Extension { #name : #ORActionRemoveMethod }

{ #category : #'*OrionFamixJava' }
ORActionRemoveMethod >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity caughtExceptions do: [:each | each deleteInAction: self ].
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].
	entity thrownExceptions do: [:each | each deleteInAction: self ].
	entity declaredExceptions do: [:each | each deleteInAction: self ].

]
