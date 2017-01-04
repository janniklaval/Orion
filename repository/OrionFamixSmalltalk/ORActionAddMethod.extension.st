Extension { #name : #ORActionAddMethod }

{ #category : #'*OrionFamixSmalltalk' }
ORActionAddMethod >> category [
	^ category
]

{ #category : #'*OrionFamixSmalltalk' }
ORActionAddMethod >> category: aValue [
	category := aValue
]

{ #category : #'*OrionFamixSmalltalk' }
ORActionAddMethod >> runOnSmalltalkExtension: newEntity [
	<toRun>
	<generatedMethod>
	"Set primitive not derived properties of the entity"
	self timeStamp ifNotNil: [ :e | 
		newEntity privateTimeStamp: e orionCopy ].

	self category ifNotNil: [ :e | 
		newEntity privateCategory: e orionCopy ].

	"Set complex not derived properties of the entity"

]

{ #category : #'*OrionFamixSmalltalk' }
ORActionAddMethod >> timeStamp [
	^ timeStamp
]

{ #category : #'*OrionFamixSmalltalk' }
ORActionAddMethod >> timeStamp: aValue [
	timeStamp := aValue
]
