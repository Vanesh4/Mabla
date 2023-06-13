from typing import Any

from django import http
from django.shortcuts import render
from django.views.generic import ListView, View
from Tablas.models import *
from django.http import JsonResponse, HttpRequest

from django.http import JsonResponse
from django.views.generic import View
from django.http import HttpRequest, JsonResponse

from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json
from Tablas.models import *




class listaCategoria(View):
    def get(self, request):
        registro=TablaCategoria.objects.all().values()
        registrocate=list(registro)
        return JsonResponse(registrocate, safe=False)
    

class getTablaUser(View):
    def get(self,request):
        register= TablaUsuario.objects.all().values()
        registerUser=list(register)
        return JsonResponse(registerUser, safe=False)

class InsertCate(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):

        registro=json.loads(request.body)
        request.POST.get('IdCategoria')
        request.POST.get('Categoria')
        print("Datos de Categoria", request.POST)
        cate=TablaCategoria.objects.create(IdCategoria=registro['IdCategoria'], Categoria=registro['Categoria'])
        cate.save()
        return JsonResponse({'mensaje': 'Registro guardado'})
    


class ActualizarCate(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            registro=TablaCategoria.objects.get(pk=pk)
        except TablaCategoria.DoesNotExist:
            return JsonResponse({'Error':'este Id de categoria no existe'})
        data=json.loads(request.body)
        registro.Categoria=data.get('Categoria')
        registro.save()
        return JsonResponse({'mensaje':'Se ha actualizado correctamente'})

class EliminarCate(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaCategoria.objects.get(pk=pk)
        except TablaCategoria.DoesNotExist:
            return JsonResponse({'Error':'El Id de categoria no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Categoria eliminada"})


#METODOS DE LA TABLA SUBCATEGORIA
class listSubcategoria(View):
    def get(self, request):
        registro=TablaSubcategoria.objects.all().values()
        registrosub=list(registro)
        return JsonResponse(registrosub, safe=False)


class insertTablaUser(View):
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


class Insertsub(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    

    def post(self, request):
        registro=json.loads(request.body)
        request.POST.get('IdSubcategoria')
        request.POST.get('IdCategoria_id')
        request.POST.get('Subcategoria')
        print("Datos de Categoria", request.POST)
        sub=TablaSubcategoria.objects.create(IdSubcategoria=registro['IdSubcategoria'], IdCategoria_id=registro['IdCategoria_id'], Subcategoria=registro['Subcategoria'])
        sub.save()
        return JsonResponse({'mensaje': 'Registro guardado'})
    
class ActualizarSub(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            registro=TablaSubcategoria.objects.get(pk=pk)
        except TablaSubcategoria.DoesNotExist:
            return JsonResponse({'Error':'este Id de subcategoria no existe'})
        data=json.loads(request.body)
        registro.IdSubcategoria=data.get('IdSubcategoria')
        registro.Subcategoria=data.get('Subcategoria')
        registro.save()
        return JsonResponse({'mensaje':'Se ha actualizado correctamente'})
    
class EliminarSub(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaSubcategoria.objects.get(pk=pk)
        except TablaSubcategoria.DoesNotExist:
            return JsonResponse({'Error':'El Id de subcategoria no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Subcategoria eliminada"})


#METODOS DE LA TABLA PALABRA
class listpalabra(View):
    def get(self, request):
        registro=TablaPalabra.objects.all().values()
        registropal=list(registro)
        return JsonResponse(registropal, safe=False)


class InsertarPal(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registro=json.loads(request.body)
        request.POST.get('Palabra')
        request.POST.get('IdCategoria')
        request.POST.get('Senia')
        print("Datos de Categoria", request.POST)
        pal=TablaSubcategoria.objects.create(Palabra=registro['Palabra'], IdCategoria=registro['IdCategoria'], Senia=registro['Senia'])
        pal.save()
        return JsonResponse({'mensaje': 'Palbra guardada'})
    
class ActualizarPal(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            registro=TablaPalabra.objects.get(pk=pk)
        except TablaPalabra.DoesNotExist:
            return JsonResponse({'Error':'esta palabra no existe'})
        data=json.loads(request.body)
        registro.Palabra=data.get('Palabra')
        registro.Senia=data.get('Senia')
        registro.save()
        return JsonResponse({'mensaje':'Se ha actualizado correctamente'})
    
class EliminarPal(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaPalabra.objects.get(pk=pk)
        except TablaPalabra.DoesNotExist:
            return JsonResponse({'Error':'Esta palabra no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Palabtra eliminada"})

class editTablaUser(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
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

class InsertarPrueba(View):
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
        request.POST.get('categoria')
        request.POST.get('puntaje')
        registerInsertPrueba1 = TablaPruebas.objects.create(alias_id=registerInsertPrueba['alias_id'],
                                      tipoPrueba=registerInsertPrueba['tipoPrueba'],
                                      categoria=registerInsertPrueba['categoria'],
                                      puntaje=registerInsertPrueba['puntaje'])
        registerInsertPrueba1.save()
        #no es necesario pero es para que genere el aviso:
        return JsonResponse({'mensaje':'datos guardados'})

