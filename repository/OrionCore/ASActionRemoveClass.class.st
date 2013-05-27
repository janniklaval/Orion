Class {
	#name : #ASActionRemoveClass,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveClass class >> description [
	^'remove class'
]

{ #category : #'as yet unclassified' }
ASActionRemoveClass class >> scope [
	<AntaresActionFor: #ASClass>
	^self
]

{ #category : #'method execution' }
ASActionRemoveClass >> run [
	super run.
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self antaresModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities antaresCopy antaresRemove: entity).
	].
	entity container ifNotNil:[
		| namespace |
		namespace := (self antaresModel retrieveEntity:entity container).
		namespace privateTypes:  (namespace privateTypes antaresCopy antaresRemove: entity).
	].
	entity outgoingReferences do:[:each |
		ASActionRemoveReference new
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity types do:[:each |
		ASActionRemoveClass new 
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

	entity subInheritances do:[:each |
		ASActionAddInheritance new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			from: each subclass; 
			to: (entity superInheritances first superclass); 
			run.
		ASActionRemoveInheritance new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].

	entity superInheritances do:[:each |
		ASActionRemoveInheritance new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].
	entity methods do:[:each |
		ASActionRemoveMethod new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:each; 
			run.
	].


	entity attributes do:[:com |
		ASActionRemoveAttribute new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].
	entity comments do:[:com |
		ASActionRemoveComment new 
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
