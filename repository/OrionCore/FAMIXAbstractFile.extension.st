Extension { #name : #FAMIXAbstractFile }

{ #category : #'*OrionCore-model' }
FAMIXAbstractFile >> privateBelongsTo [
	^ belongsTo
]

{ #category : #'*OrionCore-model' }
FAMIXAbstractFile >> privateBelongsTo: anObject [
	belongsTo := anObject
]

{ #category : #'*OrionCore-model' }
FAMIXAbstractFile >> privateEntities [
	^entities
]

{ #category : #'*OrionCore-model' }
FAMIXAbstractFile >> privateEntities: anObject [
	entities := anObject
]

{ #category : #'*OrionCore-model' }
FAMIXAbstractFile >> privateName [
	^name
]

{ #category : #'*OrionCore-model' }
FAMIXAbstractFile >> privateName: anObject [
	name := anObject
]
