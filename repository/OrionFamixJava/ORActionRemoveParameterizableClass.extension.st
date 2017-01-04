Extension { #name : #ORActionRemoveParameterizableClass }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterizableClass >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
