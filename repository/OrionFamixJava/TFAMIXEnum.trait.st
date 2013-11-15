"
A TFAMIXEnum is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXEnum,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXEnum classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXEnum >> values [
	^ self valuesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> valuesOR: aVersion [
	^ self privateValues versionIn: aVersion
]
