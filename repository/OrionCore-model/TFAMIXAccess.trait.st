Trait {
	#name : #TFAMIXAccess,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAccess >> accessor [
	^ self accessorOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> accessorOR: aVersion [
	^ self privateAccessor versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> isWrite [
	^ self isWriteOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> isWriteOR: aVersion [
	^ self privateIsWrite versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> variable [
	^ self variableOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> variableOR: aVersion [
	^ self privateVariable versionIn: aVersion
]
