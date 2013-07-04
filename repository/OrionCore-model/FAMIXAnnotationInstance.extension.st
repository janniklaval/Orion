Extension { #name : #FAMIXAnnotationInstance }

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotatedEntity [
	^ annotatedEntity
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotatedEntity: aNamedEntity [
	 annotatedEntity := aNamedEntity
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotationType [
	^ annotationType
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotationType: aAnnotationType [
	 annotationType := aAnnotationType
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAttributes [
	^ attributes
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAttributes: aAnnotationInstanceAttribute [
	 attributes := aAnnotationInstanceAttribute
]
