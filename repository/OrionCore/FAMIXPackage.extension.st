Extension { #name : #FAMIXPackage }

{ #category : #'*OrionCore-model' }
FAMIXPackage >> privateChildNamedEntities [
	^ childNamedEntities
]

{ #category : #'*OrionCore-model' }
FAMIXPackage >> privateChildNamedEntities: aNamedEntity [
	 childNamedEntities := aNamedEntity
]
