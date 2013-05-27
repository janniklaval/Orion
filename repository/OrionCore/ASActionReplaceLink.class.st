Class {
	#name : #ASActionReplaceLink,
	#superclass : #ASAction,
	#instVars : [
		'from',
		'to'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionReplaceLink class >> description [
	^'replace association'
]

{ #category : #accessing }
ASActionReplaceLink >> from [
	^ from
]

{ #category : #accessing }
ASActionReplaceLink >> from: anObject [
	from := anObject
]

{ #category : #printing }
ASActionReplaceLink >> printWorkspace [

	^ super printWorkspace, ' from ', self from mooseName, ' to ', self to mooseName
]

{ #category : #accessing }
ASActionReplaceLink >> to [
	^ to
]

{ #category : #accessing }
ASActionReplaceLink >> to: anObject [
	to := anObject
]
