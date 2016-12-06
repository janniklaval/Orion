"
A ORActionAddFAMIXAnnotationType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddAnnotationType,
	#superclass : #ORActionAddEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionAddAnnotationType >> run [
	| newAnnotationType |
	super run.
	newAnnotationType := ORAnnotationType named: newName.
	self orionModel add: newAnnotationType.
	(self container isModel not and: [ self container isMethod ])
		ifTrue: [ newAnnotationType privateContainer: self container orionCopy ].
	entity := newAnnotationType.
	^ entity
]
