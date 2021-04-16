Class {
	#name : #CuOOraTask,
	#superclass : #WATask,
	#category : #'CuOOra-WebUI'
}

{ #category : #rendering }
CuOOraTask >> go [
	self goToHome
]

{ #category : #callbacks }
CuOOraTask >> goToHome [
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
