"
A TFAMIXCaughtException is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXCaughtException,
	#traits : 'TFAMIXException',
	#classTraits : 'TFAMIXException classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXCaughtException classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXCaughtException >> definingMethod [
	^ self definingMethodOR: self currentContext
]

{ #category : #accessing }
TFAMIXCaughtException >> definingMethodOR: aVersion [
	^ self privateDefiningMethod versionIn: aVersion
]
