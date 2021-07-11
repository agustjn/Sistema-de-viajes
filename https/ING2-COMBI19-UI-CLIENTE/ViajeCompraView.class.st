Class {
	#name : #ViajeCompraView,
	#superclass : #WAComponent,
	#instVars : [
		'viaje',
		'cantAsientos',
		'insumo1',
		'insumo2',
		'insumo3',
		'errorView',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
ViajeCompraView class >> newDelViaje: unViaje [
	^ self new viaje: unViaje
]

{ #category : #'instance creation' }
ViajeCompraView class >> newDelViaje: unViaje conParent: unParent [
	^ self new viaje: unViaje;
				  parent: unParent;
				  yourself
]

{ #category : #accessing }
ViajeCompraView >> agregarInsumo: html [
	insumo1 ifNil: [ insumo1 := InsumoComponent new ]
			
			  
			ifNotNil:[ insumo2 ifNil: [ insumo2 := InsumoComponent new ] 
									 ifNotNil: [ insumo3 := InsumoComponent new ] ].
				
							              
]

{ #category : #accessing }
ViajeCompraView >> agregarViaje [
  (	 self session user) agregarViaje: self viaje.
]

{ #category : #calculations }
ViajeCompraView >> calcularMontoTotal [
	| total |
	total:=0.
	(self insumosComprados) 
		ifNotNil:[ :insumos | insumos do:[ :insumo | total := total + (insumo valor asNumber)]  ] .
	total := total + (cantAsientos asNumber) * 2000.
	^ total
]

{ #category : #accessing }
ViajeCompraView >> cantAsientos [
	^ cantAsientos
]

{ #category : #accessing }
ViajeCompraView >> cantAsientos: anObject [
	cantAsientos := anObject
]

{ #category : #event }
ViajeCompraView >> confirmarCompra [
	(self session user seRepiteViajeConFecha: viaje fecha)
		ifTrue: [ self
				renderizarError:
					'La fecha del viaje coincide con otro viaje pendiente que usted tiene.'.
			^ self ].
	self session user esSospechoso
		ifTrue: [ self renderizarError: 'Usted es sospechoso de COVID-19'.
			^ self ].
	self cantAsientos
		ifEmpty: [ self renderizarError: 'Debe ingresar una cantidad de boletos a comprar'.
			^ self ].
	self viaje cantAsientosDisponibles <= cantAsientos asNumber
		ifTrue: [ self
				renderizarError:
					'No hay la cantidad de asientos disponibles en el viaje para los cupos que usted reservo'.
			^ self ].
	self proceder
]

{ #category : #accessing }
ViajeCompraView >> insumo1 [
	^ insumo1
]

{ #category : #accessing }
ViajeCompraView >> insumo1: anObject [
	insumo1 := anObject
]

{ #category : #accessing }
ViajeCompraView >> insumo2 [
	^ insumo2
]

{ #category : #accessing }
ViajeCompraView >> insumo2: anObject [
	insumo2 := anObject
]

{ #category : #accessing }
ViajeCompraView >> insumo3 [
	^ insumo3
]

{ #category : #accessing }
ViajeCompraView >> insumo3: anObject [
	insumo3 := anObject
]

{ #category : #queries }
ViajeCompraView >> insumosComprados [
	| col |
	col := OrderedCollection new.
	insumo1 ifNotNil:[ col add: insumo1 ].
	insumo2 ifNotNil:[ col add: insumo2 ].
	insumo3 ifNotNil:[ col add: insumo3 ].
	^ col
]

{ #category : #accessing }
ViajeCompraView >> model [
	^ Combi19 soleInstance 
]

{ #category : #accessing }
ViajeCompraView >> parent [
	^ parent
]

{ #category : #accessing }
ViajeCompraView >> parent: anObject [
	parent := anObject
]

{ #category : #event }
ViajeCompraView >> proceder [
	| reserva |
	reserva := Reserva conInsumos: (self insumosComprados) cupos: (cantAsientos asNumber) delViaje: viaje yTarjeta: nil.
	self viaje restarAsientos: cantAsientos .
	( self session user ) agregarReserva: reserva.
	( self session user ) soyGold 
			ifTrue:[ self call: ((InformeDeCompraView conMonto: (self calcularMontoTotal) yTarjeta: (self session user tarjeta) conParent: self parent ) ) ]
			ifFalse:[ self call:(PagarViajeBasicoView deReserva: reserva conParent: self parent)]
	
]

{ #category : #rendering }
ViajeCompraView >> renderContentOn: html [
	html div class:'text-center';
				with:[ html heading level3 with:'Compra de pasaje' ].
	html break.
	html strong:'Viaje con Ruta ', viaje ruta string.
	html break.
	html strong:'Fecha del viaje: ', viaje fecha asString.
	html break.
	html strong:'Precio de boleto: $2000'.
	html break ; break.
	html render: errorView.
	html div class:'container';
				with:[ self renderizarFormulario:html].
	html render:compraUsuarioGoldView .
	html horizontalRule.
	
]

{ #category : #rendering }
ViajeCompraView >> renderizarBotones: html [
	html div
		class: 'text-center';
		with: [ html submitButton
				class: 'btn btn-dark';
				callback: [ self answer ];
				value: 'Cancelar'.
			html space.
			html submitButton
				class: 'btn btn-dark';
				callback: [ self confirmarCompra ];
				value: 'Confirmar compra' ]
]

{ #category : #rendering }
ViajeCompraView >> renderizarError: errorString [
	errorView := GenericAdvertiseView newWithParent: self heading:'Error al comprar los pasajes'  
		item1:errorString  
		item2:nil  
		item3:nil 
]

{ #category : #rendering }
ViajeCompraView >> renderizarFormulario:html [
	html form:[ 
			
			html text:'Ingrese la cantidad de boletos que desea comprar'.
			html break ; break.
			(html textInput on:#cantAsientos of:self) size: 2.
			html break ; break.
			html strong:'Compra de insumos para el viaje' ; break ; break.
			html render: insumo1.
			html render: insumo2.
			html render: insumo3.
			html submitButton callback: [ self agregarInsumo: html ] ;
				   value:'Agregar insumo'.
			html horizontalRule.
			"html render: cardPayView."
			self renderizarBotones: html
			 ]
]

{ #category : #accessing }
ViajeCompraView >> viaje [
	^ viaje
]

{ #category : #accessing }
ViajeCompraView >> viaje: anObject [
	viaje := anObject
]
