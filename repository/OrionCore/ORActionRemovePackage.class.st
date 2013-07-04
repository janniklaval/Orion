Class {
	#name : #ORActionRemovePackage,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'initialize-release' }
ORActionRemovePackage class >> description [
	^'remove package and its content'
]

{ #category : #'initialize-release' }
ORActionRemovePackage class >> scope [
	<ORActionFor: #ORPackage>
	^self
]

{ #category : #'method execution' }
ORActionRemovePackage >> run [
	| pack namespace|

	super run.
	entity childScopes do: [:each |
		ORActionRemoveNamespace new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].

	entity childNamedEntities do: [:each |
		(each isKindOf: ORClass) ifTrue: [
			ORActionRemoveClass new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
		]
	].

	entity childNamedEntities do: [:each |
		(each isKindOf: ORMethod) ifTrue: [
			ORActionRemoveMethod new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
		]
	].
	
	entity types do:[:each |
		(each isKindOf: ORClass) ifTrue: [
			ORActionRemoveClass new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
		].
	].

	entity parentPackage ifNotNil: [
		pack := (self orionModel retrieveEntity: entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity parentScope ifNotNil:[
		namespace := (self orionModel retrieveEntity: entity parentScope).
		namespace privateChildScopes:  (namespace privateChildScopes orionCopy orionRemove: entity).
	].

	entity outgoingReferences do: [:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity incomingReferences do: [:each |
		ORActionRemoveReference new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].

	entity comments do: [:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity functions do: [:com |
		ORActionRemoveFunction new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity globalVariables do: [:com |
		ORActionRemoveGlobalVariable new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity receivingInvocations do: [:com |
		ORActionRemoveInvocation new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].

	self orionModel remove: entity.
	self postRun.
]
