"
An ORActionAddLocalVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddLocalVariable,
	#superclass : #ORActionAddEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionAddLocalVariable >> run [
	| newLocalVar newBehavioural |
	super run.
	newLocalVar := ORLocalVariable new.
	newLocalVar name: newName.
	self orionModel add: newLocalVar.

	newBehavioural := (self orionModel retrieveEntity: container).
	newLocalVar privateParentBehaviouralEntity: newBehavioural orionCopy.
	newBehavioural privateLocalVariables: (newBehavioural privateLocalVariables orionCopy unsafeAdd: newLocalVar).
	
	entity := newLocalVar.

	^ entity
]
