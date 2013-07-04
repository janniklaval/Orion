Class {
	#name : #ORModelChanged,
	#superclass : #ORAnnouncement,
	#category : #'OrionCore-announcement'
}

{ #category : #'as yet unclassified' }
ORModelChanged class >> initializeCache: aModel [

	aModel privateState flushProperties
]
