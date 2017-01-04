"
A ORActionRemoveStructuralEntity is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveStructuralEntity,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveStructuralEntity >> run [
	<generatedMethod>
	super run.
	entity receivingInvocations do: [:each | each deleteInAction: self ].
	entity annotationInstances do: [:each | each deleteInAction: self ].
	entity incomingAccesses do: [:each | each deleteInAction: self ].
	entity dereferencedInvocations do: [:each | each deleteInAction: self ].
	entity comments do: [:each | each deleteInAction: self ].
	entity sourceAnchor ifNotNil: [ entity deleteInAction: self ].
	entity declaredType
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity declaredType.
			theEntity privateStructuresWithDeclaredType: (theEntity privateStructuresWithDeclaredType orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
self runExtendedPropertiesForEntity: entity.	self orionModel remove: entity
]