Class {
	#name : #ORAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'entity'
	],
	#category : #'OrionCore-announcement'
}

{ #category : #accessing }
ORAnnouncement >> entity [
	^ entity
]

{ #category : #accessing }
ORAnnouncement >> entity: anObject [
	entity := anObject
]
