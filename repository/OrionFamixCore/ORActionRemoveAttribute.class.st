"
A ORActionRemoveAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveAttribute,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveAttribute class >> description [
	^'remove attribute'
]

{ #category : #'method execution' }
ORActionRemoveAttribute >> run [
	super run.
	entity comments do:[:com |
		com deleteInAction: self.
	].
	entity incomingAccesses do:[:each |
		each deleteInAction: self.
	].
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity parentType ifNotNil:[
		| class |
		class := (self orionModel retrieveEntity:entity parentType).
		class privateAttributes:  (class privateAttributes orionCopy orionRemove: entity).
	].

	entity receivingInvocations do:[:com |
		com deleteInAction: self.
	].
	

	self orionModel remove: entity.
	self postRun.
]
