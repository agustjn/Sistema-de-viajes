Class {
	#name : #CombiSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
}

{ #category : #accessing }
CombiSession >> user [
	^ user
]

{ #category : #accessing }
CombiSession >> user: anObject [
	user := anObject
]
