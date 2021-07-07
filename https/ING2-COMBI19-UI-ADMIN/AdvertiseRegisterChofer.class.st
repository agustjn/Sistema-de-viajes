Class {
	#name : #AdvertiseRegisterChofer,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI-ADMIN-Components'
}

{ #category : #rendering }
AdvertiseRegisterChofer >> renderContentOn: html [
	html heading:'Intento de registro de chofer fallido'.
	html text:'Se puede deber a cualquiera de las siguientes causas: '.
	html break.
	html unorderedList:[ html listItem:'El correo electronico ya existe en el sistema '.
								html listItem:'La contraseña debe tener 6 caracteres o mas ' ]
]
