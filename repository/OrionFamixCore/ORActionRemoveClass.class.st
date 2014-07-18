"
A ORActionRemoveClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveClass,
	#superclass : #ORActionRemoveType,
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
