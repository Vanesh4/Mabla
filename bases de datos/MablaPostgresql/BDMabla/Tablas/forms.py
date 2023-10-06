from django.core.exceptions import ValidationError
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from .models import *
from django.contrib.auth.forms import AuthenticationForm
from django import forms
from django.contrib.auth.password_validation import validate_password

User = get_user_model()

class registro(UserCreationForm):
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        self.fields['username'].widget.attrs.update({
            'required':'',
            'maxlength':'150',
            'minlength':'1'
        })

        self.fields['first_name'].widget.attrs.update({
            'required':'',
            'maxlength':'150',
            'minlength':'1'
        })

        self.fields['last_name'].widget.attrs.update({
            'required':'',
            'maxlength':'150',
            'minlength':'1'
        })

        self.fields['email'].widget.attrs.update({
            'required':'',
            'maxlength':'254',
            'minlength':'13'
        })

        self.fields['password1'].widget.attrs.update({
            'required':'',
            'type':'password',
            'id':'password',
            'minlength':'4',
            'maxlength':'128'

        })

        self.fields['password2'].widget.attrs.update({
            'required':'',
            'type':'password',
            'id':'password1',
        })
    class Meta:            
        model= User
        fields= ['username','first_name', 'last_name', 'email', 'password1', 'password2']
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.pk = self.cleaned_data['username']# Utilizar username como clave primaria
        if commit:
            user.save()
        return user 
    
    """ def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")

        # Validación de contraseñas diferentes
        if password1 and password2 and password1 != password2:
            raise ValidationError("Las contraseñas no coinciden.")

        return password2
    """
    def clean_password1(self):
        password1 = self.cleaned_data.get("password1")

        # Validación de la longitud de la contraseña
        if password1 and len(password1) < 8:
            raise ValidationError("La contraseña debe tener al menos 8 caracteres.")

        # Otras validaciones personalizadas, como caracteres especiales, números, etc.
        try:
            validate_password(password1)
        except ValidationError as error:
            raise ValidationError("Contraseña no válida: " + str(error))
        return password1
    
class LoginForm(AuthenticationForm):  
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)        
        
        self.fields['password'].widget.attrs.update({
            'id':'password',
        })

    class Meta:
        model = User
        fields = ['username', 'password']
        

class userData(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        self.fields['imgPerfil'].widget.attrs.update({
             'type':'file',
             'class':'form-input',
        })
        
    
    """ first_name = forms.CharField(required=False)
    last_name = forms.CharField(required=False)
    email = forms.EmailField(required=False)
    password = forms.CharField(required=False)
    imgPerfil = forms.ImageField(required=False) """
    
    class Meta:
        model = User
        fields= ['first_name', 'last_name', 'email','imgPerfil']