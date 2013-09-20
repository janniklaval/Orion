Class {
	#name : #ORActionAddAttribute,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'classScope'
	],
	#category : #'OrionCore-action'
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
	self orionModel add: newAttribute.
	newAttribute name: newName.


	newAttribute hasClassScope: classScope orionCopy.

	(container isMemberOf: ORClass) ifTrue:[ 
		|theNewClass|
		theNewClass := (self orionModel retrieveEntity: container).
		newAttribute privateParentType: theNewClass orionCopy.
		theNewClass privateAttributes: (theNewClass privateAttributes orionCopy unsafeAdd: newAttribute)
		].

	entity := newAttribute.

	^ entity
]
