Extension { #name : #ORActionAddFunction }

{ #category : #'*OrionFamixDynamix' }
ORActionAddFunction >> activations [
	^ activations
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddFunction >> activations: aValue [
	activations := aValue
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddFunction >> runOnDynamixExtension: newEntity [
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
