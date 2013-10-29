Extension { #name : #BlockClosure }

{ #category : #'*OrionBrowser' }
BlockClosure >> orBrowserExceptionsLauncher: anObject [
	"Launch an exception in OrionBrowser and create the alert message"		

	 self on: MessageNotUnderstood
		do: [
			 :e |  | mess | 
			e message ifNotNil:[mess := e message name] ifNil: [ mess := e messageText asString  ].
			OrionBrowserException
				signal:
					('The "' , mess , '" message is not supported by "' , anObject class name
						, '" (buffered entity) \Please check if this message exists.') withCRs ] 
]

{ #category : #'*OrionBrowser' }
BlockClosure >> orBrowserExceptionsLauncherCollection: anObject [
	"Launch an exception in OrionBrowser and create the alert message"		

	 self on: MessageNotUnderstood
		do: [
			 :e |  | mess | 
			e message ifNotNil:[mess := e message name] ifNil: [ mess := e messageText asString  ].
			OrionBrowserException
				signal:
					('The "' , mess , '" message is not supported by "' , anObject first class name
						, '" (buffered entity) \Please check if this message exists.') withCRs ] 
]

{ #category : #'*OrionBrowser' }
BlockClosure >> orBrowserExceptionsUIManager [
	"Generate an Alert when an exception is launched in the OrionBrowser"
	self
		on: Error
		do: [ :exception | UIManager default alert: exception messageText ]
]
