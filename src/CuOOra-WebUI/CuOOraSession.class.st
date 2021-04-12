Class {
	#name : #CuOOraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #accessing }
CuOOraSession >> user [
	^ user
]

{ #category : #accessing }
CuOOraSession >> user: aUser [
	user := aUser
]
