Class {
	#name : #QuestionDetailComponent,
	#superclass : #CuOOraMainComponent,
	#instVars : [
		'question',
		'answerEditorComponent'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
QuestionDetailComponent >> goToAnswerEditor [
	answerEditorComponent := AnswerEditorComponent new question: question.
	self call: answerEditorComponent
]

{ #category : #accessing }
QuestionDetailComponent >> question [
	^ question
]

{ #category : #accessing }
QuestionDetailComponent >> question: aQuestion [
	question := aQuestion
]

{ #category : #rendering }
QuestionDetailComponent >> renderAnswer: anAnswer on: aCanvas [
	aCanvas
		render:
			((AnswerComponent with: anAnswer)
				userCallback: [ :user | parent goToUserProfile: user ])
]

{ #category : #rendering }
QuestionDetailComponent >> renderAnswersOn: aCanvas [
	question answers do: [ :answer | self renderAnswer: answer on: aCanvas. aCanvas horizontalRule ]
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: aCanvas [
	aCanvas div
		with: [ self renderQuestion: question on: aCanvas.
			aCanvas horizontalRule.
			aCanvas div
				class: 'container';
				with: [ self renderAnswersOn: aCanvas ].
			aCanvas horizontalRule.
			aCanvas anchor
				class: 'button';
				callback: [ self goToAnswerEditor ];
				with: 'Post answer' ]
]
