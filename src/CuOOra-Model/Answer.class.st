Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
Answer class >> text: aText [
	^ self new
		text: aText;
		createdAt: DateAndTime now;
		yourself
]

{ #category : #private }
Answer >> addEntryTo: aUser [
	aUser addAnswer: self
]

{ #category : #deleting }
Answer >> delete [
	super delete.
	question removeAnswer: self
]

{ #category : #accessing }
Answer >> question [
	^ question
]

{ #category : #accessing }
Answer >> question: aQuestion [
	aQuestion == question
		ifTrue: [ ^ self ].
	question ifNotNil: [ question removeAnswer: self ].
	aQuestion addAnswer: self.
	question := aQuestion
]

{ #category : #private }
Answer >> removeEntryFrom: aUser [
	aUser removeAnswer: self
]
