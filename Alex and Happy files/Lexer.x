{
module Lexer where
}

%wrapper "basic"

$digit = 0-9            -- digits
$alpha = [a-zA-Z]       -- alphabetic characters

tokens :-

  $white+                        ;
  "--".*                         ;
  let                            { \s -> TokenLet }
  in                             { \s -> TokenIn }
  if                             { \s -> TokenIf }
  then                           { \s -> TokenThen }
  else                           { \s -> TokenElse }
  endif                          { \s -> TokenEndif }
  inputTile                      { \s -> TokenInputTile }
  outputTile                     { \s -> TokenOutputTile }
  outputString                   { \s -> TokenOutputString }
  blank                          { \s -> TokenBlank }
  full                           { \s -> TokenFull }
  rotateR                        { \s -> TokenRotateR }
  rotateL                        { \s -> TokenRotateL }
  getHeight                      { \s -> TokenGetHeight }
  getWidth                       { \s -> TokenGetWidth }
  and                            { \s -> TokenAnd }
  or                             { \s -> TokenOr }
  xor                            { \s -> TokenXor }
  not                            { \s -> TokenNot }
  flipY                          { \s -> TokenFlipY }
  flipX                          { \s -> TokenFlipX }
  for                            { \s -> TokenFor }
  do                             { \s -> TokenDo }
  endfor                         { \s -> TokenEndfor }
  \:                             { \s -> TokenColon }
  place                          { \s -> TokenPlace }
  on                             { \s -> TokenOn }
  subtile                        { \s -> TokenSubtile }
  scaleUp                        { \s -> TokenScaleUp }
  scaleDown                      { \s -> TokenScaleDown }
  Tint                           { \s -> TokenTInt }
  Tstring                        { \s -> TokenTString }
  Ttile                          { \s -> TokenTTile }
  $digit+                        { \s -> TokenInt (read s) }
  \=                             { \s -> TokenEq }
  \+                             { \s -> TokenPlus }
  \-                             { \s -> TokenMinus }
  \*                             { \s -> TokenTimes }
  \/                             { \s -> TokenDiv }
  \(                             { \s -> TokenOB }
  \)                             { \s -> TokenCB }
  \>                             { \s -> TokenMT }
  \<                             { \s -> TokenLT }
  \.                             { \s -> TokenDot}
  \#                             { \s -> TokenHash }
  \!                             { \s -> TokenExclamation }
  "&&"                           { \s -> TokenAmpersand }
  "||"                           { \s -> TokenVerticalBar }
  \^                             { \s -> TokenCaret }
  \%                             { \s -> TokenPercent }
  $alpha [$alpha $digit \_ \']*  { \s -> TokenVar s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token
  = TokenLet
  | TokenIn
  | TokenIf
  | TokenThen
  | TokenElse
  | TokenEndif
  | TokenInputTile
  | TokenOutputTile
  | TokenOutputString
  | TokenBlank
  | TokenFull
  | TokenRotateR
  | TokenRotateL
  | TokenGetHeight
  | TokenGetWidth
  | TokenAnd
  | TokenOr
  | TokenXor
  | TokenNot
  | TokenFlipY
  | TokenFlipX
  | TokenFor
  | TokenDo
  | TokenEndfor
  | TokenColon
  | TokenPlace
  | TokenOn
  | TokenSubtile
  | TokenScaleUp
  | TokenScaleDown
  | TokenHash
  | TokenTInt
  | TokenTString
  | TokenTTile
  | TokenInt Int
  | TokenVar String
  | TokenEq
  | TokenPlus
  | TokenMinus
  | TokenTimes
  | TokenDiv
  | TokenOB
  | TokenCB
  | TokenMT
  | TokenLT
  | TokenDot
  | TokenExclamation
  | TokenAmpersand
  | TokenVerticalBar
  | TokenCaret
  | TokenPercent
  deriving (Eq, Show)
  
}