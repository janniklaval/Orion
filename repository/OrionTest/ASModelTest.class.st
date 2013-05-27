Class {
	#name : #ASModelTest,
	#superclass : #ASTest,
	#category : #OrionTest
}

{ #category : #'as yet unclassified' }
ASModelTest >> testASModelCreation [
	
	|firstMod secMod sys|
	sys := self model system. 
	firstMod := sys sourceModel.
	secMod := (ASModel withParent: self model) name: #antaresModel.
	
	self assert: TMooseEntity users size = 1.
	self assert: ASClass traits size = 1.
	
	self assert: sys antaresModels size = 2.
	self assert: (sys sourceModel childrenModel includes: secMod).
	
	self assert: firstMod parentModel = nil.
	self assert: firstMod system = sys.
	self assert: firstMod sourceLanguage = secMod sourceLanguage.
	self assert: firstMod entityStorage size = secMod entityStorage size.
	self assert: firstMod entityStorage size = 30.
	
	firstMod entities do:[:e |
		self assert: (e isKindOf: MooseEntity).
	].
	
	self assert: secMod parentModel = sys sourceModel.
	self assert: secMod system = sys.
	self assert: secMod sourceLanguage = sys sourceModel sourceLanguage.
	self assert: secMod entityStorage size = sys sourceModel entityStorage size.
	self assert: secMod entityStorage size ~= 0.
	
]
