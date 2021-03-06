{-# LANGUAGE
  RankNTypes,
  ScopedTypeVariables,
  TypeApplications,
  TypeFamilies,
  KindSignatures,
  MultiParamTypeClasses,
  FlexibleInstances,
  NoMonomorphismRestriction,
  ConstraintKinds,
  DataKinds,
  FlexibleContexts
#-}

module DDF.Meta.Diff (module DDF.Meta.Diff, module DDF.Meta.Interpreter, module DDF.Vector) where

import DDF.Vector
import DDF.Meta.Interpreter

type family DiffType (v :: *) (x :: *)

newtype GDiff r h x = GDiff {runGDiff :: forall v. Vector r v => Proxy v -> Diff r v h x}

newtype Diff r v h x = Diff {runDiff :: r (DiffType v h) (DiffType v x)}
