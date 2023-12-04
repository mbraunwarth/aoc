module Main where

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
    parseSets line = 
      let line = tail $ dropWhile (/= ':') line
      in  parseSets' () line
        where
          parseSets' acc (num:' ':'r':'e':'d':rest) ->
            parseSets' ()
          parseSets' acc (num:' ':'g':'r':'e':'e':'n':rest)
          parseSets' acc (num:' ':'b':'l':'u':'e':rest)
          

