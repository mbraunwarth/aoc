import Data.Char (ord)
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    input <- readFile $ args !! 0
    let solution = solve input
    putStrLn (show solution)

solve :: String -> Int
solve rs = sum $ map (priority . share . compartments) (lines rs)
    where
        -- split one rucksack into its compartments
        compartments :: String -> (String, String)
        compartments r = (take (length r `div` 2) r, drop (length r `div` 2) r)
        
        -- check compartments for shared items
        share :: (String, String) -> Char
        share (ls, rs) = if (head ls) `elem` rs
                            then head ls
                            else share ((tail ls), rs)
        
        -- get priority of an item
        priority :: Char -> Int
        priority c = 
          let ps = zip (['a'..'z'] ++ ['A'..'Z']) [1..52]
           in snd $ head $ filter ((==c) . fst) ps
