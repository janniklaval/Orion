"
A ORActionMovePackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionMovePackage,
	#superclass : #ORActionMove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMovePackage class >> description [
	^'move package'
]

{ #category : #'method execution' }
ORActionMovePackage >> run [
	| thePackage theOlContainer theNewContainer |
	super run.
	thePackage := (self orionModel retrieveEntity:entity).
	theNewContainer := (self orionModel retrieveEntity:newContainer).
	
	thePackage parentPackage ifNotNil:[
		theOlContainer := (self orionModel retrieveEntity: thePackage parentPackage).
		theOlContainer privateChildNamedEntities:  (theOlContainer privateChildNamedEntities orionCopy orionRemove: thePackage)].
	theNewContainer privateChildNamedEntities:  (theNewContainer privateChildNamedEntities orionCopy unsafeAdd: thePackage).
	thePackage privateParentPackage: theNewContainer.
	
	^thePackage
]
