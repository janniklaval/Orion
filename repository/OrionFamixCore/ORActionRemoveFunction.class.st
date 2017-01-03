"
A ORActionRemoveFunction is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveFunction,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveFunction >> run [
	<generatedMethod>
	super run.
	entity implicitVariables do: [:each | each deleteInAction: self ].
	entity types do: [:each | each deleteInAction: self ].
	entity outgoingReferences do: [:each | each deleteInAction: self ].
	entity outgoingInvocations do: [:each | each deleteInAction: self ].
	entity localVariables do: [:each | each deleteInAction: self ].
	entity receivingInvocations do: [:each | each deleteInAction: self ].
	entity accesses do: [:each | each deleteInAction: self ].
	entity parameters do: [:each | each deleteInAction: self ].
	entity comments do: [:each | each deleteInAction: self ].
	entity functions do: [:each | each deleteInAction: self ].
	entity annotationInstances do: [:each | each deleteInAction: self ].
	entity incomingInvocations do: [:each | each deleteInAction: self ].
	entity sourceAnchor ifNotNil: [ entity deleteInAction: self ].
	entity declaredType
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity declaredType.
			theEntity privateBehavioursWithDeclaredType: (theEntity privateBehavioursWithDeclaredType orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity container
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity container.
			theEntity privateFunctions: (theEntity privateFunctions orionCopy orionRemove: entity) ].
self runExtendedPropertiesForEntity: entity.	self orionModel remove: entity
]
