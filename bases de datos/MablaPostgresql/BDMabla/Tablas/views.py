from typing import Any
from django.http import JsonResponse
from django.shortcuts import render
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
        try:
            registerInsertUser=json.loads(request.body)

        except(json.JSONDecodeError,UnicodeDecodeError):
            return JsonResponse({'error':'El alias ingresado ya existe'})
        
        alias=registerInsertUser.get('alias')
        nombre=registerInsertUser.get('nombre')
        apellido=registerInsertUser.get('apellido')
        telefono=registerInsertUser.get('telefono')
        correo=registerInsertUser.get('correo')
        clave=registerInsertUser.get('clave')
        print("datos del cliente ",request.POST)
        TablaUsuario.objects.create(alias=alias,nombre=nombre,apellido=apellido,telefono=telefono,correo=correo,clave=clave)
        #return JsonResponse({'mensaje':'datos guardados'})
        return JsonResponse({"mensaje": "Datos guardados"})

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
        request.POST.get('alias_id')
        request.POST.get('texto')
        print("datos del cliente ",request.POST)
        registerInsertComment1=TablaComentarios.objects.create(texto=registerInsertComment['texto'], alias_id=registerInsertComment['alias_id'])
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

class insertPrueba(View):
    #anotacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        #capturados:
        registerInsertPrueba = json.loads(request.body)
        #preparar la manera de enviar los datos
        request.POST.get('alias_id')
        request.POST.get('tipoPrueba')
        request.POST.get('categoria_id')
        request.POST.get('puntaje')
        registerInsertPrueba1 = TablaPruebas.objects.create(idPrueba=registerInsertPrueba['idPrueba'],
                                    alias=registerInsertPrueba['alias'],
                                    tipoPrueba=registerInsertPrueba['tipoPrueba'],
                                    categoria_id=registerInsertPrueba['categoria_id'],
                                    fecha=registerInsertPrueba['fecha'],
                                    puntaje=registerInsertPrueba['puntaje'])
        registerInsertPrueba1.save()
        #no es necesario pero es para que genere el aviso:
        return JsonResponse({'mensaje':'datos guardados'})

#Tabla preguntas
class getPreguntas(View):
    def get(self,request):
        register= TablaPreguntas.objects.all().values()
        registerPregs=list(register)
        return JsonResponse(registerPregs, safe=False)

class PostPreguntas(View):
    #anotacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        #capturados:
        registerpreg = json.loads(request.body)
        #preparar la manera de enviar los datos
        request.POST.get('tipo')
        request.POST.get('idCategoria_id')
        request.POST.get('senia')
        request.POST.get('respuesta')
        pregunta = TablaPreguntas.objects.create(tipo=registerpreg['tipo'],
                                    idCategoria_id=registerpreg['idCategoria_id'],
                                    senia=registerpreg['senia'],
                                    respuesta=registerpreg['respuesta'],)
        pregunta.save()
        #no es necesario pero es para que genere el aviso:
        return JsonResponse({'mensaje':'datos guardados'})

class editPregunta(View):
    #anotacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try: 
            preg = TablaPreguntas.objects.get(pk=pk)
        except TablaPreguntas.DoesNotExist:
            return JsonResponse({'Error':'El numero de pregunta ingresada no existe'})
    
        data = json.loads(request.body)
    
        preg.tipo=data.get('tipo')
        preg.senia=data.get('senia')
        preg.idCategoria=data.get('idCategoria_id')
        preg.respuesta=data.get('respuesta')
        preg.save() 
        return JsonResponse({"Mensaje":"Datos actualizados"})
    
class deletePregunta(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def delete(self, request, pk):
        try:
            preg = TablaPreguntas.objects.get(pk=pk)
        except TablaPreguntas.DoesNotExist:
            return JsonResponse({"Error":"El numero de pregunta ingresado no existe"})
        
        preg.delete()
        return JsonResponse({"mensaje":"Datos eliminados"})


def formInsert(request):
    return render(request, "registro.html")

def iniciohtml(request):
    return render(request,"inicio.html")
