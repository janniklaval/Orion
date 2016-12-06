"
A ORActionRemoveFAMIXAnnotationType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveAnnotationType,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveAnnotationType >> run [
	super run.
	entity instances do: [ :com | com deleteInAction: self ].
	entity container
		ifNotNil: [ | pack |
			pack := self orionModel retrieveEntity: entity container.
			self flag: #'TODO Implement removal from container entity but private accessors are not defined because it uses private state...' ].
	self orionModel remove: entity
]
