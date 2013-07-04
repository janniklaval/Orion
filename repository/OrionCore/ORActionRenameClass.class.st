Class {
	#name : #ORActionRenameClass,
	#superclass : #ORActionRename,
	#category : #'OrionCore-action'
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
