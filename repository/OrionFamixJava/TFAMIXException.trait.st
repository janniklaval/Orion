"
A TFAMIXException is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXException,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXException classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXException >> exceptionClass [
	^ self exceptionClassOR: self currentContext
]

{ #category : #accessing }
TFAMIXException >> exceptionClassOR: aVersion [
	^ self privateExceptionClass versionIn: aVersion
]
