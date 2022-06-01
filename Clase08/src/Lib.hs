module Lib where

import Text.Show.Functions

--------------
-- Punto 01 --
--------------

data Heroe = Heroe {
    epiteto        :: String,
    reconocimiento :: Int,
    artefactos     :: [Artefacto],
    tareas         :: [Tarea]
} deriving (Show)

cambiarEpiteto        funcion heroe = heroe { epiteto = funcion (epiteto heroe) }
cambiarReconocimiento funcion heroe = heroe { reconocimiento = funcion (reconocimiento heroe) }
cambiarArtefactos     funcion heroe = heroe { artefactos = funcion (artefactos heroe) }

data Artefacto = Artefacto {
    nombre :: String,
    rareza :: Int
} deriving (Show)


--------------
-- Punto 02 --
--------------

nuevoEpiteto :: String -> Tarea
nuevoEpiteto unEpiteto unHeroe = cambiarEpiteto (const unEpiteto) heroe 

agregarArtefacto :: Artefacto -> Tarea
agregarArtefacto unArtefacto unHeroe = cambiarArtefactos (unArtefacto :) unHeroe

nuevoEpitetoYArtefacto :: String -> Artefacto -> Tarea
nuevoEpitetoYArtefacto unEpiteto unArtefacto heroe = nuevoEpiteto unEpiteto . agregarArtefacto unArtefacto $ heroe

pasarALaHistoria :: Tarea
pasarALaHistoria heroe
    | reconocimiento heroe > 1000 = nuevoEpiteto "El mítico" heroe
    | reconocimiento heroe >= 500 = nuevoEpitetoYArtefacto "El magnífico" lanzaDelOlimpo heroe
    | reconocimiento heroe >  100 = nuevoEpitetoYArtefacto "Hoplita" xiphos heroe
    | otherwise                   = heroe

lanzaDelOlimpo :: Artefacto
lanzaDelOlimpo =  Artefacto "Lanza del Olimpo" 100

xiphos :: Artefacto
xiphos =  Artefacto "Xiphos" 50

--------------
-- Punto 03 --
--------------

type Tarea = Heroe -> Heroe

encontrarArtefacto :: Artefacto -> Tarea
encontrarArtefacto artefacto heroe = agregarArtefacto artefacto . sumarReconocimiento (rareza artefacto) $ heroe

sumarReconocimiento :: Int -> Tarea
sumarReconocimiento unReconocimiento unHeroe = unHeroe { reconocimiento = unReconocimiento + reconocimiento unHeroe }

escalarElOlimpo :: Tarea
escalarElOlimpo = agregarArtefacto relampagoDeZeus . desecharArtefactosComunes . triplicarRarezaArtefactos . sumarReconocimiento 500

triplicarRarezaArtefactos :: Tarea
triplicarRarezaArtefactos heroe = cambiarArtefactos (map triplicarRareza) heroe

triplicarRareza :: Artefacto -> Artefacto
triplicarRareza artefacto = artefacto { rareza = 3 * rareza artefacto }

cambiarArtefactos :: ([Artefacto] -> [Artefacto]) -> Heroe -> Heroe
cambiarArtefactos funcion heroe = heroe { artefactos = funcion (artefactos heroe) }

desecharArtefactosComunes :: Tarea
desecharArtefactosComunes heroe = cambiarArtefactos (filter (not . esComun)) heroe

esComun :: Artefacto -> Bool
esComun artefacto = rareza artefacto < 1000

relampagoDeZeus :: Artefacto
relampagoDeZeus = Artefacto "Relámpago de Zeuz" 500

ayudarACruzarCalle :: Int -> Tarea
ayudarACruzarCalle unasCuadras heroe = nuevoEpiteto ("Gros" ++ replicate unasCuadras 'o') heroe

data Bestia = Bestia {
    nombreBestia :: String,
    debilidad    :: Debilidad
} 

type Debilidad = Heroe -> Bool

matarBestia :: Bestia -> Tarea
matarBestia bestia heroe
    | (debilidad bestia) heroe = nuevoEpiteto ("Asesino de " ++ nombreBestia bestia) heroe
    | otherwise                = (cambiarArtefactos (drop 1) . nuevoEpiteto "El cobarde") heroe

--------------
-- Punto 04 --
--------------

heracles :: Heroe
heracles = Heroe "Guardián del Olimpo" 700 [Artefacto "pistola" 1000, relampagoDeZeus] [matarAlLeonDeNemea]

--------------
-- Punto 05 --
--------------

matarAlLeonDeNemea :: Tarea
matarAlLeonDeNemea heroe = matarBestia leonDeNemea heroe

leonDeNemea :: Bestia
leonDeNemea = Bestia "León de Nemea" (\heroe -> 20 <= length (epiteto heroe))

-- Hacer que un héroe haga una tarea. Esto nos devuelve un nuevo héroe con todos los cambios que conlleva realizar una tarea.

--------------
-- Punto 06 --
--------------

realizarTarea :: Heroe -> Tarea -> Heroe
realizarTarea heroe tarea = agregarTarea tarea (tarea heroe)

agregarTarea :: Tarea -> Heroe -> Heroe
agregarTarea tarea heroe = heroe { tareas = tarea : tareas heroe }

--------------
-- Punto 07 --
--------------

-- Hacer que dos héroes presuman sus logros ante el otro. Como resultado, queremos conocer la tupla que tenga en primer lugar al ganador de la contienda, y en segundo al perdedor. Cuando dos héroes presumen, comparan de la siguiente manera:
-- * Si un héroe tiene más reconocimiento que el otro, entonces es el ganador.
-- * Si tienen el mismo reconocimiento, pero la sumatoria de las rarezas de los artefactos de un héroe es mayor al otro, entonces es el ganador.
-- * Caso contrario, ambos realizan todas las tareas del otro, y vuelven a hacer la comparación desde el principio. Llegado a este punto, el intercambio se hace tantas veces sea necesario hasta que haya un ganador.

presumir :: Heroe -> Heroe -> (Heroe, Heroe)
presumir heroe1 heroe2
    | reconocimiento heroe1 > reconocimiento heroe2 = (heroe1, heroe2)
    | reconocimiento heroe2 > reconocimiento heroe1 = (heroe2, heroe1)
    | sumaRarezaArtefactos heroe1 > sumaRarezaArtefactos heroe2  = (heroe1, heroe2)
    | sumaRarezaArtefactos heroe2 > sumaRarezaArtefactos heroe1  = (heroe2, heroe1)
    | otherwise                                                  = presumir (realizarTareasDe heroe2 heroe1) (realizarTareasDe heroe1 heroe2)

realizarTareasDe :: Heroe -> Heroe -> Heroe
realizarTareasDe otroHeroe heroe = realizarTareas (tareas otroHeroe) heroe

sumaRarezaArtefactos :: Heroe -> Int
sumaRarezaArtefactos = sum . map rareza . artefactos

presumir' :: Heroe -> Heroe -> (Heroe, Heroe)
presumir' heroe1 heroe2
    | gana heroe1 heroe2 = (heroe1, heroe2)
    | gana heroe2 heroe1 = (heroe2, heroe1)
    | otherwise          = presumir (realizarTareasDe heroe2 heroe1) (realizarTareasDe heroe1 heroe2)

gana :: Heroe -> Heroe -> Bool
gana ganador perdedor = 
    reconocimiento ganador > reconocimiento perdedor ||
    (reconocimiento ganador == reconocimiento perdedor && sumaRarezaArtefactos ganador > sumaRarezaArtefactos perdedor)

--------------
-- Punto 08 --
--------------

-- Queda infinitamente presumiendo

--------------
-- Punto 09 --
--------------

realizarTareas :: [Tarea] -> Heroe -> Heroe
realizarTareas tareas heroe = foldl realizarTarea heroe tareas

--------------
-- Punto 10 --
--------------

-- No, no se puede!!