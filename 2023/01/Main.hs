module Main where

import Data.Char (isDigit)
import Data.List (isPrefixOf, stripPrefix)
import Data.Maybe (fromJust)
import System.Environment (getArgs)

main :: IO ()
main = do
  -- read input
  args <- getArgs
  input <- readFile $ head args

  -- solve puzzle
  print $ solve01 input
  --print $ solve02 input

spelled = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
digits = [1 .. 9]
digitLookup = zip spelled digits

pLine :: String -> String
pLine line = pLine' line acc
  where
    pLine' = 
      case line of
        d:rest | isDigit d -> pLine' rest (acc ++ [d])
        _ -> if pref `isPrefixOf` line 
               then pLine' (fromJust (stripPrefix pref line)) (acc ++ pWord pref)
               else acc

pWord :: String -> String
pWord spelled =
  case spelled of 
    "one" -> "1"
    "two" -> "2"
    "three" -> "3"
    "four" -> "4"
    "five" -> "5"
    "six" -> "6"
    "seven" -> "7"
    "eight" -> "8"
    "nine" -> "9"
    _ -> spelled

applyLookup :: String -> String -> String
applyLookup line acc = 
  case line of
    [] -> acc
  where
    pref = "one"

solve01 :: String -> Int
solve01 = 
  sum . map (read . getFirstAndLastNum) . lines

getFirstAndLastNum :: String -> String
getFirstAndLastNum line = 
  let nums = filter isDigit line
  in  [head nums, last nums]

