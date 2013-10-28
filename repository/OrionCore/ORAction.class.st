Class {
	#name : #ORAction,
	#superclass : #Object,
	#instVars : [
		'entity',
		'orionModel',
		'cost',
		'parentAction',
		'childrenActions'
	],
	#category : #'OrionCore-action'
}

{ #category : #'initialize-release' }
ORAction class >> description [
	^'action'
]

{ #category : #'initialize-release' }
ORAction class >> needs: anElement [
	^self subclassResponsibility
]

{ #category : #accessing }
ORAction >> addChildAction: anAction [
	childrenActions add:  anAction
]

{ #category : #accessing }
ORAction >> addToListOfChanges [
	orionModel addToListOfChanges: self
]

{ #category : #accessing }
ORAction >> childrenActions [
	^ childrenActions
]

{ #category : #accessing }
ORAction >> cost [
	^ cost
]

{ #category : #accessing }
ORAction >> cost: anObject [
	cost := anObject
]

{ #category : #accessing }
ORAction >> currentContext [
	^ self orionModel
]

{ #category : #accessing }
ORAction >> entity [
	^ entity
]

{ #category : #accessing }
ORAction >> entity: anObject [
	entity := anObject
]

{ #category : #'initialize-release' }
ORAction >> initialize [
	cost := 1.
	parentAction := nil.
	childrenActions := OrderedCollection new.
]

{ #category : #accessing }
ORAction >> isManual [
	^ parentAction isNil
]

{ #category : #'method execution' }
ORAction >> manualRun [

	self parentAction: nil.
	self run.
	^self
]

{ #category : #accessing }
ORAction >> orionModel [
	^ orionModel
]

{ #category : #accessing }
ORAction >> orionModel: anObject [
	orionModel := anObject.
	"anObject changes add: self"
]

{ #category : #accessing }
ORAction >> parentAction [
	^ parentAction
]

{ #category : #accessing }
ORAction >> parentAction: anAction [
	parentAction ifNotNil: [parentAction removeChildAction: self].
	parentAction := anAction.
	anAction ifNotNil: [anAction addChildAction: self].
]

{ #category : #printing }
ORAction >> printOn: stream [ 

		stream nextPutAll: self class name , '(' , entity class name , ') ' , entity mooseName
]

{ #category : #printing }
ORAction >> printWorkspace [

	^ '>', self class description, '>> ', self entity mooseName
]

{ #category : #accessing }
ORAction >> removeChildAction: anAction [
	childrenActions remove: anAction ifAbsent: [nil].
]

{ #category : #'method execution' }
ORAction >> run [
	self runOR: self orionModel.
]

{ #category : #'method execution' }
ORAction >> runOR: aVersion [

	aVersion system announcer announce: ORAnnouncement.
	entity := entity versionIn: aVersion.
	^self
]

{ #category : #'method execution' }
ORAction >> runOnNewVersionFrom: previousVersion [

	| newModel |
	newModel := previousVersion createNewChildVersion.
	self orionModel: newModel.
	^self manualRun.
]
