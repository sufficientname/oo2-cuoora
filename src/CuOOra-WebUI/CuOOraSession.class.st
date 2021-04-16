Class {
	#name : #CuOOraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
CuOOraSession >> isUserSignedIn [
	^ self user isNotNil
]

{ #category : #accessing }
CuOOraSession >> signIn: aUser [
	user := aUser
]

{ #category : #accessing }
CuOOraSession >> signOut [
	user := nil.
	self unregister
]

{ #category : #accessing }
CuOOraSession >> user [
	^ user
]

{ #category : #accessing }
CuOOraSession >> user: aUser [
	user := aUser
]
