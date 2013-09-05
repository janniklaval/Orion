Class {
	#name : #ORAnnotationType,
	#superclass : #FAMIXAnnotationType,
	#traits : 'TFAMIXAnnotationType',
	#classTraits : 'TFAMIXAnnotationType classTrait',
	#category : #'OrionCore-model'
}

{ #category : #'as yet unclassified' }
ORAnnotationType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
