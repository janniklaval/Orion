"
A ORActionAddAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddAttribute,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'classScope'
	],
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddAttribute class >> description [
	^'add attribute'
]

{ #category : #accessing }
ORActionAddAttribute >> classScope [
	^ classScope
]

{ #category : #accessing }
ORActionAddAttribute >> classScope: anObject [
	classScope := anObject
]

{ #category : #'initialize-release' }
ORActionAddAttribute >> initialize [
	super initialize.
	newName := 'newFamixAttribute'.
	classScope := false.
]

{ #category : #'method execution' }
ORActionAddAttribute >> run [
	| newAttribute |
	super run.
	newAttribute := ORAttribute new.
	newAttribute name: newName.
	self orionModel add: newAttribute.
	newAttribute hasClassScope: classScope orionCopy.
	container isType
		ifTrue: [ | theNewClass |
			theNewClass := self orionModel retrieveEntity: container.
			newAttribute privateParentType: theNewClass orionCopy.
			theNewClass privateAttributes: (theNewClass privateAttributes orionCopy unsafeAdd: newAttribute) ].
	newAttribute resetMooseName.
	entity := newAttribute.
	^ entity
]
