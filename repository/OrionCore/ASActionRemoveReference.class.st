Class {
	#name : #ASActionRemoveReference,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveReference class >> description [
	^'remove reference'
]

{ #category : #'as yet unclassified' }
ASActionRemoveReference class >> scope [
	<ASActionFor: #ASReference>
	^self
]

{ #category : #'method execution' }
ASActionRemoveReference >> run [
	| fromEl toEl|
	super run.
	fromEl := (self antaresModel retrieveEntity:entity source).
	toEl := (self antaresModel retrieveEntity:entity target).
	
	fromEl privateOutgoingReferences: (fromEl privateOutgoingReferences antaresCopy antaresRemove: entity).
	toEl privateIncomingReferences: (toEl privateIncomingReferences antaresCopy antaresRemove: entity).
	
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
