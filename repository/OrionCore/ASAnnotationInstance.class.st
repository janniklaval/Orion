Class {
	#name : #ASAnnotationInstance,
	#superclass : #FAMIXAnnotationInstance,
	#traits : 'TFAMIXAnnotationInstance',
	#classTraits : 'TFAMIXAnnotationInstance classTrait',
	#category : #'OrionCore-model'
}

{ #category : #'as yet unclassified' }
ASAnnotationInstance >> attributes [
	^ self attributesAS: self currentContext
]
