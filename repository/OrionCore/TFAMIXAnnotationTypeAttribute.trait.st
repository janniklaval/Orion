Trait {
	#name : #TFAMIXAnnotationTypeAttribute,
	#traits : 'TFAMIXAttribute',
	#classTraits : 'TFAMIXAttribute classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationTypeAttribute >> annotationAttributeInstances [
	^ self annotationAttributeInstancesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationTypeAttribute >> annotationAttributeInstancesAS: aVersion [
	^ self privateAnnotationAttributeInstances versionIn: aVersion
]
