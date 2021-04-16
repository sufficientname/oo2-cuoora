Class {
	#name : #UserProfileComponent,
	#superclass : #CuOOraMainComponent,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
UserProfileComponent >> follow [
	self session user follow: user
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading with: user username.
	self renderFollowButtonOn: aCanvas.
	aCanvas label with: 'score: ' , user score printString.
	aCanvas label with: 'questions: ' , user questions size printString.
	aCanvas label with: 'answers: ' , user answers size printString.
	self renderFollowingUsersOn: aCanvas.
	self renderFollowingTopicsOn: aCanvas.
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
			buttonCallback := [ self unfollow ] ]
		ifFalse: [ buttonText := 'Follow'.
			buttonClass := 'button'.
			buttonCallback := [ self follow ] ].
	aCanvas anchor class: buttonClass; callback: buttonCallback; with: buttonText
]

{ #category : #rendering }
UserProfileComponent >> renderFollowingTopicsOn: aCanvas [
	aCanvas div
		with: [ aCanvas label with: 'topics of interest: '.
			user topicsOfInterest
				do: [ :topicOfInterest | 
					aCanvas anchor
						class: 'topic';
						callback: [ parent goToTopic: topicOfInterest ];
						with: topicOfInterest name.
					aCanvas text: ' ' ] ]
]

{ #category : #rendering }
UserProfileComponent >> renderFollowingUsersOn: aCanvas [
	aCanvas div
		with: [ aCanvas label with: 'following: '.
			user following
				do: [ :followingUser | 
					aCanvas anchor
						callback: [ parent goToUserProfile: followingUser ];
						with: followingUser username.
					aCanvas text: ' ' ] ]
]

{ #category : #callbacks }
UserProfileComponent >> unfollow [
	self session user unfollow: user
]

{ #category : #accessing }
UserProfileComponent >> user [
	^ user
]

{ #category : #accessing }
UserProfileComponent >> user: aUser [
	user := aUser
]
