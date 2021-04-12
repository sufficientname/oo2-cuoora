Class {
	#name : #SignUpComponent,
	#superclass : #CredentialsInputComponent,
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
SignUpComponent >> goToSignIn [
	self answer: nil
]

{ #category : #rendering }
SignUpComponent >> renderAlternativeOn: aCanvas [
	aCanvas paragraph
		with: [ aCanvas text: 'Have an account? '.
			aCanvas
				anchor callback: [ self goToSignIn ];
				with: 'Sign In' ]
]

{ #category : #rendering }
SignUpComponent >> renderSubmitButtonOn: aCanvas [
	aCanvas submitButton
		class: 'column';
		callback: [ self signUp ];
		with: 'Sign Up'
]

{ #category : #callbacks }
SignUpComponent >> signUp [
	| user |
	user := CuOOra soleInstance
		createUserWithUsername: username
		andPassword: password.
	username := ''.
	password := ''.
	user
		ifNil:
			[ errorText := 'The username is already in use' ]
		ifNotNil: [ errorText := ''.
			self answer: user ]
]
