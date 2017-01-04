Extension { #name : #TFAMIXMethod }

{ #category : #'*OrionFamixSmalltalk' }
TFAMIXMethod >> category [
	^ self categoryOR: self currentContext
]

{ #category : #'*OrionFamixSmalltalk' }
TFAMIXMethod >> categoryOR: aVersion [
	^ self privateCategory versionIn: aVersion
]

{ #category : #'*OrionFamixSmalltalk' }
TFAMIXMethod >> timeStamp [
	^ self timeStampOR: self currentContext
]

{ #category : #'*OrionFamixSmalltalk' }
TFAMIXMethod >> timeStampOR: aVersion [
	^ self privateTimeStamp versionIn: aVersion
]
