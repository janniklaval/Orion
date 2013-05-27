Class {
	#name : #ASActionRemoveAttribute,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveAttribute class >> description [
	^'remove attribute'
]

{ #category : #'as yet unclassified' }
ASActionRemoveAttribute >> run [
	super run.
	entity comments do:[:com |
		ASActionRemoveComment new
			parentAction: self ;
			antaresModel: self antaresModel;
			entity:com;
			run.
	].
	entity incomingAccesses do:[:each |
		ASActionRemoveAccess new
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self antaresModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities antaresCopy antaresRemove: entity).
	].
	entity parentType ifNotNil:[
		| class |
		class := (self antaresModel retrieveEntity:entity parentType).
		class privateAttributes:  (class privateAttributes antaresCopy antaresRemove: entity).
	].

	entity receivingInvocations do:[:com |
		ASActionRemoveInvocation new
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	

	self antaresModel remove: entity.
	self postRun.
]
