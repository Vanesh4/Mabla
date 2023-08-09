from typing import Any
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.views.generic import View, ListView
from django.http import HttpRequest, JsonResponse
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json
from Tablas.models import *

""" #Sara
 #tabla usuario
 
class getTablaUser(ListView):
    def get(self,request):
        register= TablaUsuario.objects.all()
        register_User=[]
        for i in  register:
            register_User.append({
                'alias': i.alias,
                'nombre': i.nombre,
                'apellido': i.apellido,
                'telefono': i.telefono,
                'correo': i.correo,
                'clave': i.clave,
            })
        return JsonResponse(register_User, safe=False)

class inciarSesion(View):
    def get(self, request, pk):
        try:
            pKey=TablaUsuario.objects.get(pk=pk)
        except(json.JSONDecodeError,UnicodeDecodeError):
            return JsonResponse({'error':'Este usuario no existe'})
        data= json.loads(request.body)
        pKey.alias=data.get('alias')
        pKey.clave=data.get('clave')
        try:
            return HttpResponseRedirect('/inicio')
        
        except(json.JSONDecodeError,UnicodeDecodeError):
            return JsonResponse({'error':'La contraseña ingresada no es correcta'})


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
        return HttpResponseRedirect('/inicio')

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
        pKey.save()
        return JsonResponse({"Mensaje":"Datos actualizados"})
 """ 
#tabla comentarios
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

#tabla pruebas
class getTablaPrueba(View):
    def get(self,request):
        register= TablaPrueba.objects.all().values()
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
        registerInsertPrueba1 = TablaPrueba.objects.create(
                                    alias=registerInsertPrueba['alias_id'],
                                    tipoPrueba=registerInsertPrueba['tipoPrueba'],
                                    categoria_id=registerInsertPrueba['categoria_id'],

                                    puntaje=registerInsertPrueba['puntaje'])
        registerInsertPrueba1.save()
        #no es necesario pero es para que genere el aviso:
        return JsonResponse({'mensaje':'datos guardados'})
#Vanesha
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
        #preg.idCategoria=data.get('idCategoria_id')
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


def subCategoriasDeCate(request, cat):
    subCategorias = TablaSubcategoria.objects.filter(categoria=cat)
    subCatedeCate = [
        {
            'subcategoria': TablaSubcategoria.subcategoria,
            
        }     
        for TablaSubcategoria in subCategorias   
    ]
    return JsonResponse(subCatedeCate, safe=False)

def pregTipoCat(request, ti, cat):
    preguntas = TablaPreguntas.objects.filter(idCategoria_id=cat).filter(tipo=ti)
    
    resPreguntas = [
        {
            'id': TablaPreguntas.id,
            'senia': TablaPreguntas.senia,
            'respuesta': TablaPreguntas.respuesta,            
        }     
        for TablaPreguntas in preguntas 
    ]
    return JsonResponse(resPreguntas, safe=False)

#Usuario
class usuarios(View):
    def get(self, request):
        return render(request, 'inicio.html')

def formInsertUser(request):
    return render(request, "registro.html")

def formIniciarSesion(request):
    return render(request, "login.html")

def iniciohtml(request):
    return render(request,"inicio.html")

def viewQuiz(request):
    return render(request,"quizTipo1.html")

def menuTodo(request):
    return render(request,"menu.html")

def vercategorias(request):
    return render(request,"consultando.html")

def versubcategorias(request):
    return render(request, "consultando.html")

def verperfil(request):
    return render(request, "perfil.html")

def palabradiccionario(request):
    listarpalabras=TablaPalabra.objects.filter(Palabra__startswith='P')
    return render(request, "diccionario.html", {"palabrita": listarpalabras })
   #return render(request, "diccionario.html")

def palabrasanimales(request):
    listap=TablaPalabra.objects.filter(subcategoria='Animales')
    return render(request, "consultando.html", {"animales":listap})

def subverbos(request):
    listav=TablaSubcategoria.objects.filter(categoria='Verbos') 
    return render(request, "consultando.html", {"subverbos":listav})

    

def subsustantivos(request):
    sustan=TablaSubcategoria.objects.filter(categoria='Sustantivos')
    return render(request, "consultando.html", {"sustantivos": sustan})

#CRUD TABLA CATEGORIAS
class getCategoria(View):
    def get(self, request):
        datos=TablaCategoria.objects.all()
        datos_Categoria=[]
        for i in datos:
            datos_Categoria.append({
                'Categoria':i.Categoria,
            })
        return JsonResponse(datos_Categoria, safe=False)



class postcategoria(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        datos=json.loads(request.body)
        request.POST.get('Categoria')
        print("categorias", request.POST)
        listcate=TablaCategoria.objects.create(Categoria=datos['Categoria'])
        listcate.save()
        return JsonResponse({'mensaje': 'Datos guardados'})
    
    
class deletecategoria(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaCategoria.objects.get(pk=pk)
        except TablaCategoria.DoesNotExist:
            return JsonResponse({'Error':'Esta categoria no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Datos eliminados"})


#CRUD TABLA SUBCATEGORIA

class getsub(View):
    def get(self,request):
        insert= TablaSubcategoria.objects.all().values()
        insertpalabra=list(insert)
        return JsonResponse(insertpalabra, safe=False)

class getSubcategoria(ListView):
    def get(self, request):
        datos=TablaSubcategoria.objects.all()
        datos_Subcate=[]
        for i in datos:
            datos_Subcate.append({
                'Subcategoria':i.subcategoria,
                'categoria':i.categoria
            })
        return JsonResponse(datos_Subcate, safe=False)
    

class postsubcategoria(View):
    #notacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        data=json.loads(request.body)
        request.POST.get('categoria_id')
        request.POST.get('subcategoria')
        print("Subcategorias",request.POST)
        insert=TablaSubcategoria.objects.create(categoria_id=data['categoria_id'],subcategoria=data['subcategoria'])
        insert.save()
        return JsonResponse({'mensaje':'datos guardados'})

class deletesubcategoria(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaSubcategoria.objects.get(pk=pk)
        except TablaSubcategoria.DoesNotExist:
            return JsonResponse({'Error':'Esta subactegoria no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Datos eliminados"})
    

#CRUD TABLA PALABRA

class getpalabra(View):
    def get(self, request):
        datos=TablaPalabra.objects.all().values
        insertpalabrita=list(datos)
        return JsonResponse(insertpalabrita, safe=False)

class getPalabraT(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def get(self, request, pk):
        try:
            registro=TablaPalabra.objects.get(pk==pk)     
        except TablaPalabra.DoesNotExist:
            return JsonResponse({'Error':'Esta palabra no existe'})
        
        mostrar=list(registro)
        return JsonResponse(mostrar, safe=False)



class postpalabra(View):
    #notacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        data=json.loads(request.body)
        request.POST.get('Palabra')
        request.POST.get('subcategoria_id')
        request.POST.get('Senia')
        print("palabras",request.POST)
        insert=TablaPalabra.objects.create(Palabra=data['Palabra'],subcategoria_id=data['subcategoria_id'], Senia=data['Senia'])
        insert.save()
        return JsonResponse({'mensaje':'Palabra guardada'})

class deletepalabra(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaPalabra.objects.get(pk=pk)
        except TablaPalabra.DoesNotExist:
            return JsonResponse({'Error':'Esta palabra no existe'})
        registro.delete()
        return JsonResponse({'mensaje': "Palabra eliminada"})


