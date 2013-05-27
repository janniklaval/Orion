Class {
	#name : #ASActionRemoveSurelyInvocation,
	#superclass : #ASActionRemove,
	#instVars : [
		'to'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveSurelyInvocation class >> description [
	^'remove invocation when there are multiple candidates'
]

{ #category : #'as yet unclassified' }
ASActionRemoveSurelyInvocation class >> scope [
	<ASActionFor: #ASSurelyInvocation>
	^self
]

{ #category : #'method execution' }
ASActionRemoveSurelyInvocation >> run [
	| fromEl toEl recEl|
	super run.
	fromEl := (self antaresModel retrieveEntity:entity sender).
	
	
	(entity candidates size > 1 and:[to notNil]) ifTrue:[
		|invoc realCandidate|
		realCandidate := (self antaresModel retrieveEntity: to).
		invoc := (self antaresModel retrieveEntity:entity).
		invoc privateCandidates: (invoc privateCandidates antaresCopy antaresRemove: realCandidate).
		realCandidate privateIncomingInvocations: (realCandidate privateIncomingInvocations antaresCopy antaresRemove: entity).
	] ifFalse:[
		"if there is only one candidate, it means that the invocation is sure, and the invocation can be removed.
		if there are multiple candidates and to is nil, it means that we want to remove the invocation itself"
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
	].
	self postRun.
]

{ #category : #accessing }
ASActionRemoveSurelyInvocation >> to [
	^ to
]

{ #category : #accessing }
ASActionRemoveSurelyInvocation >> to: anObject [
	to := anObject
]
