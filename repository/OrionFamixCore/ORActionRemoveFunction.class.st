"
A ORActionRemoveFunction is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveFunction,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveFunction class >> description [
	^'remove function'
]

{ #category : #'method execution' }
ORActionRemoveFunction >> run [
	super run.
	entity accesses do:[:each |
		ORActionRemoveAccess new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity incomingInvocations do:[:each |
		ORActionRemoveSurelyInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			to: entity; 
			run.
	].
	entity incomingReferences do:[:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity localVariables do:[:com |
		ORActionRemoveLocalVariable new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity outgoingReferences do:[:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].	
	entity outgoingInvocations do:[:each |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity parameters do:[:com |
		ORActionRemoveParameter new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity parentScope ifNotNil:[
		| typ |
		typ := (self orionModel retrieveEntity:entity parentScope).
		typ privateFunctions: (typ privateFunctions orionCopy orionRemove: entity)
	].
	entity receivingInvocations do:[:com |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity types do:[:each |
		ORActionRemoveClass new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	self orionModel remove: entity.

]
