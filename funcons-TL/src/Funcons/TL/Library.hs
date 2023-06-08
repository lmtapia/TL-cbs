module Funcons.TL.Library ( funcons ) where

import Funcons.EDSL
import Funcons.TL.Custom.Custom hiding (funcons,types,entities)
import qualified Funcons.TL.Custom.Custom
funcons = libUnions 
    [
     Funcons.TL.Custom.Custom.funcons
    ]
