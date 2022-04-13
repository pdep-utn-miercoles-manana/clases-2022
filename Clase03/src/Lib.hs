import Text.Show.Functions

siguiente unNumero = unNumero + 1
doble unNumero = unNumero * 2

sumaDeTres unNumero otroNumero unUltimoNumero = unNumero + otroNumero + unUltimoNumero
suma unNumero otroNumero = unNumero + otroNumero -- Bien!
-- suma numero1 numero2 = numero1 + numero2 -- Bien!
-- 
-- suma n1 n2 = n1 + n2 -- Mal!
-- suma num1 num2 = num1 + num2 -- Mal!

frecuenciaCardiacaPromedio :: Int
frecuenciaCardiacaPromedio = 80

hacerEjercicio :: Int -> Int
hacerEjercicio frecuenciaCardiaca = frecuenciaCardiaca + 50

tieneTaquicardia :: Int -> Bool
tieneTaquicardia frecuenciaCardiaca = frecuenciaCardiaca >= 100


frecuenciaCardiacaDeJuli :: Int
frecuenciaCardiacaDeJuli = frecuenciaCardiacaPromedio

-- Expresiones  -> tienen valor, no tienen efecto       5 * 3
-- Sentencias   -> no tienen un valor, tienen efecto    aux = 123

-- nuevaFrecuencia = hacerEjercicio(unaFrecuencia)
-- tieneTaquicardia(nuevaFrecuencia)


-- f(g(x)) = (fog)(x)
-- 
-- f (g x) = (f . g) x

--     tieneTaquicardia (hacerEjercicio frecuenciaCardiacaPromedio)
--     ^^^^^^^^^^^^^^^^  ^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^^^^
--          f           (     g                     x             )

-- (tieneTaquicardia . hacerEjercicio) frecuenciaCardiacaPromedio
-- 
-- tieneTaquicardia . hacerEjercicio $ frecuenciaCardiacaPromedio
 
-- Notación prefija
-- 
-- (+) 2 3
-- suma 2 3
-- 
-- Notación infija
-- 
-- 2 + 3
-- 2 `suma` 3

-- Precedencia de operadores

-- Paréntesis               
-- Aplicación prefija
-- .
-- ^
-- *, /
-- + -
-- >, <, ==
-- &&
-- ||
-- $

-- length "Paradigmas"
-- length $ "Paradigmas"

-- ($) ::   (a -> b) ->    a   ->        b
-- ($)     unaFuncion   unValor = unaFuncion unValor


-- (.) :: (b -> c) -> (a -> b) -> (a -> c)

dos :: Int
dos = 2

cinco :: Int
cinco = 5


-- max     :: Int -> Int -> Int
-- 
-- max 2   ::        Int -> Int
-- 
-- max 2 5 ::               Int


-- const     :: a -> b -> a
-- const dos ::      b -> Int


-- Formas de definir funciones

-- Definicion con nombre en archivo de código
-- Aplicación parcial
-- ???


-- Orden Superior
-- Cuando una función puede recibir a otra por parámetro, se dice que es una función de orden superior

-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- ($) :: (a -> b) -> a -> b
-- flip :: (a -> b -> c) -> b -> a -> c



-- (+)   :: Int -> (Int -> Int)

-- (+) 5 ::        Int -> Int

funcionMisteriosa2 :: Show d => (d -> Int)
funcionMisteriosa2 = length . show


-- unaFuncion :: tipo del parametro 1 -> tipo del parametro 2 -> ... -> tipo del retorno
-- unaFuncion parametro1 parametro2 .... parametroN = valorDeRetorno



-- (.) ::    (  b    ->  c ) -> (a ->    b  ) -> (a -> c)
-- length :: (String -> Int)
-- show :: Show d =>            (d -> String)

funcionMisteriosa2' :: Int
funcionMisteriosa2' = (length . show) 8

--         (* 3)                     (+)                        No tipa!
--       (Int -> Int)        (Int -> (Int -> Int))
-- (.) ::( b  ->  c )    ->  ( a  ->      b      ) -> (a -> c)

por :: Int -> Int -> Int
por unNumero otroNumero = (*) unNumero otroNumero

mas :: Int -> Int -> Int
mas unNumero otroNumero = (+) unNumero otroNumero

tres :: Int
tres = 3
