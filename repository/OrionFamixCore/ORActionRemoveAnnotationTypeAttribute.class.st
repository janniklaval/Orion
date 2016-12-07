"
A ORActionRemoveFAMIXAnnotationTypeAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveAnnotationTypeAttribute,
	#superclass : #ORActionRemoveAttribute,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveAnnotationTypeAttribute >> run [
	super run.
	entity annotationAttributeInstances do: [ :com | com deleteInAction: self ].
	self orionModel remove: entity
]
