Class {
	#name : #ASActionMoveMethodInPackage,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMoveMethodInPackage class >> description [
	^'move method in another package'
]

{ #category : #'method execution' }
ASActionMoveMethodInPackage >> run [
	| theMethod theOldPackage theNewPackage|
	super run.
	theMethod := (self antaresModel retrieveEntity:entity).
	theNewPackage := (self antaresModel retrieveEntity:newContainer).
	
	theMethod parentPackage ifNotNil:[
		theOldPackage := (self antaresModel retrieveEntity: (theMethod parentPackage)).
		theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities antaresCopy antaresRemove: theMethod).
	].

	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: theMethod).	
	theMethod privateParentPackage: theNewPackage.
	
	^theMethod
]
