Extension { #name : #FAMIXAnnotationType }

{ #category : #'*OrionCore-model' }
FAMIXAnnotationType >> privateContainer [
	^ container
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationType >> privateContainer: aContainerEntity [
	 container := aContainerEntity
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationType >> privateInstances [
	^ instances
]

{ #category : #'*OrionCore-model' }
FAMIXAnnotationType >> privateInstances: aAnnotationInstance [
	 instances := aAnnotationInstance
]
