Class {
	#name : #ASActionRemoveLink,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveLink class >> description [
	^'remove association'
]

{ #category : #'as yet unclassified' }
ASActionRemoveLink >> run [
	self subclassResponsability.
]
