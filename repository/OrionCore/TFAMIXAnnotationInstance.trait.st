Trait {
	#name : #TFAMIXAnnotationInstance,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotatedEntity [
	^ self annotatedEntityAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotatedEntityAS: aVersion [
	^ self privateAnnotatedEntity versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotationType [
	^ self annotationTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> annotationTypeAS: aVersion [
	^ self privateAnnotationType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> attributes [
	^ self attributesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance >> attributesAS: aVersion [
	^ self privateAttributes versionIn: aVersion
]
