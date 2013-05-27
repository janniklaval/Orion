Class {
	#name : #ASActionRenameClass,
	#superclass : #ASActionRename,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRenameClass class >> description [
	^'rename class'
]

{ #category : #'method execution' }
ASActionRenameClass >> run [
	| theClass |
	super run.
	
	theClass := (self antaresModel retrieveEntity:entity).
	theClass name: newName.

	entity := theClass.

	^ entity
	
]
