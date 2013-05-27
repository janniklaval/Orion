Class {
	#name : #ASActionMoveMethod,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMoveMethod class >> description [
	^'move method'
]

{ #category : #'method execution' }
ASActionMoveMethod >> run [
	| theMethod theOldClass theNewClass theOldPackage theNewPackage|
	super run.
	theMethod := (self antaresModel retrieveEntity: entity).
	theNewClass := (self antaresModel retrieveEntity: newContainer).
	theNewPackage := (self antaresModel retrieveEntity: theNewClass parentPackage).
	
	entity parentType ifNotNil:[
		theOldClass := (self antaresModel retrieveEntity: entity parentType).
		theOldClass privateMethods: (theOldClass privateMethods antaresCopy antaresRemove: theMethod).
	].

	entity parentPackage ifNotNil:[
		theOldPackage := (self antaresModel retrieveEntity: entity parentPackage).
		theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities antaresCopy antaresRemove: theMethod).
	].

	theNewClass privateMethods:(theNewClass privateMethods unsafeAdd: theMethod).
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: theMethod).
	
	theMethod privateParentType: theNewClass antaresCopy.
	theMethod privateParentPackage: theNewPackage antaresCopy.
	
	^theMethod
]
