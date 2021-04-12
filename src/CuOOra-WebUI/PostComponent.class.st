Class {
	#name : #PostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post',
		'userCallback'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #'instance creation' }
PostComponent class >> with: aPost [
	^ self new post: aPost; yourself
]

{ #category : #callbacks }
PostComponent >> delete [
	post delete
]

{ #category : #callbacks }
PostComponent >> dislike [
	post registerDislikeBy: self session user
]

{ #category : #callbacks }
PostComponent >> goToUser [
	^ userCallback
		ifNotNil: [ userCallback value: post user ]

]

{ #category : #callbacks }
PostComponent >> like [
	post registerLikeBy: self session user
]

{ #category : #accessing }
PostComponent >> post [
	^ post
]

{ #category : #accessing }
PostComponent >> post: aPost [
	post := aPost
]

{ #category : #rendering }
PostComponent >> renderDeleteButtonOn: aCanvas [
	post user == self session user
		ifFalse: [ ^ self ].
	aCanvas text: ' - '.
	aCanvas anchor
		class: 'button button-small';
		callback: [ self delete ];
		with: 'delete'
]

{ #category : #rendering }
PostComponent >> renderDislikeButtonOn: aCanvas [
	aCanvas anchor
		class:
			((post wasDislikedBy: self session user)
				ifTrue: [ 'reacted' ]
				ifFalse: [ 'reaction' ]);
		callback: [ self dislike ];
		with: '▼' , post dislikes size printString
]

{ #category : #rendering }
PostComponent >> renderLikeButtonOn: aCanvas [
	aCanvas anchor
		class:
			((post wasLikedBy: self session user)
				ifTrue: [ 'reacted' ]
				ifFalse: [ 'reaction' ]);
		callback: [ self like ];
		with: '▲' , post likes size printString
]

{ #category : #rendering }
PostComponent >> renderReactionButtonsOn: aCanvas [
	self renderLikeButtonOn: aCanvas.
	self renderDislikeButtonOn: aCanvas.
	aCanvas span: ' | score: ', post score printString 
]

{ #category : #rendering }
PostComponent >> renderTextOn: aCanvas [
	aCanvas paragraph with: post text.
]

{ #category : #rendering }
PostComponent >> renderUserOn: aCanvas [
	aCanvas span
		with: [ aCanvas text: 'by: '.
			aCanvas anchor
				callback: [ self goToUser ];
				with: [ aCanvas
						text: post user username , ' (' , post user score printString , ')' ].
			aCanvas text: ' - '.
			aCanvas
				text: 'at: ' , post createdAt asStringYMDHM ]
]

{ #category : #accessing }
PostComponent >> userCallback: aBlock [
	userCallback := aBlock
]
