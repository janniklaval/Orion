Extension { #name : #SequenceableCollection }

{ #category : #'*Orion-Merge' }
SequenceableCollection >> unsafeAdd: element [
	(self includes: element) not
		ifTrue: [ self add: element ]
]
