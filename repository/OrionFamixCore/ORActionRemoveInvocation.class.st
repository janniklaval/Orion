"
A ORActionRemoveInvocation is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveInvocation,
	#superclass : #ORActionRemoveLink,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveInvocation class >> description [
	^'remove invocation'
]

{ #category : #'as yet unclassified' }
ORActionRemoveInvocation class >> scope [
	<ORActionFor: #ORInvocation>
	^self
]

{ #category : #'method execution' }
ORActionRemoveInvocation >> printOn:stream [ 

		stream nextPutAll:  '>', self class description, '>> ', ' from ', entity sender mooseName, ' to ', entity receiver mooseName
]

{ #category : #'method execution' }
ORActionRemoveInvocation >> printWorkspace [

	^ '>', self class description, '>> ', ' from ', entity sender mooseName, ' to ', entity receiver mooseName
]

{ #category : #'method execution' }
ORActionRemoveInvocation >> run [
	| fromEl toEl recEl|
	super run.
	fromEl := (self orionModel retrieveEntity:entity sender).
	toEl := entity candidates collect:[:e | self orionModel retrieveEntity: e  ].
	entity receiver ifNotNil:[
		recEl := (self orionModel retrieveEntity:entity receiver).
		recEl privateReceivingInvocations: (recEl privateReceivingInvocations orionCopy orionRemove: entity).
	].
	
	fromEl privateOutgoingInvocations: (fromEl privateOutgoingInvocations orionCopy orionRemove: entity).
	
	toEl do:[:each|
		each privateIncomingInvocations: (each privateIncomingInvocations orionCopy orionRemove: entity).].
	
	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	
	self orionModel remove: entity.

]
