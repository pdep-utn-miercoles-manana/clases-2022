unos :: [Int]
unos = 1 : unos

iterar f a = a : iterar f (f a)
