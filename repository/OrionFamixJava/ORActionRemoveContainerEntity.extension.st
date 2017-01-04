Extension { #name : #ORActionRemoveContainerEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveContainerEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
