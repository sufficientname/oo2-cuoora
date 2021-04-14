Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'text',
		'user',
		'likes',
		'dislikes',
		'createdAt'
	],
	#category : #'CuOOra-Model'
}

{ #category : #private }
Post >> addPostTo: aUser [
	self subclassResponsibility
]

{ #category : #accessing }
Post >> createdAt [
	^ createdAt
]

{ #category : #accessing }
Post >> createdAt: aDateAndTime [
	createdAt := aDateAndTime
]

{ #category : #deleting }
Post >> delete [
	self removePostFrom: user
]

{ #category : #accessing }
Post >> dislikes [
	^ dislikes
]

{ #category : #initialization }
Post >> initialize [
	super initialize.
	likes := OrderedCollection new.
	dislikes := OrderedCollection new
]

{ #category : #accessing }
Post >> likes [
	^ likes
]

{ #category : #adding }
Post >> registerDislikeBy: aUser [
	dislikes
		detect: [ :each | each user == aUser ]
		ifFound: [ :it | 
			dislikes remove: it.
			^ self ]
		ifNone: [  ].
	likes
		detect: [ :each | each user == aUser ]
		ifFound: [ :it | likes remove: it ]
		ifNone: [  ].
	dislikes add: (Reaction dislike user: aUser)
]

{ #category : #adding }
Post >> registerLikeBy: aUser [
	likes
		detect: [ :each | each user == aUser ]
		ifFound: [ :it | 
			likes remove: it.
			^ self ]
		ifNone: [  ].
	dislikes
		detect: [ :each | each user == aUser ]
		ifFound: [ :it | dislikes remove: it ]
		ifNone: [  ].
	likes add: (Reaction like user: aUser)
]

{ #category : #private }
Post >> removePostFrom: aUser [
	self subclassResponsibility
]

{ #category : #accessing }
Post >> score [
	^ likes size - dislikes size
]

{ #category : #accessing }
Post >> text [
	^ text
]

{ #category : #accessing }
Post >> text: aString [
	text := aString
]

{ #category : #accessing }
Post >> user [
	^ user
]

{ #category : #accessing }
Post >> user: aUser [
	aUser == user
		ifTrue: [ ^ self ].
	user ifNotNil: [ self removePostFrom: user ].
	self addPostTo: aUser.
	user := aUser
]

{ #category : #testing }
Post >> wasDislikedBy: aUser [
	^ dislikes anySatisfy: [ :dislike | dislike user == aUser ]
]

{ #category : #testing }
Post >> wasLikedBy: aUser [
	^ likes anySatisfy: [ :like | like user == aUser ]
]
