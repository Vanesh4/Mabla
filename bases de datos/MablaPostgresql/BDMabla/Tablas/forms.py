from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from .models import *
from django.contrib.auth.forms import AuthenticationForm
from django import forms

User = get_user_model()

class registro(UserCreationForm):

    password1= forms.CharField()

    class Meta:        
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
