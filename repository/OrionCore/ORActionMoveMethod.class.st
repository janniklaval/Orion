Class {
	#name : #ORActionMoveMethod,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionMoveMethod class >> description [
	^'move method'
]

{ #category : #'method execution' }
ORActionMoveMethod >> run [
	| theMethod theOldClass theNewClass theOldPackage theNewPackage|
	super run.
	theMethod := (self orionModel retrieveEntity: entity).
	theNewClass := (self orionModel retrieveEntity: newContainer).
	theNewPackage := theNewClass parentPackage ifNil: [ self orionModel retrieveEntity: theNewClass belongsTo ] ifNotNil: [self orionModel retrieveEntity: theNewClass parentPackage].
	
	entity parentType ifNotNil:[
		theOldClass := (self orionModel retrieveEntity: entity parentType).
		theOldClass privateMethods: (theOldClass privateMethods orionCopy orionRemove: theMethod).
	].

	entity parentPackage ifNotNil:[
		theOldPackage := (self orionModel retrieveEntity: entity parentPackage).
		theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities orionCopy orionRemove: theMethod).
	].

	theNewClass privateMethods:(theNewClass privateMethods unsafeAdd: theMethod).
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: theMethod).
	
	theMethod privateParentType: theNewClass orionCopy.
	theMethod privateParentPackage: theNewPackage orionCopy.
	
	^theMethod
]
