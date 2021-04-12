Class {
	#name : #CuOOraComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
CuOOraComponent class >> parent: aWAComponent [
	^ self new
		parent: aWAComponent;
		yourself
]

{ #category : #accessing }
CuOOraComponent >> parent [
	^ parent
]

{ #category : #accessing }
CuOOraComponent >> parent: aWAComponent [
	parent := aWAComponent
]

{ #category : #rendering }
CuOOraComponent >> renderAnswer: anAnswer on: aCanvas [
	aCanvas
		render:
			((AnswerComponent with: anAnswer)
				userCallback: [ :user | parent goToUserProfile: user ])
]

{ #category : #rendering }
CuOOraComponent >> renderAnswers: anAnswerCollection on: aCanvas [
	anAnswerCollection do: [ :answer | self renderAnswer: answer on: aCanvas ]
]

{ #category : #rendering }
CuOOraComponent >> renderQuestion: aQuestion on: aCanvas [
	aCanvas
		render:
			((QuestionComponent with: aQuestion)
				questionCallback: [ :question | parent goToQuestion: question ];
				userCallback: [ :user | parent goToUserProfile: user ];
				topicCallback: [ :topic | parent goToTopic: topic ])
]

{ #category : #rendering }
CuOOraComponent >> renderQuestions: aQuestionCollection on: aCanvas [
	aQuestionCollection
		do: [ :question | self renderQuestion: question on: aCanvas ]
]
