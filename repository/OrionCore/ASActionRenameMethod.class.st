Class {
	#name : #ASActionRenameMethod,
	#superclass : #ASActionRename,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRenameMethod class >> description [
	^'rename method'
]

{ #category : #'method execution' }
ASActionRenameMethod >> run [
	| theMethod |
	super run.
	
	theMethod := (self antaresModel retrieveEntity:entity).
	theMethod name: newName.

	entity := theMethod.

	^ entity
	
]
