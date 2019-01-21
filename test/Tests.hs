import Test.Hspec        (Spec, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

newtype Position = Position (Int, Int)
    deriving (Show, Eq)

moveRover :: (Position, Char) -> String -> (Position, Char)
moveRover rover _ = rover

specs :: Spec
specs = it "should leave a rover where it is with no commands" $
          moveRover (Position (0, 0), 'N') "" `shouldBe` (Position (0, 0), 'N')
