Extension { #name : #ORActionRemoveScopingEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveScopingEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
