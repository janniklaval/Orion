"
This exception is triggered when a method is not found in the current version of the model. Consequently, we are looking into the parent model of the entity... 
"
Class {
	#name : #ORNotFoundInModel,
	#superclass : #NotFound,
	#instVars : [
		'model'
	],
	#category : #'OrionCore-Exceptions'
}

{ #category : #'as yet unclassified' }
ORNotFoundInModel class >> signal: anObject model: aModel [ 
	^ self new
		object: anObject;
		model: aModel ;
		signal
]

{ #category : #testing }
ORNotFoundInModel >> isResumable [
	^ true
]

{ #category : #'as yet unclassified' }
ORNotFoundInModel >> model: anORModel [ 
	model := anORModel
]
