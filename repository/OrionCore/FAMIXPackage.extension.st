Extension { #name : #FAMIXPackage }

{ #category : #'*OrionCore-model' }
FAMIXPackage >> copyChildNamedEntities [

	|model cand|
	self currentContext parentModel notNil ifTrue:[
		model := self currentContext.
		cand := FMMultivalueLink orionOn: self opposite: #parentPackage:.
		childNamedEntities do:[:each |
			cand orionAdd: (each versionIn: model) ].
		^ cand.]
	ifFalse:[^childNamedEntities]
]

{ #category : #'*OrionCore-model' }
FAMIXPackage >> privateChildNamedEntities [
	^childNamedEntities
]

{ #category : #'*OrionCore-model' }
FAMIXPackage >> privateChildNamedEntities: aNamedEntity [
	childNamedEntities := aNamedEntity
]
