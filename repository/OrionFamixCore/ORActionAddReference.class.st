"
A ORActionAddReference is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddReference,
	#superclass : #ORActionAddLink,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddReference class >> description [
	^'add reference'
]

{ #category : #'method execution' }
ORActionAddReference >> run [
	| newReference |
	super run.
	newReference := ORReference new.
	self orionModel add: newReference.
	to isClass
		ifTrue: [ | theNewReferenced |
			theNewReferenced := self orionModel retrieveEntity: to.
			newReference privateTarget: theNewReferenced orionCopy.
			theNewReferenced privateIncomingReferences: (theNewReferenced privateIncomingReferences orionCopy unsafeAdd: newReference) ]
		ifFalse: [ MessageNotUnderstood signal: 'privateIncomingReferences' ].
	from
		ifNotNil: [ | theNewReferencer |
			theNewReferencer := self orionModel retrieveEntity: from.
			newReference privateSource: theNewReferencer orionCopy.
			theNewReferencer privateOutgoingReferences: (theNewReferencer privateOutgoingReferences orionCopy unsafeAdd: newReference) ].
	entity := newReference.
	^ entity
]
