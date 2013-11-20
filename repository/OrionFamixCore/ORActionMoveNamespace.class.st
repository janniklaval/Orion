"
A ORActionMoveNamespace is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionMoveNamespace,
	#superclass : #ORActionMove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMoveNamespace class >> description [
	^'move namespace'
]

{ #category : #'method execution' }
ORActionMoveNamespace >> run [
	| theNamespace theOlContainer theNewContainer |
	super run.
	theNamespace := (self orionModel retrieveEntity:entity).
	
	theNewContainer := (self orionModel retrieveEntity:newContainer).
	
	(theNewContainer isKindOf:FAMIXPackage) ifTrue:[
		theNamespace parentPackage ifNotNil:[
			theOlContainer := (self orionModel retrieveEntity: theNamespace parentPackage).
			theOlContainer privateChildScopes:  (theOlContainer privateChildScopes orionCopy orionRemove: theNamespace)].
		theNewContainer privateChildScopes:  (theNewContainer privateChildScopes orionCopy unsafeAdd: theNamespace).
		theNamespace privateParentPackage: theNewContainer.
		theNamespace resetMooseName.
	].
	
	(theNewContainer isKindOf:FAMIXNamespace) ifTrue:[
		theNamespace parentScope ifNotNil:[
			theOlContainer := (self orionModel retrieveEntity: theNamespace parentScope).
			theOlContainer privateChildScopes: (theOlContainer privateChildScopes orionCopy orionRemove: theNamespace)].
		theNewContainer privateChildScopes: (theNewContainer privateChildScopes orionCopy unsafeAdd: theNamespace).
		theNamespace privateParentScope: theNewContainer.
		theNamespace resetMooseName.
	].
	^theNamespace
]
