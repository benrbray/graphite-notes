{-# LANGUAGE DuplicateRecordFields, RecordWildCards, NamedFieldPuns #-}

import Data.Text qualified as T
import Data.Map (Map)
import Data.Map qualified as M
import Data.Void (Void)
import Data.Set (Set)

newtype ProtoNodeIdentifier = ProtoNodeIdentifier T.Text

-- represents a rust type 
newtype TypeDescriptor = TypeDescriptor { 
  t :: T.Text,
  alias :: T.Text -- used by UI to assign widgets for concrete types
}

newtype GenericVar = GenericVar T.Text

data Type
  = TypeGeneric GenericVar      -- type variable
  | TypeConcrete TypeDescriptor -- concrete rust type
  | TypeFn Type Type            -- function type
  | TypeFuture Type             -- future returning inner type

---------------------------

data NodeId

data NodeNetwork

-- the "function signature" of a node
data NodeTypes = NodeTypes {
  inputs :: [Type],
  output :: Type
}

-- network_interface.rs
data NodeNetworkInterface = NodeNetworkInterface {
  network :: NodeNetwork,
  resolved_types :: Map [NodeId] NodeTypes
  -- and more...
}

----------------------------

-- proto.rs
data TypingContext = TypingContext {

}

-- dynamic_executor.rs
data DynamicExecutor = DynamicExecutor {
  output :: NodeId,
  tree :: Void,
  typingContext :: TypingContext,
  orphanedNodes :: Set NodeId
}

----------------------------

compile :: NodeNetwork -> ProtoNetwork

