"
An ORActionRemoveType is  a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveType,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveType >> run [
	super run.
	entity outgoingReferences do: [ :each | each deleteInAction: self ].
	entity types do: [ :each | each deleteInAction: self ].
	entity incomingReferences do: [ :each | each deleteInAction: self ].
	entity subInheritances
		do: [ :each | 
			entity superInheritances
				ifNotEmpty: [ 
					ORActionAddInheritance new
						parentAction: self;
						orionModel: self orionModel;
						from: each subclass;
						to: entity superInheritances first superclass;
						run.
					each deleteInAction: self ] ].
			
	entity superInheritances do: [ :each | [each deleteInAction: self]onDNU:#orionModel do: [  ] ].
	entity methods do: [ :each | each deleteInAction: self ].
	entity attributes do: [ :com | com deleteInAction: self ].
	entity comments do: [ :each | each deleteInAction: self ].
	entity receivingInvocations do: [ :each | each deleteInAction: self ].
	entity deleteOnlyInAction: self
]
