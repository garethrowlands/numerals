module Main (main, spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Monad (forM_)    
import Numerals (numerals)
    
-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

samples = [
    (0,""),
    (1,"I"),
    (2,"II"),
    (4,"IV"),
    (5,"V"),
    (8,"VIII"),
    (9,"IX"),
    (3999,"MMMCMXCIX")
    ]

spec :: Spec
spec = do
    describe "numerals" $ do
        forM_ samples $ \(number,chars) ->
            it ("returns " ++ chars ++ " for " ++ show number) $ do
                numerals number `shouldBe` chars
