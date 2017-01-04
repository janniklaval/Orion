Extension { #name : #ORActionRemoveFunction }

{ #category : #'*OrionFamixJava' }
ORActionRemoveFunction >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
