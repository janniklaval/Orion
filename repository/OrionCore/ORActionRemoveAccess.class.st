Class {
	#name : #ORActionRemoveAccess,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveAccess class >> description [
	^'remove access'
]

{ #category : #'as yet unclassified' }
ORActionRemoveAccess class >> scope [
	<ORActionFor: #ORAccess>
	^self
]

{ #category : #'method execution' }
ORActionRemoveAccess >> run [
	| fromEl toEl|
	super run.
	fromEl := (self orionModel retrieveEntity:entity accessor).
	toEl := (self orionModel retrieveEntity: entity variable).
	
	fromEl privateAccesses: (fromEl privateAccesses orionCopy orionRemove: entity).

	toEl privateIncomingAccesses: (toEl privateIncomingAccesses orionCopy orionRemove: entity).

	entity comments do:[:com |
		ORActionRemoveComment new
			parentAction: self ;
			orionModel: self orionModel;
			entity:com;
			run.
	].
	self orionModel remove: entity.
	
	self postRun.
]
