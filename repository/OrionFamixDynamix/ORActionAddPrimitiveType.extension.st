Extension { #name : #ORActionAddPrimitiveType }

{ #category : #'*OrionFamixDynamix' }
ORActionAddPrimitiveType >> instances [
	^ instances
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddPrimitiveType >> instances: aValue [
	instances := aValue
]

{ #category : #'*OrionFamixDynamix' }
ORActionAddPrimitiveType >> runOnDynamixExtension: newEntity [
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
