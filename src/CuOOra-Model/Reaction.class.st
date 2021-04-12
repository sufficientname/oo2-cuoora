Class {
	#name : #Reaction,
	#superclass : #Object,
	#instVars : [
		'user',
		'kind',
		'createdAt'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
Reaction class >> dislike [
	^ self new
		kind: false;
		createdAt: DateAndTime now;
		yourself
]

{ #category : #'instance creation' }
Reaction class >> like [
	^ self new
		kind: true;
		createdAt: DateAndTime now;
		yourself
]

{ #category : #accessing }
Reaction >> createdAt [
	^ createdAt
]

{ #category : #accessing }
Reaction >> createdAt: aDateAndTime [
	createdAt := aDateAndTime
]

{ #category : #accessing }
Reaction >> kind [
	^ kind
]

{ #category : #accessing }
Reaction >> kind: aBoolean [
	kind := aBoolean
]

{ #category : #accessing }
Reaction >> user [
	^ user
]

{ #category : #accessing }
Reaction >> user: aUser [
	user := aUser
]
