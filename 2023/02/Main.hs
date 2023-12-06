module Main where

import Data.List

data Game = Game Int [Set]

data Set = Set
  { red :: Int
  , blue :: Int
  , green :: Int
  }


main :: IO ()
main = do
  input <- readFile "sample.txt"
  print (solve input)

solve :: String -> String
solve input = solve' input
  where 
    solve' =
      show . 
        lines

parseGames :: String -> [Game]
parseGames input = map parseGame (lines input)

-- example game:
--
-- "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
--
parseGame :: String -> Game
parseGame line = Game (parseID line) (parseSets line)
  where
    parseID = read . last . words . takeWhile (/= ':')
    parseSets :: String -> [Set]
    parseSets line = unwords . words . tail . dropWhile (/= ':')

-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
splitAt :: Eq a => a -> [a] -> [[a]]
splitAt e xs = splitAt' e xs []
  where
    splitAt' _ []   acc = acc
    splitAt' e x:xs acc | x == e    = acc ++ (splitAt' e xs [])
                        | otherwise = splitAt' e xs (acc ++ [x])
