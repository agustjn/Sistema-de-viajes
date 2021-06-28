Class {
	#name : #ViajeClienteView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'errorView',
		'origenProvincia',
		'origenLocalidad',
		'destinoProvincia',
		'destinoLocalidad',
		'fecha'
	],
	#category : #'ING2-COMBI19-UI-Cliente-UI'
}

{ #category : #'instance creation' }
ViajeClienteView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
ViajeClienteView >> destinoLocalidad [
	^ destinoLocalidad 
]

{ #category : #accessing }
ViajeClienteView >> destinoLocalidad: unDestino [
	destinoLocalidad:= unDestino 
]

{ #category : #accessing }
ViajeClienteView >> destinoProvincia [
	^destinoProvincia 
]

{ #category : #accessing }
ViajeClienteView >> destinoProvincia: unDestino [
	destinoProvincia:= unDestino 
]

{ #category : #accessing }
ViajeClienteView >> fecha [
	 ^ fecha
]

{ #category : #accessing }
ViajeClienteView >> fecha: unaFecha [
	fecha:= unaFecha
	
]

{ #category : #accessing }
ViajeClienteView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
ViajeClienteView >> origenLocalidad [
	^ origenLocalidad
]

{ #category : #accessing }
ViajeClienteView >> origenLocalidad: unOrigen [
	origenLocalidad:= unOrigen 
]

{ #category : #accessing }
ViajeClienteView >> origenProvincia [
	^ origenProvincia 
]

{ #category : #accessing }
ViajeClienteView >> origenProvincia: unOrigen [
	origenProvincia:= unOrigen
]

{ #category : #accessing }
ViajeClienteView >> parent [
	^parent
]

{ #category : #accessing }
ViajeClienteView >> parent: aParent [ 
	parent:= aParent
]

{ #category : #accessing }
ViajeClienteView >> renderContentOn: aCanvas [
	"self model administrador viajesString
		ifEmpty: [ self advertenciaSinRuta ]
		
		ifNotEmpty: ["
			 aCanvas heading level2 with: 'Buscador De Viaje'.
			aCanvas
				form: [ self renderizarFormulario: aCanvas.
					self renderizarBotonesOn: aCanvas ].
]

{ #category : #rendering }
ViajeClienteView >> renderizarBotonesOn: aCanvas [
	aCanvas submitButton
						callback: [ self siguiente: aCanvas ];
						value: 'Siguiente'.
					aCanvas space.
					aCanvas space.
					aCanvas submitButton
						callback: [ self parent desactivarViajeView ];
						with: 'Cancelar'
]

{ #category : #'as yet unclassified' }
ViajeClienteView >> renderizarFormulario: html [
	html text: 'Origen provincia: '.
	html space.
	html textInput on: #origenProvincia of: self.
	html break.
	html text: 'Origen Localidad: '.
	html space.
	html textInput on: #origenLocalidad of: self.
	html break.
	html text: 'Destino Pronvincia '.
	html space.
	html textInput on: #destinoProvincia of: self.
	html break.
	html text: 'Destino Localidad'.
	html textInput on: #destinoLocalidad of: self.
	html break. html text: 'Ingrese la fecha del viaje'.
	html dateInput on: #fecha of: self.
	html break
]
