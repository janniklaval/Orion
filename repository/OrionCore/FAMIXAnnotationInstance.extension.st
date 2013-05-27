Extension { #name : #FAMIXAnnotationInstance }

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotatedEntity [
	^ annotatedEntity
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotatedEntity: anEntity [
	annotatedEntity := anEntity
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotationType [
	^ annotationType
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAnnotationType: anAnnotationType [
	annotationType := anAnnotationType
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAttributes [
	^ attributes
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstance >> privateAttributes: anAnnotationInstanceAttribute [
	attributes := anAnnotationInstanceAttribute
]
