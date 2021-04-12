Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'topics',
		'answers'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
Question class >> title: aTitle text: aText [
	^ self new
		title: aTitle;
		text: aText;
		createdAt: DateAndTime now;
		yourself
]

{ #category : #adding }
Question >> addAnswer: anAnswer [
	(self hasAnswer: anAnswer)
		ifTrue: [ ^ self ].
	answers add: anAnswer.
	anAnswer question: self
]

{ #category : #private }
Question >> addEntryTo: aUser [
	aUser addQuestion: self
]

{ #category : #adding }
Question >> addTopic: aTopic [
	(self hasTopic: aTopic)
		ifTrue: [ ^ self ].
	topics add: aTopic.
	aTopic addQuestion: self
]

{ #category : #adding }
Question >> addTopics: aTopicCollection [
	aTopicCollection do: [ :topic | self addTopic: topic ]
]

{ #category : #accessing }
Question >> answers [
	^ answers
]

{ #category : #deleting }
Question >> delete [
	super delete.
	topics copy do: [ :topic | topic removeQuestion: self ].
	answers copy do: [ :answer | answer delete ]
]

{ #category : #testing }
Question >> hasAnswer: anAnswer [
	^ answers includes: anAnswer
]

{ #category : #testing }
Question >> hasTopic: aTopic [
	^ topics includes: aTopic
]

{ #category : #initialization }
Question >> initialize [
	super initialize.
	topics := OrderedCollection new.
	answers := OrderedCollection new
]

{ #category : #removing }
Question >> removeAnswer: anAnswer [
	answers remove: anAnswer ifAbsent: [ ^ self ]
]

{ #category : #private }
Question >> removeEntryFrom: aUser [
	aUser removeQuestion: self
]

{ #category : #removing }
Question >> removeTopic: aTopic [
	topics remove: aTopic ifAbsent: [ ^ self ].
	aTopic removeQuestion: self
]

{ #category : #accessing }
Question >> title [
	^ title
]

{ #category : #accessing }
Question >> title: aString [
	title := aString
]

{ #category : #accessing }
Question >> topics [
	^ topics
]
