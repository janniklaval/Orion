Trait {
	#name : #TFAMIXAnnotationInstanceAttribute,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttribute [
	^ self annotationTypeAttributeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttributeOR: aVersion [
	^ self privateAnnotationTypeAttribute versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstance [
	^ self parentAnnotationInstanceOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstanceOR: aVersion [
	^ self privateParentAnnotationInstance versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> value [
	^ self valueOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> valueOR: aVersion [
	^ self privateValue versionIn: aVersion
]
