Trait {
	#name : #TFAMIXFileAnchor,
	#traits : 'TFAMIXSourceAnchor',
	#classTraits : 'TFAMIXSourceAnchor classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> endColumn [
	^ self endColumnAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> endColumnAS: aVersion [
	^ self privateEndColumn versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> endLine [
	^ self endLineAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> endLineAS: aVersion [
	^ self privateEndLine versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> fileName [
	^ self fileNameAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> fileNameAS: aVersion [
	^ self privateFileName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> startColumn [
	^ self startColumnAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> startColumnAS: aVersion [
	^ self privateStartColumn versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> startLine [
	^ self startLineAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFileAnchor >> startLineAS: aVersion [
	^ self privateStartLine versionIn: aVersion
]
