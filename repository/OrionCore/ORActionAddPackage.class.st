Class {
	#name : #ORActionAddPackage,
	#superclass : #ORActionAddEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddPackage class >> description [
	^'add package'
]

{ #category : #'as yet unclassified' }
ORActionAddPackage class >> needs: anElement [
	^nil
]

{ #category : #'as yet unclassified' }
ORActionAddPackage >> initialize [
	super initialize.
	newName := 'newFamixPackage'.

]

{ #category : #'method execution' }
ORActionAddPackage >> run [
	| newPackage |
	super run.
	newPackage := ORPackage new.
	newPackage name: newName.
	self orionModel add: newPackage.
	container ifNotNil:[
		|theNewPackage|
		theNewPackage := (self orionModel retrieveEntity: container).
		newPackage privateParentPackage: theNewPackage orionCopy.
		theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newPackage)
	].
	entity := newPackage.
	
	^ entity
]
