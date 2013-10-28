Class {
	#name : #ORActionRemoveParameter,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveParameter class >> description [
	^'remove parameter'
]

{ #category : #'as yet unclassified' }
ORActionRemoveParameter >> run [
	super run.
	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].

	entity parentBehaviouralEntity ifNotNil:[
		| functionOrMethod |
		functionOrMethod := (self orionModel retrieveEntity:entity parentBehaviouralEntity).
		functionOrMethod privateLocalVariables ifNotEmpty:[ 
				functionOrMethod privateLocalVariables:  (functionOrMethod privateLocalVariables orionCopy orionRemove: entity)].
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
