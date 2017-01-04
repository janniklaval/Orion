"
A ORActionRemoveCustomSourceLanguage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveCustomSourceLanguage,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveCustomSourceLanguage >> run [
	<generatedMethod>
	super run.
	entity sourcedEntities do: [:each | each deleteInAction: self ].
self runExtendedPropertiesForEntity: entity.	self orionModel remove: entity
]