from typing import Any
from django.http import JsonResponse
from django.views.generic import View
from django.http import HttpRequest, JsonResponse
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json
from Tablas.models import *

class getTablaUser(View):
    def get(self,request):
        register= TablaUsuario.objects.all().values()
        registerUser=list(register)
        return JsonResponse(registerUser, safe=False)

class insertTablaUser(View):
    #notacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registerInsertUser=json.loads(request.body)
        request.POST.get('alias')
        request.POST.get('nombre')
        request.POST.get('apellido')
        request.POST.get('telefono')
        request.POST.get('correo')
        request.POST.get('clave')
        request.POST.get('imgPerfil')
        print("datos del cliente ",request.POST)
        registerInsertUser1=TablaUsuario.objects.create(alias=registerInsertUser['alias'],nombre=registerInsertUser['nombre'],apellido=registerInsertUser['apellido'],telefono=registerInsertUser['telefono'],correo=registerInsertUser['correo'],clave=registerInsertUser['clave'], imgPerfil=registerInsertUser['imgPerfil'])
        registerInsertUser1.save()
        return JsonResponse({'mensaje':'datos guardados'})

class editTablaUser(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            pKey=TablaUsuario.objects.get(pk=pk)
        
        except TablaUsuario.DoesNotExist:
            return JsonResponse({'Error':'El alias ingresado no existe'})
        data= json.loads(request.body)
        pKey.nombre=data.get('nombre')
        pKey.apellido=data.get('apellido')
        pKey.telefono=data.get('telefono')
        pKey.correo=data.get('correo')
        pKey.clave=data.get('clave')
        pKey.imgPerfil=data.get('imgPerfil')
        pKey.save()
        return JsonResponse({"Mensaje":"Datos actualizados"})

class getTablaComment(View):
    def get(self,request):
        register= TablaComentarios.objects.all().values()
        registerComment=list(register)
        return JsonResponse(registerComment, safe=False)

class insertComment(View):
    #notacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registerInsertComment=json.loads(request.body)
        request.POST.get('alias')
        request.POST.get('texto')
        print("datos del cliente ",request.POST)
        registerInsertComment1=TablaComentarios.objects.create(alias=registerInsertComment['alias'],texto=registerInsertComment['texto'])
        registerInsertComment1.save()
        return JsonResponse({'mensaje':'datos guardados'})

class editComment(View):
    #anotacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try: 
            pKey = TablaComentarios.objects.get(pk=pk)
        except TablaComentarios.DoesNotExist:
            return JsonResponse({'Error':'El alias ingresado no existe'})
        data = json.loads(request.body)
        #objeto de tipo cliente (registro):
        pKey.texto=data.get('texto')
        pKey.save() 
        return JsonResponse({"Mensaje":"Datos actualizados"})
    
class deleteComment(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def delete(self, request, pk):
        try:
            pKey = TablaComentarios.objects.get(pk=pk)
        except TablaComentarios.DoesNotExist:
            return JsonResponse({"Error":"El alias no existe"})
        
        pKey.delete()
        return JsonResponse({"mensaje":"Datos eliminados"})

class getTablaPrueba(View):
    def get(self,request):
        register= TablaPruebas.objects.all().values()
        registerPrueba=list(register)
        return JsonResponse(registerPrueba, safe=False)

class InsertarPrueba(View):
    #anotacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        #capturados:
        registerInsertPrueba = json.loads(request.body)
        #preparar la manera de enviar los datos
        request.POST.get('idPrueba')
        request.POST.get('alias')
        request.POST.get('tipoPrueba')
        request.POST.get('categoria')
        request.POST.get('fecha')
        request.POST.get('puntaje')
        registerInsertPrueba1 = TablaPruebas.objects.create(idPrueba=registerInsertPrueba['idPrueba'],
                                    alias=registerInsertPrueba['alias'],
                                    tipoPrueba=registerInsertPrueba['tipoPrueba'],
                                    categoria=registerInsertPrueba['categoria'],
                                    fecha=registerInsertPrueba['fecha'],
                                    puntaje=registerInsertPrueba['puntaje'])
        registerInsertPrueba1.save()
        #no es necesario pero es para que genere el aviso:
        return JsonResponse({'mensaje':'datos guardados'})
    

        
