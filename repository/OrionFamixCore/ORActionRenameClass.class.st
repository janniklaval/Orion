"
A ORActionRenameClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRenameClass,
	#superclass : #ORActionRename,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRenameClass class >> description [
	^'rename class'
]

{ #category : #'method execution' }
ORActionRenameClass >> run [
	| theClass |
	super run.
	
	theClass := (self orionModel retrieveEntity:entity).
	theClass name: newName.

	entity := theClass.

	^ entity
	
]
