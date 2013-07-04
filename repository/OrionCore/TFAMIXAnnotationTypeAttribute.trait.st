Trait {
	#name : #TFAMIXAnnotationTypeAttribute,
	#traits : 'TFAMIXAttribute',
	#classTraits : 'TFAMIXAttribute classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationTypeAttribute >> annotationAttributeInstances [
	^ self annotationAttributeInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationTypeAttribute >> annotationAttributeInstancesOR: aVersion [
	^ self privateAnnotationAttributeInstances versionIn: aVersion
]
