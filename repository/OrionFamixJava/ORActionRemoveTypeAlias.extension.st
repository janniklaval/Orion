Extension { #name : #ORActionRemoveTypeAlias }

{ #category : #'*OrionFamixJava' }
ORActionRemoveTypeAlias >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
