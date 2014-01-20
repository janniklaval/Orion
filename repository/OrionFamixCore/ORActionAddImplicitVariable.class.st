"
An ORActionAddImplicitVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddImplicitVariable,
	#superclass : #ORActionAddEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionAddImplicitVariable >> run [
	| newImplicitVar newBehavioural |
	super run.
	newImplicitVar := ORLocalVariable new.
	newImplicitVar name: newName.
	self orionModel add: newImplicitVar.

	newBehavioural := (self orionModel retrieveEntity: container).
	newImplicitVar privateParentBehaviouralEntity: newBehavioural orionCopy.
	newBehavioural privateImplicitVariables: (newBehavioural privateLocalVariables orionCopy unsafeAdd: newImplicitVar).
	
	entity := newImplicitVar.

	^ entity
]
