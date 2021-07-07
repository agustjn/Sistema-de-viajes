Class {
	#name : #ViajesClientViewFiltro,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'filtro'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
ViajesClientViewFiltro class >> newWithParent: aParent [
	^ self new parent: aParent
]
