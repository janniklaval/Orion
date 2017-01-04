Extension { #name : #ORActionRemoveContainerEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveContainerEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
