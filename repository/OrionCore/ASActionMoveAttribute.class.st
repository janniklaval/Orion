Class {
	#name : #ASActionMoveAttribute,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMoveAttribute class >> description [
	^'move attribute'
]

{ #category : #'method execution' }
ASActionMoveAttribute >> run [
	| theAttribute theOldClass theNewClass theOldPackage theNewPackage|
	super run.
	
	theAttribute := (self antaresModel retrieveEntity:entity).
	theNewClass := (self antaresModel retrieveEntity:newContainer).
	"theNewPackage := (self antaresModel retrieveEntity:theNewClass parentPackage)."
	
	entity parentType ifNotNil:[
		theOldClass := (self antaresModel retrieveEntity:entity parentType).
		theOldClass privateAttributes:(theOldClass privateAttributes  antaresCopy antaresRemove: theAttribute).
	].

	entity parentPackage ifNotNil:[
		theOldPackage := (self antaresModel retrieveEntity:entity parentPackage).
		theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities antaresCopy antaresRemove: theAttribute).
	].

	theNewClass privateAttributes:(theNewClass privateAttributes  unsafeAdd: theAttribute).
	"theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: theAttribute)."
	
	theAttribute privateParentType: theNewClass antaresCopy.
	theAttribute parentPackage: theNewPackage antaresCopy.
	
	^theAttribute
]
