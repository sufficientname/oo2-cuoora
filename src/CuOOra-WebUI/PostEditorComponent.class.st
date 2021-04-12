Class {
	#name : #PostEditorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'text',
		'errorText'
	],
	#category : #'CuOOra-WebUI'
}

{ #category : #callbacks }
PostEditorComponent >> cancel [
	self answer: nil
]

{ #category : #accessing }
PostEditorComponent >> formTitle [
	self subclassResponsibility
]

{ #category : #callbacks }
PostEditorComponent >> post [
	self subclassResponsibility
]

{ #category : #rendering }
PostEditorComponent >> renderCancelButtonOn: aCanvas [
	aCanvas anchor
		class: 'button column';
		callback: [ self answer ];
		with: 'Cancel'
]

{ #category : #rendering }
PostEditorComponent >> renderContentOn: aCanvas [
	aCanvas div class: 'row'; with: [
	aCanvas div class: 'column';
		with: [ aCanvas heading level3 with: self formTitle.
			self renderFormErrorOn: aCanvas.
			aCanvas form
				with: [ self renderFormFieldsOn: aCanvas.
					aCanvas break.
					self renderSubmitButtonOn: aCanvas ].
			self renderCancelButtonOn: aCanvas ] ]
]

{ #category : #rendering }
PostEditorComponent >> renderFormErrorOn: aCanvas [
	(errorText) ifNotNil: [ aCanvas label class: 'error-text'; with: errorText ]
]

{ #category : #rendering }
PostEditorComponent >> renderFormFieldsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #rendering }
PostEditorComponent >> renderSubmitButtonOn: aCanvas [
	aCanvas submitButton
		class: 'button column';
		callback: [ self post ];
		with: 'Post'
]

{ #category : #accessing }
PostEditorComponent >> text [
	^ text
]

{ #category : #accessing }
PostEditorComponent >> text: aString [
	text := aString
]
