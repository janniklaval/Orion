Class {
	#name : #ASActionRenamePackage,
	#superclass : #ASActionRename,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRenamePackage class >> description [
	^'rename package'
]

{ #category : #'method execution' }
ASActionRenamePackage >> run [
	| thePackage |
	super run.
	
	thePackage := (self antaresModel retrieveEntity:entity).
	thePackage name: newName.

	entity := thePackage.

	^ entity
	
]
