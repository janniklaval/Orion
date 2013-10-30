"
A ORActionMoveAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionMoveAttribute,
	#superclass : #ORActionMove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMoveAttribute class >> description [
	^'move attribute'
]

{ #category : #'method execution' }
ORActionMoveAttribute >> run [
	| theAttribute theOldClass theNewClass theOldPackage theNewPackage|
	super run.
	
	theAttribute := (self orionModel retrieveEntity:entity).
	theNewClass := (self orionModel retrieveEntity:newContainer).
	"theNewPackage := (self orionModel retrieveEntity:theNewClass parentPackage)."
	
	entity parentType ifNotNil:[
		theOldClass := (self orionModel retrieveEntity:entity parentType).
		theOldClass privateAttributes:(theOldClass privateAttributes  orionCopy orionRemove: theAttribute).
	].

	entity parentPackage ifNotNil:[
		theOldPackage := (self orionModel retrieveEntity:entity parentPackage).
		theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities orionCopy orionRemove: theAttribute).
	].

	theNewClass privateAttributes:(theNewClass privateAttributes  unsafeAdd: theAttribute).
	"theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: theAttribute)."
	
	theAttribute privateParentType: theNewClass orionCopy.
	theAttribute parentPackage: theNewPackage orionCopy.
	
	^theAttribute
]
