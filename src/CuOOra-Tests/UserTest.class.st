Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
UserTest >> testAddAnswer [
	| user1 user2 answer |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	answer := Answer new text: 'this this an answer'.
	user1 addAnswer: answer.
	self assert: (user1 hasAnswer: answer).
	self assert: answer user equals: user1.
	user2 addAnswer: answer.
	self assert: (user1 hasAnswer: answer) not.
	self assert: (user2 hasAnswer: answer).
	self assert: answer user equals: user2
]

{ #category : #tests }
UserTest >> testAddQuestion [
	| user1 user2 question |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	user1 addQuestion: question.
	self assert: (user1 hasQuestion: question).
	self assert: question user equals: user1.
	user2 addQuestion: question.
	self assert: (user1 hasQuestion: question) not.
	self assert: (user2 hasQuestion: question).
	self assert: question user equals: user2
]

{ #category : #tests }
UserTest >> testAnswers [
	| user answer |
	user := User username: 'user' password: 'pass'.
	answer := Answer new text: 'this this an answer'.
	self assert: user answers isEmpty.
	user addAnswer: answer.
	self assert: (user hasAnswer: answer)
]

{ #category : #tests }
UserTest >> testBeInterestedIn [
	| user topic |
	user := User username: 'user' password: 'pass'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	user beInterestedIn: topic.
	self assert: (user isInterestedIn: topic)
]

{ #category : #tests }
UserTest >> testBeNotInterestedIn [
	| user topic |
	user := User username: 'user' password: 'pass'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	user beInterestedIn: topic.
	user beNotInterestedIn: topic.
	self assert: (user isInterestedIn: topic) not
]

{ #category : #tests }
UserTest >> testCreatedAt [
	| user createdAt |
	createdAt := DateAndTime now.
	user := User new.
	user createdAt: createdAt.
	self assert: user createdAt equals: createdAt.
]

{ #category : #tests }
UserTest >> testFollow [
	| user1 user2 |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	user1 follow: user1.
	self assert: (user1 isFollowing: user1) not.
	user1 follow: user2.
	self assert: (user1 isFollowing: user2)
]

{ #category : #tests }
UserTest >> testFollowing [
	| user1 user2 |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	self assert: user1 following isEmpty.
	user1 follow: user2.
	self assert: (user1 following includes: user2)
]

{ #category : #tests }
UserTest >> testHasAnswer [
	| user answer |
	user := User username: 'user' password: 'pass'.
	answer := Answer new text: 'this this an answer'.
	self assert: (user hasAnswer: answer) not.
	user addAnswer: answer.
	self assert: (user hasAnswer: answer)
]

{ #category : #tests }
UserTest >> testHasQuestion [
	| user question |
	user := User username: 'user' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	self assert: (user hasQuestion: question) not.
	user addQuestion: question.
	self assert: (user hasQuestion: question)
]

{ #category : #tests }
UserTest >> testInitialize [
	| user |
	user := User new.
	self assert: user following isEmpty.
	self assert: user topicsOfInterest isEmpty.
	self assert: user questions isEmpty.
	self assert: user answers isEmpty.
]

{ #category : #tests }
UserTest >> testIsFollowing [
	| user1 user2 |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	self assert: (user1 following includes: user2) not.
	user1 follow: user2.
	self assert: (user1 following includes: user2)
]

{ #category : #tests }
UserTest >> testIsInterestedIn [
	| user topic |
	user := User username: 'user' password: 'pass'.
	topic := Topic name: 'Test topic' description: 'A test topic'. 
	self assert: (user topicsOfInterest includes: topic) not.
	user beInterestedIn: topic.
	self assert: (user topicsOfInterest includes: topic)
]

{ #category : #tests }
UserTest >> testPassword [
	| user password |
	password := 'pass'.
	user := User new.
	user password: password.
	self assert: user password equals: password
]

{ #category : #tests }
UserTest >> testPostAnswerTo [
	| user1 user2 topic question answer text |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	question := user2
		postQuestion: 'is this a question'
		titled: 'question'
		relatedTo: (Set with: topic).
	text := 'yes'.
	answer := user1 postAnswer: text to: question.
	"assert user"
	self assert: answer user equals: user1.
	self assert: (user1 hasAnswer: answer).
	"assert question"
	self assert: answer question equals: question.
	self assert: (question hasAnswer: answer).
	"assert text"
	self assert: answer text equals: text
]

{ #category : #tests }
UserTest >> testPostQuestionTitledRelatedTo [
	| user topic1 topic2 topics question title description |
	user := User username: 'user' password: 'pass'.
	topic1 := Topic name: 'Test topic 1' description: 'A test topic'.
	topic2 := Topic name: 'Test topic 2' description: 'Another test topic'.
	title := 'question'.
	description := 'is this a question?'.
	topics := OrderedCollection with: topic1 with: topic2.
	question := user postQuestion: description titled: title relatedTo: topics.
	"assert user"
	self assert: question user equals: user.
	self assert: (user hasQuestion: question).
	"assert topic"
	self assert: question topics equals: topics.
	topics do: [ :topic | self assert: (topic hasQuestion: question) ].
	"assert title and description"
	self assert: question title equals: title.
	self assert: question text equals: description
	
	
	
	
]

{ #category : #tests }
UserTest >> testQuestions [
	| user question |
	user := User username: 'user' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	self assert: user questions isEmpty.
	user addQuestion: question.
	self assert: (user questions includes: question)
]

{ #category : #tests }
UserTest >> testRelevantQuestions [
	| user1 user2 user3 topic1 topic2 question1 question2 question3 question4 relevantQuestions |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	user3 := User username: 'user3' password: 'pass'.
	topic1 := Topic name: 'topic1' description: 'topic1'.
	topic2 := Topic name: 'topic2' description: 'topic2'.
	user1 follow: user2.
	user1 beInterestedIn: topic2.
	"posteada por el usuario que sigue en el topico que no sigue. score=0"
	question1 := user2
		postQuestion: 'question1'
		titled: 'question1'
		relatedTo: (Set with: topic1).
	self assert: question1 score equals: 0.
	"posteada por el usuario que sigue en el topico que sigue. score=-1"
	question2 := user2
		postQuestion: 'question2'
		titled: 'question2'
		relatedTo: (Set with: topic2).
	question2 registerDislikeBy: user2.
	self assert: question2 score equals: -1.
	"posteada por el usuario que no sigue en el topico que sigue. score=1"
	question3 := user3
		postQuestion: 'question3'
		titled: 'question3'
		relatedTo: (Set with: topic2).
	question3 registerLikeBy: user3.
	self assert: question3 score equals: 1.
	"posteada por el usuario que no sigue en el topic que no sigue"
	question4 := user3
		postQuestion: 'question4'
		titled: 'question4'
		relatedTo: (Set with: topic1).
	"relevant questions"
	relevantQuestions := user1 relevantQuestions.
	self assert: relevantQuestions size equals: 3.
	self assert: (relevantQuestions includes: question4) not.
	self assert: relevantQuestions first equals: question3.
	self assert: relevantQuestions second equals: question1.
	self assert: relevantQuestions last equals: question2
]

{ #category : #tests }
UserTest >> testRemoveAnswer [
	| user answer |
	user := User username: 'user' password: 'pass'.
	answer := Answer new text: 'this this an answer'.
	user addAnswer: answer.
	user removeAnswer: answer.
	self assert: (user hasAnswer: answer) not
]

{ #category : #tests }
UserTest >> testRemoveQuestion [
	| user question |
	user := User username: 'user' password: 'pass'.
	question := Question title: 'question' text: 'is this a question?'.
	user addQuestion: question.
	user removeQuestion: question.
	self assert: (user hasQuestion: question) not
]

{ #category : #tests }
UserTest >> testScore [
	| user1 user2 topic question1 question2 answer1 answer2 answer3 |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	"pregunta que hizo 20pts"
	question1 := user1
		postQuestion: 'question1'
		titled: 'question1'
		relatedTo: (Set with: topic).
	"pregunta con un dislike score=-1"
	question1 registerDislikeBy: user2.
	"respuesta a su misma pregunta 0pts"
	answer1 := user1 postAnswer: 'answer1' to: question1.
	"respuesta con un like score=1"
	answer1 registerLikeBy: user1.
	"pregunta de otro usuario"
	question2 := user2
		postQuestion: 'question2'
		titled: 'question2'
		relatedTo: (Set with: topic).
	answer2 := user2 postAnswer: 'answer2' to: question2.
	answer2 registerLikeBy: user1.
	"respuesta a pregunta de otro usuario 50pts"
	answer3 := user1 postAnswer: 'answer3' to: question2.
	"respuesta con 2 likes score=2"
	answer3 registerLikeBy: user1.
	answer3 registerLikeBy: user2.
	self assert: user1 score equals: 20 + -1 + 1 + 50 + 2
]

{ #category : #tests }
UserTest >> testTopicsOfInterest [
	| user topic |
	user := User username: 'user' password: 'pass'.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	self assert: user topicsOfInterest isEmpty.
	user beInterestedIn: topic.
	self assert: (user topicsOfInterest includes: topic)
]

{ #category : #tests }
UserTest >> testUnfollow [
	| user1 user2 |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	user1 follow: user2.
	user1 unfollow: user2.
	self assert: (user1 isFollowing: user2) not
]

{ #category : #tests }
UserTest >> testUsername [
	| user username |
	username := 'username'.
	user := User new.
	user username: username.
	self assert: user username equals: username
]

{ #category : #tests }
UserTest >> testUsernamePassword [
	| user username password createdAt |
	username := 'user'.
	password := 'pass'.
	createdAt := DateAndTime now.
	user := User username: username password: password.
	self assert: user username equals: username.
	self assert: user password equals: password.
	self assert: user createdAt asSeconds closeTo: createdAt asSeconds 
]
