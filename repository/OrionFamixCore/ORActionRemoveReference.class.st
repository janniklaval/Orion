"
A ORActionRemoveReference is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveReference,
	#superclass : #ORActionRemoveLink,
	#category : #'OrionFamixCore-Action'
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
	| fromEl toEl |
	super run.
	fromEl := self orionModel retrieveEntity: entity source.
	toEl := self orionModel retrieveEntity: entity target.
	fromEl privateOutgoingReferences: (fromEl privateOutgoingReferences orionCopy orionRemove: entity).
	toEl privateIncomingReferences: (toEl privateIncomingReferences orionCopy orionRemove: entity).
	entity comments do: [ :com | com deleteInAction: self ].
	self orionModel remove: entity
]
