from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render
from django.views import View
from .models import *
from .forms import *
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages

class registerUser(View):    
    
    template_name='registro.html'

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

            else:   
                print("no json")
                print("Contenido de request.POST:")
                print(request.POST)
                print("Contenido de request.FILES:")
                print(request.FILES)

                if form.is_valid():
                    form.save()
                    print("se valido el formulario")
                    messages.success(request, 'Usuario registrado correctamente desde formulario HTML.')
                    return redirect('ingresar')
                else:
                    messages.error(request, 'Error al registrar el usuario desde formulario HTML.')
                    print("no ingreso")
        else:
            print("no metodo")
            form = registro()
          
        return render(request, self.template_name, {'form': form})
    
    def get(self, request):
        form= registro()
        return render(request, self.template_name, {'form': form})


class IniciarSesionView(View):
    
    def get(self, request):

        form = LoginForm()
        return render(request, 'login.html', {'form': form})
    
    def post(self, request):

        form = LoginForm(data=request.POST)

        if form.is_valid():

            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            print(user.imgPerfil)
            if user is not None:
                login(request, user)
                print("ya se tuvo que redirigir")
                #print("Contenido de request.FILES:")
                #print(user.FILES)
                return redirect('inicio') 
             # Redirigir a la página de clientes
          # Redirigir a otra página para otros roles
            else:
                print("no funciono")
                form.add_error(None, 'Credenciales inválidas. Por favor, intenta nuevamente.')
        
        return render(request, 'login.html', {'form': form})


@method_decorator(login_required(login_url='ingresar'), name='dispatch')
class profile(View):
    template_name = 'perfilP.html'

    def get(self, request):
        
        print(request.user.alias) 
        user= User.objects.get(alias = request.user.alias) 
        print(user.username)
        print(user.imgPerfil)

        form = userData(instance= user)
        
        return render(request, self.template_name, {'form': form}, 'inicio.html', {'username': user.username, 'imgPerfil': user.imgPerfil})
    
    def post(self, request):
        
        user= User.objects.get(alias = request.user.alias) 
        print(user.alias)
        print("el email",user.email)
        form = userData(request.POST, instance= user)
        print("entro al post")
        
        if form.is_valid():
            print("el formulario se valido")
            form.save()
            
            imagen_file = request.FILES['imgPerfil']
            user_instance = form.save(commit=False)
            print(user_instance)
            user_instance.imgPerfil = imagen_file  # Asignar la imagen al campo correspondiente en el modelo
            user_instance.save()
            return redirect('perfil')

        messages.success(request, 'Cambios guardados correctamente.')

        return render(request, self.template_name, {'form': form})


