Class {
	#name : #VenderBoletoView,
	#superclass : #WAComponent,
	#instVars : [
		'viaje',
		'errorView',
		'correo',
		'cantBoletos',
		'parent',
		'cliente'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
VenderBoletoView class >> newWithParent: aParent delViaje: unViaje [
	^ self new
		parent: aParent;
		viaje: unViaje;
		yourself
]

{ #category : #accessing }
VenderBoletoView >> cantBoletos [
	^ cantBoletos
]

{ #category : #accessing }
VenderBoletoView >> cantBoletos: anObject [
	cantBoletos := anObject
]

{ #category : #event }
VenderBoletoView >> confirmarVenta [
	( self viaje cantAsientosDisponibles >= cantBoletos asNumber )
			ifFalse:[ self renderizarError:'No quedan asientos disponibles para la cantidad que usted reservo.'.
						^ self ].
	"Si quedan asientos, se procede a hacer las operaciones para dar de alta a un pasajero"
		( self model buscarClienteMail: correo )
		ifNotNil:[ self viaje restarAsientos: cantBoletos asNumber.
					  self viaje agregarCliente: ( self model buscarClienteMail: correo ).
					( self model buscarClienteMail: correo ) agregarViaje: self viaje .
					  self parent activarMensajeExito:'Al cliente ', correo , ' se lo dio de alta al viaje correctamente.']
		ifNil: [ self viaje restarAsientos: cantBoletos asNumber.
					self crearObjetoCliente.
					self model agregarCliente: cliente.
					self viaje agregarCliente: cliente. "La v.i. cliente se crea en el metodo crearObjetoCliente".
					cliente agregarViaje: self viaje.
					self parent activarMensajeExito: 'Se le creo una nueva cuenta al cliente ' , correo , ' con contraseña 123456, y se le dio de alta al viaje correctamente.'  ]
	
]

{ #category : #accessing }
VenderBoletoView >> correo [
	^ correo
]

{ #category : #accessing }
VenderBoletoView >> correo: anObject [
	correo := anObject
]

{ #category : #event }
VenderBoletoView >> crearObjetoCliente [
	cliente := Cliente initializeCon: correo contraseña: '123456' nombre: 'Nombre' apellido: 'Apellido' dni: '13000000' fecha: ('4/21/1994' asDate) plan: PlanBasico new.
]

{ #category : #accessing }
VenderBoletoView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
VenderBoletoView >> parent [
	^ parent
]

{ #category : #accessing }
VenderBoletoView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
VenderBoletoView >> renderContentOn: html [
	html div
		class: 'text-center';
		with: [ html heading level2 with: 'Venta de nuevo boleto'.
			html render:errorView.
			html
				form: [ self renderizarFormulario: html.
					self renderizarBotones: html ] ]
]

{ #category : #rendering }
VenderBoletoView >> renderizarBotones: html [
	html submitButton
		class: 'btn btn-dark';
		callback: [ self confirmarVenta ];
		with: 'Confirmar'.
	html space ; space.
	html submitButton
		class: 'btn btn-dark';
		callback: [ self answer ];
		with: 'Cancelar'
]

{ #category : #rendering }
VenderBoletoView >> renderizarError: unString [
	errorView := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al vender nuevo boleto.'
		item1: unString
		item2: nil
		item3: nil
]

{ #category : #rendering }
VenderBoletoView >> renderizarFormulario:html [
	html label:'Ingrese el correo electronico del cliente' ; break.
	html textInput on:#correo of:self.
	html break ; break.
	html label:'Ingrese la cantidad de boletos que se desean comprar' ; break.
	html textInput on:#cantBoletos of:self.
	html horizontalRule.
	
	
	
]

{ #category : #accessing }
VenderBoletoView >> viaje [
	^ viaje
]

{ #category : #accessing }
VenderBoletoView >> viaje: anObject [
	viaje := anObject
]
