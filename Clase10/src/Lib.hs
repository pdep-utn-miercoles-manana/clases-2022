module Lib where

import Text.Show.Functions

--------------
-- Punto 01 --
--------------

data Investigador = Investigador {
    nombre      :: String,
    experiencia :: Float,
    compañero   :: Pokemon,
    mochila     :: [Item],
    pokemons    :: [Pokemon]
} deriving (Show)

data Pokemon = Pokemon {
    mote        :: String,
    descripcion :: String,
    nivel       :: Int,
    puntosBase  :: Float,
    esAlfa      :: Bool
} deriving (Show)

data Rango = Cielo | Estrella | Constelacion | Galaxia deriving (Show, Eq)

ranking :: Rango -> Float
ranking Cielo        =    0
ranking Estrella     =  100
ranking Constelacion =  500
ranking Galaxia      = 2000

akari :: Investigador
akari = Investigador "Akari" (ranking Galaxia - 501) oshawott [] [oshawott]

oshawott :: Pokemon
oshawott = Pokemon "Oshawott" "Una nutria que pelea con el caparazón de su pecho" 5 3 False

--------------
-- Punto 02 --
--------------

rango :: Investigador -> Rango
rango investigador
    | noAlcanzaRango Estrella     = Cielo
    | noAlcanzaRango Constelacion = Estrella
    | noAlcanzaRango Galaxia      = Constelacion
    | otherwise                   = Galaxia
    where
        noAlcanzaRango rango = experiencia investigador < ranking rango

--------------
-- Punto 03 --
--------------

type Actividad = Investigador -> Investigador

type Item = Float -> Float 
-- Podría ser una función de Investigador -> Investigador 
-- pero como solo se aplpicaba a la experiencia me pareció mas simple esto

-- A -- 

obtenerItem :: Item -> Actividad
obtenerItem item = mapExperiencia item . agregarItem item

mapExperiencia :: (Float -> Float) -> Investigador -> Investigador
mapExperiencia f investigador = investigador { experiencia = max 0 . f $ experiencia investigador }

baya :: Item
baya = (^2).(+1)

apicorns :: Item
apicorns = (* 1.5)

guijarros :: Item
guijarros = (+ 2)

fragmentos :: Float -> Item
fragmentos cantidad = (/ cantidad)

agregarItem :: Item -> Investigador -> Investigador
agregarItem item = mapMochila (item :)

mapMochila :: ([Item] -> [Item]) -> Investigador -> Investigador
mapMochila f investigador = investigador { mochila = f $ mochila investigador }

-- B --

admirarElPaisaje :: Actividad
admirarElPaisaje = mapExperiencia (* 0.95) . mapMochila (drop 3)

-- C --

capturar :: Pokemon -> Actividad
capturar pokemon = mapCompañero (mejorCompañero pokemon) . agregarPokemon pokemon . sumarExperiencia (puntos pokemon)

sumarExperiencia :: Float -> Investigador -> Investigador
sumarExperiencia cantidad = mapExperiencia (+ cantidad) 

agregarPokemon :: Pokemon -> Investigador -> Investigador
agregarPokemon pokemon investigador = investigador { pokemons = pokemon : pokemons investigador }

puntos :: Pokemon -> Float
puntos pokemon
    | esAlfa pokemon = puntosBase pokemon * 2
    | otherwise      = puntosBase pokemon

mejorCompañero :: Pokemon -> Pokemon -> Pokemon
mejorCompañero pokemon compañero
    | nivel pokemon > 20 = pokemon
    | otherwise          = compañero

mapCompañero :: (Pokemon -> Pokemon) -> Investigador -> Investigador
mapCompañero f investigador = investigador { compañero = f $ compañero investigador }

-- D --

combatir :: Pokemon -> Actividad
combatir pokemon investigador
    | leGana (compañero investigador) pokemon = sumarExperiencia (puntos pokemon / 2) investigador
    | otherwise                               = investigador

leGana :: Pokemon -> Pokemon -> Bool
leGana pokemon1 pokemon2 = nivel pokemon1 > nivel pokemon2

--------------
-- Punto 04 --
--------------

type Expedicion = [Actividad]

reporte :: (Investigador -> a) -> (Investigador -> Bool) -> Expedicion -> [Investigador] -> [a]
reporte transformacion condicion expedicion = map transformacion . filter condicion . map (realizarExpedicion expedicion)

realizarExpedicion :: Expedicion -> Investigador -> Investigador
realizarExpedicion expedicion investigador = foldl (flip ($)) investigador expedicion

-- Reportes --

nombreInvestigadoresConMasDeTresAlfas :: Expedicion -> [Investigador] -> [String]
nombreInvestigadoresConMasDeTresAlfas = reporte nombre ((>3) . length . filter esAlfa . pokemons)

experienciaDeGalacticos :: Expedicion -> [Investigador] -> [Float]
experienciaDeGalacticos = reporte experiencia ((== Galaxia) . rango)

compañerosPoderosos :: Expedicion -> [Investigador] -> [Pokemon]
compañerosPoderosos = reporte compañero ((>= 10) . nivel . compañero)

ultimosTresCapturadosPares :: Expedicion -> [Investigador] -> [[Pokemon]]
ultimosTresCapturadosPares = reporte (take 3 . pokemons)  (all (even . nivel) . pokemons)

--------------
-- Punto 05 --
--------------

-- De la forma en la que está realizado, si un investigador tuviese infinitos:
-- pokemons solo funcionaria los reportes de experienciaDeGalacticos y compañerosPoderosos. 
-- El reporte de nombreInvestigadoresConMasDeTresAlfas se quedaría colgado y ultimosTresCapturadosPares 
-- se quedaría colgado si todos los pokemons tienen nivel par pero respondería si algún pokemon tiene nivel impar
