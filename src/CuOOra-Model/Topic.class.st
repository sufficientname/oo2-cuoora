Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
Topic class >> name: aName description: aDescription [
	^ self new
		name: aName;
		description: aDescription;
		yourself
]

{ #category : #adding }
Topic >> addQuestion: aQuestion [
	(self hasQuestion: aQuestion)
		ifTrue: [ ^ self ].
	questions add: aQuestion.
	aQuestion addTopic: self
]

{ #category : #accessing }
Topic >> description [
	^ description
]

{ #category : #accessing }
Topic >> description: aString [
	description := aString
]

{ #category : #testing }
Topic >> hasQuestion: aQuestion [
	^ questions includes: aQuestion
]

{ #category : #initialization }
Topic >> initialize [
	super initialize.
	questions := OrderedCollection new
]

{ #category : #accessing }
Topic >> name [
	^ name
]

{ #category : #accessing }
Topic >> name: aString [
	name := aString
]

{ #category : #accessing }
Topic >> questions [
	^ questions
]

{ #category : #removing }
Topic >> removeQuestion: aQuestion [
	questions remove: aQuestion ifAbsent: [ ^ self ].
	aQuestion removeTopic: self	
]
