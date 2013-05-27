Class {
	#name : #ASActionUnextendMethod,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionUnextendMethod class >> description [
	^'unextend method'
]

{ #category : #'as yet unclassified' }
ASActionUnextendMethod class >> needs: anElement [
	^nil
]

{ #category : #'as yet unclassified' }
ASActionUnextendMethod class >> scope [
	<ASActionFor: #ASMethod>
	^self
]

{ #category : #'method execution' }
ASActionUnextendMethod >> run [
	| newMethod theNewClass theNewPackage theOldPackage |
	super run.
	newMethod := (self antaresModel retrieveEntity:entity).
		
	theOldPackage := (self antaresModel retrieveEntity:entity parentPackage).
	theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities antaresCopy antaresRemove: newMethod).
	
	theNewClass := (self antaresModel retrieveEntity:entity parentType).
	theNewClass extendedInPackages remove: entity parentPackage.
	
	theNewPackage := (self antaresModel retrieveEntity: theNewClass parentPackage).
	
	newMethod privateParentPackage: theNewPackage.
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newMethod).

	^newMethod
]
