Class {
	#name : #ORActionRenameMethod,
	#superclass : #ORActionRename,
	#category : #'OrionCore-action'
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
