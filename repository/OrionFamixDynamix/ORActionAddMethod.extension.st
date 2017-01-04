Extension { #name : #ORActionAddMethod }

{ #category : #'*OrionFamixDynamix' }
ORActionAddMethod >> activations [
	^ activations
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddMethod >> activations: aValue [
	activations := aValue
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddMethod >> runOnDynamixExtension: newEntity [
	<toRun>
	<generatedMethod>
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self activations
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self activations collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateActivations: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateBehaviour: newEntity ] ].

]
