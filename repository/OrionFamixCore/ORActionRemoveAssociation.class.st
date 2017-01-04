"
A ORActionRemoveAssociation is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveAssociation,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveAssociation >> run [
	<generatedMethod>
	super run.
	entity comments do: [ :e | e deleteInAction: self ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
