Class {
	#name : #ChoferEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'chofer',
		'name',
		'lastname',
		'mail',
		'password',
		'telefono',
		'errorView'
	],
	#category : #'ING2-COMBI19-UI-Chofer-CRUD-UI'
}

{ #category : #'instance creation' }
ChoferEditorView class >> newOf: aChofer [
	| instance |
	instance := self new.
	instance chofer: aChofer.
	^ instance
]

{ #category : #accessing }
ChoferEditorView >> chofer [
	^ chofer
]

{ #category : #accessing }
ChoferEditorView >> chofer: anObject [
	chofer := anObject
]

{ #category : #event }
ChoferEditorView >> editarChofer [
	(self model editarChofer: chofer email: mail contraseña: password telefono: telefono nombre: name apellido:lastname)
		ifFalse:[ errorView := GenericAdvertiseView newWithParent: self 
																heading:'Error al editar chofer'  
																item1:'El correo ingresado ya existe en el sistema.'
																item2: nil
																item3: nil]
		ifTrue:[ self answer ]
]

{ #category : #initialization }
ChoferEditorView >> initialize [
	super initialize.
]

{ #category : #accessing }
ChoferEditorView >> lastname [
	^ lastname
]

{ #category : #accessing }
ChoferEditorView >> lastname: anObject [
	lastname := anObject
]

{ #category : #accessing }
ChoferEditorView >> mail [
	^ mail
]

{ #category : #accessing }
ChoferEditorView >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
ChoferEditorView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
ChoferEditorView >> name [
	^ name
]

{ #category : #accessing }
ChoferEditorView >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ChoferEditorView >> password [
	^ password
]

{ #category : #accessing }
ChoferEditorView >> password: anObject [
	password := anObject
]

{ #category : #rendering }
ChoferEditorView >> renderContentOn: html [
	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html.
			html render: errorView.


			 ]
]

{ #category : #rendering }
ChoferEditorView >> renderizarAdvertencia: aCanvas [
	aCanvas
		div: [ aCanvas heading level5 with: 'Aviso'.
		 aCanvas
				unorderedList: [ 
					aCanvas
						listItem: 'Los campos que no se quieran modificar, se deben dejar vacios.'.
					aCanvas listItem: 'Los caracteres en transparente indican los datos previos a la edicion.' ] ]
]

{ #category : #rendering }
ChoferEditorView >> renderizarBotonesOn: aCanvas [

	aCanvas submitButton
					class:'btn btn-primary';
					callback: [ self editarChofer ] ;
					value:'Confirmar!'.
	aCanvas space.
	aCanvas submitButton
		class:'btn btn-danger';
		callback: [ self answer ];
		value:'Cancelar' 
]

{ #category : #rendering }
ChoferEditorView >> renderizarCamposBasicosOn: aCanvas [
	aCanvas horizontalRule.
	aCanvas heading
	level:4;
	with: 'Editar datos'.	
	self renderizarAdvertencia: aCanvas.
	self renderizarCamposOn: aCanvas.
]

{ #category : #rendering }
ChoferEditorView >> renderizarCamposOn: aCanvas [
	aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Nombre'.	
			aCanvas textInput 
			placeholder:chofer nombre ;
			class: 'form-control required ml-4';
			on: #name of: self.].
		aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Apellido/s'.	
			aCanvas textInput 
			placeholder: chofer apellido;
			class: 'form-control required ml-4';
			on: #lastname of: self.].
	
	aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Correo Electronico'.	
			aCanvas textInput 
			placeholder:chofer email;
			class: 'form-control required ml-4';
			on: #mail of: self.].
	aCanvas div
			class: 'form-group col-4';
			with:[
			aCanvas label: 'Contraseña'.	
			aCanvas passwordInput 
			placeholder:'Contraseña';
			class: 'form-control required ml-4';
			on: #password of: self.].
	aCanvas div
			class: 'form-group col-4';
			with:[
			aCanvas label: 'Telefono'.	
			aCanvas numberInput 
			placeholder:chofer telefono;
			class: 'form-control required ml-4';
			on: #telefono of: self.].
	
]

{ #category : #accessing }
ChoferEditorView >> telefono [
	^ telefono
]

{ #category : #accessing }
ChoferEditorView >> telefono: anObject [
	telefono := anObject
]
