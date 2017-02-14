"
This exception is triggered when a method is not found in the current version of the model. Consequently, we are looking into the parent model of the entity... 

ORNotFoundInModelAndTryPreviousVersionInstead exception is thrown when the entity is not found in the current version of the model but could be found in the previous ones. The exception is thrown at demand on very specific cases and is desactivated by default. 
"
Class {
	#name : #ORNotFoundInModelAndTryPreviousVersionInstead,
	#superclass : #ORNotFoundInModel,
	#classVars : [
		'Activated'
	],
	#category : #'OrionCore-Exceptions'
}

{ #category : #accessing }
ORNotFoundInModelAndTryPreviousVersionInstead class >> activate [
	Activated := true
]

{ #category : #accessing }
ORNotFoundInModelAndTryPreviousVersionInstead class >> desactivate [
	Activated := false
]

{ #category : #initialization }
ORNotFoundInModelAndTryPreviousVersionInstead class >> initialize [
	self desactivate
]

{ #category : #handling }
ORNotFoundInModelAndTryPreviousVersionInstead >> isActivated [
	^ Activated
]

{ #category : #handling }
ORNotFoundInModelAndTryPreviousVersionInstead >> resume [
	^ self resume: false
]

{ #category : #handling }
ORNotFoundInModelAndTryPreviousVersionInstead >> signal [
	self isActivated
		ifTrue: [ ^ super signal ].
	^ false
]
