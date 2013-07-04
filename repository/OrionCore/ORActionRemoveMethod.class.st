Class {
	#name : #ORActionRemoveMethod,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveMethod class >> description [
	^'remove method'
]

{ #category : #'as yet unclassified' }
ORActionRemoveMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionRemoveMethod >> run [
	super run.
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].

	entity parentType ifNotNil:[
		| typ |
		typ := (self orionModel retrieveEntity:entity parentType).
		typ privateMethods: (typ privateMethods orionCopy orionRemove: entity)
	].
	
	entity outgoingReferences do:[:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity incomingReferences do:[:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity outgoingInvocations do:[:each |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	
	entity incomingInvocations do:[:each |
		"each might be null in case of recursive call: the incoming invocation was also an outgoing one"
		each ifNotNil: [
			ORActionRemoveSurelyInvocation new 
				parentAction: self ;
				orionModel: self orionModel; 
				entity:each; 
				to: entity; 
				run.]
	].

	"entity receivingInvocations do:[:com |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	]."

	entity accesses do:[:each |
		ORActionRemoveAccess new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].

	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity localVariables do:[:com |
		ORActionRemoveLocalVariable new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity parameters do:[:com |
		ORActionRemoveParameter new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].

	entity types do:[:each |
		ORActionRemoveClass new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].

	self orionModel remove: entity.
	self postRun.
]
