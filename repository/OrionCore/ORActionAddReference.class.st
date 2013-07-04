Class {
	#name : #ORActionAddReference,
	#superclass : #ORActionAddLink,
	#category : #'OrionCore-action'
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
		
	to ifNotNil: [
		|theNewReferenced|
		theNewReferenced := (self orionModel retrieveEntity: to).
		newReference privateTarget: theNewReferenced orionCopy.
		theNewReferenced privateIncomingReferences:  (theNewReferenced privateIncomingReferences orionCopy unsafeAdd: newReference)
	].

	from ifNotNil: [
		|theNewReferencer|
		theNewReferencer := (self orionModel retrieveEntity: from).
		newReference privateSource: theNewReferencer orionCopy.
		theNewReferencer privateOutgoingReferences:  (theNewReferencer privateOutgoingReferences orionCopy unsafeAdd: newReference)
	].

	entity := newReference.
	^ entity
]
