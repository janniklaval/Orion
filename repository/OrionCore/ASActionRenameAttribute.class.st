Class {
	#name : #ASActionRenameAttribute,
	#superclass : #ASActionRename,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRenameAttribute class >> description [
	^'rename attribute'
]

{ #category : #'method execution' }
ASActionRenameAttribute >> run [
	| theAttribute |
	super run.
	
	theAttribute := (self antaresModel retrieveEntity:entity).
	theAttribute name: newName.

	entity := theAttribute.

	^ entity
	
]
