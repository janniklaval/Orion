Extension { #name : #TClassDescription }

{ #category : #'*OrionGenerator' }
TClassDescription >> compileSilently: code classified: category notifying: requestor [
	"Compile the code and classify the resulting method in the given category, leaving no trail in the system log, nor in any change set, nor in the 'recent submissions' list. This should only be used when you know for sure that the compilation will succeed."

	^ SystemAnnouncer uniqueInstance
		suspendAllWhile: [ | methodSelector |
			methodSelector := self compile: code classified: category notifying: requestor.
			self packageOrganizer addMethod: self >> methodSelector ] 
]
