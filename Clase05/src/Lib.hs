import Text.Show.Functions

-- Formas de crear funciones
-- 1. Definición normal de una función

siguiente unNumero = unNumero + 1
doble unNumero = unNumero * 2

-- 2. Composicion

-- doble . siguiente

-- 3. Aplicación parcial

-- (+) :: Num a => a -> a -> a
-- 
-- (+) 3 :: Num a => a -> a



-- 4. Expresiones Lambda

-- Función anónima


type Persona = (String, Int)

cumplirAños :: Persona -> Persona
cumplirAños (nombre, edad) = (nombre, (\unNumero -> unNumero + 1) edad)
--                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
--                                         Int   ->     Int

-- Condiciones para usar expresiones lambda:
-- No tenemos un buen nombre para la abstracción
-- No la vamos a volver a usar


-- map :: (a -> b) -> [a] -> [b]

pam :: a -> [(a -> b)] -> [b]
pam valor unasFunciones = map (\unaFuncion -> unaFuncion valor) unasFunciones

esMultiploDe :: Int -> Int -> Bool
esMultiploDe multiplo elOtro = rem multiplo elOtro == 0

-- (\multiplo elOtro -> rem multiplo elOtro == 0)

-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- (.) f g = (\x -> f (g x)) 

-- (f (g x)) = (f . g) x


-- Currificación
-- Proceso de transformar una función que toma N parámetros en una cadena de N funciones de 1 parámetro

sumaDe4 :: Num a => a -> a -> a -> a -> a
sumaDe4 numero1 numero2 numero3 numero4 = numero1 + numero2 + numero3 + numero4

sumaDe4' :: Num a => a -> (a -> a -> a -> a)
sumaDe4' numero1 = (\numero2 numero3 numero4 -> numero1 + numero2 + numero3 + numero4)

sumaDe4'' :: Num a => a -> (a -> (a -> a -> a))
sumaDe4'' numero1 = (\numero2 -> (\numero3 numero4 -> numero1 + numero2 + numero3 + numero4))

sumaDe4''' :: Num a => a -> (a -> (a -> (a -> a)))
sumaDe4''' numero1 = (\numero2 -> (\numero3 -> (\numero4 -> numero1 + numero2 + numero3 + numero4)))

sumaDe4'''' :: Num a => (a -> (a -> (a -> (a -> a))))
sumaDe4'''' = (\numero1 -> (\numero2 -> (\numero3 -> (\numero4 -> numero1 + numero2 + numero3 + numero4))))

--sumaDe4 5 9
--
-- (\numero2 -> (\numero3 -> (\numero4 -> 5 + numero2 + numero3 + numero4)))) 9

-- (\numero3 -> (\numero4 -> 5 + 9 + numero3 + numero4)))
{-
(.)       :: (b ->   c) -> (a ->   b) -> (a -> c)
--           ^^^    ^^^   
doble     :: Int -> Int--  ^^^    ^^^
siguiente ::               Int -> Int

doble . siguiente :: Int -> Int


(.)         :: (    b       ->   c) -> (a ->       b      ) -> (a -> c)
--             ^^^^^^^^^^^      ^^^   
funcionRara :: (Int -> Int) ->  Int--  ^^^    ^^^^^^^^^^^^ 
(+) ::                                 Int -> (Int -> Int)


($ 3) :: (Int -> Int) -> Int

(+ 3) :: Int -> Int

doble . (+) :: 


(+) :: Int -> Int -> Int
-}


valorAbsoluto :: (Ord a, Num a) => a -> a
valorAbsoluto unNumero
  | unNumero >= 0 =  unNumero
  | otherwise     = -unNumero

factorial :: Int -> Int
factorial unNumero
  | unNumero == 0 = 1
  | unNumero >  0 = unNumero * factorial (unNumero - 1)

tipoRaices :: (Ord a, Num a) => a -> a -> a -> String
tipoRaices a b c
  | discriminante == 0 = "Raiz doble"
  | discriminante  > 0 = "Dos raices simples"
  | otherwise          = "Dos raices imaginarias"
  where 
    discriminante = b^2 - 4 * a * c

-- Pattern Matching

factorial' :: Int -> Int
factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

saludar "Fede" = "Hola"
saludar otroNombre = "Hola persona hermosa"

primero (x, _) = x
segundo (_, y) = y

funcionRara (4, (a, b)) = a * b
funcionRara (7, (a, b)) = a - b
funcionRara (_, (a, b)) = a / b

conjuncion :: Bool -> Bool -> Bool
conjuncion True True = True
conjuncion _    _    = False

disyuncion :: Bool -> Bool -> Bool
disyuncion False False = False
disyuncion _     _     = True

listaDe4ElementosSinElTercerElemento :: [a] -> [a]
listaDe4ElementosSinElTercerElemento [x, y, z, w] = [x, y, w]

listaDe4BooleanosSinElTercerElemento :: [Bool] -> [Bool]
listaDe4BooleanosSinElTercerElemento [True, y, z, w] = [y, z, w]
