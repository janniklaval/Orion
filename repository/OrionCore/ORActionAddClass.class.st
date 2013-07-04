Class {
	#name : #ORActionAddClass,
	#superclass : #ORActionAddEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddClass class >> description [
	^'add class'
]

{ #category : #accessing }
ORActionAddClass >> container [
	^ container
]

{ #category : #accessing }
ORActionAddClass >> container: anObject [
	container := anObject
]

{ #category : #'as yet unclassified' }
ORActionAddClass >> initialize [
	super initialize.
	newName := 'newFamixClass'.
]

{ #category : #'method execution' }
ORActionAddClass >> run [
	| newClass |
	super run.
	newClass := ORClass new.
	newClass name: newName.
	self orionModel add: newClass.

	container ifNotNil:[
		|theNewContainer theNewPackage|
		theNewContainer := (self orionModel retrieveEntity:container).
		newClass privateContainer: theNewContainer orionCopy.
		theNewContainer privateTypes: (theNewContainer privateTypes orionCopy unsafeAdd: newClass).
		
		(container isKindOf: FAMIXPackage)
		ifTrue: [ theNewPackage := theNewContainer ]
		ifFalse: [self orionModel retrieveEntity: theNewContainer parentPackage].
		theNewPackage ifNotNil: [
			newClass privateParentPackage: theNewPackage orionCopy.
			theNewPackage privateChildNamedEntities:
						 (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newClass)
		]
	].

	entity := newClass.

	^ entity

]
