Class {
	#name : #ASActionAddLink,
	#superclass : #ASAction,
	#instVars : [
		'from',
		'to'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddLink class >> description [
	^'add association'
]

{ #category : #accessing }
ASActionAddLink >> from [

	^ from
]

{ #category : #accessing }
ASActionAddLink >> from: anObject [
	from := anObject
]

{ #category : #printing }
ASActionAddLink >> printWorkspace [

	^ super printWorkspace, ' from ', self from mooseName, ' to ', self to mooseName
]

{ #category : #accessing }
ASActionAddLink >> to [
	^ to
]

{ #category : #accessing }
ASActionAddLink >> to: anObject [
	to := anObject
]
