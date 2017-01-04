Extension { #name : #ORActionRemovePackage }

{ #category : #'*OrionFamixJava' }
ORActionRemovePackage >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
