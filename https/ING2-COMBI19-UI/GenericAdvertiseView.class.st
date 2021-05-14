Class {
	#name : #GenericAdvertiseView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'heading',
		'text1',
		'text2',
		'text3'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
}

{ #category : #'instance creation' }
GenericAdvertiseView class >> newWithParent: aParent heading: head item1:aText1 item2: aText2 item3: aText3 [
	^ self new 
					parent:aParent ;
					heading: head ;
					text1: aText1 ; 
					text2: aText2 ;
					text3: aText3 ;
					yourself
]

{ #category : #accessing }
GenericAdvertiseView >> heading [
	^ heading
]

{ #category : #accessing }
GenericAdvertiseView >> heading: anObject [
	heading := anObject
]

{ #category : #accessing }
GenericAdvertiseView >> parent [
	^ parent
]

{ #category : #accessing }
GenericAdvertiseView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
GenericAdvertiseView >> renderContentOn: html [
	html horizontalRule.
	html heading: heading.
	html paragraph: [html unorderedList: [ html listItem:text1.
													  text2 ifNotNil:[html listItem: text2].
													  text3 ifNotNil:[ html listItem: text3] 
													] 
						].
	html horizontalRule.
]

{ #category : #accessing }
GenericAdvertiseView >> text1 [
	^ text1
]

{ #category : #accessing }
GenericAdvertiseView >> text1: anObject [
	text1 := anObject
]

{ #category : #accessing }
GenericAdvertiseView >> text2 [
	^ text2
]

{ #category : #accessing }
GenericAdvertiseView >> text2: anObject [
	text2 := anObject
]

{ #category : #accessing }
GenericAdvertiseView >> text3 [
	^ text3
]

{ #category : #accessing }
GenericAdvertiseView >> text3: anObject [
	text3 := anObject
]
