
elNumeroPi :: Float
elNumeroPi = 3.1415926536589

edadDeNico :: Int
edadDeNico = 21

letraDeCarreraDeLaUTN :: Char
letraDeCarreraDeLaUTN = 'K'

comoNoLeGustaAFedeQueLoLlamen :: String
comoNoLeGustaAFedeQueLoLlamen = "Profe"

riquelmeEstaFeliz :: Bool
riquelmeEstaFeliz = True

anterior :: Int -> Int
anterior unNumero = unNumero - 1

cuadruple :: Num a => a -> a
cuadruple unNumero = 4 * unNumero

cuadruple' :: Num a => a -> a
cuadruple' unNumero = 2 * doble unNumero

cuadruple'' :: Num a => a -> a
cuadruple'' unNumero = doble (doble unNumero)

cuadruple''' :: Num a => a -> a
cuadruple''' unNumero = (doble . doble) unNumero

cuadruple'''' :: Num a => a -> a
cuadruple'''' = doble . doble

cuadrado :: Num a => a -> a
cuadrado unNumero = unNumero * unNumero

doble :: (Num a) => a -> a
doble unNumero = 2 * unNumero

sonMultiplos :: Int -> Int -> Bool
sonMultiplos unNumero otroNumero = rem unNumero otroNumero == 0

identidad :: a -> a
identidad unValor = unValor