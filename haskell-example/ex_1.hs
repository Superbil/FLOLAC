-- * 1
-- 1
_even :: Int -> Bool
_even x = if mod x 2 == 0 then True else False

-- 2
_area :: Double -> Double
_area x = x * x * (22/7)

-- 3
smaller :: Int -> Int -> Int
smaller x y = if x < y then x else y
st3 :: Int -> Int
st3 x = smaller 3 x
-- smaller = \x y -> if x < y then x else y

-- 4
square :: Int -> Int
square x = x * x

quad :: Int -> Int
quad x = square x * square x

twice :: (a -> a) -> (a -> a)
twice f x = f (f x)

_quad :: Int -> Int
_quad x = twice square x

-- 5
_twice :: (a -> a) -> (a -> a)
_twice f = f . f

-- * 2
-- 1
-- let x = ((1,'a'), True)
-- fst (fst x)
-- snd (fst x)

  -- a
swapA :: (a, b) -> (b, a)
swapA = \(a, b) -> (b, a)

  -- b
swapB :: (a, b) -> (b, a)
-- swapB x = (snd x, fst x) -- another way
swapB = \x -> (snd x, fst x)

  -- c
swapC :: (a, b) -> (b, a)
swapC x = case x of
  (y, z) -> (z, y)

-- 3
half :: Int -> Either Int Int
half n =
  if even n
  then Left (div n 2)
  else Right (div n 2)

half2 :: Int -> Either Int Int
half2 n | even n = Left (div n 2)
       | otherwise = Right (div n 2)

-- 4.a
-- (\x -> (snd x, fst x)) :: (a , b) -> (b, a)
-- 4.b
-- (\f -> \x -> f x x)
-- :: (a -> a -> b) -> a -> b
-- 4.c
-- (\f x y -> f y x) :: (t1 -> t2 -> t) -> t2 -> t1 -> t
-- (\f x y -> f (fst y) x)

-- example
-- (\x -> x) :: a -> a
-- (\x y -> x) :: a -> b -> a
-- (\f g x -> f x (g x))

-- * 3
-- 1
-- fstEven :: [Int] -> Int
-- fstEven x = head x

-- 2
hasZero :: [Int] -> Bool
-- hasZero x = if head x == 0 then True else hasZero (tail x)
hasZero [] = False
hasZero (x: xs) = if x == 0 then True else hasZero xs

-- 3
myLast :: [a] -> a
myLast [a] = a
myLast (x : xs) = myLast xs

-- 4
-- find :: Char -> [] -> Int
-- find (x : xs) = 1 + find xs

-- pos :: Eq a => a -> [a] -> Int

-- 6
double :: [a] -> [a]
double [] = []
double (x : xs) = [x] ++ [x] ++ double xs

-- 7
interleave :: [a] -> [a] -> [a]
interleave [] [] = []
interleave x y = [head x] ++ [head y] ++ interleave (tail x) (tail y)

-- 8
splitLR :: [Either a b] -> ([a],[b])
splitLR [] = ([],[])
splitLR (x : xs) = case x of
  Left t -> (t: a, b)
  Right s -> (a, s: b)
  where (a, b) = splitLR (xs)

