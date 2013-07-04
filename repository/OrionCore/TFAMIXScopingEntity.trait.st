Trait {
	#name : #TFAMIXScopingEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> childScopes [
	^ self childScopesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> childScopesOR: aVersion [
	^ self privateChildScopes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> globalVariables [
	^ self globalVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> globalVariablesOR: aVersion [
	^ self privateGlobalVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
