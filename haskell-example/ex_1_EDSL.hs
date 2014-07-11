-- 1

-- AA-BBB
-- ex: AA-123

{-# LANGUAGE KindSignatures, GADTs #-}
-- 2
data Grammar :: * where
  Empty :: Grammar
  Unit :: Grammar
  Single :: Char -> Grammar
  Conc :: Grammar -> Grammar -> Grammar -- \w\w
  Union :: Grammar -> Grammar -> Grammar -- (\w)
instance Show Grammar where
  show Empty = putStr "[" ++ "]"
  show Unit = putStr "[" ++ "" ++ "]"


{--
data Tree = Leaf
          | Node Tree Int Tree

instance Show Tree where
  show Leaf = "()"
  show (Node lhs n rhs) = "[" ++ show lhs ++ ":" ++ show n ++ ":" ++ show rhs ++ "]"
--}

-- AB34EFG
-- A234EFG
-- diagits :: Grammar
-- diagits x = diagits x
diagits = foldr Union Empty (map Single ['0' .. '9'])

word = foldr Union Empty (map Single ['A' .. 'Z'])

