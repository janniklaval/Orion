Class {
	#name : #ORActionRemoveAttribute,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveAttribute class >> description [
	^'remove attribute'
]

{ #category : #'as yet unclassified' }
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
