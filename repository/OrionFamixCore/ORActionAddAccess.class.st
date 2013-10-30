"
A ORActionAddAccess is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddAccess,
	#superclass : #ORActionAddLink,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddAccess class >> description [
	^'add reference'
]

{ #category : #'method execution' }
ORActionAddAccess >> run [
	| newAccess |

	super run.
	newAccess := ORAccess new.
	
	self orionModel add: newAccess.
		
	to ifNotNil: [
		| thenewVar |
		thenewVar := (self orionModel retrieveEntity: to).
		newAccess privateVariable: thenewVar orionCopy.
		thenewVar privateIncomingAccesses:  (thenewVar privateIncomingAccesses orionCopy unsafeAdd: newAccess)
	].

	from ifNotNil: [
		| theNewAccessor |
		theNewAccessor := (self orionModel retrieveEntity: from).
		newAccess privateAccessor: theNewAccessor orionCopy.
		theNewAccessor privateAccesses:  (theNewAccessor privateAccesses orionCopy unsafeAdd: newAccess)
	].

	entity := newAccess.
	^ entity
]
