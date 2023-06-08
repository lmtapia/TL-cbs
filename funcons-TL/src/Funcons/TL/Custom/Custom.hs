-- GeNeRaTeD fOr: /home/luis/Desktop/TESIS/CBS-beta/My-Languages/TL/TL-cbs/Funcons/Custom/Custom.cbs
{-# LANGUAGE OverloadedStrings #-}

module Funcons.TL.Custom.Custom where

import Funcons.EDSL

import Funcons.Operations hiding (Values,libFromList)
entities = []

types = typeEnvFromList
    []

funcons = libFromList
    [("last",StrictFuncon stepLast),("while-values",NonStrictFuncon stepWhile_values),("if-true-empty",PartiallyStrictFuncon [Strict] NonStrict stepIf_true_empty)]

last_ fargs = FApp "last" (fargs)
stepLast fargs =
    evalRules [rewrite1,rewrite2,rewrite3] []
    where rewrite1 = do
            let env = emptyEnv
            env <- vsMatch fargs [VPAnnotated (VPMetaVar "V") (TName "values")] env
            rewriteTermTo (TVar "V") env
          rewrite2 = do
            let env = emptyEnv
            env <- vsMatch fargs [VPAnnotated VPWildCard (TName "values"),VPAnnotated (VPSeqVar "V+" PlusOp) (TSortSeq (TName "values") PlusOp)] env
            rewriteTermTo (TApp "last" [TVar "V+"]) env
          rewrite3 = do
            let env = emptyEnv
            env <- vsMatch fargs [] env
            rewriteTermTo (TName "null-value") env

while_values_ fargs = FApp "while-values" (fargs)
stepWhile_values fargs =
    evalRules [rewrite1] []
    where rewrite1 = do
            let env = emptyEnv
            env <- fsMatch fargs [PMetaVar "B",PSeqVar "X+" PlusOp] env
            rewriteTermTo (TApp "if-true-empty" [TVar "B",TApp "left-to-right" [TVar "X+",TApp "while-values" [TVar "B",TVar "X+"]]]) env

if_true_empty_ fargs = FApp "if-true-empty" (fargs)
stepIf_true_empty fargs =
    evalRules [rewrite1,rewrite2] []
    where rewrite1 = do
            let env = emptyEnv
            env <- fsMatch fargs [PValue (PADT "true" []),PSeqVar "X+" PlusOp] env
            rewriteTermTo (TVar "X+") env
          rewrite2 = do
            let env = emptyEnv
            env <- fsMatch fargs [PValue (PADT "false" []),PSeqVar "X+" PlusOp] env
            rewriteTermTo (TSeq []) env