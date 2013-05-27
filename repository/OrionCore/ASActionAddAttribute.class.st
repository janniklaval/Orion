Class {
	#name : #ASActionAddAttribute,
	#superclass : #ASActionAddEntity,
	#instVars : [
		'classScope'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddAttribute class >> description [
	^'add attribute'
]

{ #category : #accessing }
ASActionAddAttribute >> classScope [
	^ classScope
]

{ #category : #accessing }
ASActionAddAttribute >> classScope: anObject [
	classScope := anObject
]

{ #category : #'initialize-release' }
ASActionAddAttribute >> initialize [
	super initialize.
	newName := 'newFamixAttribute'.
	classScope := false.
]

{ #category : #'method execution' }
ASActionAddAttribute >> run [
	| newAttribute |
	super run.
	newAttribute := ASAttribute new.
	newAttribute name: newName.
	self antaresModel add: newAttribute.

	newAttribute hasClassScope: classScope antaresCopy.

	(container isMemberOf: ASClass) ifTrue:[ 
		|theNewClass|
		theNewClass := (self antaresModel retrieveEntity: container).
		newAttribute privateParentType: theNewClass antaresCopy.
		theNewClass privateAttributes: (theNewClass privateAttributes antaresCopy unsafeAdd: newAttribute)
		].

	entity := newAttribute.

	^ entity
]
