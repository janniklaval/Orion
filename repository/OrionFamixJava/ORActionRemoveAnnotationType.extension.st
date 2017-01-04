Extension { #name : #ORActionRemoveAnnotationType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveAnnotationType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
