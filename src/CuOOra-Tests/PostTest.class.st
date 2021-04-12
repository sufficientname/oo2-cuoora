Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
PostTest >> testCreatedAt [
	| post createdAt |
	createdAt := DateAndTime now.
	post := Post new.
	post createdAt: createdAt.
	self assert: post createdAt equals: createdAt.
]

{ #category : #tests }
PostTest >> testDislikes [
	| user post |
	user := User username: 'user' password: 'pass'.
	post := Post new.
	self assert: post dislikes isEmpty.
	post registerDislikeBy: user.
	self assert: (post dislikes anySatisfy: [ :dislike | dislike user == user ])
	
]

{ #category : #tests }
PostTest >> testInitialize [
	| post |
	post := Post new.
	self assert: post likes isEmpty.
	self assert: post dislikes isEmpty.
]

{ #category : #tests }
PostTest >> testLikes [
	| user post |
	user := User username: 'user' password: 'pass'.
	post := Post new.
	self assert: post likes isEmpty.
	post registerLikeBy: user.
	self assert: (post likes anySatisfy: [ :like | like user == user ])
	
]

{ #category : #tests }
PostTest >> testRegisterDislikeBy [
	| user post |
	user := User username: 'user' password: 'pass'.
	post := Post new.
	post registerDislikeBy: user.
	self assert: (post wasDislikedBy: user).
	post registerDislikeBy: user.
	self assert: (post wasDislikedBy: user) not.

	
]

{ #category : #tests }
PostTest >> testRegisterLikeBy [
	| user post |
	user := User username: 'user' password: 'pass'.
	post := Post new.
	post registerLikeBy: user.
	self assert: (post wasLikedBy: user).
	post registerLikeBy: user.
	self assert: (post wasLikedBy: user) not
	
]

{ #category : #tests }
PostTest >> testScore [
	| user1 user2 user3 post |
	user1 := User username: 'user1' password: 'pass'.
	user2 := User username: 'user2' password: 'pass'.
	user3 := User username: 'user3' password: 'pass'.
	post := Post new.
	post registerLikeBy: user1.
	post registerDislikeBy: user2.
	post registerLikeBy: user2.
	post registerDislikeBy: user3.
	self assert: post score equals: 1
]

{ #category : #tests }
PostTest >> testText [
	| post text |
	text := 'this is an entry'.
	post := Post new.
	post text: text.
	self assert: post text equals: text.
]

{ #category : #tests }
PostTest >> testWasDislikedBy [
	| user post |
	user := User username: 'user' password: 'pass'.
	post := Post new.
	self assert: (post wasLikedBy: user) not.
	post registerLikeBy: user.
	self assert: (post wasLikedBy: user)

	
]

{ #category : #tests }
PostTest >> testWasLikedBy [
	| user post |
	user := User username: 'user' password: 'pass'.
	post := Post new.
	self assert: (post wasLikedBy: user) not.
	post registerLikeBy: user.
	self assert: (post wasLikedBy: user)

	
]
