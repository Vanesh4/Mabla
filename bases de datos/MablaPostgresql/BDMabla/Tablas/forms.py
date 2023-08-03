from tkinter import Widget
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from .models import *

User = get_user_model()

class registro(UserCreationForm):
    class Meta:
        model= User
        fields= ['username','first_name', 'last_name', 'email', 'password1', 'password2']
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.pk = self.cleaned_data['username']# Utilizar username como clave primaria
        if commit:
            user.save()
        return user 

class LoginForm(forms.ModelForm):

    imgPerfil = forms.CharField()

    class Meta:
        model = TablaUsuario
        fields = ['username', 'password', 'imgPerfil']
        Widget ={
            'username': forms.TextInput(attrs={'placeholder': 'username'}),
            'password': forms.TextInput(attrs={'placeholder': 'password'}),
            'imgPerfil': forms.TextInput(attrs={'placeholder': 'imgPerfil'}),
        }
