Class {
	#name : #ASActionRename,
	#superclass : #ASAction,
	#instVars : [
		'newName'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRename class >> description [
	^'replace association'
]

{ #category : #accessing }
ASActionRename >> newName [
	
	^ newName
]

{ #category : #accessing }
ASActionRename >> newName: anObject [
	
	newName := anObject
]
