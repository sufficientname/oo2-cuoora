Class {
	#name : #CredentialsInputComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password',
		'errorText'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #private }
CredentialsInputComponent >> continueAs: aUser [
	self session signIn: aUser.
	self answer
]

{ #category : #accessing }
CredentialsInputComponent >> password [
	^ password
]

{ #category : #accessing }
CredentialsInputComponent >> password: aString [
	password := aString
]

{ #category : #rendering }
CredentialsInputComponent >> renderAlternativeOn: aCanvas [
	self subclassResponsibility
]

{ #category : #rendering }
CredentialsInputComponent >> renderContentOn: aCanvas [
	aCanvas div
		class: 'row';
		with: [ aCanvas div
				class: 'column column-50 column-offset-25';
				with: [ self renderFormErrorOn: aCanvas.
					aCanvas form
						with: [ aCanvas label: 'username'.
							aCanvas textInput on: #username of: self.
							aCanvas break.
							aCanvas label: 'password'.
							aCanvas passwordInput on: #password of: self.
							aCanvas break.
							aCanvas break.
							self renderSubmitButtonOn: aCanvas ].
					aCanvas horizontalRule.
					self renderAlternativeOn: aCanvas ] ]
]

{ #category : #rendering }
CredentialsInputComponent >> renderFormErrorOn: aCanvas [
	(errorText) ifNotNil: [ aCanvas label class: 'error-text'; with: errorText ]
]

{ #category : #rendering }
CredentialsInputComponent >> renderSubmitButtonOn: aCanvas [
	self subclassResponsibility
]

{ #category : #accessing }
CredentialsInputComponent >> username [
	^ username
]

{ #category : #accessing }
CredentialsInputComponent >> username: aString [
	username := aString
]
