Class {
	#name : #ORActionExtendMethod,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionExtendMethod class >> description [
	^'extend method'
]

{ #category : #'as yet unclassified' }
ORActionExtendMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionExtendMethod >> run [
	| newMethod theNewClass theNewPackage theOldPackage |
	self flag: #fixme. "should probably not inherit from ORActionMove"
	super run.
	newMethod := (self orionModel retrieveEntity:entity).
		
	theOldPackage := (self orionModel retrieveEntity:entity parentPackage).
	
	theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities orionCopy orionRemove: newMethod).
		
	theNewPackage := (self orionModel retrieveEntity:newContainer).
	
	newMethod privateParentPackage: theNewPackage orionCopy.
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newMethod).
		
	theNewClass := (self orionModel retrieveEntity:entity parentType).
	
	^newMethod
]
