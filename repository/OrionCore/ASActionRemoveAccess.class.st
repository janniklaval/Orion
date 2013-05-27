Class {
	#name : #ASActionRemoveAccess,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveAccess class >> description [
	^'remove access'
]

{ #category : #'as yet unclassified' }
ASActionRemoveAccess class >> scope [
	<ASActionFor: #ASAccess>
	^self
]

{ #category : #'method execution' }
ASActionRemoveAccess >> run [
	| fromEl toEl|
	super run.
	fromEl := (self antaresModel retrieveEntity:entity accessor).
	toEl := (self antaresModel retrieveEntity: entity variable).
	
	fromEl privateAccesses: (fromEl privateAccesses antaresCopy antaresRemove: entity).

	toEl privateIncomingAccesses: (toEl privateIncomingAccesses antaresCopy antaresRemove: entity).

	entity comments do:[:com |
		ASActionRemoveComment new
			parentAction: self ;
			antaresModel: self antaresModel;
			entity:com;
			run.
	].
	self antaresModel remove: entity.
	
	self postRun.
]
