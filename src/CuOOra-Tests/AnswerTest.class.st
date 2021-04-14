Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
AnswerTest >> testAddPostTo [
	| user answer |
	user := User username: 'user' password: 'pass'.
	answer := Answer text: 'this is an answer'.
	answer addPostTo: user.
	self assert: (user hasAnswer: answer)
]

{ #category : #tests }
AnswerTest >> testDelete [
	| user question answer |
	user := User username: 'user1' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	answer := user postAnswer: 'yes' to: question.
	answer delete.
	self assert: (question hasAnswer: answer) not.
	self assert: (user hasAnswer: answer) not
]

{ #category : #tests }
AnswerTest >> testQuestion [
	| answer question |
	question := Question title: 'question' text: 'is this a question'.
	answer := Answer text: 'yes'.
	answer question: question.
	self assert: answer question equals: question.
	self assert: (question hasAnswer: answer)
]

{ #category : #tests }
AnswerTest >> testRemovePostFrom [
	| user answer |
	user := User username: 'user' password: 'pass'.
	answer := Answer text: 'this is an answer'.
	answer addPostTo: user.
	answer removePostFrom: user.
	self assert: (user hasAnswer: answer) not
]

{ #category : #tests }
AnswerTest >> testText [
	| answer text |
	text := 'this is a text'.
	answer := Answer text: text. 
	self assert: answer text equals: text
]

{ #category : #tests }
AnswerTest >> testUser [
	| user answer |
	user := User username: 'user' password: 'pass'.
	answer := Answer text: 'this an answer'.
	answer user: user.
	self assert: answer user equals: user.
	self assert: (user hasAnswer: answer)
]
