module Lib where

import Data.List

numeros = [1,2,3,4,5,6,7,8,9]

-- Data record syntax
data Persona = Persona {
    nombrePersona :: String,
    edadPersona   :: Int,
    equipoArgentinoDePrimeraA :: EquipoArgentinoDePrimeraA
} deriving (Show)

data EquipoArgentinoDePrimeraA = Boca | River | SanLorenzo | Independiente | Racing deriving (Show)

data DiaSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show)

juli :: Persona
juli = Persona "Julian Berbel Alt" 27 Boca

fede :: Persona
fede = Persona "Federico Alfredo Scarpa" 34 SanLorenzo

saludar :: Persona -> String
saludar persona = "Hola " ++ nombrePersona persona ++ " de " ++ show (edadPersona persona) ++ " anios"

cumplirAños :: Persona -> Persona
cumplirAños persona = Persona (nombrePersona persona) (edadPersona persona + 1) (equipoArgentinoDePrimeraA persona)


data Estudiante = Estudiante String Int deriving (Show)

diego :: Estudiante
diego = Estudiante "Diego Hernandez" 1786784




















fst' :: (a, b) -> a
fst' (x, _) = x

snd' :: (a, b) -> b
snd' (_, y) = y



fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

snd3 :: (a, b, c) -> b
snd3 (_, y, _) = y

trd3 :: (a, b, c) -> c
trd3 (_, _, z) = z


fst4 :: (a, b, c, d) -> a
fst4 (x, _, _, _) = x

snd4 :: (a, b, c, d) -> b
snd4 (_, y, _, _) = y

trd4 :: (a, b, c, d) -> c
trd4 (_, _, z, _) = z

frd4 :: (a, b, c, d) -> d
frd4 (_, _, _, w) = w



esMultiploDe divisor dividendo = rem dividendo divisor == 0


-- (filter ((>30) . edadPersona)) [juli, fede]
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^
--            g                       x

-- (map nombrePersona) ((filter ((>30) . edadPersona)) [juli, fede])
-- ^^^^^^^^^^^^^^^^^^^  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^
--          f          (            g                       x      )

--   (f . g) x
-- (map nombrePersona . filter ((>30) . edadPersona)) [juli, fede]