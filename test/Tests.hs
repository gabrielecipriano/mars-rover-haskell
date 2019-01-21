import Test.Hspec        (Spec, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

hello :: String
hello = "Hello, World!"

specs :: Spec
specs = it "hello" $
          hello `shouldBe` "Hello, World!"
