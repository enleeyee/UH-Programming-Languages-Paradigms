getLocation :: (String, String, Int)
getLocation = ("Houston", "Texas", 77000)

main :: IO ()
main = do
  let (city, state, zip) = getLocation
  putStrLn $ "City: " ++ city
  putStrLn $ "State: " ++ state
  putStrLn $ "Zip: " ++ show zip
