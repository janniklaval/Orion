"
A ORActionAddNamespace is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddNamespace,
	#superclass : #ORActionAddEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddNamespace class >> description [
	^'add namespace'
]

{ #category : #'initialize-release' }
ORActionAddNamespace >> initialize [
	super initialize.
	newName := 'newFamixNameSpace'.

]

{ #category : #'method execution' }
ORActionAddNamespace >> run [
	| newNamespace |
	super run.
	newNamespace := ORNamespace new.
	newNamespace name: newName.
	self orionModel add: newNamespace.


	"package ifNotNil:[
		|theNewPackage|
		theNewPackage := (self orionModel retrieveEntity: package).
		newNamespace privateParentPackage: theNewPackage orionCopy.
		theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newNamespace)
	]."
	container ifNotNil:[
		| theNewContainer theNewPackage |
		theNewContainer := (self orionModel retrieveEntity:container).
		newNamespace privateParentScope: theNewContainer orionCopy.
		theNewContainer privateChildScopes: (theNewContainer privateChildScopes orionCopy unsafeAdd: newNamespace).

		(container isKindOf: FAMIXPackage)
		ifTrue: [ theNewPackage := theNewContainer ]
		ifFalse: [self orionModel retrieveEntity: theNewContainer parentPackage].
		theNewPackage ifNotNil: [
			newNamespace privateParentPackage: theNewPackage orionCopy.
			theNewPackage privateChildNamedEntities:
						 (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newNamespace)
		]
	].

	entity := newNamespace.
	
	^ entity

]
