Extension { #name : #FAMIXType }

{ #category : #'*OrionCore-model' }
FAMIXType >> privateAttributes [
	^ attributes
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateAttributes: aAttribute [
	 attributes := aAttribute
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateBehavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateBehavioursWithDeclaredType: aBehaviouralEntity [
	 behavioursWithDeclaredType := aBehaviouralEntity
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateContainer [
	^ container
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateContainer: aContainerEntity [
	 container := aContainerEntity
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateMethods [
	^ methods
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateMethods: aMethod [
	 methods := aMethod
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateStructuresWithDeclaredType [
	^ structuresWithDeclaredType
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateStructuresWithDeclaredType: aStructuralEntity [
	 structuresWithDeclaredType := aStructuralEntity
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSubInheritances [
	^ subInheritances
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSubInheritances: aInheritance [
	 subInheritances := aInheritance
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSuperInheritances [
	^ superInheritances
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSuperInheritances: aInheritance [
	 superInheritances := aInheritance
]
