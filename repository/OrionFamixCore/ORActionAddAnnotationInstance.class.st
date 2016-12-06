"
A ORActionAddFAMIXAnnotationInstance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddAnnotationInstance,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'type'
	],
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionAddAnnotationInstance >> run [
	| newAnnotationInstance theType theNewContainer |
	super run.
	newAnnotationInstance := ORAnnotationInstance new.
	self orionModel add: newAnnotationInstance.
	theNewContainer := self orionModel retrieveEntity: container.
	theType := self orionModel
		retrieveEntity: (self orionModel allAnnotationTypes detect: [ :annoType | annoType name asSymbol = self type asSymbol ]).

	"Set item values"
	newAnnotationInstance privateAnnotationType: theType orionCopy.
	newAnnotationInstance privateAnnotatedEntity: theNewContainer orionCopy.

	"Set opposite values"
	theType privateInstances: (theType privateInstances orionCopy unsafeAdd: newAnnotationInstance).
	theNewContainer privateAnnotationInstances: (theNewContainer privateAnnotationInstances orionCopy unsafeAdd: newAnnotationInstance).
	entity := newAnnotationInstance.
	^ entity
]

{ #category : #'as yet unclassified' }
ORActionAddAnnotationInstance >> type [
	^ type
]

{ #category : #'as yet unclassified' }
ORActionAddAnnotationInstance >> type: aString [
	type := aString
]
