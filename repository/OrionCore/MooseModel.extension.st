Extension { #name : #MooseModel }

{ #category : #'*OrionCore-modelBuilder' }
MooseModel >> convertToAntares [
	<menuItem: 'Convert to ASModel' category: 'Antares'> 
	^ASConverter buildFromMooseModel: self.
]
