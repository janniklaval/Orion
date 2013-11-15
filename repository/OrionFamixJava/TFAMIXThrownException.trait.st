"
A TFAMIXThrownException is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXThrownException,
	#traits : 'TFAMIXException',
	#classTraits : 'TFAMIXException classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXThrownException classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXThrownException >> definingMethod [
	^ self definingMethodOR: self currentContext
]

{ #category : #accessing }
TFAMIXThrownException >> definingMethodOR: aVersion [
	^ self privateDefiningMethod versionIn: aVersion
]
