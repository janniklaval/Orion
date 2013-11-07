"
An ORActionMove is an Orion abstract class for move actions

Instance Variables
	newContainer:		new container of the moved entity

"
Class {
	#name : #ORActionMove,
	#superclass : #ORAction,
	#instVars : [
		'newContainer'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionMove class >> description [
	^'move'
]

{ #category : #accessing }
ORActionMove >> newContainer [
	^ newContainer
]

{ #category : #accessing }
ORActionMove >> newContainer: anObject [
	newContainer := anObject
]

{ #category : #printing }
ORActionMove >> printWorkspace [

	^ super printWorkspace, self entity name , ' in ', self to mooseName
]

{ #category : #accessing }
ORActionMove >> to [
	^ newContainer
]

{ #category : #accessing }
ORActionMove >> to: anObject [
	newContainer := anObject
]
