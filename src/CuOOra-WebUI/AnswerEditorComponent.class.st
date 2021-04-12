Class {
	#name : #AnswerEditorComponent,
	#superclass : #PostEditorComponent,
	#instVars : [
		'question'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
AnswerEditorComponent >> formTitle [
	^ 'Post an answer'
]

{ #category : #callbacks }
AnswerEditorComponent >> post [
	| answer |
	text isEmpty
		ifTrue: [ errorText := 'Missing required fields'.
			^ self ].
	errorText := nil.
	answer := self session user postAnswer: text to: question.
	self answer: answer
]

{ #category : #accessing }
AnswerEditorComponent >> question [
	^ question
]

{ #category : #accessing }
AnswerEditorComponent >> question: aQuestion [
	question := aQuestion
]

{ #category : #rendering }
AnswerEditorComponent >> renderFormFieldsOn: aCanvas [
	aCanvas label: 'text'.
	aCanvas textArea on: #text of: self
]
