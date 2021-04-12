Class {
	#name : #SignInComponent,
	#superclass : #CredentialsInputComponent,
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
SignInComponent >> goToSignUp [
	| user |
	user := self call: SignUpComponent new.
	user ifNotNil: [ self continueAs: user ]
]

{ #category : #rendering }
SignInComponent >> renderAlternativeOn: aCanvas [
	aCanvas paragraph
		with: [ aCanvas text: 'Don''t have an account? '.
			aCanvas
				anchor callback: [ self goToSignUp ];
				with: 'Sign Up' ]
]

{ #category : #rendering }
SignInComponent >> renderSubmitButtonOn: aCanvas [
	aCanvas submitButton
		class: 'column';
		callback: [ self signIn ];
		with: 'Sign In'
]

{ #category : #callbacks }
SignInComponent >> signIn [
	| user |
	user := CuOOra soleInstance getUserWithUsername: username andPassword: password.
	username := ''.
	password := ''.
	user
		ifNil:
			[ errorText := 'This combination of user and password does not exist' ]
		ifNotNil: [ errorText := ''. self continueAs: user ]
]
