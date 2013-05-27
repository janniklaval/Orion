Class {
	#name : #ASActionAddAccess,
	#superclass : #ASActionAddLink,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddAccess class >> description [
	^'add reference'
]

{ #category : #'method execution' }
ASActionAddAccess >> run [
	| newAccess |

	super run.
	newAccess := ASAccess new.
	
	self antaresModel add: newAccess.
		
	to ifNotNil: [
		| thenewVar |
		thenewVar := (self antaresModel retrieveEntity: to).
		newAccess privateVariable: thenewVar antaresCopy.
		thenewVar privateIncomingAccesses:  (thenewVar privateIncomingAccesses antaresCopy unsafeAdd: newAccess)
	].

	from ifNotNil: [
		| theNewAccessor |
		theNewAccessor := (self antaresModel retrieveEntity: from).
		newAccess privateAccessor: theNewAccessor antaresCopy.
		theNewAccessor privateAccesses:  (theNewAccessor privateAccesses antaresCopy unsafeAdd: newAccess)
	].

	entity := newAccess.
	^ entity
]
