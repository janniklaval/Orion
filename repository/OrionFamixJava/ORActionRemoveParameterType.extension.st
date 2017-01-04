Extension { #name : #ORActionRemoveParameterType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
