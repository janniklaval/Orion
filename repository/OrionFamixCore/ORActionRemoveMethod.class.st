"
A ORActionRemoveMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveMethod,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
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

	entity outgoingReferences do:[:each |
		each deleteInAction: self.
	].
	entity incomingReferences do:[:each |
		each deleteInAction: self.
	].
	entity outgoingInvocations do:[:each |
		each deleteInAction: self.
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
"Halt if: [entity accesses notEmpty]."
	entity accesses do:[:each |
		each deleteInAction: self.
	].

	entity comments do:[:com |
		com deleteInAction: self.
	].
	
	entity types do:[:each |
		each deleteInAction: self.
	].
	entity localVariables do:[:com |
		com deleteInAction: self.
	].
	entity parameters do:[:com |
		com deleteInAction: self.
	].

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

	self orionModel remove: entity.

]
