Class {
	#name : #QuestionDetailComponent,
	#superclass : #CuOOraComponent,
	#instVars : [
		'question'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
QuestionDetailComponent >> question [
	^ question
]

{ #category : #accessing }
QuestionDetailComponent >> question: aQuestion [
	question := aQuestion
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: aCanvas [
	aCanvas div
		with: [ self renderQuestion: question on: aCanvas.
			aCanvas horizontalRule.
			aCanvas div
				class: 'container';
				with: [ self renderAnswers: question answers on: aCanvas ].
			aCanvas horizontalRule.
			aCanvas anchor
				class: 'button';
				callback: [ self show: (AnswerEditorComponent new question: question) ];
				with: 'Post answer' ]
]
