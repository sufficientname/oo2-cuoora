Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'instance creation' }
CuOOra class >> soleInstanceClear [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstanceFill [
	| cuOOra pedro diego juan topicOO1 topicTestDeUnidad topicSmalltalk questionPedro questionDiego |
	cuOOra := self soleInstance.
	"users"
	pedro := cuOOra createUserWithUsername: 'pedro@cuoora.com' andPassword: 'pedro@cuoora.com'.
	diego := cuOOra createUserWithUsername: 'diego@cuoora.com' andPassword: 'diego@cuoora.com'.
	juan := cuOOra createUserWithUsername: 'juan@cuoora.com' andPassword: 'juan@cuoora.com'.
	"follows"
	juan follow: diego.
	pedro follow: juan.
	"topics"
	topicOO1 := cuOOra getOrCreateTopicWithName: 'OO1'.
	topicTestDeUnidad := cuOOra getOrCreateTopicWithName: 'Test de Unidad'.
	topicSmalltalk := cuOOra getOrCreateTopicWithName: 'Smalltalk'.
	"questions and answors"
	questionPedro := pedro postQuestion: 'Lo que dice el titulo' titled: '¿Para que sirve el metodo SetUp?' relatedTo: (OrderedCollection with: topicOO1 with: topicTestDeUnidad).
	diego postAnswer: 'Sirve para instanciar los objetos que son evaluados por el test en un único 	método y que se ejecute siempre antes de cada test.' to: questionPedro.
	questionDiego := diego postQuestion: 'Lo que dice el titulo' titled: '¿Que significa #messageNotUnderstood?' relatedTo: (Set with: topicOO1 with: topicSmalltalk).
	pedro postAnswer: 'Significa que el objeto que recibió el mensajeno encontró ningún método para 	ejecutar en respuesta.' to: questionDiego.
]

{ #category : #adding }
CuOOra >> addTopic: aTopic [
	(self hasTopic: aTopic)
		ifFalse: [ topics add: aTopic ]
]

{ #category : #adding }
CuOOra >> addUser: aUser [
	(self hasUser: aUser)
		ifFalse: [ users add: aUser ]
]

{ #category : #other }
CuOOra >> createUserWithUsername: aUsername andPassword: aPassword [
	^ (users anySatisfy: [ :user | user username = aUsername ])
		ifTrue: [ nil ]
		ifFalse: [ | user |
			user := User username: aUsername password: aPassword.
			self addUser: user.
			user ]
]

{ #category : #other }
CuOOra >> getOrCreateTopicWithName: aName [
	^ topics
		detect: [ :each | each name = aName ]
		ifNone: [ | topic |
			topic := Topic new name: aName.
			self addTopic: topic.
			topic ]
]

{ #category : #other }
CuOOra >> getUserWithUsername: aUsername andPassword: aPassword [
	^ users
		detect: [ :user | user username = aUsername and: user password = aPassword ]
		ifNone: [ nil ]
]

{ #category : #testing }
CuOOra >> hasTopic: aTopic [
	^ topics includes: aTopic
]

{ #category : #testing }
CuOOra >> hasUser: aUser [
	^ users includes: aUser
]

{ #category : #initialization }
CuOOra >> initialize [
	super initialize.
	users := OrderedCollection new.
	topics := OrderedCollection new
]

{ #category : #accessing }
CuOOra >> topics [
	^ topics
]

{ #category : #accessing }
CuOOra >> users [
	^ users
]
