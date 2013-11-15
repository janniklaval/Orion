"
A TFAMIXDeclaredException is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXDeclaredException,
	#traits : 'TFAMIXException',
	#classTraits : 'TFAMIXException classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException classSide >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> definingMethod [
	^ self definingMethodOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> definingMethodOR: aVersion [
	^ self privateDefiningMethod versionIn: aVersion
]
