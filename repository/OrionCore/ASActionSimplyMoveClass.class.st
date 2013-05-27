Class {
	#name : #ASActionSimplyMoveClass,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionSimplyMoveClass class >> description [
	^'move class without its content'
]

{ #category : #'method execution' }
ASActionSimplyMoveClass >> run [
	| theClass theOldContainer theNewContainer|
	super run.
	theClass := (self antaresModel retrieveEntity:entity).
	
	theNewContainer := (self antaresModel retrieveEntity:newContainer).
	
	(theNewContainer isKindOf:FAMIXPackage) ifTrue:[
		theClass parentPackage ifNotNil:[
			theOldContainer := (self antaresModel retrieveEntity: theClass parentPackage).
			theOldContainer privateChildNamedEntities:  (theOldContainer privateChildNamedEntities antaresCopy antaresRemove: theClass).
		].
		theNewContainer privateChildNamedEntities:  (theNewContainer privateChildNamedEntities antaresCopy unsafeAdd: theClass).
		theClass privateParentPackage: theNewContainer.
	].
	(theNewContainer isKindOf:FAMIXNamespace) ifTrue:[
		theClass container ifNotNil:[
			theOldContainer := (self antaresModel retrieveEntity: theClass container).
			theOldContainer privateTypes: (theOldContainer privateTypes antaresCopy antaresRemove: theClass).
		].
		theNewContainer privateTypes: (theNewContainer privateTypes antaresCopy unsafeAdd: theClass).
		theClass privateContainer: theNewContainer.
	].
	^theClass
]
