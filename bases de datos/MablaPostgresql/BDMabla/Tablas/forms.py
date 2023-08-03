from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import AuthenticationForm

User = get_user_model()

class registro(UserCreationForm):
    
    telefono =forms.IntegerField()

    class Meta:
        model= User
        fields= ['username','first_name', 'last_name', 'telefono', 'email', 'password1', 'password2']
    
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
