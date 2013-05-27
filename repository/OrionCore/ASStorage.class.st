Class {
	#name : #ASStorage,
	#superclass : #MooseGroupRuntimeStorage,
	#type : #variable,
	#instVars : [
		'model'
	],
	#category : #OrionCore
}

{ #category : #'as yet unclassified' }
ASStorage class >> new [ 
	 
	^self basicNew initialize: 10
]

{ #category : #adding }
ASStorage >> add: anElement [ 

	| key group |

	key := anElement class.
	group := byType 
		at: key
		ifAbsentPut: [ OrderedCollection new ].
	group add: anElement.
	elements add: (anElement mooseID -> anElement).
	^ anElement
]

{ #category : #accessing }
ASStorage >> at: key [ 
	"Answer the value associated with the key."

	^ self atID: key ifAbsent: [self errorKeyNotFound]
]

{ #category : #accessing }
ASStorage >> at: uniqueName ifAbsent: exceptionBlock [ 
	| entity na | 

	na := uniqueName asSymbol.
	entity := byName at: na ifAbsent: nil. 
	entity notNil ifTrue: [^ (self atID: entity mooseID ifAbsent:[]) versionIn: self model privateState currentContext]. 
	entity := self 
		detect: [:each | na == (each versionIn: self model privateState currentContext) mooseName asSymbol] 
		ifNone: exceptionBlock. 
	entity notNil ifTrue: [byName at: na put: entity]. 
	^entity versionIn: self model privateState currentContext.
]

{ #category : #accessing }
ASStorage >> atID: uniqueId ifAbsent: exceptionBlock [ 
	 
	^elements at: uniqueId ifAbsent:exceptionBlock.
]

{ #category : #'initialize-release' }
ASStorage >> initialize: capacity [ 
	 
	byType := Dictionary new: 24. 
	byName := IdentityDictionary new: capacity.
	elements := HashTable new: capacity
]

{ #category : #accessing }
ASStorage >> model [
	^ model
]

{ #category : #accessing }
ASStorage >> model: anObject [
	model := anObject
]

{ #category : #removing }
ASStorage >> remove: anElement ifAbsent: exceptionBlock [ 
	 
	| key group | 
	key := anElement class. 
	group := byType 
		at: key 
		ifAbsent: [OrderedCollection new]. 
	group remove: anElement ifAbsent:[]. 
	byName 
		removeKey: (byName keyAtValue: anElement ifAbsent:[])
		ifAbsent: []. 
	elements removeKey: anElement mooseID ifAbsent: exceptionBlock. 
	^anElement
]
