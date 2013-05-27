Trait {
	#name : #TFAMIXComment,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXComment >> container [
	^ self containerAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXComment >> containerAS: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXComment >> contentString [
	^ self contentStringAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXComment >> contentStringAS: aVersion [
	^ self privateContentString versionIn: aVersion
]
