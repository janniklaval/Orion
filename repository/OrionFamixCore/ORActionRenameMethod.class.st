"
A ORActionRenameMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRenameMethod,
	#superclass : #ORActionRename,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRenameMethod class >> description [
	^'rename method'
]

{ #category : #'method execution' }
ORActionRenameMethod >> run [
	| theMethod |
	super run.
	
	theMethod := (self orionModel retrieveEntity:entity).
	theMethod name: newName.

	entity := theMethod.

	^ entity
	
]
