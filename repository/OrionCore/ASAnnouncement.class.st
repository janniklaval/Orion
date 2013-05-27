Class {
	#name : #ASAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'entity'
	],
	#category : #'OrionCore-announcement'
}

{ #category : #accessing }
ASAnnouncement >> entity [
	^ entity
]

{ #category : #accessing }
ASAnnouncement >> entity: anObject [
	entity := anObject
]
