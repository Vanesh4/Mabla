from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from .models import *
from django.contrib.auth.forms import AuthenticationForm
from django import forms

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
            'maxlength':'128',
            'minlength':'4'

        })

        self.fields['password2'].widget.attrs.update({
            'required':'',
            'type':'password',
            'maxlength':'128',
            'minlength':'4'
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

class LoginForm(AuthenticationForm):
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

    imgPerfil = forms.ImageField(required=False)
    
    class Meta:
        model = User
        fields= ['first_name', 'last_name', 'email', 'password', 'imgPerfil']

        """ widgets = {
            'username': forms.TextInput(attrs={'id':'username',}),
            'first_name': forms.TextInput(attrs={'id':'first_name',}),
            'last_name': forms.EmailInput(attrs={'id':'last_name',}),
            'email': forms.TextInput(attrs={'id':'email',}),
            'password': forms.TextInput(attrs={'id':'password',}),
            'imgPerfil': forms.TextInput(attrs={'id':'imgPerfil',}),
        } """