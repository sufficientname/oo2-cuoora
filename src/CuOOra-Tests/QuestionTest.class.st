Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
QuestionTest >> testAddAnswer [
	| question answer |
	question := Question title: 'question' text: 'is this a question?'.
	answer := Answer text: 'yes'.
	question addAnswer: answer.
	self assert: (question hasAnswer: answer).
	self assert: answer question equals: question
]

{ #category : #tests }
QuestionTest >> testAddEntryTo [
	| user question |
	user := User username: 'user' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	question addEntryTo: user.
	self assert: (user hasQuestion: question)
]

{ #category : #tests }
QuestionTest >> testAddTopic [
	| question topic |
	question := Question title: 'question' text: 'is this a question?'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	question addTopic: topic.
	self assert: (question hasTopic: topic).
	self assert: (topic hasQuestion: question)
]

{ #category : #tests }
QuestionTest >> testAddTopics [
	| question topic1 topic2 topics |
	question := Question new.
	topic1 := Topic name: 'Test topic 1' description: 'A test topic'.
	topic2 := Topic
		name: 'Test topic 2'
		description: 'Another test topic'.
	topics := Set with: topic1 with: topic2.
	question addTopics: topics.
	topics do: [ :topic | self assert: (question hasTopic: topic) ]
]

{ #category : #tests }
QuestionTest >> testAnswers [
	| question answer |
	question := Question title: 'question' text: 'is this a question?'.
	answer := Answer text: 'yes'.
	self assert: question answers isEmpty.
	question addAnswer: answer.
	self assert: (question answers includes: answer)
]

{ #category : #tests }
QuestionTest >> testDelete [
	| user1 user2 topic1 topic2 topics question answer1 answer2 |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	topic1 := Topic name: 'topic 1' description: 'A topic'.
	topic2 := Topic name: 'topic 2' description: 'Another topic'.
	topics := OrderedCollection with: topic1 with: topic2.
	question := user1 postQuestion: 'is this a question?' titled: 'question' relatedTo: topics.
	answer1 := user1  postAnswer: 'yes' to: question.
	answer2 := user2 postAnswer: 'no' to: question.
	question delete.
	self assert: (user1 hasQuestion: question) not.
	self assert: (user1 hasAnswer: answer1) not.
	self assert: (user2 hasAnswer: answer2) not.
	self assert: (topic1 hasQuestion: question) not.
	self assert: (topic2 hasQuestion: question) not
]

{ #category : #tests }
QuestionTest >> testHasAnswer [
	| question answer |
	question := Question title: 'question' text: 'is this a question?'.
	answer := Answer text: 'yes'.
	self assert: (question hasAnswer: answer) not.
	question addAnswer: answer.
	self assert: (question hasAnswer: answer)
]

{ #category : #tests }
QuestionTest >> testHasTopic [
	| question topic |
	question := Question title: 'question' text: 'is this a question?'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	self assert: (question hasTopic: topic) not.
	question addTopic: topic.
	self assert: (question hasTopic: topic)
]

{ #category : #tests }
QuestionTest >> testInitialize [
	| question |
	question := Question new.
	self assert: question topics isEmpty.
	self assert: question answers isEmpty
]

{ #category : #tests }
QuestionTest >> testRemoveAnswer [
	| question answer |
	question := Question title: 'question' text: 'is this a question?'.
	answer := Answer text: 'yes'.
	question addAnswer: answer.
	question removeAnswer: answer.
	self assert: (question hasAnswer: answer) not
]

{ #category : #tests }
QuestionTest >> testRemoveEntryFrom [
	| user question |
	user := User username: 'user' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	question addEntryTo: user.
	question removeEntryFrom: user.
	self assert: (user hasQuestion: question) not
]

{ #category : #tests }
QuestionTest >> testRemoveTopic [
	| question topic |
	question := Question title: 'question' text: 'is this a question?'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	question addTopic: topic.
	question removeTopic: topic.
	self assert: (question topics includes: topic) not.
	self assert: (topic questions includes: question) not
]

{ #category : #tests }
QuestionTest >> testTitle [
	| question title |
	title := 'this is a title'.
	question := Question new.
	question title: title.
	self assert: question title equals: title
]

{ #category : #tests }
QuestionTest >> testTitleText [
	| question title text |
	title := 'this is a title'.
	text := 'this is a text'.
	question := Question title: title text: text. 
	self assert: question title equals: title.
	self assert: question text equals: text
]

{ #category : #tests }
QuestionTest >> testTopics [
	| question topic |
	question := Question new.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	self assert: question topics isEmpty.
	question addTopic: topic.
	self assert: (question topics includes: topic)
]

{ #category : #tests }
QuestionTest >> testUser [
	| user question |
	user := User username: 'user' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	question user: user.
	self assert: question user equals: user.
	self assert: (user hasQuestion: question)
]
