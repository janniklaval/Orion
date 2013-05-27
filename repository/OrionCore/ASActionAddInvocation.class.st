Class {
	#name : #ASActionAddInvocation,
	#superclass : #ASActionAddLink,
	#instVars : [
		'signature'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddInvocation class >> description [
	^'add invocation'
]

{ #category : #'method execution' }
ASActionAddInvocation >> run [
	| newInvocation |
	super run.
	newInvocation := ASInvocation new.
	
	self antaresModel add: newInvocation.
	
	signature isNil
		ifTrue: [newInvocation privateSignature: to signature antaresCopy, '()'] 
		ifFalse: [newInvocation privateSignature: signature antaresCopy].
		
	to ifNotNil: [
		|theNewInvoked|
		theNewInvoked := (self antaresModel retrieveEntity: to).
		newInvocation privateCandidates: (newInvocation privateCandidates antaresCopy unsafeAdd: theNewInvoked).
		theNewInvoked privateIncomingInvocations:  (theNewInvoked privateIncomingInvocations antaresCopy unsafeAdd: newInvocation)
	].

	from ifNotNil: [
		|theNewInvoker|
		theNewInvoker := (self antaresModel retrieveEntity: from).
		newInvocation privateSender: theNewInvoker antaresCopy.
		theNewInvoker privateOutgoingInvocations:  (theNewInvoker privateOutgoingInvocations antaresCopy unsafeAdd: newInvocation)
	].

	entity := newInvocation.
	^ entity
]

{ #category : #accessing }
ASActionAddInvocation >> signature [
	^ signature
]

{ #category : #accessing }
ASActionAddInvocation >> signature: anObject [
	signature := anObject
]
