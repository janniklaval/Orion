Trait {
	#name : #TFAMIXFolder,
	#traits : 'TFAMIXAbstractFile',
	#classTraits : 'TFAMIXAbstractFile classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXFolder >> files [
	^ self filesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFolder >> filesAS: aVersion [
	^ self privateFiles versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFolder >> folders [
	^ self foldersAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFolder >> foldersAS: aVersion [
	^ self privateFolders versionIn: aVersion
]
