Class {
	#name : #HomeChoferComponent,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI-Chofer-CRUD-UI'
}

{ #category : #event }
HomeChoferComponent >> cerrarSesion [ 
	self session user: nil.
	self show: LoginComponent new
]

{ #category : #rendering }
HomeChoferComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with: 'Combi-19'.
	aCanvas text: 'Bienvenido Chofer:  ' , self session user nombre.
	aCanvas break.
	aCanvas anchor
		callback: [ self cerrarSesion ];
		with: 'Cerrar sesion'
]

{ #category : #updating }
HomeChoferComponent >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
