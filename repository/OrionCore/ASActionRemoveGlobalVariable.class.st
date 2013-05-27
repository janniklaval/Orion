Class {
	#name : #ASActionRemoveGlobalVariable,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveGlobalVariable class >> description [
	^'remove global variable'
]

{ #category : #'as yet unclassified' }
ASActionRemoveGlobalVariable >> run [
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

	entity parentScope ifNotNil:[
		|scope|
		scope := (self antaresModel retrieveEntity:entity parentScope).
		scope privateGlobalVariables:  (scope privateGlobalVariables antaresCopy antaresRemove: entity).
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
