Class {
	#name : #ORActionAddLink,
	#superclass : #ORAction,
	#instVars : [
		'from',
		'to'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddLink class >> description [
	^'add association'
]

{ #category : #accessing }
ORActionAddLink >> from [

	^ from
]

{ #category : #accessing }
ORActionAddLink >> from: anObject [
	from := anObject
]

{ #category : #printing }
ORActionAddLink >> printWorkspace [

	^ super printWorkspace, ' from ', self from mooseName, ' to ', self to mooseName
]

{ #category : #accessing }
ORActionAddLink >> to [
	^ to
]

{ #category : #accessing }
ORActionAddLink >> to: anObject [
	to := anObject
]
