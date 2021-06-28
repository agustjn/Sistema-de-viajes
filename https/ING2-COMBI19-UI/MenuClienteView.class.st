Class {
	#name : #MenuClienteView,
	#superclass : #WAComponent,
	#instVars : [
		'cliente',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Cliente-UI'
}

{ #category : #'instance creation' }
MenuClienteView class >> newWithParent: aParent [
| instance |
	instance := self new.
	instance parent: aParent.
	^ instance
]

{ #category : #accessing }
MenuClienteView >> parent [
	^parent
]

{ #category : #accessing }
MenuClienteView >> parent: aParent [
	parent:= aParent
]

{ #category : #rendering }
MenuClienteView >> renderContentOn: aCanvas [
	self renderizarAnchors: aCanvas
	
]

{ #category : #rendering }
MenuClienteView >> renderizarAnchors: aCanvas [
	aCanvas unorderedList
		class: 'nav justify-content-center nav-tabs mb-4';
		with: [ aCanvas listItem
				class: 'nav-item ml-4 ';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [ self parent activarViajesView];
						with: 'Viajes' ].
			aCanvas listItem
				class: 'nav-item ml-4';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [ self parent activarForoView ];
						with: 'Foro' ]].
]

{ #category : #updating }
MenuClienteView >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet
		url:
			'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
