Extension { #name : #Collection }

{ #category : #'*OrionCore-model' }
Collection >> antaresCopy [
	"Must copy the associations, or later store will affect both the
original and the copy"
	|copy|
	
	^ self shallowCopy.
]

{ #category : #'*OrionCore-model' }
Collection >> versionIn: aVersion [
	^ self collect:[:e | e versionIn: aVersion]
]
