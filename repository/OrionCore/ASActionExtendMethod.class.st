Class {
	#name : #ASActionExtendMethod,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionExtendMethod class >> description [
	^'extend method'
]

{ #category : #'as yet unclassified' }
ASActionExtendMethod class >> scope [
	<ASActionFor: #ASMethod>
	^self
]

{ #category : #'method execution' }
ASActionExtendMethod >> run [
	| newMethod theNewClass theNewPackage theOldPackage |
	self flag: #fixme. "should probably not inherit from ASActionMove"
	super run.
	newMethod := (self antaresModel retrieveEntity:entity).
		
	theOldPackage := (self antaresModel retrieveEntity:entity parentPackage).
	
	theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities antaresCopy antaresRemove: newMethod).
		
	theNewPackage := (self antaresModel retrieveEntity:newContainer).
	
	newMethod privateParentPackage: theNewPackage antaresCopy.
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newMethod).
		
	theNewClass := (self antaresModel retrieveEntity:entity parentType).
	
	^newMethod
]
