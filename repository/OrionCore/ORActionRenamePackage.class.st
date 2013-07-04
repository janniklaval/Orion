Class {
	#name : #ORActionRenamePackage,
	#superclass : #ORActionRename,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRenamePackage class >> description [
	^'rename package'
]

{ #category : #'method execution' }
ORActionRenamePackage >> run [
	| thePackage |
	super run.
	
	thePackage := (self orionModel retrieveEntity:entity).
	thePackage name: newName.

	entity := thePackage.

	^ entity
	
]
