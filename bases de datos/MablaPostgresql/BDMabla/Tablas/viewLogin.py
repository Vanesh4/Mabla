""" from django.shortcuts import redirect, render
from django.views import View
from .forms import *

class registerUser(View):
    def get(self, request):
        form= registro()
        return render(request, 'formRegister',{'form': form})
    
    def post(self, request):
        form= registro(request.POST)
        if form.is_valid():
            form.save()
            return redirect('home')
        return render(request, 'formRegister',{'form': form}) """
