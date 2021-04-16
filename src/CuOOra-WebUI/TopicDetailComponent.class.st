Class {
	#name : #TopicDetailComponent,
	#superclass : #CuOOraMainComponent,
	#instVars : [
		'topic'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
TopicDetailComponent >> follow [
	self session user beInterestedIn: topic
]

{ #category : #rendering }
TopicDetailComponent >> renderContentOn: aCanvas [
	aCanvas heading with: topic name.
	self renderFollowButtonOn: aCanvas.
	aCanvas label with: topic description.
	aCanvas horizontalRule.
	aCanvas heading level3 with: 'Questions:'.
	aCanvas div
		class: 'container';
		with: [ self renderQuestions: topic questions on: aCanvas ]
]

{ #category : #rendering }
TopicDetailComponent >> renderFollowButtonOn: aCanvas [
	| buttonText buttonClass buttonCallback |
	(self session user isInterestedIn: topic)
		ifTrue: [ buttonText := 'Unfollow'.
			buttonClass := 'button button-outline'.
			buttonCallback := [ self unfollow ] ]
		ifFalse: [ buttonText := 'Follow'.
			buttonClass := 'button'.
			buttonCallback := [ self follow ] ].
	aCanvas anchor
		class: buttonClass;
		callback: buttonCallback;
		with: buttonText
]

{ #category : #accessing }
TopicDetailComponent >> topic [
	^ topic
]

{ #category : #accessing }
TopicDetailComponent >> topic: aTopic [
	topic := aTopic
]

{ #category : #callbacks }
TopicDetailComponent >> unfollow [
	self session user beNotInterestedIn: topic
]
