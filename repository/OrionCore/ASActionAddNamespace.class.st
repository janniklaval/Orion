Class {
	#name : #ASActionAddNamespace,
	#superclass : #ASActionAddEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddNamespace class >> description [
	^'add namespace'
]

{ #category : #'initialize-release' }
ASActionAddNamespace >> initialize [
	super initialize.
	newName := 'newFamixNameSpace'.

]

{ #category : #'method execution' }
ASActionAddNamespace >> run [
	| newNamespace |
	super run.
	newNamespace := ASNamespace new.
	newNamespace name: newName.
	self antaresModel add: newNamespace.
	"package ifNotNil:[
		|theNewPackage|
		theNewPackage := (self antaresModel retrieveEntity: package).
		newNamespace privateParentPackage: theNewPackage antaresCopy.
		theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newNamespace)
	]."
	container ifNotNil:[
		| theNewContainer theNewPackage |
		theNewContainer := (self antaresModel retrieveEntity:container).
		newNamespace privateParentScope: theNewContainer antaresCopy.
		theNewContainer privateChildScopes: (theNewContainer privateChildScopes antaresCopy unsafeAdd: newNamespace).

		(container isKindOf: FAMIXPackage)
		ifTrue: [ theNewPackage := theNewContainer ]
		ifFalse: [self antaresModel retrieveEntity: theNewContainer parentPackage].
		theNewPackage ifNotNil: [
			newNamespace privateParentPackage: theNewPackage antaresCopy.
			theNewPackage privateChildNamedEntities:
						 (theNewPackage privateChildNamedEntities antaresCopy unsafeAdd: newNamespace)
		]
	].

	entity := newNamespace.
	
	^ entity

]
