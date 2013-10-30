"
A ORActionRenamePackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRenamePackage,
	#superclass : #ORActionRename,
	#category : #'OrionFamixCore-Action'
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
