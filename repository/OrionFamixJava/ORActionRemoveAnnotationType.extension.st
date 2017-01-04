Extension { #name : #ORActionRemoveAnnotationType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveAnnotationType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
