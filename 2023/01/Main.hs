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

applyLookup :: String -> String -> String
applyLookup line acc = 
  case line of
    [] -> acc
    _ -> if pref `isPrefixOf` line 
           then applyLookup (fromJust (stripPrefix pref line)) (acc ++ pref)
           else acc
  where
    pref = "one"

solve01 :: String -> Int
solve01 = 
  sum . map (read . getFirstAndLastNum) . lines

getFirstAndLastNum :: String -> String
getFirstAndLastNum line = 
  let nums = filter isDigit line
  in  [head nums, last nums]

