Class {
	#name : #ASActionMovePackage,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMovePackage class >> description [
	^'move package'
]

{ #category : #'method execution' }
ASActionMovePackage >> run [
	| thePackage theOlContainer theNewContainer |
	super run.
	thePackage := (self antaresModel retrieveEntity:entity).
	theNewContainer := (self antaresModel retrieveEntity:newContainer).
	
	thePackage parentPackage ifNotNil:[
		theOlContainer := (self antaresModel retrieveEntity: thePackage parentPackage).
		theOlContainer privateChildNamedEntities:  (theOlContainer privateChildNamedEntities antaresCopy antaresRemove: thePackage)].
	theNewContainer privateChildNamedEntities:  (theNewContainer privateChildNamedEntities antaresCopy unsafeAdd: thePackage).
	thePackage privateParentPackage: theNewContainer.
	
	^thePackage
]
