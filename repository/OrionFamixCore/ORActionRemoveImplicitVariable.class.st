"
An ORActionRemoveImplicitVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveImplicitVariable,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveImplicitVariable >> run [
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

	entity parentBehaviouralEntity ifNotNil:[
		| functionOrMethod |
		functionOrMethod := (self orionModel retrieveEntity:entity parentBehaviouralEntity).
		functionOrMethod privateImplicitVariables:  (functionOrMethod privateImplicitVariables orionCopy orionRemove: entity).
	].

	entity receivingInvocations do:[:com |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	

	self orionModel remove: entity.

]
