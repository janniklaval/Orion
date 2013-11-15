"
A TFAMIXJavaSourceLanguage is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXJavaSourceLanguage,
	#traits : 'TFAMIXSourceLanguage',
	#classTraits : 'TFAMIXSourceLanguage classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXJavaSourceLanguage classSide >> isOrionClass [
	^ true
]
