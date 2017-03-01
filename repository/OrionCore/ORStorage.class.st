Class {
	#name : #ORStorage,
	#superclass : #MooseGroupRuntimeStorage,
	#type : #variable,
	#instVars : [
		'model'
	],
	#category : #OrionCore
}

{ #category : #'as yet unclassified' }
ORStorage class >> new [ 
	 
	^self basicNew initialize: 10
]

{ #category : #adding }
ORStorage >> add: anElement [
	| key group |
	key := anElement class.
	group := byType at: key ifAbsentPut: [ OrderedCollection new ].
	group add: anElement.
	elements add: anElement mooseID -> anElement.
	^ anElement
]

{ #category : #accessing }
ORStorage >> at: key [ 
	"Answer the value associated with the key."

	^ self atID: key ifAbsent: [self errorKeyNotFound]
]

{ #category : #accessing }
ORStorage >> at: uniqueName ifAbsent: exceptionBlock [
	| entity na |
	na := uniqueName asSymbol.
	entity := byName at: na ifAbsent: nil.
	entity
		ifNotNil: [ ^ (self atID: entity mooseID ifAbsent: [  ])
				versionIn: self model privateState currentContext ].
	entity := self
		detect: [ :each | na == (each versionIn: self model privateState currentContext) mooseName asSymbol ]
		ifNone: exceptionBlock.
	entity ifNotNil: [ byName at: na put: entity ].
	^ entity versionIn: self model privateState currentContext
]

{ #category : #accessing }
ORStorage >> at: uniqueName withType: aType ifAbsent: exceptionBlock [
	| entity na |
	na := uniqueName asSymbol.
	entity := super at: uniqueName withType: aType ifAbsent: [  ].
	entity ifNotNil: [ ^ (self atID: entity mooseID ifAbsent: [  ]) versionIn: self model privateState currentContext ].
	entity := self detect: [ :each | na == (each versionIn: self model privateState currentContext) mooseName asSymbol ] ifNone: exceptionBlock.
	entity ifNotNil: [ byName at: na put: entity ].
	^ entity versionIn: self model privateState currentContext
]

{ #category : #accessing }
ORStorage >> atID: uniqueId ifAbsent: exceptionBlock [ 
	 
	^elements at: uniqueId ifAbsent:exceptionBlock.
]

{ #category : #'as yet unclassified' }
ORStorage >> errorKeyNotFound [
	self error: 'key not found'
]

{ #category : #'initialize-release' }
ORStorage >> initialize: capacity [ 
	 
	byType := Dictionary new: 24. 
	byName := IdentityDictionary new: capacity.
	elements := HashTable new: capacity
]

{ #category : #accessing }
ORStorage >> model [
	^ model
]

{ #category : #accessing }
ORStorage >> model: anObject [
	model := anObject
]

{ #category : #removing }
ORStorage >> remove: anElement ifAbsent: exceptionBlock [
	| key group |
	key := anElement class.
	group := byType at: key ifAbsent: [ OrderedCollection new ].
	group remove: anElement ifAbsent: [  ].
	byName
		removeKey: (byName keyAtValue: anElement ifAbsent: [  ])
		ifAbsent: [  ].
	elements removeKey: anElement mooseID ifAbsent: exceptionBlock.
	^ anElement
]
