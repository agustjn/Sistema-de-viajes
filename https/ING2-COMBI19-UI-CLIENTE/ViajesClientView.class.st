Class {
	#name : #ViajesClientView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
ViajesClientView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
ViajesClientView >> parent [
	^ parent
]

{ #category : #accessing }
ViajesClientView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ViajesClientView >> renderContentOn: html [ 
	html div class:'container'; 
				with:[ html div class:'d-grid gap-2 col-2 mx-auto';
									 with:[ html anchor callback:[];
															  with:[ html submitButton class:'btn btn-primary';
																							   with:'Pendientes'].
											  html break ; break.
											  html anchor callback:[];
															  with:[ html submitButton class:'btn btn-primary';
																							   with:'Realizados'].
											  html break ; break.
											  html anchor callback:[ self call: (BuscarViajeClienteView new)];
															  with:[ html submitButton class:'btn btn-primary';
																							   with:'Buscar viaje'].
																							] ].
	
	html horizontalRule.
	
]
