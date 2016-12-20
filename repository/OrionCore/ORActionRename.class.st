"
An ORActionRename is an Orion abstract class for rename actions

Instance Variables
	newName:		new name of the entity
"
Class {
	#name : #ORActionRename,
	#superclass : #ORAction,
	#instVars : [
		'newName'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRename class >> description [
	^'replace association'
]

{ #category : #testing }
ORActionRename >> isRename [
	^ true
]

{ #category : #accessing }
ORActionRename >> newName [
	
	^ newName
]

{ #category : #accessing }
ORActionRename >> newName: anObject [
	
	newName := anObject
]
