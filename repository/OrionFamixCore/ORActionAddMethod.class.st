"
A ORActionAddMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddMethod,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'classScope',
		'signature'
	],
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddMethod class >> description [
	^'add method'
]

{ #category : #accessing }
ORActionAddMethod >> classScope [
	^ classScope
]

{ #category : #accessing }
ORActionAddMethod >> classScope: anObject [
	classScope := anObject
]

{ #category : #'initialize-release' }
ORActionAddMethod >> initialize [
	super initialize.
	newName := 'newFamixMethod'.
	classScope := false.
]

{ #category : #'method execution' }
ORActionAddMethod >> run [
	| newMethod containerPackage |
	super run.
	newMethod := ORMethod new.
	newMethod name: newName.
	self orionModel add: newMethod.
	
	signature isNil
		ifTrue:[newMethod signature: newName orionCopy, '()'] 
		ifFalse:[newMethod signature: signature orionCopy].
	
	newMethod hasClassScope: classScope orionCopy.

	container ifNotNil: [ 
		|theNewClass|
		(container isKindOf: FAMIXType) 
		ifTrue: [
			theNewClass := (self orionModel retrieveEntity:container).
			newMethod privateParentType: theNewClass orionCopy.
			theNewClass privateMethods: (theNewClass privateMethods orionCopy unsafeAdd: newMethod).
			
			containerPackage := container parentPackage orionCopy
		].
		(container isKindOf: FAMIXPackage) 
		ifTrue: [ containerPackage := container orionCopy ]
	].

	containerPackage ifNotNil:[
		|theNewPackage|
		theNewPackage := (self orionModel retrieveEntity: containerPackage).
		newMethod privateParentPackage: theNewPackage orionCopy.
		newMethod parentType privateParentPackage: theNewPackage orionCopy.
		theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newMethod).
	].
	newMethod resetMooseName.
	entity := newMethod.
	
	^ entity
]

{ #category : #accessing }
ORActionAddMethod >> signature [
	^ signature
]

{ #category : #accessing }
ORActionAddMethod >> signature: anString [
	signature := anString
]
