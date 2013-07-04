Trait {
	#name : #TFAMIXType,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> container [
	^ self containerOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]
