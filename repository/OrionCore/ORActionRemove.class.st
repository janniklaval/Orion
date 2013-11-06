"
An ORActionRemove is an Orion abstract class for remove actions

"
Class {
	#name : #ORActionRemove,
	#superclass : #ORAction,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemove class >> description [
	^'remove'
]

{ #category : #'as yet unclassified' }
ORActionRemove class >> needs: anElement [
	^nil
]
