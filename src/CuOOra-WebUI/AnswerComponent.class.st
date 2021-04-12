Class {
	#name : #AnswerComponent,
	#superclass : #PostComponent,
	#category : #'CuOOra-WebUI'
}

{ #category : #rendering }
AnswerComponent >> renderContentOn: aCanvas [
	aCanvas div
		class: 'answer';
		with: [ self renderUserOn: aCanvas.
			self renderDeleteButtonOn: aCanvas.
			aCanvas break.
			self renderReactionButtonsOn: aCanvas.
			self renderTextOn: aCanvas ]
]
