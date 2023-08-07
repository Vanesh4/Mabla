from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from .models import *
from django.contrib.auth.forms import AuthenticationForm
from django import forms

User = get_user_model()

class registro(UserCreationForm):
<<<<<<< HEAD
    class Meta:
=======

    password1= forms.CharField()

    class Meta:        
>>>>>>> 528d065a2fd730aec7c5bcdbe1dc6f0071087e59
        model= User
        fields= ['username','first_name', 'last_name', 'email', 'password', 'password1']
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.pk = self.cleaned_data['username']# Utilizar username como clave primaria
        if commit:
            user.save()
        return user 

class LoginForm(AuthenticationForm):
    class Meta:
        model = User
        fields = ['username', 'password']
