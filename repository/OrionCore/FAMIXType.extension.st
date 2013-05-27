Extension { #name : #FAMIXType }

{ #category : #'*OrionCore-model' }
FAMIXType >> privateAttributes [
	^attributes
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateAttributes: anAttribute [
	attributes := anAttribute
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateBehavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateBehavioursWithDeclaredType: aCollectionOfBehaviours [
	behavioursWithDeclaredType := aCollectionOfBehaviours
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateContainer [
	^container
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateContainer: aContainerEntity [
	container := aContainerEntity
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateMethods [
	^methods
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
FAMIXType >> privateStructuresWithDeclaredType: aCollectionOfStructuralEntities [
	structuresWithDeclaredType := aCollectionOfStructuralEntities
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSubInheritances [
	^subInheritances
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSubInheritances: anInheritance [
	subInheritances := anInheritance
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSuperInheritances [
	^superInheritances
]

{ #category : #'*OrionCore-model' }
FAMIXType >> privateSuperInheritances: anInheritance [
	superInheritances := anInheritance
]
