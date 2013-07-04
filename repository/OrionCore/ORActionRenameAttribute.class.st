Class {
	#name : #ORActionRenameAttribute,
	#superclass : #ORActionRename,
	#category : #'OrionCore-action'
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
