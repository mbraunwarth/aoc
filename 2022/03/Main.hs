import System.Environment

main :: IO ()
main = do
    args <- getArgs
    input <- readFile $ args !! 0
    let solution = solve input
    putStrLn (show solution)

solve :: String -> Int
solve rs = (foldr (priority . share . compartments) 0) $ lines rs
    where
        -- split one rucksack into its compartments
        compartments :: String -> (String, String)
        compartments r = (take (length r `div` 2) r, drop (length r `div` 2) r)

        share :: (String, String) -> Char
        share _ = 'a'

        priority :: Char -> Int
        priority _ = 1
