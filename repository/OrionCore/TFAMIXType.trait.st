Trait {
	#name : #TFAMIXType,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXType >> attributes [
	^ self attributesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> attributesAS: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> behavioursWithDeclaredTypeAS: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> container [
	^ self containerAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> containerAS: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> methods [
	^ self methodsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> methodsAS: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> structuresWithDeclaredTypeAS: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> subInheritances [
	^ self subInheritancesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> subInheritancesAS: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXType >> superInheritances [
	^ self superInheritancesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXType >> superInheritancesAS: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]
