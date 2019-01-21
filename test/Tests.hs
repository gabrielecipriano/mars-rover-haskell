import Test.Hspec        (Spec, it, shouldBe, describe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

data Position = Position (Int, Int)
    deriving (Show, Eq)

data Direction = N | E | S | W
    deriving (Show, Eq)

data Rover = Rover (Position, Direction)
    deriving (Show, Eq)

moveRover :: Rover -> String -> Rover
moveRover (Rover (Position (0,0),  N)) "R" = Rover(Position(0,0), E) 
moveRover rover _ = rover

specs :: Spec
specs =
    describe "Mars Rover" $ do
        it "should leave a rover where it is with no commands" $
            let rover = Rover (Position (0, 0), N)
            in moveRover rover "" `shouldBe` rover 

        it "should be facing east when turned once right from North" $ 
            let
                rover = Rover (Position (0, 0), N)
                expectedRover = Rover (Position (0, 0), E)
         
            in moveRover rover "R" `shouldBe` expectedRover 
