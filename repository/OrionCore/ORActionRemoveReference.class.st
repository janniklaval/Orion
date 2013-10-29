Class {
	#name : #ORActionRemoveReference,
	#superclass : #ORActionRemoveLink,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveReference class >> description [
	^'remove reference'
]

{ #category : #'as yet unclassified' }
ORActionRemoveReference class >> scope [
	<ORActionFor: #ORReference>
	^self
]

{ #category : #'method execution' }
ORActionRemoveReference >> printWorkspace [

	^ '>', self class description, '>> ', ' from ', entity source mooseName, ' to ', entity target mooseName
]

{ #category : #'method execution' }
ORActionRemoveReference >> run [
	| fromEl toEl|
	super run.
	fromEl := (self orionModel retrieveEntity:entity source).
	toEl := (self orionModel retrieveEntity:entity target).
	
	fromEl privateOutgoingReferences: (fromEl privateOutgoingReferences orionCopy orionRemove: entity).
	toEl privateIncomingReferences: (toEl privateIncomingReferences orionCopy orionRemove: entity).
	
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
