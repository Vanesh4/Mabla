from django.shortcuts import render, redirect
from django.views.generic import View

from Tablas.models import *
from django.contrib.auth.decorators import login_required

from django.contrib.auth import logout



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

def inicioConSesion(request):
    return render(request,"inicioConSesion.html")

@login_required
def viewQuiz1(request):
    return render(request,"quizTipo1.html")
                  
""" def viewQuiz1(request):
    return render(request,"quizTipo1.html") """
def viewQuiz2(request):
    return render(request,"quizTipo2.html")

def menuTodo(request):
    return render(request,"menu.html")

def cont321(request):
    return render(request,"contadorQuiz.html")

def vercategorias(request):
    return render(request,"consultando.html")

def pagError(request):
    return render(request,"paginaERROR.html")

def versubcategorias(request):
    return render(request, "consultando.html")

def verperfil(request):
    return render(request, "perfil.html")

def sobreNosotrxs(request):
    return render(request,"nosotrxs.html")

def prueba(request):
    return render(request, "perfilP.html")

def palabradiccionario(request):
    listarpalabras=TablaPalabra.objects.filter(Palabra__startswith='P')
    return render(request, "diccionario.html", {"palabrita": listarpalabras })
   #return render(request, "diccionario.html")

def cerrarSesion(request):
    logout(request)  # Cierra la sesión del usuario
    return redirect('inicio')  # Redirige a la página de inicio o a donde desees después de cerrar la sesión
