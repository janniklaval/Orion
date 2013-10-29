Extension { #name : #FMMultivalueLink }

{ #category : #'*OrionCore-model' }
FMMultivalueLink >> orionCopy [
	"Must the associations, or later store will affect both the
original and the copy"

	
	^ self shallowCopy valueCopy.
]

{ #category : #'*OrionCore-model' }
FMMultivalueLink >> orionRemove: element [

	values remove: (values detect:[:e | e mooseID = element mooseID] ifNone: [nil]) ifAbsent: [nil].
	
	

]

{ #category : #'*OrionCore-model' }
FMMultivalueLink >> valueCopy [
	"Must copy the associations, or later store will affect both the
original and the copy"

	values := values collect: [ :val |
		val ifNotNil: [ val shallowCopy ] ].
]
