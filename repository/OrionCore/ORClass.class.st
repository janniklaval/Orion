Class {
	#name : #ORClass,
	#superclass : #FAMIXClass,
	#traits : 'TFAMIXClass',
	#classTraits : 'TFAMIXClass classTrait',
	#category : #'OrionCore-model'
}

{ #category : #'as yet unclassified' }
ORClass >> versionIn: anOrionModel [

	|upEntity|

	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
