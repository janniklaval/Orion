"
A ORActionAddClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddClass,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'parent'
	],
	#category : #'OrionFamixCore-Action'
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

{ #category : #'initialize-release' }
ORActionAddClass >> initialize [
	super initialize.
	newName := 'newFamixClass'.
]

{ #category : #accessing }
ORActionAddClass >> parent [
	^ parent
]

{ #category : #accessing }
ORActionAddClass >> parent: anObject [
	parent := anObject
]

{ #category : #'method execution' }
ORActionAddClass >> run [
	| newClass |
	super run.
	newClass := ORClass new.
	newClass name: newName.
	self orionModel add: newClass.

	

	container ifNotNil:[
		|theNewContainer |
		theNewContainer := (self orionModel retrieveEntity:container).
		newClass privateContainer: theNewContainer orionCopy.
		theNewContainer privateTypes: (theNewContainer privateTypes orionCopy unsafeAdd: newClass).
	].
	
	parent ifNotNil: [
		|theNewParent |
		theNewParent := (self orionModel retrieveEntity: parent).
		newClass privateParentPackage: theNewParent orionCopy.
		theNewParent privateChildNamedEntities: (theNewParent privateChildNamedEntities orionCopy unsafeAdd: newClass).
	].

	entity := newClass.
	

	^ entity

]
