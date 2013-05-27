Class {
	#name : #ASActionRemoveInvocation,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveInvocation class >> description [
	^'remove invocation'
]

{ #category : #'as yet unclassified' }
ASActionRemoveInvocation class >> scope [
	<ASActionFor: #ASInvocation>
	^self
]

{ #category : #'method execution' }
ASActionRemoveInvocation >> run [
	| fromEl toEl recEl|
	super run.
	fromEl := (self antaresModel retrieveEntity:entity sender).
	toEl := entity candidates collect:[:e | self antaresModel retrieveEntity: e  ].
	entity receiver ifNotNil:[
		recEl := (self antaresModel retrieveEntity:entity receiver).
		recEl privateReceivingInvocations: (recEl privateReceivingInvocations antaresCopy antaresRemove: entity).
	].
	
	fromEl privateOutgoingInvocations: (fromEl privateOutgoingInvocations antaresCopy antaresRemove: entity).
	
	toEl do:[:each|
		each privateIncomingInvocations: (each privateIncomingInvocations antaresCopy antaresRemove: entity).].
	
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
