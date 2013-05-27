Extension { #name : #FAMIXAnnotationInstanceAttribute }

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateAnnotationTypeAttribute [
	^ annotationTypeAttribute
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateAnnotationTypeAttribute: anAnnotationTypeAttribute [
	annotationTypeAttribute := anAnnotationTypeAttribute
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateParentAnnotationInstance [
	^ parentAnnotationInstance
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateParentAnnotationInstance: anAnnotationInstance [
	parentAnnotationInstance := anAnnotationInstance
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateValue [
	^ value
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateValue: anObject [
	value := anObject
]
