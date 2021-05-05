Class {
	#name : #MenuViewComponent,
	#superclass : #WAComponent,
	#instVars : [
		'admin'
	],
	#category : #'ING2-COMBI19-UI'
}

{ #category : #initializing }
MenuViewComponent >> initialize [
	super initialize.
	admin := self session user.
]

{ #category : #accessing }
MenuViewComponent >> model [
	^Combi19 soleInstance	
]
