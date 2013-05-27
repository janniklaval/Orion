Class {
	#name : #ASActionMoveNamespace,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMoveNamespace class >> description [
	^'move namespace'
]

{ #category : #'method execution' }
ASActionMoveNamespace >> run [
	| theNamespace theOlContainer theNewContainer |
	super run.
	theNamespace := (self antaresModel retrieveEntity:entity).
	
	theNewContainer := (self antaresModel retrieveEntity:newContainer).
	
	(theNewContainer isKindOf:FAMIXPackage) ifTrue:[
		theNamespace parentPackage ifNotNil:[
			theOlContainer := (self antaresModel retrieveEntity: theNamespace parentPackage).
			theOlContainer privateChildScopes:  (theOlContainer privateChildScopes antaresCopy antaresRemove: theNamespace)].
		theNewContainer privateChildScopes:  (theNewContainer privateChildScopes antaresCopy unsafeAdd: theNamespace).
		theNamespace privateParentPackage: theNewContainer.
	].
	
	(theNewContainer isKindOf:FAMIXNamespace) ifTrue:[
		theNamespace parentScope ifNotNil:[
			theOlContainer := (self antaresModel retrieveEntity: theNamespace parentScope).
			theOlContainer privateChildScopes: (theOlContainer privateChildScopes antaresCopy antaresRemove: theNamespace)].
		theNewContainer privateChildScopes: (theNewContainer privateChildScopes antaresCopy unsafeAdd: theNamespace).
		theNamespace privateParentScope: theNewContainer.
	].
	^theNamespace
]
