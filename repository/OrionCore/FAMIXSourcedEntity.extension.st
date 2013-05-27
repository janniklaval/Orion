Extension { #name : #FAMIXSourcedEntity }

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateComments [
	^comments
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateComments: aCollection [

	comments := aCollection
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateDeclaredSourceLanguage [
	^declaredSourceLanguage
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateDeclaredSourceLanguage: aSourceLanguage [
	declaredSourceLanguage :=  aSourceLanguage 
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateSourceAnchor [
	^sourceAnchor
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateSourceAnchor: aSourceAnchor [
	sourceAnchor := aSourceAnchor
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateSourceLanguage [
	^ sourceLanguage
]

{ #category : #'*OrionCore-model' }
FAMIXSourcedEntity >> privateSourceLanguage: aSourceLanguage [
	sourceLanguage := aSourceLanguage
]
