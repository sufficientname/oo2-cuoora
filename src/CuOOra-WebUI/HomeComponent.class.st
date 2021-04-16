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
	questionEditorComponent := QuestionEditorComponent new.
	self call: questionEditorComponent
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
