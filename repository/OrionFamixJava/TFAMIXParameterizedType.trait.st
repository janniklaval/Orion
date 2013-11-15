"
A TFAMIXParameterizedType is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXParameterizedType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXParameterizedType >> arguments [
	^ self argumentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> argumentsOR: aVersion [
	^ self privateArguments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> parameterizableClass [
	^ self parameterizableClassOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> parameterizableClassOR: aVersion [
	^ self privateParameterizableClass versionIn: aVersion
]
