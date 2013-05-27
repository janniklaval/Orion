Class {
	#name : #ASActionAddReference,
	#superclass : #ASActionAddLink,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddReference class >> description [
	^'add reference'
]

{ #category : #'method execution' }
ASActionAddReference >> run [
	| newReference |
	super run.
	newReference := ASReference new.
	
	self antaresModel add: newReference.
		
	to ifNotNil: [
		|theNewReferenced|
		theNewReferenced := (self antaresModel retrieveEntity: to).
		newReference privateTarget: theNewReferenced antaresCopy.
		theNewReferenced privateIncomingReferences:  (theNewReferenced privateIncomingReferences antaresCopy unsafeAdd: newReference)
	].

	from ifNotNil: [
		|theNewReferencer|
		theNewReferencer := (self antaresModel retrieveEntity: from).
		newReference privateSource: theNewReferencer antaresCopy.
		theNewReferencer privateOutgoingReferences:  (theNewReferencer privateOutgoingReferences antaresCopy unsafeAdd: newReference)
	].

	entity := newReference.
	^ entity
]
