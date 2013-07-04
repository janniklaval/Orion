Trait {
	#name : #TFAMIXInheritance,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> next [
	^ self nextOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> previous [
	^ self previousOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> subclass [
	^ self subclassOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> subclassOR: aVersion [
	^ self privateSubclass versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> superclass [
	^ self superclassOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInheritance >> superclassOR: aVersion [
	^ self privateSuperclass versionIn: aVersion
]
