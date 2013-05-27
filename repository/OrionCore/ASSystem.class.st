Class {
	#name : #ASSystem,
	#superclass : #Object,
	#instVars : [
		'sourceModel',
		'name',
		'announcer',
		'antaresModels'
	],
	#classVars : [
		'announcer'
	],
	#classInstVars : [
		'rootSystem'
	],
	#category : #OrionCore
}

{ #category : #'as yet unclassified' }
ASSystem class >> add: anElement [

	self root add: anElement.
	self announcer announce: (ASSystemAdded new entity: anElement).

]

{ #category : #accessing }
ASSystem class >> announcer [
	^ announcer 	ifNil: 
		[ announcer := (Announcer new)]
]

{ #category : #accessing }
ASSystem class >> announcer: anObject [
	announcer := anObject
]

{ #category : #'as yet unclassified' }
ASSystem class >> remove: anElement [

	self root remove: anElement.
	self announcer announce: (ASSystemRemoved new entity: anElement).

]

{ #category : #'as yet unclassified' }
ASSystem class >> resetRoot [ 
	 
	rootSystem := OrderedCollection new
]

{ #category : #'as yet unclassified' }
ASSystem class >> root [ 
	 
	^ rootSystem 
		ifNil: 
			[ rootSystem := (OrderedCollection new)]
]

{ #category : #accessing }
ASSystem >> announcer [
	^ announcer
]

{ #category : #accessing }
ASSystem >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
ASSystem >> antaresModels [
	^ antaresModels
]

{ #category : #accessing }
ASSystem >> antaresModels: anObject [
	antaresModels := anObject
]

{ #category : #'initialize-release' }
ASSystem >> initialize [
	antaresModels := OrderedCollection new initialize.
	announcer := Announcer new.
]

{ #category : #accessing }
ASSystem >> name [
	^ name
]

{ #category : #accessing }
ASSystem >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASSystem >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
ASSystem >> sourceModel: anObject [
	sourceModel := anObject
]
