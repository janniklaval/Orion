Class {
	#name : #ASActionRemoveParameter,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveParameter class >> description [
	^'remove parameter'
]

{ #category : #'as yet unclassified' }
ASActionRemoveParameter >> run [
	super run.
	entity comments do:[:com |
		ASActionRemoveComment new 
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

	entity parentBehaviouralEntity ifNotNil:[
		| functionOrMethod |
		functionOrMethod := (self antaresModel retrieveEntity:entity parentBehaviouralEntity).
		functionOrMethod privateLocalVariables:  (functionOrMethod privateLocalVariables antaresCopy antaresRemove: entity).
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
