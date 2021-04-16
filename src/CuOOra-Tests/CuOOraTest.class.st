Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
CuOOraTest >> testAddTopic [
	| cuoora topic |
	cuoora := CuOOra new.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	cuoora addTopic: topic.
	self assert: (cuoora hasTopic: topic)
]

{ #category : #tests }
CuOOraTest >> testAddUser [
	| cuoora user |
	cuoora := CuOOra new.
	user := User username: 'user' password: 'pass'.
	cuoora addUser: user.
	self assert: (cuoora hasUser: user)
]

{ #category : #tests }
CuOOraTest >> testCreateUserWithUsernameAndPassword [
	| cuoora user userWithSameUsername username password |
	cuoora := CuOOra new.
	username := 'user'.
	password := 'pass'.
	user := cuoora createUserWithUsername: username andPassword: password.
	self assert: (cuoora hasUser: user). 
	self assert: user username equals: username.
	self assert: user password equals: password.
	userWithSameUsername := cuoora createUserWithUsername: user username andPassword: user password.
	self assert: userWithSameUsername isNil
]

{ #category : #tests }
CuOOraTest >> testGetOrCreateTopicWithName [
	| cuoora topic topicWithSameName topicName |
	cuoora := CuOOra new.
	topicName := 'topic'.
	self assert: cuoora topics isEmpty.
	topic := cuoora getOrCreateTopicWithName: topicName.
	self assert: (cuoora hasTopic: topic).
	self assert: topic name equals: topicName.
	topicWithSameName := cuoora getOrCreateTopicWithName: topic name.
	self assert: topic identicalTo: topicWithSameName
]

{ #category : #tests }
CuOOraTest >> testGetUserWithUsernameAndPassword [
	| cuoora user1 user2 |
	cuoora := CuOOra new.
	user1 := User username: 'user1' password: 'pass1'.
	user2 := User username: 'user2' password: 'pass2'.
	cuoora addUser: user1.
	cuoora addUser: user2.
	self assert: (cuoora getUserWithUsername: user1 username andPassword: user1 password) equals: user1.
	self assert: (cuoora getUserWithUsername: user1 username andPassword: user2 password) isNil.
	self assert: (cuoora getUserWithUsername: 'user3' andPassword: 'pass3') isNil.
]

{ #category : #tests }
CuOOraTest >> testHasTopic [
	| cuoora topic |
	cuoora := CuOOra new.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	self assert: (cuoora hasTopic: topic) not.
	cuoora addTopic: topic.
	self assert: (cuoora hasTopic: topic)
]

{ #category : #tests }
CuOOraTest >> testHasUser [
	| cuoora user |
	cuoora := CuOOra new.
	user := User username: 'user' password: 'pass'.
	self assert: (cuoora hasUser: user) not. 
	cuoora addUser: user.
	self assert: (cuoora hasUser: user)
]

{ #category : #tests }
CuOOraTest >> testInitialize [
	| cuoora |
	cuoora := CuOOra new.
	self assert: cuoora users isEmpty.
	self assert: cuoora topics isEmpty
]

{ #category : #tests }
CuOOraTest >> testTopics [
	| cuoora topic |
	cuoora := CuOOra new.
	topic := Topic name: 'Test topic' description: 'A test topic'.
	self assert: cuoora topics isEmpty.
	cuoora addTopic: topic.
	self assert: (cuoora topics includes: topic)
]

{ #category : #tests }
CuOOraTest >> testUsers [
	| cuoora user |
	cuoora := CuOOra new.
	user := User username: 'user' password: 'pass'.
	self assert: cuoora users isEmpty.
	cuoora addUser: user.
	self assert: (cuoora users includes: user)
]
