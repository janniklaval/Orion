Extension { #name : #ORActionAddType }

{ #category : #'*OrionFamixDynamix' }
ORActionAddType >> instances [
	^ instances
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddType >> instances: aValue [
	instances := aValue
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddType >> runOnDynamixExtension: newEntity [
	<toRun>
	<generatedMethod>
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self instances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self instances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateInstances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateType: newEntity ] ].

]
