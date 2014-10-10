"
A ORActionAddInvocation is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddInvocation,
	#superclass : #ORActionAddLink,
	#instVars : [
		'signature',
		'candidates',
		'receiver'
	],
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddInvocation class >> description [
	^'add invocation'
]

{ #category : #accessing }
ORActionAddInvocation >> candidates [
	^ candidates
]

{ #category : #accessing }
ORActionAddInvocation >> candidates: anObject [
	candidates := anObject
]

{ #category : #'method execution' }
ORActionAddInvocation >> postRun [

	from ifNotNil: [ 
		| sender |
		sender := (self orionModel retrieveEntity: from).
		sender parentType resetMooseName ].
	super postRun.
]

{ #category : #accessing }
ORActionAddInvocation >> receiver [
	^ receiver
]

{ #category : #accessing }
ORActionAddInvocation >> receiver: anObject [
	receiver := anObject
]

{ #category : #'method execution' }
ORActionAddInvocation >> run [
	| newInvocation |
	super run.
	newInvocation := ORInvocation new.
	
	self orionModel add: newInvocation.
	
	signature isNil
		ifTrue: [newInvocation privateSignature: candidates first signature orionCopy] 
		ifFalse: [newInvocation privateSignature: signature orionCopy].
		
	candidates ifNotNil: [
		candidates do: [:c | |theNewInvoked | 
		theNewInvoked := (self orionModel retrieveEntity: c).
		newInvocation privateCandidates: (newInvocation privateCandidates orionCopy unsafeAdd: theNewInvoked).
		theNewInvoked privateIncomingInvocations:  (theNewInvoked privateIncomingInvocations orionCopy unsafeAdd: newInvocation)]
	].

	from ifNotNil: [
		|theNewInvoker|
		theNewInvoker := (self orionModel retrieveEntity: from).
		newInvocation privateSender: theNewInvoker orionCopy.
		theNewInvoker privateOutgoingInvocations:  (theNewInvoker privateOutgoingInvocations orionCopy unsafeAdd: newInvocation)
	].

	receiver ifNotNil: [  
		|theNewreceiver|
		theNewreceiver := (self orionModel retrieveEntity: receiver).
		newInvocation privateReceiver: theNewreceiver orionCopy.
		theNewreceiver privateReceivingInvocations:  (theNewreceiver privateReceivingInvocations orionCopy unsafeAdd: newInvocation)
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
