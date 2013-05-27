Trait {
	#name : #TFAMIXAccess,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAccess >> accessor [
	^ self accessorAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> accessorAS: aVersion [
	^ self privateAccessor versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> isWrite [
	^ self isWriteAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> isWriteAS: aVersion [
	^ self privateIsWrite versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> variable [
	^ self variableAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAccess >> variableAS: aVersion [
	^ self privateVariable versionIn: aVersion
]
