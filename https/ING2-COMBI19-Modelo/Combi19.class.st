Class {
	#name : #Combi19,
	#superclass : #Object,
	#instVars : [
		'clientes',
		'choferes',
		'administrador',
		'publicaciones'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #accessing }
Combi19 class >> clearSoleInstance [
	soleInstance := nil.
]

{ #category : #'instance creation' }
Combi19 class >> instanciaDePrueba [
	| chofer1 chofer2 chofer3 plan1 plan2 tarj1 client1 client2 ruta1 ruta2 lugar1 lugar2 lugar3 lugar4 lugar5 lugar6 combi1 combi2 combi3 insumo1 insumo2 pub1 pub2 viaje1 |
	self soleInstance.
	"---------------------------Planes-------------------"
	plan1 := PlanBasico new.
	plan2 := PlanGold new.
	"-----------------------TarjetasDeCredito----------------"
	tarj1 := TarjetaCredito
		conNumero: '1640193823912345'
		mesVencimiento: '12'
		añoVencimiento: '2024'
		codSeguridad: '760'.
	"---------------------------Usuarios-----------------"
	chofer1 := Chofer
		initializeCon: 'Esteban'
		apellido: 'Perez'
		email: 'chofer1'
		contraseña: '123456'
		telefono: '2218896545'.
	chofer2 := Chofer
		initializeCon: 'Carlos'
		apellido: 'Mansilla'
		email: 'chofer2'
		contraseña: '123456'
		telefono: '22215312'.
	chofer3 := Chofer
		initializeCon: 'Pedro'
		apellido: 'Fonsek'
		email: 'pedro@hotmail.com'
		contraseña: '654321'
		telefono: '2216688388'.
	client1 := Cliente
		initializeCon: 'cliente1'
		contraseña: '123456'
		nombre: 'Javier'
		apellido: 'Gomez'
		dni: '23365435'
		fecha: '3/25/1985'
		plan: plan1.
	client2 := Cliente
		initializeCon: 'cliente2'
		contraseña: '123456'
		nombre: 'Alberto'
		apellido: 'Cardenas'
		dni: '27365435'
		fecha: '7/12/1989'
		plan: plan2.
	client2 agregarTarjeta: tarj1.
	soleInstance
		crearAdmin: 'ING'
		apellido: 'SOFT 2'
		mail: 'admin'
		contraseña: 'admin'.
	soleInstance agregarChofer: chofer1.
	soleInstance agregarChofer: chofer2.
	soleInstance agregarChofer: chofer3.
	soleInstance
		agregarCliente: client1;
		agregarCliente: client2.
	"---------------------------Combis-----------------"
	combi1 := Combi
		initializeModelo: 'Mercedes Benz Sprinter'
		patente: 'CGF-412'
		asientos: 40
		chofer: chofer1
		tipo: 'Semi-Cama'.
	soleInstance administrador agregarCombi: combi1.
	combi2 := Combi
		initializeModelo: 'Ford Transit'
		patente: 'PKP-359'
		asientos: 35
		chofer: chofer2
		tipo: 'Cama'.
	combi3 := Combi
		initializeModelo: 'Chevrolet HH'
		patente: 'PQP-333'
		asientos: 25
		chofer: chofer3
		tipo: 'Semi-Cama'.
	soleInstance administrador agregarCombi: combi2.
	soleInstance administrador agregarCombi: combi3.
	"---------------------------Lugares-----------------"
	lugar1 := Lugar deProvincia: 'Buenos Aires' yLocalidad: 'La Plata'.
	lugar2 := Lugar deProvincia: 'Río Negro' yLocalidad: 'Viedma'.
	lugar3 := Lugar deProvincia: 'Córdoba' yLocalidad: 'Villa Carlos Paz'.
	lugar4 := Lugar
		deProvincia: 'Jujuy'
		yLocalidad: 'San Salvador de Jujuy'.
	lugar5 := Lugar deProvincia: 'La Rioja' yLocalidad: 'Rioja City'.
	lugar6 := Lugar deProvincia: 'Chaco' yLocalidad: 'Resistencia'.
	soleInstance administrador
		agregarLugar: lugar1;
		agregarLugar: lugar2;
		agregarLugar: lugar3;
		agregarLugar: lugar4;
		agregarLugar: lugar5;
		agregarLugar: lugar6.

	"---------------------------Rutas-----------------"
	ruta1 := Ruta
		newCon: lugar1
		destino: lugar2
		combi: combi1
		distancia: '700'
		horario: '5 pm' asTime.
	ruta2 := Ruta
		newCon: lugar3
		destino: lugar4
		combi: combi2
		distancia: '650'
		horario: '3 pm' asTime.
	soleInstance administrador
		agregarRuta: ruta1;
		agregarRuta: ruta2.
	"-----------------------Insumos-------------------------"
	insumo1 := Insumo newNombre: 'Galletitas' marca: 'Oreo' precio: '140'.
	insumo2 := Insumo newNombre: 'Gaseosa' marca: 'Sprite' precio: '85'.
	soleInstance administrador
		agregarInsumo: insumo1;
		agregarInsumo: insumo2.
	"-----------------------Publicaciones-------------------"
	pub1 := Publicacion
		de: chofer1
		conContenido: 'En el ultimo viaje me lleve una buena experiencia!'.
	pub2 := Publicacion
		de: chofer2
		conContenido: 'Estaria bueno que arreglen las combis.'.
	soleInstance
		agregarPublicacion: pub1;
		agregarPublicacion: pub2.
	"-----------------------Viajes------------------------"
	viaje1 := Viaje
		newCon: ruta1
		fecha: '11/13/2021' asDate
		precio: 1500
		asientos: 30.
	soleInstance administrador agregarViaje: viaje1.
	
	viaje1 agregarCliente: client1.
	client1 agregarViaje: viaje1
]

{ #category : #accessing }
Combi19 class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new. ]
]

{ #category : #accessing }
Combi19 >> administrador [
	^ administrador
]

{ #category : #accessing }
Combi19 >> administrador: anObject [
	administrador := anObject
]

{ #category : #accessing }
Combi19 >> agregarChofer: unChofer [
	choferes add: unChofer
]

{ #category : #accessing }
Combi19 >> agregarCliente: unCliente [
	clientes add: unCliente
]

{ #category : #accessing }
Combi19 >> agregarPublicacion: unaPublicacion [
	publicaciones add: unaPublicacion
]

{ #category : #accessing }
Combi19 >> borrarPublicacion: aPublication [
	self publicaciones remove: aPublication 
]

{ #category : #'as yet unclassified' }
Combi19 >> buscarAdminMail: unEmail pass: unaClave [
	administrador email = unEmail & (administrador contraseña = unaClave)
		ifTrue: [ ^ administrador ]
		ifFalse: [ ^ nil ]
]

{ #category : #queries }
Combi19 >> buscarChoferMail: unEmail [
	^ self choferes
		detect:
			[ :unUsuario | unUsuario email = unEmail ]
		ifNone: [ ^nil ]
]

{ #category : #'as yet unclassified' }
Combi19 >> buscarChoferMail: unEmail pass: unaClave [
	^ self choferes
		detect:
			[ :unUsuario | unUsuario email = unEmail & (unUsuario contraseña = unaClave) ]
		ifNone: [ nil ]
]

{ #category : #queries }
Combi19 >> buscarChoferNombre: unNombre [
	^ self choferes
		detect:
			[ :unUsuario | unUsuario nombre = unNombre ]
		ifNone: [ ^nil ]
]

{ #category : #queries }
Combi19 >> buscarClienteMail: unCorreo [
	^ self clientes
		detect:
			[ :unUsuario | unUsuario email = unCorreo ]
		ifNone: [ ^ nil ]
]

{ #category : #queries }
Combi19 >> buscarClienteMail: unEmail pass: unaClave [
	^self clientes
		detect:
			[ :unUsuario | unUsuario email = unEmail & (unUsuario contraseña = unaClave) ]
		ifNone: [ ^ nil ]
]

{ #category : #'as yet unclassified' }
Combi19 >> buscarPasajeroString: unPasajero [
"Busca el pasajero desde un string enviado como parametro"
	^ clientes
		detect: [ :unCliente | unCliente string = unPasajero ]
		ifNone: [ nil ]
]

{ #category : #accessing }
Combi19 >> choferes [
	^choferes
]

{ #category : #accessing }
Combi19 >> choferesDisponibles [
	| dispChoferes |
	dispChoferes := choferes reject: [ :chofer | chofer ocupado ].
	dispChoferes
		ifEmpty: [ ^ OrderedCollection new. ]
		ifNotEmpty: [ ^ (dispChoferes collect: [ :chof | chof nombre ]) asArray ]
]

{ #category : #accessing }
Combi19 >> clientes [
	 ^clientes
]

{ #category : #'accessing - backend' }
Combi19 >> crearAdmin: unNombre apellido: unApellido mail: unEmail contraseña: unaContraseña [
	administrador := Administrador
		initializeCon: unNombre
		apellido: unApellido
		mail: unEmail
		contraseña: unaContraseña.
	^ administrador
]

{ #category : #'accessing - backend' }
Combi19 >> crearChofer: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono [ 
	|unChofer|
	unChofer := Chofer initializeCon: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono.
	choferes add: unChofer.
	^ unChofer
]

{ #category : #'accessing - backend' }
Combi19 >> crearClienteConMail: unEmail contraseña: unaContraseña nombre: unNombre apellido: unApellido dni: unDni fecha: unaFecha plan: unPlan [
	| unCliente |
	unCliente := Cliente
		initializeCon: unEmail
		contraseña: unaContraseña
		nombre: unNombre
		apellido: unApellido
		dni: unDni
		fecha: unaFecha
		plan: unPlan.
	clientes add: unCliente.
	^unCliente
]

{ #category : #'as yet unclassified' }
Combi19 >> editarChofer: unChofer email: unEmail contraseña: unaContraseña telefono: unTelefono nombre: aName apellido: aLastName [
	"Chequea que el email que llega por parametro no lo tenga otro chofer asignado , edita , y devuelve un booleano confirmando o negando accion"
	(choferes anySatisfy: [ :chofer | chofer email = unEmail ])
		ifTrue: [ ^ false ]
		ifFalse: [ unChofer
				editarDatosEmail: unEmail
				contraseña: unaContraseña
				telefono: unTelefono
				nombre: aName 
				apellido: aLastName.
				^ true ]
]

{ #category : #'as yet unclassified' }
Combi19 >> eliminarChofer: unChofer [
	"Si el usuario no esta ocupado y no tiene una combi asignada se elimina y devuelve true, caso contrario no hace nada y devuelve false."

	unChofer ocupado
		&	(administrador hayCombiConChofer: unChofer)
		
		ifFalse: [ choferes remove: unChofer.
			^ true ].
	^ false
]

{ #category : #queries }
Combi19 >> existeMail: unEmail [ 
	^ (self clientes
		anySatisfy:
			[ :unUsuario | unUsuario email = unEmail ]) not
		"Se niega lo retornado para un claro entendimiento del objeto que utiliza este mensaje. Si el
		 email ya existe, se retorna un 'false' para entender que no se cumplio la condicion"
		"Falta verificar si el mail recibido existe en la coleccion choferes..."
]

{ #category : #initialization }
Combi19 >> initialize [
	clientes := OrderedCollection new.
	choferes := OrderedCollection new.
	publicaciones := OrderedCollection new.
]

{ #category : #queries }
Combi19 >> provinciasArgentinas [
	^ #('Buenos Aires'
'Catamarca'
'Chaco'
'Chubut'
'Córdoba'
'Corrientes'
'Entre Ríos'
'Formosa'
'Jujuy'
'La Pampa'
'La Rioja'
'Mendoza'
'Misiones'
'Neuquén'
'Río Negro'
'Salta'
'San Juan'
'Santa Cruz'
'Santa Fe'
'Santiago del Estero'
'Tierra del Fuego'
'Tucumán')
]

{ #category : #accessing }
Combi19 >> publicaciones [
	^ publicaciones
]

{ #category : #queries }
Combi19 >> retornarChoferesAsString [

	^ choferes  collect: [ :chof | chof nombre ].
]

{ #category : #queries }
Combi19 >> usuario: unEmail protegidoPor: unaClave [
	"Busca el usuario en las diferentes colecciones y en caso de exito lo devuelve, sino devuelve nil."

	| elUsuario |
	elUsuario := nil.
	elUsuario := (self buscarClienteMail: unEmail pass: unaClave)
		ifNil: [ (self buscarChoferMail: unEmail pass: unaClave)
				ifNil: (self buscarAdminMail: unEmail pass: unaClave) ].
	^ elUsuario
]

{ #category : #queries }
Combi19 >> validarPublicacion: aPublication [
	^ aPublication contenido byteSize > 10
]

{ #category : #queries }
Combi19 >> validarRegistroChoferConMail: unMail  Password: unPass [
^ ( ( (choferes anySatisfy: [ :chofer | chofer email = unMail ]) not)
		and: unPass size >= 6)
]

{ #category : #queries }
Combi19 >> validarRegistroConMail: unMail  Password: unPass [
( ( (clientes anySatisfy: [ :client | client email = unMail ]) not)
		and: unPass size >= 6)
]

{ #category : #queries }
Combi19 >> validarRegistroConMail: mail Password: contraseña FechaNac: fechaNac [
	^ ( ( (clientes anySatisfy: [ :client | client email = mail ]) not)
		and: contraseña size >= 6)
		and:
			[  (Date today subtractDate: fechaNac asDate) > 6570 ]
		"En la condicion de las fechas, el calculo que se realiza es el dia de hoy menos
		la fecha ingresada por el usuario. Ese calculo se retorna en dias, y 6570 son la cantidad
		de dias que hay en 18 años. Falta mejorarlo"
]
