Extension { #name : #FAMIXFolder }

{ #category : #'*OrionCore-model' }
FAMIXFolder >> privateFiles [
	^files
]

{ #category : #'*OrionCore-model' }
FAMIXFolder >> privateFiles: aCollection [
	files := aCollection
]

{ #category : #'*OrionCore-model' }
FAMIXFolder >> privateFolders [
	^folders
]

{ #category : #'*OrionCore-model' }
FAMIXFolder >> privateFolders: aCollection [
	folders := aCollection
]
