"
A ORActionRemoveGlobalVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveGlobalVariable,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveGlobalVariable class >> description [
	^'remove global variable'
]

{ #category : #'method execution' }
ORActionRemoveGlobalVariable >> run [
	super run.
	entity comments do: [ :com | com deleteInAction: self ].
	entity incomingAccesses do: [ :each | each deleteInAction: self ].
	entity parentPackage
		ifNotNil: [ | pack |
			pack := self orionModel retrieveEntity: entity parentPackage.
			pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parentScope
		ifNotNil: [ | scope |
			scope := self orionModel retrieveEntity: entity parentScope.
			scope privateGlobalVariables: (scope privateGlobalVariables orionCopy orionRemove: entity) ].
	entity receivingInvocations do: [ :com | com deleteInAction: self ].
	self orionModel remove: entity
]
