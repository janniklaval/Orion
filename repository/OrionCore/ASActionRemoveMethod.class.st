Class {
	#name : #ASActionRemoveMethod,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveMethod class >> description [
	^'remove method'
]

{ #category : #'as yet unclassified' }
ASActionRemoveMethod class >> scope [
	<ASActionFor: #ASMethod>
	^self
]

{ #category : #'method execution' }
ASActionRemoveMethod >> run [
	super run.
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self antaresModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities antaresCopy antaresRemove: entity).
	].

	entity parentType ifNotNil:[
		| typ |
		typ := (self antaresModel retrieveEntity:entity parentType).
		typ privateMethods: (typ privateMethods antaresCopy antaresRemove: entity)
	].
	
	entity outgoingReferences do:[:each |
		ASActionRemoveReference new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity incomingReferences do:[:each |
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
	
	entity incomingInvocations do:[:each |
		"each might be null in case of recursive call: the incoming invocation was also an outgoing one"
		each ifNotNil: [
			ASActionRemoveSurelyInvocation new 
				parentAction: self ;
				antaresModel: self antaresModel; 
				entity:each; 
				to: entity; 
				run.]
	].

	"entity receivingInvocations do:[:com |
		ASActionRemoveInvocation new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	]."

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
	entity localVariables do:[:com |
		ASActionRemoveLocalVariable new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity parameters do:[:com |
		ASActionRemoveParameter new 
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
