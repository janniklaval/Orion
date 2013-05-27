Class {
	#name : #ASActionRemovePackage,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'initialize-release' }
ASActionRemovePackage class >> description [
	^'remove package and its content'
]

{ #category : #'initialize-release' }
ASActionRemovePackage class >> scope [
	<ASActionFor: #ASPackage>
	^self
]

{ #category : #'method execution' }
ASActionRemovePackage >> run [
	| pack namespace|

	super run.
	entity childScopes do: [:each |
		ASActionRemoveNamespace new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].

	entity childNamedEntities do: [:each |
		(each isKindOf: ASClass) ifTrue: [
			ASActionRemoveClass new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
		]
	].

	entity childNamedEntities do: [:each |
		(each isKindOf: ASMethod) ifTrue: [
			ASActionRemoveMethod new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
		]
	].
	
	entity types do:[:each |
		(each isKindOf: ASClass) ifTrue: [
			ASActionRemoveClass new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
		].
	].

	entity parentPackage ifNotNil: [
		pack := (self antaresModel retrieveEntity: entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities antaresCopy antaresRemove: entity).
	].
	entity parentScope ifNotNil:[
		namespace := (self antaresModel retrieveEntity: entity parentScope).
		namespace privateChildScopes:  (namespace privateChildScopes antaresCopy antaresRemove: entity).
	].

	entity outgoingReferences do: [:each |
		ASActionRemoveReference new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity incomingReferences do: [:each |
		ASActionRemoveReference new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].

	entity comments do: [:com |
		ASActionRemoveComment new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity functions do: [:com |
		ASActionRemoveFunction new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity globalVariables do: [:com |
		ASActionRemoveGlobalVariable new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity receivingInvocations do: [:com |
		ASActionRemoveInvocation new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].

	self antaresModel remove: entity.
	self postRun.
]
