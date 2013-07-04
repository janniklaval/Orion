Extension { #name : #MooseModel }

{ #category : #'*OrionCore-modelBuilder' }
MooseModel >> convertToOrion [
	<menuItem: 'Convert to ASModel' category: 'Antares'> 
	^ORConverter buildFromMooseModel: self.
]
