Extension { #name : #FAMIXAnnotationInstanceAttribute }

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateAnnotationTypeAttribute [
	^ annotationTypeAttribute
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateAnnotationTypeAttribute: aAnnotationTypeAttribute [
	 annotationTypeAttribute := aAnnotationTypeAttribute
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateParentAnnotationInstance [
	^ parentAnnotationInstance
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateParentAnnotationInstance: aAnnotationInstance [
	 parentAnnotationInstance := aAnnotationInstance
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateValue [
	^ value
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationInstanceAttribute >> privateValue: aString [
	 value := aString
]
