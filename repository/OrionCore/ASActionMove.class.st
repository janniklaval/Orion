Class {
	#name : #ASActionMove,
	#superclass : #ASAction,
	#instVars : [
		'newContainer'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMove class >> description [
	^'move'
]

{ #category : #accessing }
ASActionMove >> newContainer [
	^ newContainer
]

{ #category : #accessing }
ASActionMove >> newContainer: anObject [
	newContainer := anObject
]

{ #category : #printing }
ASActionMove >> printWorkspace [

	^ super printWorkspace, ' in ', self to mooseName
]

{ #category : #accessing }
ASActionMove >> to [
	^ newContainer
]

{ #category : #accessing }
ASActionMove >> to: anObject [
	newContainer := anObject
]
