Class {
	#name : #ORActionAddMethodWithBodyHash,
	#superclass : #ORActionAddMethod,
	#instVars : [
		'bodyHash'
	],
	#category : #'Famix-Hash-Extension'
}

{ #category : #accessing }
ORActionAddMethodWithBodyHash >> bodyHash [
	^ bodyHash
]

{ #category : #accessing }
ORActionAddMethodWithBodyHash >> bodyHash: anObject [
	bodyHash := anObject
]

{ #category : #'method execution' }
ORActionAddMethodWithBodyHash >> run [
	super run.
	entity bodyHash: self bodyHash orionCopy.
	^ entity
]
