Class {
	#name : #CuOOraTask,
	#superclass : #WATask,
	#instVars : [
		'signInComponent',
		'mainComponent'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #rendering }
CuOOraTask >> go [
	self goToHomeComponent
]

{ #category : #callbacks }
CuOOraTask >> goToHomeComponent [
	self call: (HomeComponent parent: self)
]

{ #category : #callbacks }
CuOOraTask >> goToQuestion: aQuestion [
	self call: ((QuestionDetailComponent parent: self) question: aQuestion)
]

{ #category : #callbacks }
CuOOraTask >> goToTopic: aTopic [
	self call: ((TopicDetailComponent parent: self) topic: aTopic)
]

{ #category : #callbacks }
CuOOraTask >> goToTopics [
	self call: (TopicListComponent parent: self)
]

{ #category : #callbacks }
CuOOraTask >> goToUserProfile: aUser [
	self call: ((UserProfileComponent parent: self) user: aUser)
]

{ #category : #initialization }
CuOOraTask >> initialize [
	super initialize.
	signInComponent := SignInComponent new
]
