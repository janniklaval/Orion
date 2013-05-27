Trait {
	#name : #TFAMIXAnnotationInstanceAttribute,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttribute [
	^ self annotationTypeAttributeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttributeAS: aVersion [
	^ self privateAnnotationTypeAttribute versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstance [
	^ self parentAnnotationInstanceAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstanceAS: aVersion [
	^ self privateParentAnnotationInstance versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> value [
	^ self valueAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute >> valueAS: aVersion [
	^ self privateValue versionIn: aVersion
]
