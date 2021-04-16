Class {
	#name : #HomeComponent,
	#superclass : #CuOOraMainComponent,
	#instVars : [
		'questionEditorComponent'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
HomeComponent >> goToQuestionEditor [
	| question |
	questionEditorComponent := QuestionEditorComponent new.
	question := self call: questionEditorComponent.
	parent goToQuestion: question
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas anchor
		class: 'button';
		callback: [ self goToQuestionEditor ];
		with: 'Post question'.
	aCanvas heading with: 'Relevant questions:'.
	self renderQuestions: self session user relevantQuestions on: aCanvas
]
