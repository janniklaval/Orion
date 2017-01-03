"
A ORActionRemoveNamedEntity is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveNamedEntity,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveNamedEntity >> run [
	<generatedMethod>
	super run.
	entity comments do: [:each | each deleteInAction: self ].
	entity annotationInstances do: [:each | each deleteInAction: self ].
	entity receivingInvocations do: [:each | each deleteInAction: self ].
	entity sourceAnchor ifNotNil: [ entity deleteInAction: self ].
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
