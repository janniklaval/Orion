"
An ORActionRemoveUnknownVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveUnknownVariable,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveUnknownVariable >> run [
		self orionModel remove: entity.
]
