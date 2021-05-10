Class {
	#name : #InsumosCreationView,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Insumo-UI'
}

{ #category : #'instance creation' }
InsumosCreationView class >> newWithParent: aParent [
 ^self new parent: aParent
]
