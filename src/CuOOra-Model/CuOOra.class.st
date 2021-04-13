Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'instance creation' }
CuOOra class >> soleInstanceClear [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstanceFill [
	| user1 user2 user3 topic1 topic2 topic3 question1 question2 question3 question4 relevantQuestions |
	user1 := User username: 'usernameusername1' password: 'pass'.
	user2 := User username: 'usernameusername2' password: 'pass'.
	user3 := User username: 'usernameusername3' password: 'pass'.
	topic1 := Topic name: 'topic1' description: 'topic1'.
	topic2 := Topic name: 'topic2' description: 'topic2'.
	topic3 := Topic name: 'topic3' description: 'topic3'.
	user1 follow: user2.
	user1 beInterestedIn: topic2.
	question1 := user2
		postQuestion: 'Lo que dice el titulo, me preguntaba si puedo preguntar algo como esto.'
		titled: 'Es esta una pregunta valida?'
		relatedTo: (Set with: topic1 with: topic2 with: topic3).
	question2 := user2
		postQuestion: 'Lo que dice el titulo, me preguntaba si puedo preguntar algo como esto.'
		titled: 'Es esta una pregunta valida?'
		relatedTo: (Set with: topic2).
	question2 registerDislikeBy: user2.
	question3 := user3
		postQuestion: 'Lo que dice el titulo, me preguntaba si puedo preguntar algo como esto.'
		titled: 'Es esta una pregunta valida?'
		relatedTo: (Set with: topic2).
	question3 registerLikeBy: user3.
	question4 := user3
		postQuestion: 'question4'
		titled: 'question4'
		relatedTo: (Set with: topic1).
	relevantQuestions := user1 relevantQuestions.
	user2 postAnswer: 'No, este tipo de preguntas no estan permitidas' to: question1.
	user3 postAnswer: 'Exactamente como dijo @user2' to: question1.
	user1 postAnswer: 'Muchas gracias!' to: question1. 
	self soleInstance addTopic: topic1; addTopic: topic2.
	self soleInstance addUser: user1; addUser: user2; addUser: user3.

]

{ #category : #adding }
CuOOra >> addTopic: aTopic [
	(self hasTopic: aTopic)
		ifFalse: [ topics add: aTopic ]
]

{ #category : #adding }
CuOOra >> addUser: aUser [
	(self hasUser: aUser)
		ifFalse: [ users add: aUser ]
]

{ #category : #other }
CuOOra >> createUserWithUsername: aUsername andPassword: aPassword [
	^ (users anySatisfy: [ :user | user username = aUsername ])
		ifTrue: [ nil ]
		ifFalse: [ | user |
			user := User username: aUsername password: aPassword.
			self addUser: user.
			user ]
]

{ #category : #other }
CuOOra >> getOrCreateTopicWithName: aName [
	^ topics
		detect: [ :each | each name = aName ]
		ifNone: [ | topic |
			topic := Topic new name: aName.
			self addTopic: topic.
			topic ]
]

{ #category : #other }
CuOOra >> getUserWithUsername: aUsername andPassword: aPassword [
	^ users
		detect: [ :user | user username = aUsername and: user password = aPassword ]
		ifNone: [ nil ]
]

{ #category : #testing }
CuOOra >> hasTopic: aTopic [
	^ topics includes: aTopic
]

{ #category : #testing }
CuOOra >> hasUser: aUser [
	^ users includes: aUser
]

{ #category : #initialization }
CuOOra >> initialize [
	super initialize.
	users := OrderedCollection new.
	topics := OrderedCollection new
]

{ #category : #accessing }
CuOOra >> topics [
	^ topics
]

{ #category : #accessing }
CuOOra >> users [
	^ users
]
