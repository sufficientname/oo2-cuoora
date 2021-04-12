Class {
	#name : #QuestionEditorComponent,
	#superclass : #PostEditorComponent,
	#instVars : [
		'title',
		'topicNames'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
QuestionEditorComponent >> formTitle [
	^ 'Post a question'
]

{ #category : #parsing }
QuestionEditorComponent >> parseTopics [
	^ (topicNames splitOn: ',')
		collect:
			[ :topicName | CuOOra soleInstance getOrCreateTopicWithName: topicName trim ]
]

{ #category : #callbacks }
QuestionEditorComponent >> post [
	| question topics |
	title isEmpty | text isEmpty | topicNames isEmpty
		ifTrue: [ errorText := 'Missing required fields'.
			^ self ].
	errorText := nil.
	topics := self parseTopics.
	question := self session user postQuestion: text titled: title relatedTo: topics.
	self answer: question
]

{ #category : #rendering }
QuestionEditorComponent >> renderFormFieldsOn: aCanvas [
	aCanvas label: 'title'.
	aCanvas textInput on: #title of: self.
	aCanvas label: 'text'.
	aCanvas textArea on: #text of: self.
	aCanvas label: 'topics (comma separated)'.
	aCanvas textInput on: #topicNames of: self
]

{ #category : #accessing }
QuestionEditorComponent >> title [
	^ title
]

{ #category : #accessing }
QuestionEditorComponent >> title: aString [
	title := aString
]

{ #category : #accessing }
QuestionEditorComponent >> topicNames [
	^ topicNames
]

{ #category : #accessing }
QuestionEditorComponent >> topicNames: aString [
	topicNames := aString
]
