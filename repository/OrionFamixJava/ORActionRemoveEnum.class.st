"
A ORActionRemoveEnum is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveEnum,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixJava-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveEnum >> run [
	<generatedMethod>
	super run.
	entity typeAliases do: [:each | each deleteInAction: self ].
	entity superInheritances do: [:each | each deleteInAction: self ].
	entity attributes do: [:each | each deleteInAction: self ].
	entity types do: [:each | each deleteInAction: self ].
	entity functions do: [:each | each deleteInAction: self ].
	entity structuresWithDeclaredType do: [:each | each deleteInAction: self ].
	entity receivingInvocations do: [:each | each deleteInAction: self ].
	entity argumentsInParameterizedTypes do: [:each | each deleteInAction: self ].
	entity comments do: [:each | each deleteInAction: self ].
	entity behavioursWithDeclaredType do: [:each | each deleteInAction: self ].
	entity incomingReferences do: [:each | each deleteInAction: self ].
	entity annotationInstances do: [:each | each deleteInAction: self ].
	entity subInheritances do: [:each | each deleteInAction: self ].
	entity values do: [:each | each deleteInAction: self ].
	entity methods do: [:each | each deleteInAction: self ].
	entity sourceAnchor ifNotNil: [ entity deleteInAction: self ].
	entity declaredSourceLanguage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity container
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity container.
			theEntity privateTypes: (theEntity privateTypes orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
self runExtendedPropertiesForEntity: entity.	self orionModel remove: entity
]

{ #category : #'*OrionFamixJava' }
ORActionRemoveEnum >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
