Class {
	#name : #OrionMergeFamixVisitor,
	#superclass : #FAMIXVisitor,
	#instVars : [
		'currentEntity',
		'changeVisitor'
	],
	#category : #'Orion-Merge'
}

{ #category : #accessing }
OrionMergeFamixVisitor >> actionType [
	^ currentEntity ppname capitalized
]

{ #category : #accessing }
OrionMergeFamixVisitor >> changeVisitor [
	^ changeVisitor
]

{ #category : #accessing }
OrionMergeFamixVisitor >> changeVisitor: anObject [
	changeVisitor := anObject
]

{ #category : #accessing }
OrionMergeFamixVisitor >> currentEntity [
	^ currentEntity
]

{ #category : #accessing }
OrionMergeFamixVisitor >> currentEntity: aFamixAddChange [
	currentEntity := aFamixAddChange
]

{ #category : #visiting }
OrionMergeFamixVisitor >> visitEntity: anEntity [
	^ self changeVisitor
		perform: ('create' , self actionType , anEntity mooseDescription name asMutator)asSymbol
		with: currentEntity
]
