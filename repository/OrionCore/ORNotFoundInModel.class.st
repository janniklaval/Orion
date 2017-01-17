Class {
	#name : #ORNotFoundInModel,
	#superclass : #NotFound,
	#instVars : [
		'model'
	],
	#category : #'OrionCore-action'
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
