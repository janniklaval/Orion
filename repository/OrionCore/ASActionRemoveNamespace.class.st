Class {
	#name : #ASActionRemoveNamespace,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveNamespace class >> description [
	^'remove namespace'
]

{ #category : #'as yet unclassified' }
ASActionRemoveNamespace class >> scope [
	<ASActionFor: #ASNamespace>
	^self
]

{ #category : #'method execution' }
ASActionRemoveNamespace >> run [
	|namespace pack|
	super run.
	entity parentPackage ifNotNil:[
		pack := (self antaresModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities antaresCopy antaresRemove: entity).
	].
	entity parentScope ifNotNil:[
		namespace := (self antaresModel retrieveEntity:entity parentScope).
		namespace privateChildScopes:  (namespace privateChildScopes antaresCopy antaresRemove: entity).
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

	entity types do:[:each |
		| class |
		class := (self antaresModel retrieveEntity:each).
		entity parentScope isNil ifFalse:[
			class privateContainer: namespace.
			namespace privateTypes: (namespace privateTypes antaresCopy unsafeAdd: class).]
		ifTrue:[class privateContainer: nil].
	].

	entity comments do:[:com |
		ASActionRemoveComment new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity functions do:[:com |
		ASActionRemoveFunction new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity globalVariables do:[:com |
		ASActionRemoveGlobalVariable new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity receivingInvocations do:[:com |
		ASActionRemoveInvocation new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	
	entity childScopes do:[:each |
		| scope |
		scope := (self antaresModel retrieveEntity:each).
		entity parentScope isNil ifFalse:[
			scope privateParentScope: namespace.
			namespace privateChildScopes: (namespace privateChildScopes antaresCopy unsafeAdd: scope).]
		ifTrue:[scope privateParentScope: nil].
	].
	self antaresModel remove: entity.
	self postRun.
]
