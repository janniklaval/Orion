Extension { #name : #TFAMIXType }

{ #category : #'*OrionFamixC' }
TFAMIXType >> typeAliases [
	^ self typeAliasesOR: self currentContext
]

{ #category : #'*OrionFamixC' }
TFAMIXType >> typeAliasesOR: aVersion [
	^ self privateTypeAliases versionIn: aVersion
]
