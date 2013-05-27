Class {
	#name : #ASAction,
	#superclass : #Object,
	#instVars : [
		'entity',
		'antaresModel',
		'cost',
		'parentAction',
		'childrenActions'
	],
	#category : #'OrionCore-action'
}

{ #category : #'initialize-release' }
ASAction class >> description [
	^'action'
]

{ #category : #'initialize-release' }
ASAction class >> needs: anElement [
	^self subclassResponsibility
]

{ #category : #accessing }
ASAction >> addChildAction: anAction [
	childrenActions add:  anAction
]

{ #category : #accessing }
ASAction >> antaresModel [
	^ antaresModel
]

{ #category : #accessing }
ASAction >> antaresModel: anObject [
	antaresModel := anObject.
	anObject changes add: self
]

{ #category : #accessing }
ASAction >> childrenActions [
	^ childrenActions
]

{ #category : #accessing }
ASAction >> cost [
	^ cost
]

{ #category : #accessing }
ASAction >> cost: anObject [
	cost := anObject
]

{ #category : #accessing }
ASAction >> currentContext [
	^ self antaresModel
]

{ #category : #accessing }
ASAction >> entity [
	^ entity
]

{ #category : #accessing }
ASAction >> entity: anObject [
	entity := anObject
]

{ #category : #'initialize-release' }
ASAction >> initialize [
	cost := 1.
	parentAction := nil.
	childrenActions := OrderedCollection new.
]

{ #category : #accessing }
ASAction >> isManual [
	^ parentAction isNil
]

{ #category : #'method execution' }
ASAction >> manualRun [

	self parentAction: nil.
	self run.
	^self
]

{ #category : #accessing }
ASAction >> parentAction [
	^ parentAction
]

{ #category : #accessing }
ASAction >> parentAction: anAction [
	parentAction ifNotNil: [parentAction removeChildAction: self].
	parentAction := anAction.
	anAction ifNotNil: [anAction addChildAction: self].
]

{ #category : #printing }
ASAction >> printWorkspace [

	^ '>', self class description, '>> ', self entity mooseName
]

{ #category : #accessing }
ASAction >> removeChildAction: anAction [
	childrenActions remove: anAction ifAbsent: [nil].
]

{ #category : #'method execution' }
ASAction >> run [
	self runAS: self antaresModel.
]

{ #category : #'method execution' }
ASAction >> runAS: aVersion [

	aVersion system announcer announce: ASAnnouncement.
	entity := entity versionIn: aVersion.
	^self
]

{ #category : #'method execution' }
ASAction >> runOnNewVersionFrom: previousVersion [

	| newModel |
	newModel := previousVersion createNewChildVersion.
	self antaresModel: newModel.
	^self manualRun.
]
