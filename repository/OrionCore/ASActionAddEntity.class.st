"
An ASActionAddEntity is an Orion abstract class for add entity actions

Instance Variables
	container: the entity that will contains the created one
	newName: the name of the created entity

"
Class {
	#name : #ASActionAddEntity,
	#superclass : #ASAction,
	#instVars : [
		'newName',
		'container'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddEntity class >> description [
	^'add entity'
]

{ #category : #accessing }
ASActionAddEntity >> container [
	^ container
]

{ #category : #accessing }
ASActionAddEntity >> container: anEntity [
	container := anEntity
]

{ #category : #'initialize-release' }
ASActionAddEntity >> initialize [ 
	super initialize.
	container := nil.
]

{ #category : #accessing }
ASActionAddEntity >> newName [
	^ newName
]

{ #category : #accessing }
ASActionAddEntity >> newName: aString [
	newName := aString
]

{ #category : #printing }
ASActionAddEntity >> printWorkspace [

	^ super printWorkspace, ' in ', self container mooseName
]
