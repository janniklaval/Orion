Class {
	#name : #ASActionAddPackage,
	#superclass : #ASActionAddEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddPackage class >> description [
	^'add package'
]

{ #category : #'as yet unclassified' }
ASActionAddPackage class >> needs: anElement [
	^nil
]

{ #category : #'as yet unclassified' }
ASActionAddPackage >> initialize [
	super initialize.
	newName := 'newFamixPackage'.

]

{ #category : #'method execution' }
ASActionAddPackage >> run [
	| newPackage |
	super run.
	newPackage := ASPackage new.
	newPackage name: newName.
	self antaresModel add: newPackage.
	container ifNotNil:[
		|theNewPackage|
		theNewPackage := (self antaresModel retrieveEntity: container).
		newPackage privateParentPackage: theNewPackage antaresCopy.
		theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newPackage)
	].
	entity := newPackage.
	
	^ entity
]
