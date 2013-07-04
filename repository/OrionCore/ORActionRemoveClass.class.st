Class {
	#name : #ORActionRemoveClass,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveClass class >> description [
	^'remove class'
]

{ #category : #'as yet unclassified' }
ORActionRemoveClass class >> scope [
	<OrionActionFor: #ORClass>
	^self
]

{ #category : #'method execution' }
ORActionRemoveClass >> run [
	super run.
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity container ifNotNil:[
		| namespace |
		namespace := (self orionModel retrieveEntity:entity container).
		namespace privateTypes:  (namespace privateTypes orionCopy orionRemove: entity).
	].
	entity outgoingReferences do:[:each |
		ORActionRemoveReference new
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity types do:[:each |
		ORActionRemoveClass new 
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

	entity subInheritances do:[:each |
		ORActionAddInheritance new 
			parentAction: self ;
			orionModel: self orionModel; 
			from: each subclass; 
			to: (entity superInheritances first superclass); 
			run.
		ORActionRemoveInheritance new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].

	entity superInheritances do:[:each |
		ORActionRemoveInheritance new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].
	entity methods do:[:each |
		ORActionRemoveMethod new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:each; 
			run.
	].


	entity attributes do:[:com |
		ORActionRemoveAttribute new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].
	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
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
