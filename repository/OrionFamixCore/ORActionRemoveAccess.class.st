"
A ORActionRemoveAccess is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveAccess,
	#superclass : #ORActionRemoveLink,
	#category : #'OrionFamixCore-Action'
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
ORActionRemoveAccess >> printWorkspace [

	^ '>', self class description, '>> ', ' from ', entity accessor mooseName, ' to ', entity variable mooseName
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
