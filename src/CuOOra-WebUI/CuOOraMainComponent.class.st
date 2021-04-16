Class {
	#name : #CuOOraMainComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
CuOOraMainComponent class >> parent: aCuOOraTask [
	^ self new
		parent: aCuOOraTask;
		yourself
]

{ #category : #accessing }
CuOOraMainComponent >> parent [
	^ parent
]

{ #category : #accessing }
CuOOraMainComponent >> parent: aWAComponent [
	parent := aWAComponent
]

{ #category : #rendering }
CuOOraMainComponent >> renderQuestion: aQuestion on: aCanvas [
	aCanvas
		render:
			((QuestionComponent with: aQuestion)
				questionCallback: [ :question | parent goToQuestion: question ];
				userCallback: [ :user | parent goToUserProfile: user ];
				topicCallback: [ :topic | parent goToTopic: topic ])
]

{ #category : #rendering }
CuOOraMainComponent >> renderQuestions: aQuestionCollection on: aCanvas [
	aQuestionCollection
		do: [ :question | self renderQuestion: question on: aCanvas. aCanvas horizontalRule ]
]
