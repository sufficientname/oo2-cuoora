Class {
	#name : #UserProfileComponent,
	#superclass : #CuOOraComponent,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
UserProfileComponent >> follow: aUser [
	self session user follow: aUser
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading with: user username.
	self renderFollowButtonOn: aCanvas.
	aCanvas label with: 'score: ' , user score printString.
	aCanvas label with: 'questions: ' , user questions size printString.
	aCanvas label with: 'answers: ' , user answers size printString.
	aCanvas horizontalRule.
	aCanvas heading level3 with: 'Questions:'.
	aCanvas div
		class: 'container';
		with: [ self renderQuestions: user questions on: aCanvas ]
]

{ #category : #rendering }
UserProfileComponent >> renderFollowButtonOn: aCanvas [
	| buttonText buttonClass buttonCallback |
	user == self session user
		ifTrue: [ ^ self ].
	(self session user isFollowing: user)
		ifTrue: [ buttonText := 'Unfollow'.
			buttonClass := 'button button-outline'.
			buttonCallback := [ self unfollow: user ] ]
		ifFalse: [ buttonText := 'Follow'.
			buttonClass := 'button'.
			buttonCallback := [ self follow: user ] ].
	aCanvas anchor class: buttonClass; callback: buttonCallback; with: buttonText
]

{ #category : #callbacks }
UserProfileComponent >> unfollow: aUser [
	self session user unfollow: aUser
]

{ #category : #accessing }
UserProfileComponent >> user [
	^ user
]

{ #category : #accessing }
UserProfileComponent >> user: aUser [
	user := aUser
]
