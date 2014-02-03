"
An ORActionAddEnum is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionAddEnum,
	#superclass : #ORActionAddEntity,
	#category : #'OrionFamixJava-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddEnum >> run [
	| newEnum |
	super run.
	newEnum := ORClass new.
	newEnum name: newName.
	self orionModel add: newEnum.

	

	container ifNotNil:[
		|theNewContainer |
		theNewContainer := (self orionModel retrieveEntity:container).
		newEnum privateContainer: theNewContainer orionCopy.
		theNewContainer privateTypes: (theNewContainer privateTypes orionCopy unsafeAdd: newEnum).
	].
	

	entity := newEnum.
	

	^ entity

]
