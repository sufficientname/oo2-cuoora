Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#instVars : [
		'topicCallback',
		'questionCallback'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
QuestionComponent >> goToQuestion [
	^ questionCallback ifNotNil: [ questionCallback value: post ]
]

{ #category : #callbacks }
QuestionComponent >> goToTopic: aTopic [
	^ topicCallback ifNotNil: [ topicCallback value: aTopic ]
]

{ #category : #accessing }
QuestionComponent >> questionCallback: aBlock [
	questionCallback := aBlock
]

{ #category : #rendering }
QuestionComponent >> renderAnswerCountOn: aCanvas [
	aCanvas span with: post answers size printString, ' answers'
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
	aCanvas div
		class: 'question';
		with: [ self renderUserOn: aCanvas.
			self renderDeleteButtonOn: aCanvas.
			aCanvas break.
			self renderReactionButtonsOn: aCanvas.
			self renderTitleOn: aCanvas.
			self renderTextOn: aCanvas.
			self renderTopicsOn: aCanvas.
			aCanvas break.
			self renderAnswerCountOn: aCanvas ]
]

{ #category : #rendering }
QuestionComponent >> renderTitleOn: aCanvas [
	aCanvas heading level3
		with: [ aCanvas anchor
				callback: [ self goToQuestion ];
				with: post title ].
]

{ #category : #rendering }
QuestionComponent >> renderTopicsOn: aCanvas [
	post topics
		do: [ :topic | 
			aCanvas anchor class: 'topic';
				callback: [ self goToTopic: topic ];
				with: topic name ].
]

{ #category : #accessing }
QuestionComponent >> topicCallback: aBlock [
	topicCallback := aBlock
]
