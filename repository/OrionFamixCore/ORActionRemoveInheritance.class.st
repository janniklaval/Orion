"
A ORActionRemoveInheritance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveInheritance,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveInheritance class >> description [
	^'remove inheritance'
]

{ #category : #'as yet unclassified' }
ORActionRemoveInheritance class >> scope [
	<ORActionFor: #ORInheritance>
	^self
]

{ #category : #'method execution' }
ORActionRemoveInheritance >> printWorkspace [

	^ '>', self class description, '>> ', ' from ', entity subclass mooseName, ' to ', entity superclass mooseName
]

{ #category : #'method execution - generated' }
ORActionRemoveInheritance >> run [
	<generatedMethod>
	super run.
	entity comments do: [:each | each deleteInAction: self ].
	entity sourceAnchor ifNotNil: [ entity deleteInAction: self ].
	entity previous ifNotNil: [ entity deleteInAction: self ].
	entity next ifNotNil: [ entity deleteInAction: self ].
	entity superclass
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity superclass.
			theEntity privateSubInheritances: (theEntity privateSubInheritances orionCopy orionRemove: entity) ].
	entity subclass
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity subclass.
			theEntity privateSuperInheritances: (theEntity privateSuperInheritances orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ |theEntity|
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
self runExtendedPropertiesForEntity: entity.	self orionModel remove: entity
]
