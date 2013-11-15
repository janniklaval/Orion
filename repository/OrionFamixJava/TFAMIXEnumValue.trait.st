"
A TFAMIXEnumValue is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXEnumValue,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXEnumValue classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXEnumValue >> parentEnum [
	^ self parentEnumOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnumValue >> parentEnumOR: aVersion [
	^ self privateParentEnum versionIn: aVersion
]
