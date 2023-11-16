{
module Parser where
import Lexer
}

%name parseCalc
%tokentype { Token }
%error { parseError }
%errorhandlertype explist

%right in flipX flipY not rotateL rotateR '!' scaleUp scaleDown getHeight getWidth place on subtile full blank
%nonassoc '>' '<' and or xor "&&" "||" '^'
%left '+' '-'
%left '*' '/' '%'
%left NEG

%token
      let             { TokenLet }
      in              { TokenIn }
      int             { TokenInt $$ }
      var             { TokenVar $$ }
      '='             { TokenEq }
	  '>'             { TokenMT }
	  '<'             { TokenLT }
      '+'             { TokenPlus }
      '-'             { TokenMinus }
      '*'             { TokenTimes }
      '/'             { TokenDiv }
      '('             { TokenOB }
      ')'             { TokenCB }
	  '.'             { TokenDot }
	  if              { TokenIf }
      then            { TokenThen }
      else            { TokenElse }
	  endif           { TokenEndif }
	  inputTile       { TokenInputTile }
	  outputTile      { TokenOutputTile }
	  outputString    { TokenOutputString }
	  blank           { TokenBlank }
	  full            { TokenFull }
	  rotateR         { TokenRotateR }
	  rotateL         { TokenRotateL }
	  getHeight       { TokenGetHeight }
	  getWidth        { TokenGetWidth }
	  and             { TokenAnd }
	  or              { TokenOr }
	  xor             { TokenXor }
	  not             { TokenNot }
	  flipY           { TokenFlipY }
	  flipX           { TokenFlipX }
	  for             { TokenFor }
	  do              { TokenDo }
	  endfor          { TokenEndfor }
	  ':'             { TokenColon }
	  place           { TokenPlace }
	  on              { TokenOn }
	  subtile         { TokenSubtile }
	  scaleUp         { TokenScaleUp }
	  scaleDown       { TokenScaleDown }
	  Tint            { TokenTInt }
	  Tstring         { TokenTString }
	  Ttile           { TokenTTile }
	  '#'             { TokenHash }
	  '!'             { TokenExclamation }
	  "&&"            { TokenAmpersand }
	  "||"            { TokenVerticalBar }
	  '^'             { TokenCaret }
	  '%'             { TokenPercent }
	  
%%

Prgrm : Stmt2                   { Program2 $1 }
      | Stmt                    { Program1 $1 }
	  | '#' Stmt2               { Comment }
	  | '#' Stmt                { Comment }

Stmt2 : if BExp then Blck else Blck endif                                      { IfElse $2 $4 $6 }
      | if BExp then Blck endif                                                { If $2 $4 }
	  | for Stmt ':' BExp ':' Stmt do Blck endfor                              { For $2 $4 $6 $8 }
	  | for '(' Stmt ':' BExp ':' Stmt ')' do Blck endfor                      { For $3 $5 $7 $10 }
	  | outputTile TExp         { OutputTile $2 }
	  | outputString Exp        { OutputString $2 }
	  
Stmt  : Tint var '=' Exp        { AssignInt $2 $4 }
      | Tstring var '=' Exp     { AssignString $2 $4 }
      | Ttile var '=' TExp      { AssignTile $2 $4 }
	  
Blck  : Stmt ':'                { Block1 $1 }
      | Stmt2 ':'               { Block2 $1 }
	  | Stmt ':' Blck           { Block11 $1 $3 }
	  | Stmt2 ':' Blck          { Block22 $1 $3 }
      | '#' Stmt ':'            { BComment }
	  | '#' Stmt2 ':'           { BComment }
	  | '#' Stmt ':' Blck       { BDComment $4 }
	  | '#' Stmt2 ':' Blck      { BDComment $4 }

Exp   : let var '=' Exp in Exp  { Let $2 $4 $6 }
      | Exp '+' Exp             { Plus $1 $3 }
      | Exp '-' Exp             { Minus $1 $3 }
      | Exp '*' Exp             { Times $1 $3 }
      | Exp '/' Exp             { Div $1 $3 }
	  | Exp '%' Exp             { Modulo $1 $3 }
	  | getHeight TExp          { GetHeight $2 }
	  | getWidth TExp           { GetWidth $2 }
      | '(' Exp ')'             { $2 }
      | '-' Exp %prec NEG       { Negate $2 }
      | int                     { Int $1 }
      | var                     { Var $1 }
	  
TExp  : inputTile var '.' var   { InputTile $2 }
      | blank Exp Exp           { Blank $2 $3 }
	  | full Exp Exp            { Full $2 $3 }
	  | subtile TExp Exp Exp Exp Exp { Subtile $2 $3 $4 $5 $6 }
	  | TExp and TExp           { And $1 $3 }
	  | TExp or TExp            { Or $1 $3 }
	  | TExp xor TExp           { Xor $1 $3 }
	  | not TExp                { Not $2 }
	  | flipY TExp              { FlipY $2 }
	  | flipX TExp              { FlipX $2 }
	  | place TExp on TExp Exp Exp { Place $2 $4 $5 $6 }
	  | rotateR TExp            { RotateR $2 }
	  | rotateL TExp            { RotateL $2 }
	  | scaleUp TExp Exp        { ScaleUp $2 $3 }
	  | scaleDown TExp Exp      { ScaleDown $2 $3 }
	  | '(' TExp ')'            { $2 }
	  | var                     { TVar $1 }
	  
BExp  : Tint Exp '>' Exp        { MoreThanI $2 $4 }
      | Tint Exp '<' Exp        { LessThanI $2 $4 }
	  | Tint Exp '>' '=' Exp    { MoreThanEqualsI $2 $5 }
      | Tint Exp '<' '=' Exp    { LessThanEqualsI $2 $5 }
	  | Ttile TExp '>' TExp     { MoreThanT $2 $4 }
      | Ttile TExp '<' TExp     { LessThanT $2 $4 }
	  | Ttile TExp '>' '=' TExp { MoreThanEqualsT $2 $5 }
      | Ttile TExp '<' '=' TExp { LessThanEqualsT $2 $5 }
	  | Tint Exp '=' '=' Exp    { EqualsI $2 $5 }
	  | Ttile TExp '=' '=' TExp { EqualsT $2 $5 }
	  | '(' BExp ')'            { $2 }
	  | BExp "&&" BExp          { BAnd $1 $3 }
	  | BExp "||" BExp          { BOr $1 $3 }
	  | BExp '^' BExp           { BXor $1 $3 }
	  | '!' BExp                { BNot $2 }
	  
{
	  
parseError :: ([Token], [String]) -> a
parseError (ts, ss) = error ("Parse error: " ++ (show ts) ++ (show ss))

data Exp
      = Let String Exp Exp
	  | MoreThan Exp Exp
	  | LessThan Exp Exp
	  | Plus Exp Exp
	  | Minus Exp Exp
	  | Times Exp Exp
	  | Div Exp Exp
	  | Modulo Exp Exp
	  | GetHeight TExp
	  | GetWidth TExp
	  | Negate Exp
	  | Int Int
	  | Var String
      deriving Show

data Stmt
	  = AssignInt String Exp
	  | AssignString String Exp
	  | AssignTile String TExp
	  deriving Show

data Stmt2
	  = IfElse BExp Blck Blck
	  | If BExp Blck
	  | For Stmt BExp Stmt Blck
	  | OutputTile TExp
	  | OutputString Exp
	  deriving Show

data Blck
	  = Block1 Stmt
	  | Block2 Stmt2
	  | Block11 Stmt Blck
	  | Block22 Stmt2 Blck
	  | BComment
	  | BDComment Blck
	  deriving Show

data TExp
	  = InputTile String
	  | Blank Exp Exp
	  | Full Exp Exp
	  | Subtile TExp Exp Exp Exp Exp
	  | And TExp TExp
	  | Or TExp TExp
	  | Xor TExp TExp
	  | Not TExp
	  | FlipY TExp
	  | FlipX TExp
	  | Place TExp TExp Exp Exp
	  | RotateR TExp
	  | RotateL TExp
	  | ScaleUp TExp Exp
	  | ScaleDown TExp Exp
	  | TVar String
	  deriving Show

data BExp
	  = MoreThanI Exp Exp
	  | LessThanI Exp Exp
	  | MoreThanEqualsI Exp Exp
	  | LessThanEqualsI Exp Exp
	  | MoreThanT TExp TExp
	  | LessThanT TExp TExp
	  | MoreThanEqualsT TExp TExp
	  | LessThanEqualsT TExp TExp
	  | EqualsI Exp Exp
	  | EqualsT TExp TExp
	  | BAnd BExp BExp
	  | BOr BExp BExp
	  | BXor BExp BExp
	  | BNot BExp
	  deriving Show
	  
data Prgrm
	  = Program2 Stmt2
	  | Program1 Stmt
	  | Comment
	  deriving Show
	  
}