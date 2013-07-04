Class {
	#name : #ORActionRemoveLink,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveLink class >> description [
	^'remove association'
]

{ #category : #'as yet unclassified' }
ORActionRemoveLink >> run [
	self subclassResponsability.
]
