Class {
	#name : #FAMIXTestClass,
	#superclass : #FAMIXEntity,
	#instVars : [
		'kind'
	],
	#category : #'OrionGenerator-TestModel'
}

{ #category : #'as yet unclassified' }
FAMIXTestClass class >> annotation [
	<MSEClass: #TestClass super: #MooseEntity>
	"<package: #FAMIX>"
	^self
]

{ #category : #'as yet unclassified' }
FAMIXTestClass >> isSetter [
	<MSEProperty: #isSetter type: #Boolean>
	<derived>
	<MSEComment: 'for testing'>

	^true
]

{ #category : #'as yet unclassified' }
FAMIXTestClass >> kind [
	<MSEProperty: #kind type: #String>
	<MSEComment: 'for testing'>
	
	^ 'kind'
]

{ #category : #'as yet unclassified' }
FAMIXTestClass >> test [
	<MSEProperty: #test type: #String>
	<MSEComment: 'for testing'>
	
	^ 'test'
]
