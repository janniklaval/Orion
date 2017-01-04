Extension { #name : #ORActionRemoveClass }

{ #category : #'*OrionFamixJava' }
ORActionRemoveClass >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
