Class {
	#name : #ASActionAddClass,
	#superclass : #ASActionAddEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddClass class >> description [
	^'add class'
]

{ #category : #accessing }
ASActionAddClass >> container [
	^ container
]

{ #category : #accessing }
ASActionAddClass >> container: anObject [
	container := anObject
]

{ #category : #'as yet unclassified' }
ASActionAddClass >> initialize [
	super initialize.
	newName := 'newFamixClass'.
]

{ #category : #'method execution' }
ASActionAddClass >> run [
	| newClass |
	super run.
	newClass := ASClass new.
	newClass name: newName.
	self antaresModel add: newClass.

	container ifNotNil:[
		|theNewContainer theNewPackage|
		theNewContainer := (self antaresModel retrieveEntity:container).
		newClass privateContainer: theNewContainer antaresCopy.
		theNewContainer privateTypes: (theNewContainer privateTypes antaresCopy unsafeAdd: newClass).
		
		(container isKindOf: FAMIXPackage)
		ifTrue: [ theNewPackage := theNewContainer ]
		ifFalse: [self antaresModel retrieveEntity: theNewContainer parentPackage].
		theNewPackage ifNotNil: [
			newClass privateParentPackage: theNewPackage antaresCopy.
			theNewPackage privateChildNamedEntities:
						 (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newClass)
		]
	].

	entity := newClass.

	^ entity

]
