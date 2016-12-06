"
An ORActionAddParameter is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddParameter,
	#superclass : #ORActionAddEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionAddParameter >> run [
	| newParameter newBehavioural |
	super run.
	newParameter := ORParameter new.
	newParameter name: newName.
	self orionModel add: newParameter.

	newBehavioural := (self orionModel retrieveEntity: container).
	newParameter privateParentBehaviouralEntity: newBehavioural orionCopy.
	newBehavioural privateParameters: (newBehavioural privateParameters orionCopy unsafeAdd: newParameter).
	
	entity := newParameter.

	^ entity
]
