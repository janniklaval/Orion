"
A TFAMIXParameterizableClass is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXParameterizableClass,
	#traits : 'TFAMIXClass',
	#classTraits : 'TFAMIXClass classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXParameterizableClass >> parameterizedTypes [
	^ self parameterizedTypesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> parameterizedTypesOR: aVersion [
	^ self privateParameterizedTypes versionIn: aVersion
]
