module Main where

import System.Environment (getArgs)
import Numerals

main :: IO ()
main = do
    args <- getArgs
    case args of
        [nString] -> do
            let n = read nString :: Integer
            putStrLn $ numerals (read nString)
        _ -> putStrLn "Usage: numberals <number>"
            