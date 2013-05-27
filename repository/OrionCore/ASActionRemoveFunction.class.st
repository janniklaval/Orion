Class {
	#name : #ASActionRemoveFunction,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveFunction class >> description [
	^'remove function'
]

{ #category : #'as yet unclassified' }
ASActionRemoveFunction >> run [
	super run.
	entity accesses do:[:each |
		ASActionRemoveAccess new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity comments do:[:com |
		ASActionRemoveComment new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity incomingInvocations do:[:each |
		ASActionRemoveSurelyInvocation new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			to: entity; 
			run.
	].
	entity incomingReferences do:[:each |
		ASActionRemoveReference new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity localVariables do:[:com |
		ASActionRemoveLocalVariable new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity outgoingReferences do:[:each |
		ASActionRemoveReference new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].	
	entity outgoingInvocations do:[:each |
		ASActionRemoveInvocation new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity parameters do:[:com |
		ASActionRemoveParameter new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self antaresModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities antaresCopy antaresRemove: entity).
	].
	entity parentScope ifNotNil:[
		| typ |
		typ := (self antaresModel retrieveEntity:entity parentScope).
		typ privateFunctions: (typ privateFunctions antaresCopy antaresRemove: entity)
	].
	entity receivingInvocations do:[:com |
		ASActionRemoveInvocation new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity types do:[:each |
		ASActionRemoveClass new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	self antaresModel remove: entity.
	self postRun.
]
