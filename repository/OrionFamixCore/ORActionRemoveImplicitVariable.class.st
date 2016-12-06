"
An ORActionRemoveImplicitVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveImplicitVariable,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveImplicitVariable >> run [
	super run.
	entity comments do: [ :com | com deleteInAction: self ].
	entity incomingAccesses do: [ :each | each deleteInAction: self ].
	entity parentPackage
		ifNotNil: [ | pack |
			pack := self orionModel retrieveEntity: entity parentPackage.
			pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parentBehaviouralEntity
		ifNotNil: [ | functionOrMethod |
			functionOrMethod := self orionModel retrieveEntity: entity parentBehaviouralEntity.
			functionOrMethod privateImplicitVariables: (functionOrMethod privateImplicitVariables orionCopy orionRemove: entity) ].
	entity receivingInvocations do: [ :com | com deleteInAction: self ].
	self orionModel remove: entity
]
