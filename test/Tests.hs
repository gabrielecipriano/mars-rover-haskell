import Test.Hspec        (Spec, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

newtype Position = Position (Int, Int)
    deriving (Show, Eq)

data Direction = N | E | S | W
    deriving (Show, Eq)

newtype Rover = Rover (Position, Direction)
    deriving (Show, Eq)

moveRover :: Rover -> String -> Rover
moveRover rover _ = rover

specs :: Spec
specs = it "should leave a rover where it is with no commands" $
        let rover = Rover (Position (0, 0), N)
        in moveRover rover "" `shouldBe` rover 
