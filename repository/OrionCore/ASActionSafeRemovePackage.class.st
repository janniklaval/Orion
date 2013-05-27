Class {
	#name : #ASActionSafeRemovePackage,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionSafeRemovePackage class >> description [
	^'remove package without its content'
]

{ #category : #'as yet unclassified' }
ASActionSafeRemovePackage class >> scope [
	<ASActionFor: #ASPackage>
	^self
]

{ #category : #'method execution' }
ASActionSafeRemovePackage >> run [
	| pack namespace|
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
	
	entity childScopes do:[:each |
		| scope |
		scope := (self antaresModel retrieveEntity:each).
		entity parentPackage isNil ifFalse:[
			scope privateParentPackage: pack.
			pack privateChildScopes: (pack privateChildScopes antaresCopy unsafeAdd: scope).]
		ifTrue:[scope privateParentPackage: nil].
	].

	entity childNamedEntities do:[:each |
		| ent |
		ent := (self antaresModel retrieveEntity:each).
		entity parentPackage isNil ifFalse:[
			ent privateParentPackage: pack.
			pack privateChildNamedEntities: (pack privateChildNamedEntities antaresCopy unsafeAdd: ent).]
		ifTrue:[ent privateParentPackage: nil].
	].

	entity types do:[:each |
		| class |
		class := (self antaresModel retrieveEntity:each).
		entity parentPackage isNil ifFalse:[
			class privateParentPackage: pack.
			pack privateTypes: (pack privateTypes antaresCopy unsafeAdd: class).]
		ifTrue:[class privateParentPackage: nil].
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

	self antaresModel remove: entity.
	self postRun.

]
