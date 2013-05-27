Trait {
	#name : #TFAMIXInheritance,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> subclass [
	^ self subclassAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> subclassAS: aVersion [
	^ self privateSubclass versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> superclass [
	^ self superclassAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> superclassAS: aVersion [
	^ self privateSuperclass versionIn: aVersion
]
