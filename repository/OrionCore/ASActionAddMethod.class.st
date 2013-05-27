Class {
	#name : #ASActionAddMethod,
	#superclass : #ASActionAddEntity,
	#instVars : [
		'classScope',
		'signature'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddMethod class >> description [
	^'add method'
]

{ #category : #accessing }
ASActionAddMethod >> classScope [
	^ classScope
]

{ #category : #accessing }
ASActionAddMethod >> classScope: anObject [
	classScope := anObject
]

{ #category : #'initialize-release' }
ASActionAddMethod >> initialize [
	super initialize.
	newName := 'newFamixMethod'.
	classScope := false.
]

{ #category : #'method execution' }
ASActionAddMethod >> run [
	| newMethod containerPackage |
	super run.
	newMethod := ASMethod new.
	newMethod name: newName.
	self antaresModel add: newMethod.

	signature isNil
		ifTrue:[newMethod signature: newName antaresCopy, '()'] 
		ifFalse:[newMethod signature: signature antaresCopy].
	
	newMethod hasClassScope: classScope antaresCopy.

	container ifNotNil: [ 
		|theNewClass|
		(container isKindOf: FAMIXType) 
		ifTrue: [
			theNewClass := (self antaresModel retrieveEntity:container).
			newMethod privateParentType: theNewClass antaresCopy.
			theNewClass privateMethods: (theNewClass privateMethods antaresCopy unsafeAdd: newMethod).
			containerPackage := container parentPackage antaresCopy
		].
		(container isKindOf: FAMIXPackage) 
		ifTrue: [ containerPackage := container antaresCopy ]
	].

	containerPackage ifNotNil:[
		|theNewPackage|
		theNewPackage := (self antaresModel retrieveEntity: containerPackage).
		newMethod privateParentPackage: theNewPackage antaresCopy.
		newMethod parentType privateParentPackage: theNewPackage antaresCopy.
		theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newMethod).
	].

	entity := newMethod.
	
	^ entity
]

{ #category : #accessing }
ASActionAddMethod >> signature [
	^ signature
]

{ #category : #accessing }
ASActionAddMethod >> signature: anString [
	signature := anString
]
