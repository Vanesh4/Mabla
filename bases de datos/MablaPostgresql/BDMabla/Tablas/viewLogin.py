from msilib.schema import ListView
from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.views import View
from .models import *
from .forms import *
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages

""" class getUser(ListView):
    def get(self,request):
        users = User.objects.all()
        user_list = []
        for i in  users:
            user_list.append({
                'username': i.username,
                'first_name': i.first_name,
                'last_name': i.last_name,
                'email': i.email,
                'password': i.password,
                'alias': i.alias,
                'imgPerfil': i.imgPerfil,
            })
        
        return JsonResponse(user_list, safe=False) """

class registerUser(View):    
    
    template_name='registro.html'
    
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        form= registro()
        if request.method == 'POST':
            print("en el metodo")
        
            if 'application/json' in request.headers.get('content-type', ''):
                print('en el json')
            
            else:   
                print("no json")
                form= registro(request.POST)
                if form.is_valid():
                    form.save()
                    print("se valido el formulario")
                    messages.success(request, 'Usuario registrado correctamente desde formulario HTML.')
                    return redirect('iniciosesion')
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
 

""" class IniciarSesionView(View):
    def get(self, request):
        form = LoginForm()
        return render(request, 'editUser.html', {'form': form})

    def post(self, request):
        
        form = LoginForm(data=request.POST)
        
        if form.is_valid():
            
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)

            if user is not None:
                #validar si el registro coincide con los datos en la base de datos
                login(request, user)
                try:
                    aliasPk= user.alias
                    #aliasPk=TablaUsuario.objects.get(username=username) 
                    print(aliasPk)
                    
                    if request.method == 'POST' and 'editar' in request.POST:
                        formLog = LoginForm(request.POST, instance=aliasPk)
                        
                        if formLog.is_valid():
                            formLog.save()
                            messages.success(request, 'Cambios guardados')        
                            return redirect ('inicio')
                        
                        else:
                            messages.error(request, 'el usuario no esta registrado')
                    else:
                        formLog=LoginForm(instance=aliasPk)
                    return render(request, 'editUser.html', {'usuario': aliasPk, 'form': formLog})
                    
                except User.DoesNotExist:
                    messages.error(request, 'No se encontraron los datos')
                #return redirect('inicio')  # Redirigir a la página de clientes
          # Redirigir a otra página para otros roles
            else:
                form.add_error(None, 'Credenciales inválidas. Por favor, intenta nuevamente.')

        return render(request, 'editUser.html', {'form': form})
      """

class IniciarSesionView(View):
    def get(self, request):
        form = LoginForm()
        print("formulario:" ,form)
        return render(request, 'login.html', {'form': form})
    
    def post(self, request):
        form = LoginForm(data=request.POST)

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            print("el user: ", user)
            if user is not None:
                login(request, user)
                print("ya se tuvo que redirigir")
                return redirect('iniciosesion')  # Redirigir a la página de clientes
          # Redirigir a otra página para otros roles
            else:
                print("no funciono")
                form.add_error(None, 'Credenciales inválidas. Por favor, intenta nuevamente.')
        
        return render(request, 'login.html', {'form': form})