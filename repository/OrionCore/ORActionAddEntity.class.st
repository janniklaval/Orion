"
An ORActionAddEntity is an Orion abstract class for add entity actions

Instance Variables
	container: the entity that will contains the created one
	newName: the name of the created entity

"
Class {
	#name : #ORActionAddEntity,
	#superclass : #ORAction,
	#instVars : [
		'newName',
		'container'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddEntity class >> description [
	^'add entity'
]

{ #category : #accessing }
ORActionAddEntity >> container [
	^ container
]

{ #category : #accessing }
ORActionAddEntity >> container: anEntity [
	container := anEntity
]

{ #category : #'initialize-release' }
ORActionAddEntity >> initialize [ 
	super initialize.
	container := nil.
]

{ #category : #accessing }
ORActionAddEntity >> newName [
	^ newName
]

{ #category : #accessing }
ORActionAddEntity >> newName: aString [
	newName := aString
]

{ #category : #printing }
ORActionAddEntity >> printWorkspace [

	^ super printWorkspace, ' in ', self container mooseName
]
