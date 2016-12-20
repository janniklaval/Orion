Extension { #name : #FAMIXMethod }

{ #category : #'*OrionFamixJava' }
FAMIXMethod >> privateCaughtExceptions [
	^ self privateState attributeAt: #caughtExceptions
]

{ #category : #'*OrionFamixJava' }
FAMIXMethod >> privateCaughtExceptions: aValue [
	self privateState attributeAt: #caughtExceptions put: aValue
]

{ #category : #'*OrionFamixJava' }
FAMIXMethod >> privateDeclaredExceptions [
	^ self privateState attributeAt: #declaredExceptions
]

{ #category : #'*OrionFamixJava' }
FAMIXMethod >> privateDeclaredExceptions: aValue [
	self privateState attributeAt: #declaredExceptions put: aValue
]

{ #category : #'*OrionFamixJava' }
FAMIXMethod >> privateThrownExceptions [
	^ self privateState attributeAt: #thrownExceptions
]

{ #category : #'*OrionFamixJava' }
FAMIXMethod >> privateThrownExceptions: aValue [
	self privateState attributeAt: #thrownExceptions put: aValue
]
