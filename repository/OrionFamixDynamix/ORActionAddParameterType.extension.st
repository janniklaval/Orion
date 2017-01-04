Extension { #name : #ORActionAddParameterType }

{ #category : #'*OrionFamixDynamix' }
ORActionAddParameterType >> instances [
	^ instances
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddParameterType >> instances: aValue [
	instances := aValue
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddParameterType >> runOnDynamixExtension: newEntity [
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
