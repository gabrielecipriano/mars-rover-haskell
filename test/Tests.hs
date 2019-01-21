import Test.Hspec        (Spec, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

moveRover :: ((Int, Int), Char) -> String -> ((Int, Int), Char)
moveRover rover _ = rover

specs :: Spec
specs = it "should leave a rover where it is with no commands" $
          moveRover ((0, 0), 'N') "" `shouldBe` ((0, 0), 'N')
