"
An ORActionAddLink is an Orion abstract class for add link actions

Instance Variables
	from:		source of the link
	to:		target of the link

"
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

{ #category : #testing }
ORActionAddLink >> isAddition [
	^ true
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
