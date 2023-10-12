import json
from django.contrib.auth import authenticate, login
from django.http import HttpResponseBadRequest, JsonResponse
from django.shortcuts import redirect, render
from django.views import View
from .models import *
from .forms import *
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
import jwt
from datetime import datetime, timedelta
from django.conf import settings

class registerUser(View):    
    
    template_name='registro.html'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):

        form= registro(request.POST)

        if request.method == 'POST':
            print("en el metodo")
        
            if 'application/json' in request.headers.get('content-type', ''):
                
                print('en el json')
                print("Contenido de request.POST:")
                print(request.POST)
                print("Contenido de request.FILES:")
                print(request.FILES)
                self.handle_flutter_data(request)

            else:   
                print("no json")
                print("Contenido de request.POST:")
                print(request.POST)
                print("Contenido de request.FILES:")
                print(request.FILES)

                if form.is_valid():
                    form.save()
                    print("se valido el form")
                    messages.success(request, 'Usuario registrado correctamente desde form HTML.')
                    return redirect('ingresar')
                else:
                    messages.error(request, 'Error al registrar el usuario desde form HTML.')
                    #errors = dict(form.errors.items())
                    #return JsonResponse({"success": False, "errors": errors})
        else:
            print("no metodo")
            form = registro()
          
        return render(request, self.template_name, {'form': form})
    
    def get(self, request):
        form= registro()
        return render(request, self.template_name, {'form': form})

    def handle_flutter_data(self, request):
        try:
            data = json.loads(request.body)
            print("Datos recibidos desde Flutter:")
            print(data)  # Imprime los datos recibidos desde Flutter
            form = registro(data)
            
            if form.is_valid():
                print("Datos válidos:")
                print(form.cleaned_data)  # Imprime los datos validados por el form
                form.save()
                print("si registro en flutter")
                return JsonResponse({'mensaje': 'si registro en flutter'})
            else:
                print("Errores en el form:")
                print(form.errors)  
            
                print("no registro en flutter")
                return JsonResponse({'mensaje': form.errors})

        except json.JSONDecodeError:
            messages.error(request, 'Error en los datos enviados desde Flutter.')
    
            #xreturn JsonResponse({"success": False, "message":'pailax2'})
    
class IniciarSesionView(View):
    print("entro a la vista de iniciar sesion")

    def get(self, request):
        print("entro a la vista de iniciar sesion1")
        form = LoginForm()
        return render(request, 'login.html', {'form': form})
    
    @csrf_exempt
    def dispatch(self, request, *args, **kwargs):
        if request.method.lower() == "get":
            print("entro a la vista de iniciar sesion2")
            return self.get(request, *args, **kwargs)
        elif request.method.lower() == "post":
            print("entro a la vista de iniciar sesion3")
            return self.post(request, *args, **kwargs)
        
        
    def post(self, request):
        accept_header = request.META.get('HTTP_ACCEPT', '')
        print("**********")
        
        if 'application/json' in accept_header:
            print("en json")
            
            try:
                json_data = json.loads(request.body)
                username = json_data.get('username')
                password = json_data.get('password')
                user = authenticate(username=username, password=password)
                if user is not None:
                    print("json validacion")
                    login(request, user) 
                    print("entro a la vista de iniciar sesion4")
                    return JsonResponse({'mensaje': "inicio de sesion exitoso"})
                
                else:
                    return JsonResponse({'mensaje': 'paila'}, status=400)
            
            except json.JSONDecodeError:
                return HttpResponseBadRequest('Invalid JSON data')
        
        else:
            form = LoginForm(data=request.POST)
            if form.is_valid():
                print("wwwwwwww")
                username = form.cleaned_data.get('username')
                password = form.cleaned_data.get('password')
                user = authenticate(username=username, password=password)
                print(user.imgPerfil)
                if user is not None:
                    login(request, user)
                    print("ya se tuvo que redirigir")
                    #print("Contenido de request.FILES:")
                    #print(user.FILES)
                    #return redirect('inicio') 
                    return render(request, 'inicio.html', {'form': form})
                
                # Redirigir a la página de clientes
            # Redirigir a otra página para otros roles
                else:
                    print("no funciono")                    
            else:
                print("noiniciosesion")
                return render(request, 'login.html', {'form': form}) 
        
#@method_decorator(login_required(login_url='ingresar'), name='dispatch')
class profile(View):
    
    template_name = 'perfil.html'
    print("holi")

    def generate_token(self, user):
        token_options = {
            'iat': datetime.utcnow(),
            'exp': datetime.utcnow() + timedelta(milliseconds=10),  # Sepuede cambiar
                        'alias': user.alias,  # Agrega la información que desees al token
        }
        token = jwt.encode(token_options, settings.SECRET_KEY, algorithm='HS256')
        return token

    @method_decorator(login_required(login_url='ingresar'))
    def get(self, request):
        try:
            print(request.user.alias) 
            user= User.objects.get(alias = request.user.alias) 
            print(user.alias)
            user_data = {
                'alias': user.alias,
                'first_name': user.first_name,
                'last_name': user.last_name,
                'email': user.email,
                'imgPerfil': str(user.imgPerfil),
            }
            print(user.username)
            print(user.imgPerfil)
            
            accept_header = request.META.get('HTTP_ACCEPT', '')
            
            if 'application/json' in accept_header:
                token = self.generate_token(request.user)

                return JsonResponse({'token': token, **user_data})
            else:
                form = userData(instance= user)
                return render(request, self.template_name, {'form': form})
            
        except User.DoesNotExist:
            return JsonResponse({'error': 'No se encontraron los datos del cliente.'}, status=400)
        
    @method_decorator(login_required(login_url='ingresar'))
    def post(self, request):
        try:
            user= User.objects.get(alias = request.user.alias) 
            print(user.alias)
            print("el email",user.email)
        
        except User.DoesNotExist:
            messages.error(request, 'No se encontraron los datos del cliente.')

        form = userData(request.POST, instance= user)
        print(user.password)
        print("entro al post")
        if form.is_valid():
            print("el form se valido")
            print("la clave:",user.password)
            form.save()
            print("eeeeeeeeee")              
                #form.save()
            #if form.cleaned_data['imgPerfil'] or form.cleaned_data['imgPerfil'] is None:
            if request.FILES:
                imgPerfil_file = request.FILES['imgPerfil']
                user_instance = form.save(commit=False)
                user_instance.imgPerfil = imgPerfil_file  # Asignar la imgPerfil al campo correspondiente en el modelo
                user_instance.save()

            print("nuevo email:",user.email )
            messages.success(request, 'Cambios guardados correctamente.')
            
            accept_header = request.META.get('HTTP_ACCEPT', '')

            if 'application/json' in accept_header:
                    user_data = {
                        'alias': user.alias,
                        'first_name': user.first_name,
                        'last_name': user.last_name,
                        'email': user.email,
                        'imgPerfil': user.imgPerfil
                    }
                    print(user_data)
                    return JsonResponse(user_data)
            else:
                return render(request, self.template_name, {'form': form}) 
              
        return render(request, self.template_name, {'form': form}) 