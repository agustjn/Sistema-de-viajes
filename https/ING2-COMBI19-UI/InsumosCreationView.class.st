Class {
	#name : #InsumosCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Insumo-CRUD-UI'
}

{ #category : #'instance creation' }
InsumosCreationView class >> newWithParent: aParent [
 ^self new parent: aParent
]
