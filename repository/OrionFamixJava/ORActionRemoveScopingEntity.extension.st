Extension { #name : #ORActionRemoveScopingEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveScopingEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
