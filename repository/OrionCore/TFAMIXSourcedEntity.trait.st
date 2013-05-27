Trait {
	#name : #TFAMIXSourcedEntity,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> comments [
	^ self commentsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> commentsAS: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> declaredSourceLanguage [
	^ self declaredSourceLanguageAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> declaredSourceLanguageAS: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> sourceAnchor [
	^ self sourceAnchorAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> sourceAnchorAS: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> sourceLanguage [
	^ self sourceLanguageAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourcedEntity >> sourceLanguageAS: aVersion [
	^ self privateSourceLanguage versionIn: aVersion
]
