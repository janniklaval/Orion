Class {
	#name : #ORActionReplaceLink,
	#superclass : #ORAction,
	#instVars : [
		'from',
		'to'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionReplaceLink class >> description [
	^'replace association'
]

{ #category : #accessing }
ORActionReplaceLink >> from [
	^ from
]

{ #category : #accessing }
ORActionReplaceLink >> from: anObject [
	from := anObject
]

{ #category : #printing }
ORActionReplaceLink >> printWorkspace [

	^ super printWorkspace, ' from ', self from mooseName, ' to ', self to mooseName
]

{ #category : #accessing }
ORActionReplaceLink >> to [
	^ to
]

{ #category : #accessing }
ORActionReplaceLink >> to: anObject [
	to := anObject
]
