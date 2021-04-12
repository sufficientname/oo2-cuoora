Class {
	#name : #TopicTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
TopicTest >> testAddQuestion [
	| question topic |
	question := Question title: 'question' text: 'is this a question?'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	topic addQuestion: question.
	self assert: (topic hasQuestion: question).
	self assert: (question hasTopic: topic)
]

{ #category : #tests }
TopicTest >> testDescription [
	| topic description |
	topic := Topic new.
	description := 'topic description'.
	topic description: description.
	self assert: topic description equals: description
]

{ #category : #tests }
TopicTest >> testHasQuestion [
	| topic question |
	topic := Topic name: 'Test topic' description: 'A test topic'.
	question := Question title: 'question' text: 'is this a question?'.
	self assert: (topic hasQuestion: question) not.
	topic addQuestion: question.
	self assert: (topic hasQuestion: question)
]

{ #category : #tests }
TopicTest >> testInitialize [
	| topic |
	topic := Topic new.
	self assert: topic questions isEmpty
]

{ #category : #tests }
TopicTest >> testName [
	| topic name |
	topic := Topic new.
	name := 'topic'.
	topic name: name.
	self assert: topic name equals: name
]

{ #category : #tests }
TopicTest >> testNameDescription [
	| topic name description |
	name := 'Test topic'.
	description := 'A test topic'.
	topic := Topic name: name description: description.
	self assert: topic name equals: name.
	self assert: topic description equals: description
]

{ #category : #tests }
TopicTest >> testQuestions [
	| topic question |
	topic := Topic name: 'Test topic' description: 'A test topic'.
	question := Question title: 'question' text: 'is this a question?'.
	self assert: topic questions isEmpty.
	topic addQuestion: question.
	self assert: (topic questions includes: question)
]

{ #category : #tests }
TopicTest >> testRemoveQuestion [
	| topic question |
	topic := Topic name: 'Test topic' description: 'A test topic'.
	question := Question title: 'question' text: 'is this a question?'.
	topic addQuestion: question.
	topic removeQuestion: question.
	self assert: (topic questions includes: question) not.
	self assert: (question topics includes: topic) not.
]
