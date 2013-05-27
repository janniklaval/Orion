Class {
	#name : #ASModelChanged,
	#superclass : #ASAnnouncement,
	#category : #'OrionCore-announcement'
}

{ #category : #'as yet unclassified' }
ASModelChanged class >> initializeCache: aModel [

	aModel privateState flushProperties
]
