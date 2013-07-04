Class {
	#name : #ORActionAddInvocation,
	#superclass : #ORActionAddLink,
	#instVars : [
		'signature'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddInvocation class >> description [
	^'add invocation'
]

{ #category : #'method execution' }
ORActionAddInvocation >> run [
	| newInvocation |
	super run.
	newInvocation := ORInvocation new.
	
	self orionModel add: newInvocation.
	
	signature isNil
		ifTrue: [newInvocation privateSignature: to signature orionCopy, '()'] 
		ifFalse: [newInvocation privateSignature: signature orionCopy].
		
	to ifNotNil: [
		|theNewInvoked|
		theNewInvoked := (self orionModel retrieveEntity: to).
		newInvocation privateCandidates: (newInvocation privateCandidates orionCopy unsafeAdd: theNewInvoked).
		theNewInvoked privateIncomingInvocations:  (theNewInvoked privateIncomingInvocations orionCopy unsafeAdd: newInvocation)
	].

	from ifNotNil: [
		|theNewInvoker|
		theNewInvoker := (self orionModel retrieveEntity: from).
		newInvocation privateSender: theNewInvoker orionCopy.
		theNewInvoker privateOutgoingInvocations:  (theNewInvoker privateOutgoingInvocations orionCopy unsafeAdd: newInvocation)
	].

	entity := newInvocation.
	^ entity
]

{ #category : #accessing }
ORActionAddInvocation >> signature [
	^ signature
]

{ #category : #accessing }
ORActionAddInvocation >> signature: anObject [
	signature := anObject
]
