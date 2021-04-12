Class {
	#name : #HomeComponent,
	#superclass : #CuOOraComponent,
	#instVars : [
		'component'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas anchor
		class: 'button';
		callback: [ self call: QuestionEditorComponent new ];
		with: 'Post question'.
	aCanvas heading with: 'Relevant questions:'.
	self renderQuestions: self session user relevantQuestions on: aCanvas
]
