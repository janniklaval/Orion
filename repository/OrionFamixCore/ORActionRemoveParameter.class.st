"
A ORActionRemoveParameter is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveParameter,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveParameter class >> description [
	^'remove parameter'
]

{ #category : #'method execution' }
ORActionRemoveParameter >> run [
	super run.
	entity comments do: [ :com | com deleteInAction: self ].
	entity parentPackage
		ifNotNil: [ | pack |
			pack := self orionModel retrieveEntity: entity parentPackage.
			pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parentBehaviouralEntity
		ifNotNil: [ | functionOrMethod |
			functionOrMethod := self orionModel retrieveEntity: entity parentBehaviouralEntity.
			functionOrMethod privateParameters
				ifNotEmpty: [ functionOrMethod privateParameters: (functionOrMethod privateParameters orionCopy orionRemove: entity) ] ].
	entity receivingInvocations do: [ :com | com deleteInAction: self ].
	self orionModel remove: entity
]
