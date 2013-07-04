Class {
	#name : #ORActionRemoveNamespace,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveNamespace class >> description [
	^'remove namespace'
]

{ #category : #'as yet unclassified' }
ORActionRemoveNamespace class >> scope [
	<ORActionFor: #ORNamespace>
	^self
]

{ #category : #'method execution' }
ORActionRemoveNamespace >> run [
	|namespace pack|
	super run.
	entity parentPackage ifNotNil:[
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity parentScope ifNotNil:[
		namespace := (self orionModel retrieveEntity:entity parentScope).
		namespace privateChildScopes:  (namespace privateChildScopes orionCopy orionRemove: entity).
	].
	entity outgoingReferences do:[:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity incomingReferences do:[:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].

	entity types do:[:each |
		| class |
		class := (self orionModel retrieveEntity:each).
		entity parentScope isNil ifFalse:[
			class privateContainer: namespace.
			namespace privateTypes: (namespace privateTypes orionCopy unsafeAdd: class).]
		ifTrue:[class privateContainer: nil].
	].

	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity functions do:[:com |
		ORActionRemoveFunction new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity globalVariables do:[:com |
		ORActionRemoveGlobalVariable new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity receivingInvocations do:[:com |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	
	entity childScopes do:[:each |
		| scope |
		scope := (self orionModel retrieveEntity:each).
		entity parentScope isNil ifFalse:[
			scope privateParentScope: namespace.
			namespace privateChildScopes: (namespace privateChildScopes orionCopy unsafeAdd: scope).]
		ifTrue:[scope privateParentScope: nil].
	].
	self orionModel remove: entity.
	self postRun.
]
