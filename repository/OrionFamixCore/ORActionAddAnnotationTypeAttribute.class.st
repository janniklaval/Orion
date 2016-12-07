"
A ORActionAddFAMIXAnnotationTypeAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddAnnotationTypeAttribute,
	#superclass : #ORActionAddAttribute,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionAddAnnotationTypeAttribute >> run [
	self flag: '#Maybe there is some other things to do ...'.
	super run
]
