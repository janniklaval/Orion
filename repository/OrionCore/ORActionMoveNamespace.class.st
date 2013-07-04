Class {
	#name : #ORActionMoveNamespace,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
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
	].
	
	(theNewContainer isKindOf:FAMIXNamespace) ifTrue:[
		theNamespace parentScope ifNotNil:[
			theOlContainer := (self orionModel retrieveEntity: theNamespace parentScope).
			theOlContainer privateChildScopes: (theOlContainer privateChildScopes orionCopy orionRemove: theNamespace)].
		theNewContainer privateChildScopes: (theNewContainer privateChildScopes orionCopy unsafeAdd: theNamespace).
		theNamespace privateParentScope: theNewContainer.
	].
	^theNamespace
]
