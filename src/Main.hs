-- | Haskell language pragma
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

-- | Haskell module declaration
module Main where

import Control.Arrow
import qualified Data.Map.Lazy as M

-- | Miso framework import
import Miso
import qualified Miso.String as S

import Action
import Model
import Update
import View

-- | Entry point for a miso application
main :: IO ()
main = do
  t <- now
  let m = initialModel {time = t}
  startApp App {model = m, initialAction = Init, ..}
  where
    update = updateModel -- update function
    view = viewModel -- view function
    events = defaultEvents -- default delegated events
    subs = [arrowsSub GetArrows] -- empty subscription list
