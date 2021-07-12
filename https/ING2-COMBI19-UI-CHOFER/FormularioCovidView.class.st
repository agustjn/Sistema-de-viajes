Class {
	#name : #FormularioCovidView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'pasajero',
		'temperatura',
		'fiebre',
		'garganta',
		'olfato',
		'respiratoria',
		'viaje'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
FormularioCovidView class >> newWith: unPasajero parent: aParent [
^ self new
		parent: aParent;
		pasajero: unPasajero;
		yourself
	
]

{ #category : #'instance creation' }
FormularioCovidView class >> newWith: unPasajero parent: aParent viaje: unViaje [
	^ self new
		parent: aParent;
		pasajero: unPasajero;
		viaje: unViaje ;yourself
]

{ #category : #'as yet unclassified' }
FormularioCovidView >> advertenciaCorrecta [
	self parent
		activarMensaje: 'Se le dio el presente a el pasajero: ' , self pasajero string. self answer
]

{ #category : #'as yet unclassified' }
FormularioCovidView >> advertenciaSintomas [
	self parent
		activarMensaje:  'no se puede dar de alta a ',pasajero string, ' por ser sospechoso de covid 19  y se lo bloquea por 15 dias para cualquier proximo viaje'.
	self answer
]

{ #category : #'as yet unclassified' }
FormularioCovidView >> advertenciaTemperatura [
	self parent
		activarMensaje:
			' no se puede dar de alta a ' , pasajero string
				,
					' por ser sospechoso de covid 19, teniendo mas de 38 grados y se lo bloquea por 15 dias para cualquier proximo viaje'.
	self answer
]

{ #category : #'as yet unclassified' }
FormularioCovidView >> confirmar [
	| cant |
	cant := 0.
	temperatura = 'Si'
		ifTrue: [ self darDeBaja.
			self advertenciaTemperatura ]
		ifFalse: [ fiebre = 'Si'
				ifTrue: [ cant := cant + 1 ].
			garganta = 'Si'
				ifTrue: [ cant := cant + 1 ].
			olfato = 'Si'
				ifTrue: [ cant := cant + 1 ].
			respiratoria = 'Si'
				ifTrue: [ cant := cant + 1 ].
			cant > 1
				ifTrue: [ self darDeBaja.
					self advertenciaSintomas ]
				ifFalse: [ self viaje presente: self pasajero.
					self advertenciaCorrecta ] ]
]

{ #category : #'as yet unclassified' }
FormularioCovidView >> darDeBaja [
	self viaje rechazado: self pasajero.
	self pasajero sospechoso: true.
	self pasajero fechaSospecha: (viaje fecha asDate).
	self pasajero darDeBajaViajesProximos.
	
]

{ #category : #accessing }
FormularioCovidView >> fiebre [
	^ fiebre
]

{ #category : #accessing }
FormularioCovidView >> fiebre: anObject [
	fiebre := anObject
]

{ #category : #accessing }
FormularioCovidView >> garganta [
	^ garganta
]

{ #category : #accessing }
FormularioCovidView >> garganta: anObject [
	garganta := anObject
]

{ #category : #accessing }
FormularioCovidView >> olfato [
	^ olfato
]

{ #category : #accessing }
FormularioCovidView >> olfato: anObject [
	olfato := anObject
]

{ #category : #accessing }
FormularioCovidView >> parent [
	^parent
]

{ #category : #accessing }
FormularioCovidView >> parent: aParent [
	parent := aParent
]

{ #category : #accessing }
FormularioCovidView >> pasajero [
	^pasajero
]

{ #category : #accessing }
FormularioCovidView >> pasajero: unPasajero [
	pasajero:= unPasajero
]

{ #category : #accessing }
FormularioCovidView >> renderContentOn: html [
	self
		renderizarAviso: html .
		html
		 form: [ self renderizarFormularioOn: html.
					self renderizarBotones: html ]
]

{ #category : #rendering }
FormularioCovidView >> renderizarAviso: html [
html space.
	html horizontalRule.
	html
		strong: 'Aviso';
		break.
	html
		text: 'Si tiene mas de 38 grados  o   tiene mas de 1 sintoma';
		break.
	html
		text: 'Sera rechazado y puesto en una lista por 15 dias ';
		break;
		break;
		horizontalRule
]

{ #category : #rendering }
FormularioCovidView >> renderizarBotones: html [
	html div
		class: ' my-0';
		with: [ html submitButton
				callback: [ self confirmar ];
				class: 'btn btn-success mx-2';
				with:  'Confirmar ' .
			html submitButton
				class: 'btn btn-outline-danger';
				callback: [ self answer ];
				with:  'Cancelar '  ]
]

{ #category : #rendering }
FormularioCovidView >> renderizarFormularioOn: html [
	html div
		class: 'form-group col-12 ';
		with: [ html
				label: '¿El pasajero tiene mas de 38 grados en la ultima semana?'.
			html select
				class: 'form-control required col-2 text-center';
				list: #(#Si #No);
				selected: temperatura;
				callback: [ :value | temperatura := value ] ].
	html div
		class: 'form-group col-12 ';
		with: [ html label: '¿El pasajero tuvo fiebre la ultima semana?'.
			html select
				class: 'form-control required col-2 text-center';
				list: #(#Si #No);
				selected: fiebre;
				callback: [ :value | fiebre := value ] ].
	html div
		class: 'form-group col-12 ';
		with: [ html label: '¿El pasajero tuvo perdida de gusto  u olfato?'.
			html select
				class: 'form-control required col-2 text-center';
				list: #(#Si #No);
				selected: olfato;
				callback: [ :value | olfato := value ] ].
	html div
		class: 'form-group col-12 ';
		with: [ html label: '¿El pasajero tuvo dificultad respiratoria?'.
			html select
				class: 'form-control required col-2 text-center';
				list: #(#Si #No);
				selected: respiratoria;
				callback: [ :value | respiratoria := value ] ].
	html div
		class: 'form-group col-12 ';
		with: [ html label: '¿El pasajero tuvo dolor de garganta?'.
			html select
				class: 'form-control required col-2 text-center';
				list: #(#Si #No);
				selected: garganta;
				callback: [ :value | garganta := value ] ]
]

{ #category : #accessing }
FormularioCovidView >> respiratoria [
	^ respiratoria
]

{ #category : #accessing }
FormularioCovidView >> respiratoria: anObject [
	respiratoria := anObject
]

{ #category : #accessing }
FormularioCovidView >> temperatura [
	^ temperatura
]

{ #category : #accessing }
FormularioCovidView >> temperatura1: anObject [
	^ temperatura := anObject
]

{ #category : #accessing }
FormularioCovidView >> temperatura: anObject [
	temperatura := anObject
]

{ #category : #accessing }
FormularioCovidView >> viaje [
	^ viaje
]

{ #category : #accessing }
FormularioCovidView >> viaje: anObject [
	viaje := anObject
]
