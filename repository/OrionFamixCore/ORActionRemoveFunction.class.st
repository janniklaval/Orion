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
	entity accesses do: [ :each | each deleteInAction: self ].
	entity comments do: [ :com | com deleteInAction: self ].
	entity incomingInvocations
		do: [ :each | 
			ORActionRemoveSurelyInvocation new
				parentAction: self;
				orionModel: self orionModel;
				entity: each;
				to: entity;
				run ].
	entity incomingReferences do: [ :each | each deleteInAction: self ].
	entity localVariables do: [ :com | com deleteInAction: self ].
	entity outgoingReferences do: [ :each | each deleteInAction: self ].
	entity outgoingInvocations do: [ :each | each deleteInAction: self ].
	entity parameters do: [ :com | com deleteInAction: self ].
	entity parentPackage
		ifNotNil: [ | pack |
			pack := self orionModel retrieveEntity: entity parentPackage.
			pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parentScope
		ifNotNil: [ | typ |
			typ := self orionModel retrieveEntity: entity parentScope.
			typ privateFunctions: (typ privateFunctions orionCopy orionRemove: entity) ].
	entity receivingInvocations do: [ :com | com deleteInAction: self ].
	entity types do: [ :each | each deleteInAction: self ].
	self orionModel remove: entity
]
