"
A ORActionRenameAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRenameAttribute,
	#superclass : #ORActionRename,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRenameAttribute class >> description [
	^'rename attribute'
]

{ #category : #'method execution' }
ORActionRenameAttribute >> run [
	| theAttribute |
	super run.
	
	theAttribute := (self orionModel retrieveEntity:entity).
	theAttribute name: newName.

	entity := theAttribute.

	^ entity
	
]
