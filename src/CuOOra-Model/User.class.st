Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'following',
		'topicsOfInterest',
		'questions',
		'answers',
		'createdAt'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
User class >> username: aUsername password: aPassword [
	^ self new
		username: aUsername;
		password: aPassword;
		createdAt: DateAndTime now;
		yourself
]

{ #category : #adding }
User >> addAnswer: anAnswer [
	(self hasAnswer: anAnswer)
		ifTrue: [ ^ self ].
	answers add: anAnswer.
	anAnswer user: self
]

{ #category : #adding }
User >> addQuestion: aQuestion [
	(self hasQuestion: aQuestion)
		ifTrue: [ ^ self ].
	questions add: aQuestion.
	aQuestion user: self
]

{ #category : #accessing }
User >> answers [
	^ answers
]

{ #category : #adding }
User >> beInterestedIn: aTopic [
	(self isInterestedIn: aTopic)
		ifFalse: [ topicsOfInterest add: aTopic ]
]

{ #category : #removing }
User >> beNotInterestedIn: aTopic [
	(self isInterestedIn: aTopic)
		ifTrue: [ topicsOfInterest remove: aTopic ]
]

{ #category : #accessing }
User >> createdAt [
	^ createdAt
]

{ #category : #accessing }
User >> createdAt: aDateAndTime [
	createdAt := aDateAndTime
]

{ #category : #adding }
User >> follow: aUser [
	((self isFollowing: aUser) or: self == aUser)
		ifFalse: [ following add: aUser ]
]

{ #category : #accessing }
User >> following [
	^ following
]

{ #category : #testing }
User >> hasAnswer: anAnswer [
	^ answers includes: anAnswer
]

{ #category : #testing }
User >> hasQuestion: aQuestion [
	^ questions includes: aQuestion
]

{ #category : #initialization }
User >> initialize [
	super initialize.
	following := OrderedCollection new.
	topicsOfInterest := OrderedCollection new.
	questions := OrderedCollection new.
	answers := OrderedCollection new
]

{ #category : #testing }
User >> isFollowing: aUser [
	^ following includes: aUser
]

{ #category : #testing }
User >> isInterestedIn: aTopic [
	^ topicsOfInterest includes: aTopic
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: aString [
	password := aString
]

{ #category : #other }
User >> postAnswer: answerString to: aQuestion [
	| answer |
	answer := Answer text: answerString.
	self addAnswer: answer.
	aQuestion addAnswer: answer.
	^ answer
]

{ #category : #other }
User >> postQuestion: questionString titled: titleString relatedTo: aTopicCollection [
	| question |
	question := Question title: titleString text: questionString.
	self addQuestion: question.
	question addTopics: aTopicCollection.
	^ question
	
]

{ #category : #accessing }
User >> questions [
	^ questions
]

{ #category : #accessing }
User >> relevantQuestions [
	| relevantQuestions |
	relevantQuestions := Set new.
	relevantQuestions addAll: (following flatCollect: [ :user | user questions ]).
	relevantQuestions addAll: (topicsOfInterest flatCollect: [ :topic | topic questions ]).
	^ relevantQuestions sorted: [ :questionA :questionB | questionA score >= questionB score ]
	
	 
	
	 
]

{ #category : #removing }
User >> removeAnswer: anAnswer [
	answers remove: anAnswer ifAbsent: [ ^ self ]
]

{ #category : #removing }
User >> removeQuestion: aQuestion [
	questions remove: aQuestion ifAbsent: [ ^ self ]
]

{ #category : #accessing }
User >> score [
	| pointsPerQuestion pointsPerAnswer scoreQuestions scoreAnswers scoreReactionQuestions scoreReactionAnswers |
	pointsPerQuestion := 20.
	pointsPerAnswer := 50.
	scoreQuestions := questions size * pointsPerQuestion.
	scoreAnswers := (answers
		reject: [ :answer | answer question user == self ]) size
		* pointsPerAnswer.
	scoreReactionQuestions := questions
		inject: 0
		into: [ :sum :question | sum + question score ].
	scoreReactionAnswers := answers
		inject: 0
		into: [ :sum :answer | sum + answer score ].
	^ scoreQuestions + scoreAnswers + scoreReactionQuestions + scoreReactionAnswers
]

{ #category : #accessing }
User >> topicsOfInterest [
	^ topicsOfInterest
]

{ #category : #removing }
User >> unfollow: aUser [
	(self isFollowing: aUser)
		ifTrue: [ following remove: aUser ]
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #accessing }
User >> username: aString [
	username := aString
]
