Class {
	#name : #TopicListComponent,
	#superclass : #CuOOraMainComponent,
	#category : #'CuOOra-WebUI'
}

{ #category : #rendering }
TopicListComponent >> renderContentOn: aCanvas [
	CuOOra soleInstance topics
		do: [ :topic | 
			aCanvas anchor
				class: 'topic';
				callback: [ parent goToTopic: topic ];
				with: topic name.
			aCanvas text: ' ' ]
]
