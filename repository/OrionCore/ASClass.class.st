Class {
	#name : #ASClass,
	#superclass : #FAMIXClass,
	#traits : 'TFAMIXClass',
	#classTraits : 'TFAMIXClass classTrait',
	#category : #'OrionCore-model'
}

{ #category : #'as yet unclassified' }
ASClass >> currentContext [
	"Answers the model containing the receiver"
	^ self privateState currentContext
]
