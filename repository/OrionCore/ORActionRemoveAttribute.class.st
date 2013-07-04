Class {
	#name : #ORActionRemoveAttribute,
	#superclass : #ORActionRemove,
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
		ORActionRemoveComment new
			parentAction: self ;
			orionModel: self orionModel;
			entity:com;
			run.
	].
	entity incomingAccesses do:[:each |
		ORActionRemoveAccess new
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
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
		ORActionRemoveInvocation new
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	

	self orionModel remove: entity.
	self postRun.
]
