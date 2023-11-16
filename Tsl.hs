{-# LANGUAGE ScopedTypeVariables #-}
import System.IO
import System.Environment
import System.IO.Unsafe
import Data.Char
import Data.List
import Lexer
import Parser
import Data.List.Split
import qualified Control.Exception as E

main :: IO()
main = do
  args <- getArgs
  case args of
    [file] -> (do
      codeString <- readFile file
      let expStrings = splitOn ";" codeString
      let astList = map getAST (removeEmpty expStrings)
      let finalParameters = interpretPrograms ([], [], [], [[2]], "@") astList
      hPutStr stdout (getFinalOutput finalParameters) ) `E.catch`  (\(err :: E.SomeException) -> hPutStr stderr (head $ splitOn "\n" (show err))) --Exclude stack trace from error
  
printError :: String -> IO()
printError s = do
  putStrLn s
  
getAST :: String -> Prgrm
getAST s = let
    tokens = alexScanTokens s
    ast = parseCalc tokens
  in
    ast

removeEmpty :: [String] -> [String]
removeEmpty strings = [(strings!!n) | n <- [0..((length strings)-1)], (not (isBlank (strings!!n)))]

isBlank :: String -> Bool
isBlank [] = True
isBlank (c:[]) | isSpace c = True
               | otherwise = False
isBlank (c:cs) | isSpace c = isBlank cs
               | otherwise = False

type Params = (StackInt, StackString, StackTile, Tile, String) --3 type stacks, output tile, output string(for debugging)
type StackInt = [(String, Int)]
type StackString = [(String, String)]
type StackTile = [(String, Tile)]
type Tile = [[Int]]

getFinalOutput :: Params -> String
getFinalOutput (_, _, _, oT, oS) | (oT /= [[2]] && oS == "@") = tileToString oT
                                 | (oT /= [[2]] && oS /= "@") = (tileToString oT) ++ "\n" ++ oS ++ "\n" ++ "WARNING: String output for debugging only"
                                 | (oT == [[2]] && oS /= "@") = oS ++ "\n" ++ "WARNING: String output for debugging only"
                                 | (oT == [[2]] && oS == "@") = "WARNING: No output"

tileToString :: Tile -> String
tileToString [] = ""
tileToString (l:[]) = [intToDigit (l!!n) | n <- [0..((length l)-1)]]
tileToString (l:ls) = ((tileToString (l:[])) ++ "\n") ++ (tileToString ls)

interpretPrograms :: Params -> [Prgrm] -> Params
interpretPrograms prs [] = prs
interpretPrograms prs (p:[]) = interpretProgram prs p
interpretPrograms prs (p:ps) = interpretPrograms (interpretProgram prs p) ps

interpretProgram :: Params -> Prgrm -> Params
interpretProgram ps (Program1 assign) = interpretAssign ps assign
interpretProgram (stackI, stackS, stackT, oT, oS) (Program2 (OutputTile texp)) = (stackI, stackS, stackT, (interpretTExp (stackI, stackS, stackT, oT, oS) texp), oS)
interpretProgram (stackI, stackS, stackT, oT, oS) (Program2 (OutputString exp)) | not (canFindVariable stackI dString) = (stackI, stackS, stackT, oT, dString)
                                                                                | otherwise = (stackI, stackS, stackT, oT, show (getVariable stackI dString))
  where dString = (interpretExpString (stackI, stackS, stackT, oT, oS) exp)
interpretProgram (stackI, stackS, stackT, oT, oS) (Program2 (If bexp blck)) | (interpretBExp (stackI, stackS, stackT, oT, oS) bexp) = interpretBlock (stackI, stackS, stackT, oT, oS) blck
                                                                            | otherwise = (stackI, stackS, stackT, oT, oS)
interpretProgram (stackI, stackS, stackT, oT, oS) (Program2 (IfElse bexp blck1 blck2)) | (interpretBExp (stackI, stackS, stackT, oT, oS) bexp) = interpretBlock (stackI, stackS, stackT, oT, oS) blck1
                                                                                       | otherwise = interpretBlock (stackI, stackS, stackT, oT, oS) blck2
interpretProgram (stackI, stackS, stackT, oT, oS) (Program2 (For init bexp stmt blck)) = interpretFor (interpretAssign (stackI, stackS, stackT, oT, oS) init) bexp stmt blck 9999
interpretProgram ps (Comment) = ps

interpretFor :: Params -> BExp -> Stmt -> Blck -> Int -> Params
interpretFor ps bexp stmt blck 0 = error "Stack error (for): Maximum iteration count reached (9999)"
interpretFor ps bexp stmt blck d | interpretBExp ps bexp = interpretFor (interpretAssign (interpretBlock ps blck) stmt) bexp stmt blck (d-1)
                                 | otherwise = ps

interpretBlock :: Params -> Blck -> Params
interpretBlock ps (Block1 stmt) = interpretAssign ps stmt
interpretBlock ps (Block2 stmt) = interpretProgram ps (Program2 stmt)
interpretBlock ps (Block11 stmt blck) = interpretBlock (interpretAssign ps stmt) blck
interpretBlock ps (Block22 stmt blck) = interpretBlock (interpretProgram ps (Program2 stmt)) blck
interpretBlock ps (BComment) = ps
interpretBlock ps (BDComment blck) = interpretBlock ps blck

interpretAssign :: Params -> Stmt -> Params
interpretAssign (stackI, stackS, stackT, oT, oS) (AssignInt s exp) | not (canFindVariable stackI s) = ((stackI ++ (s,(interpretExpInt (stackI, stackS, stackT, oT, oS) exp)):[]), stackS, stackT, oT, oS)
                                                                   | otherwise = ((replaceVariable stackI s (interpretExpInt (stackI, stackS, stackT, oT, oS) exp)), stackS, stackT, oT, oS)
interpretAssign (stackI, stackS, stackT, oT, oS) (AssignString s exp) | not (canFindVariable stackS s) = (stackI, (stackS ++ (s,(interpretExpString (stackI, stackS, stackT, oT, oS) exp)):[]), stackT, oT, oS)
                                                                      | otherwise = (stackI, (replaceVariable stackS s (interpretExpString (stackI, stackS, stackT, oT, oS) exp)), stackT, oT, oS)
interpretAssign (stackI, stackS, stackT, oT, oS) (AssignTile s exp) | not (canFindVariable stackT s) = (stackI, stackS, (stackT ++ (s,(interpretTExp (stackI, stackS, stackT, oT, oS) exp)):[]), oT, oS)
                                                                    | otherwise = (stackI, stackS, (replaceVariable stackT s (interpretTExp (stackI, stackS, stackT, oT, oS) exp)), oT, oS)

interpretExpInt :: Params -> Exp -> Int
interpretExpInt (stackI, stackS, stackT, oT, oS) (Let s e1 e2) = interpretExpInt ((stackI ++ (s,(interpretExpInt (stackI, stackS, stackT, oT, oS) e1)):[]), stackS, stackT, oT, oS) e2
interpretExpInt (stackI, stackS, stackT, oT, oS) (Plus e1 e2) = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) + (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretExpInt (stackI, stackS, stackT, oT, oS) (Minus e1 e2) = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) - (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretExpInt (stackI, stackS, stackT, oT, oS) (Times e1 e2) = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) * (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretExpInt (stackI, stackS, stackT, oT, oS) (Div e1 e2) = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) `div` (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretExpInt (stackI, stackS, stackT, oT, oS) (Modulo e1 e2) = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) `mod` (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretExpInt (stackI, stackS, stackT, oT, oS) (GetHeight texp) = length (interpretTExp (stackI, stackS, stackT, oT, oS) texp)
interpretExpInt (stackI, stackS, stackT, oT, oS) (GetWidth texp) = length (head (interpretTExp (stackI, stackS, stackT, oT, oS) texp))
interpretExpInt (stackI, stackS, stackT, oT, oS) (Negate exp) = (interpretExpInt (stackI, stackS, stackT, oT, oS) exp) * (-1)
interpretExpInt (stackI, stackS, stackT, oT, oS) (Int i) = i
interpretExpInt (stackI, stackS, stackT, oT, oS) (Var v) = getVariable stackI v

interpretExpString :: Params -> Exp -> String
interpretExpString (stackI, stackS, stackT, oT, oS) (Let s e1 e2) = interpretExpString (stackI, (stackS ++ (s,(interpretExpString (stackI, stackS, stackT, oT, oS) e1)):[]), stackT, oT, oS) e2
interpretExpString (stackI, stackS, stackT, oT, oS) (Plus e1 e2) = (interpretExpString (stackI, stackS, stackT, oT, oS) e1) ++ (interpretExpString (stackI, stackS, stackT, oT, oS) e2)
interpretExpString (stackI, stackS, stackT, oT, oS) (Minus e1 e2) = (interpretExpString (stackI, stackS, stackT, oT, oS) e1) ++ (interpretExpString (stackI, stackS, stackT, oT, oS) e2)
interpretExpString (stackI, stackS, stackT, oT, oS) (Times e1 e2) = error "Type error: type Tstring can't be used with operator '*'"
interpretExpString (stackI, stackS, stackT, oT, oS) (Div e1 e2) = error "Type error: type Tstring can't be used with operator '/'"
interpretExpString (stackI, stackS, stackT, oT, oS) (Modulo e1 e2) = error "Type error: type Tstring can't be used with operator '%'"
interpretExpString (stackI, stackS, stackT, oT, oS) (GetHeight texp) = error "Type error: type Tstring can't be used with function 'GetHeight'"
interpretExpString (stackI, stackS, stackT, oT, oS) (GetWidth texp) = error "Type error: type Tstring can't be used with function 'GetWidth'"
interpretExpString (stackI, stackS, stackT, oT, oS) (Negate exp) = "-" ++ (interpretExpString (stackI, stackS, stackT, oT, oS) exp)
interpretExpString (stackI, stackS, stackT, oT, oS) (Int i) = show i
interpretExpString (stackI, stackS, stackT, oT, oS) (Var v) | canFindVariable stackS v = getVariable stackS v
                                                            | otherwise = v

interpretTExp :: Params -> TExp -> Tile
interpretTExp (stackI, stackS, stackT, oT, oS) (InputTile file) = importTileFile file
interpretTExp (stackI, stackS, stackT, oT, oS) (Blank e1 e2) | (exp1Num >= 0 && exp2Num >= 0) = createNewTile exp1Num exp2Num 0
                                                             | otherwise = error "Function error (blank): Integer parameters must be positive"
  where
    exp1Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1)
    exp2Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretTExp (stackI, stackS, stackT, oT, oS) (Full e1 e2) | (exp1Num >= 0 && exp2Num >= 0) = createNewTile exp1Num exp2Num 1
                                                            | otherwise = error "Function error (full): Integer parameters must be positive"
  where
    exp1Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1)
    exp2Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretTExp (stackI, stackS, stackT, oT, oS) (Subtile texp e1 e2 e3 e4) | (exp1Num >= 0 && exp2Num >= 0 && exp3Num >= 0 && exp4Num >= 0) = takeSubtile (interpretTExp (stackI, stackS, stackT, oT, oS) texp) exp1Num exp2Num exp3Num exp4Num
                                                                          | otherwise = error "Function error (subtile): Integer parameters must be positive"
  where
    exp1Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1)
    exp2Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
    exp3Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e3)
    exp4Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e4)
interpretTExp (stackI, stackS, stackT, oT, oS) (And te1 te2) = booleanTileFunc (interpretTExp (stackI, stackS, stackT, oT, oS) te1) (interpretTExp (stackI, stackS, stackT, oT, oS) te2) 'A'
interpretTExp (stackI, stackS, stackT, oT, oS) (Or te1 te2) = booleanTileFunc (interpretTExp (stackI, stackS, stackT, oT, oS) te1) (interpretTExp (stackI, stackS, stackT, oT, oS) te2) 'O'
interpretTExp (stackI, stackS, stackT, oT, oS) (Xor te1 te2) = booleanTileFunc (interpretTExp (stackI, stackS, stackT, oT, oS) te1) (interpretTExp (stackI, stackS, stackT, oT, oS) te2) 'X'
interpretTExp (stackI, stackS, stackT, oT, oS) (Not te1) = booleanTileFunc (interpretTExp (stackI, stackS, stackT, oT, oS) te1) (interpretTExp (stackI, stackS, stackT, oT, oS) te1) 'N'
interpretTExp (stackI, stackS, stackT, oT, oS) (FlipY texp) = reverse (interpretTExp (stackI, stackS, stackT, oT, oS) texp)
interpretTExp (stackI, stackS, stackT, oT, oS) (FlipX texp) = [reverse (tle!!n) | n <- [0..((length tle)-1)]]
  where tle = (interpretTExp (stackI, stackS, stackT, oT, oS) texp)
interpretTExp (stackI, stackS, stackT, oT, oS) (Place te1 te2 e1 e2) | (exp1Num >= 0 && exp2Num >= 0) = placeOnTile (interpretTExp (stackI, stackS, stackT, oT, oS) te1) (interpretTExp (stackI, stackS, stackT, oT, oS) te2) exp1Num exp2Num
                                                                     | otherwise = error "Function error (place): Integer parameters must be positive"
  where
    exp1Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e1)
    exp2Num = (interpretExpInt (stackI, stackS, stackT, oT, oS) e2)
interpretTExp (stackI, stackS, stackT, oT, oS) (RotateR texp) = transpose (reverse (interpretTExp (stackI, stackS, stackT, oT, oS) texp))
interpretTExp (stackI, stackS, stackT, oT, oS) (RotateL texp) = reverse (transpose (interpretTExp (stackI, stackS, stackT, oT, oS) texp))
interpretTExp (stackI, stackS, stackT, oT, oS) (ScaleUp texp exp) | expNum >= 0 = scaleTileUp (interpretTExp (stackI, stackS, stackT, oT, oS) texp) expNum
                                                                  | otherwise = error "Function error (scaleUp): Integer parameter must be positive"
  where expNum = (interpretExpInt (stackI, stackS, stackT, oT, oS) exp)
interpretTExp (stackI, stackS, stackT, oT, oS) (ScaleDown texp exp) | expNum >= 0 = scaleTileDown (interpretTExp (stackI, stackS, stackT, oT, oS) texp) expNum
                                                                    | otherwise = error "Function error (scaleDown): Integer parameter must be positive"
  where expNum = (interpretExpInt (stackI, stackS, stackT, oT, oS) exp)
interpretTExp (stackI, stackS, stackT, oT, oS) (TVar v) = getVariable stackT v

interpretBExp :: Params -> BExp -> Bool
interpretBExp (stackI, stackS, stackT, oT, oS) (MoreThanI e1 e2) | (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) > (interpretExpInt (stackI, stackS, stackT, oT, oS) e2) = True
                                                                 | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (LessThanI e1 e2) | (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) < (interpretExpInt (stackI, stackS, stackT, oT, oS) e2) = True
                                                                 | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (MoreThanEqualsI e1 e2) | (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) >= (interpretExpInt (stackI, stackS, stackT, oT, oS) e2) = True
                                                                       | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (LessThanEqualsI e1 e2) | (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) <= (interpretExpInt (stackI, stackS, stackT, oT, oS) e2) = True
                                                                       | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (MoreThanT e1 e2) | (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e1)) > (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e2)) = True
                                                                 | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (LessThanT e1 e2) | (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e1)) < (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e2)) = True
                                                                 | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (MoreThanEqualsT e1 e2) | (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e1)) >= (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e2)) = True
                                                                       | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (LessThanEqualsT e1 e2) | (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e1)) <= (countTileOnes (interpretTExp (stackI, stackS, stackT, oT, oS) e2)) = True
                                                                       | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (EqualsI e1 e2) | (interpretExpInt (stackI, stackS, stackT, oT, oS) e1) == (interpretExpInt (stackI, stackS, stackT, oT, oS) e2) = True
                                                               | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (EqualsT e1 e2) | (interpretTExp (stackI, stackS, stackT, oT, oS) e1) == (interpretTExp (stackI, stackS, stackT, oT, oS) e2) = True
                                                               | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (BAnd be1 be2) | (interpretBExp (stackI, stackS, stackT, oT, oS) be1) && (interpretBExp (stackI, stackS, stackT, oT, oS) be2) = True
                                                              | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (BOr be1 be2) | (interpretBExp (stackI, stackS, stackT, oT, oS) be1) || (interpretBExp (stackI, stackS, stackT, oT, oS) be2) = True
                                                             | otherwise = False
interpretBExp (stackI, stackS, stackT, oT, oS) (BXor be1 be2) | (finalBExp1 && (not finalBExp2)) || ((not finalBExp1) && finalBExp2) = True
                                                              | otherwise = False
  where
    finalBExp1 = (interpretBExp (stackI, stackS, stackT, oT, oS) be1)
    finalBExp2 = (interpretBExp (stackI, stackS, stackT, oT, oS) be2)
interpretBExp (stackI, stackS, stackT, oT, oS) (BNot bexp) = not (interpretBExp (stackI, stackS, stackT, oT, oS) bexp)

--Variable specific functions

canFindVariable :: (Eq a) => [(String, a)] -> String -> Bool
canFindVariable stack s | matches == [] = False
                        | otherwise = True
  where matches = findMatches stack s

getVariable :: (Eq a) => [(String, a)] -> String -> a
getVariable stack s | matches == [] = error ("Stack error: Variable '" ++ s ++ "' doesn't exist, or the program is badly typed")
                    | otherwise = head matches
  where matches = findMatches stack s

findMatches :: [(String, a)] -> String -> [a]
findMatches stack varName = [snd (stack!!n) | n <- [0..((length stack) - 1)], (fst (stack!!n)) == varName]

replaceVariable :: [(String, a)] -> String -> a -> [(String, a)]
replaceVariable stack varname newvalue = [if ((fst (stack!!n)) == varname) then (varname, newvalue) else (stack!!n) | n <- [0..((length stack)-1)]]

--Tile specific functions:

countTileOnes :: Tile -> Int
countTileOnes tile = sum countList
  where countList = [length $ filter (== 1) (tile!!n) | n <- [0..((length tile)-1)]]

importTileFile :: String -> Tile
importTileFile filename = unsafePerformIO $ importTileFileHelper filename --unsafe function here is safe since no continuous I/O is done and all errors are caught

importTileFileHelper :: String -> IO Tile
importTileFileHelper file = do
  tileString <- readFile (file ++ ".tl")
  let tileStringRows = splitOn "\n" tileString
  let dimension = length tileStringRows
  let tileIntRows = [stringToIntList (tileStringRows!!n) | n <- [0..(dimension-1)]]
  return tileIntRows

stringToIntList :: String -> [Int]
stringToIntList [] = []
stringToIntList (c:[]) = (digitToInt c) : []
stringToIntList (c:cs) = ((digitToInt c) : []) ++ stringToIntList cs

createNewTile :: Int -> Int -> Int -> Tile
createNewTile w h i = [row | n <- [1..h]]
  where row = [i | n <- [1..w]]

takeSubtile :: Tile -> Int -> Int -> Int -> Int -> Tile
takeSubtile tile x y i3 i4 | (x+i3) <= width && (y+i4) <= height = [(takeSubline tile n x i3) | n <- [y..(y+i4-1)]]
                           | otherwise = error "Function error (subtile): Invalid values passed"
  where 
    height = length tile
    width = length $ head tile

takeSubline :: Tile -> Int -> Int -> Int -> [Int]
takeSubline tile curY x xw = [(tile!!curY)!!n | n <- [0..(width-1)], n >= x && n < (x+xw)]
  where width = length $ head tile

booleanTileFunc :: Tile -> Tile -> Char -> Tile
booleanTileFunc t1 t2 c | h1 == h2 && w1 == w2 = [(booleanTileFuncHelper (t1!!n) (t2!!n) c) | n <- [0..(h1-1)]]
                        | otherwise = error "Function error (and|or|xor|not): Cannot use boolean operators on tiles with different dimensions"
  where
    h1 = length t1
    h2 = length t2
    w1 = length $ head t1
    w2 = length $ head t2

booleanTileFuncHelper :: [Int] -> [Int] -> Char -> [Int]
booleanTileFuncHelper is1 is2 'A' = [if ((is1!!n) == 1 && (is2!!n) == 1) then 1 else 0 | n <- [0..((length is1)-1)]]
booleanTileFuncHelper is1 is2 'O' = [if ((is1!!n) == 1 || (is2!!n) == 1) then 1 else 0 | n <- [0..((length is1)-1)]]
booleanTileFuncHelper is1 is2 'X' = [if (((is1!!n) == 1 && (is2!!n) == 0) || ((is1!!n) == 0 && (is2!!n) == 1)) then 1 else 0 | n <- [0..((length is1)-1)]]
booleanTileFuncHelper is1 is2 'N' = [if ((is1!!n) == 1) then 0 else 1 | n <- [0..((length is1)-1)]]

placeOnTile :: Tile -> Tile -> Int -> Int -> Tile
placeOnTile t1 t2 x y | ((h1+y) <= h2) && ((w1+x) <= w2) = [if (((n-y) >= 0) && ((n-y) < h1)) then (placeOnTileHelper (t1!!(n-y)) (t2!!n) x) else ((t2!!n)) | n <- [0..(h2-1)]]
                      | otherwise = error "Function error (place):first tile too large to be placed on the second tile"
  where
    h1 = length t1
    h2 = length t2
    w1 = length $ head t1
    w2 = length $ head t2

placeOnTileHelper :: [Int] -> [Int] -> Int -> [Int]
placeOnTileHelper l1 l2 x = [if (n >= x && n < (x+w1)) then (l1!!(n-x)) else (l2!!n) | n <- [0..((length l2)-1)]]
  where w1 = length l1

scaleTileUp :: Tile -> Int -> Tile
scaleTileUp tile i = [(scaleTileUpHelper (tile!!(n `div` i)) i) | n <- [0..((h*i)-1)]]
  where h = length tile

scaleTileUpHelper :: [Int] -> Int -> [Int]
scaleTileUpHelper line i = [(line!!(n `div` i)) | n <- [0..((w*i)-1)]]
  where w = length line

scaleTileDown :: Tile -> Int -> Tile
scaleTileDown tile i | ((((h `div` i)*i) == h) && ((h `div` i) >= 1)) = [(scaleTileDownHelper (tile!!(n*i)) i) | n <- [0..((h `div` i)-1)]]
                     | otherwise = error "Function error (scaleDown): tile cannot be scaled down by provided value, ensure value is a factor of the tile height"
  where h = length tile

scaleTileDownHelper :: [Int] -> Int -> [Int]
scaleTileDownHelper line i = [(line!!(n*i)) | n <- [0..((w `div` i)-1)]]
  where w = length line