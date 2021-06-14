Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'contenido',
		'autor'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #'as yet unclassified' }
Publicacion class >> de: unAutor conContenido: text [
	
	^ self new autor: unAutor ;
				  contenido: text ; 
				  yourself
]

{ #category : #accessing }
Publicacion >> autor [
	^ autor
]

{ #category : #accessing }
Publicacion >> autor: anObject [
	autor := anObject
]

{ #category : #accessing }
Publicacion >> contenido [
	^ contenido
]

{ #category : #accessing }
Publicacion >> contenido: anObject [
	contenido := anObject
]
