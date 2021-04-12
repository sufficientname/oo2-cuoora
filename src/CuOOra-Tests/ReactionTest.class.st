Class {
	#name : #ReactionTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #tests }
ReactionTest >> testCreatedAt [
	| reaction createdAt |
	reaction := Reaction new.
	createdAt := DateAndTime now.
	reaction createdAt: createdAt.
	self assert: reaction createdAt equals: createdAt
]

{ #category : #tests }
ReactionTest >> testDislike [
	| dislike createdAt |
	createdAt := DateAndTime now.
	dislike := Reaction dislike.
	self assert: dislike kind not.
	self assert: dislike createdAt asSeconds closeTo: createdAt asSeconds
]

{ #category : #tests }
ReactionTest >> testKind [
	| reaction kind |
	reaction := Reaction new.
	kind := true.
	reaction kind: kind.
	self assert: reaction kind equals: kind
]

{ #category : #tests }
ReactionTest >> testLike [
	| like createdAt |
	createdAt := DateAndTime now.
	like := Reaction like.
	self assert: like kind.
	self assert: like createdAt asSeconds closeTo: createdAt asSeconds
]

{ #category : #tests }
ReactionTest >> testUser [
	| reaction user |
	reaction := Reaction new.
	user := User username: 'user' password: 'pass'.
	reaction user: user.
	self assert: reaction user equals: user
]
