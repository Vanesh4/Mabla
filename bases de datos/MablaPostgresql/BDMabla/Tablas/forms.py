""" from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model

user = get_user_model()

class registro(UserCreationForm):
    alias=forms.CharField(max_length=30)
    clave= forms.CharField(max_length=30)
    imgPerfil=forms.ImageField(required=False)

    class Meta:
        model= user
        fields= ['alias', 'nombre', 'apellido', 'telefono', 'correo', 'clave'] """