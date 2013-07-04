Trait {
	#name : #TFAMIXAnnotationInstance,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotatedEntity [
	^ self annotatedEntityOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotatedEntityOR: aVersion [
	^ self privateAnnotatedEntity versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotationType [
	^ self annotationTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotationTypeOR: aVersion [
	^ self privateAnnotationType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]
