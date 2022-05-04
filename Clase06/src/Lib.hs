data Persona = Persona {
    nombre :: String,
    edad :: Int,
    apodo :: String,
    hobbies :: [String]
} deriving (Show)

apodar nuevoApodo (Persona nombre edad _ hobbies) = Persona nombre edad nuevoApodo hobbies

apodar'' nuevoApodo persona = persona { apodo = nuevoApodo }

ingenierizar persona = persona { apodo = "Ing. " ++ apodo persona }


cambiarApodo funcion persona = persona { apodo = funcion (apodo persona) }

apodar' nuevoApodo persona = cambiarApodo (const nuevoApodo) persona

ingenierizar' persona = cambiarApodo ("Ing. " ++) persona


factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Toda funcion recursiva tiene al menos
-- un caso base y un caso recursivo
-- Ver el número de Ackerman (tiene casos base y recursivos)

-- Existen estructuras de dato recursivas, como esta...
data Amigo = Amigo {
    nombreAmigo :: String,
    edadAmigo :: Int,
    apodoAmigo :: String,
    amigues :: [Amigo]
} deriving (Show)

head' (cabeza:cola) = cabeza
tail' (cabeza:cola) = cola

take' :: Int -> [a] -> [a]
take' 0 _      = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs

drop' :: Int -> [a] -> [a]
drop' 0 lista  = lista
drop' _ []     = []
drop' n (_:xs) = drop' (n-1) xs





sum' :: Num a => [a] -> a
sum' []     = 0
sum' (x:xs) = (+) x (sum' xs)

product' :: Num a => [a] -> a
product' []     = 1
product' (x:xs) = (*) x (product' xs)

and' :: [Bool] -> Bool
and' []     = True
and' (x:xs) = (&&) x (and' xs)

or' :: [Bool] -> Bool
or' []     = False
or' (x:xs) = x || or' xs

concat' :: [[a]] -> [a]
concat' []     = []
concat' (x:xs) = x ++ concat' xs 

map' :: (a -> b) -> [a] -> [b]
map' f []     = []
map' f (x:xs) = (:) (f x) (map f xs)

length' :: [a] -> Int
length' []     = 0
length' (_:xs) = 1 + length' xs


foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' operador valorInicial []     = valorInicial
foldr' operador valorInicial (x:xs) = operador x (foldr' operador valorInicial xs)


sum'' :: Num a => [a] -> a
sum'' numeros = plegar (+) 0 numeros

product'' :: Num a => [a] -> a
product'' numeros = plegar (*) 1 numeros

and'' :: [Bool] -> Bool
and'' booleanos = plegar (&&) True booleanos

or'' :: [Bool] -> Bool
or'' booleanos = plegar (||) False booleanos

concat'' :: [[a]] -> [a]
concat'' listas = plegar (++) [] listas

length'' :: [a] -> Int
length'' lista = plegar (\_ otroNumero -> 1 + otroNumero) 0 lista

map'' :: (a -> b) -> [a] -> [b]
map'' f lista =
  plegar (\elemento listaAcumuladora -> f elemento : listaAcumuladora)) [] lista
