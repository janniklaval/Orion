"
A ORActionRemoveClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveClass,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
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
	
	entity outgoingReferences do:[:each |
		each deleteInAction: self.
	].
	entity types do:[:each |
		each deleteInAction: self.
	].
	entity incomingReferences do:[:each |
		each deleteInAction: self.
	].

	entity subInheritances do:[:each |
		ORActionAddInheritance new 
			parentAction: self ;
			orionModel: self orionModel; 
			from: each subclass; 
			to: (entity superInheritances first superclass); 
			run.
		each deleteInAction: self.
	].

	entity superInheritances do:[:each | 
		each deleteInAction: self
	].
	entity methods do:[:each |
		each deleteInAction: self.
	].


	entity attributes do:[:com |
		com deleteInAction: self.
	].
	entity comments do:[:each |
		each deleteInAction: self.
	].
	entity receivingInvocations do:[:each |
		each deleteInAction: self.
	].

	entity deleteOnlyInAction: self.
	self orionModel remove: entity.
	self postRun.
]
