from django.urls import path
from .views import *
from . import views

urlpatterns = [
    path('tablaUsuario',getTablaUser.as_view(), name='tablaUsuario'),
    path('insertUser',insertTablaUser.as_view(), name='insertUser'),
    path('insertUserForm/inicio.html',views.formInsertUser, name='insertUserForm'),
    path('login',views.formIniciarSesion, name='login'),
    path('tablaComment',getTablaComment.as_view(), name='tablaComment'),
    path('editUser/<pk>',editTablaUser.as_view(),name='editUser'),
    path('insertComment',insertComment.as_view(),name='insertComment'),
    path('editComment/<pk>',editComment.as_view(),name='editComment/<pk>'),
    path('deleteComment/<pk>',deleteComment.as_view(),name='deleteComment/<pk>'),
    path('tablaPrueba',getTablaPrueba.as_view(),name='tablaPrueba'),
    path('insertPrueba',insertPrueba.as_view(),name='insertPrueba'),

    path('getPreguntas/',getPreguntas.as_view(),name='getpreg'),
    path('postPreguntas/',PostPreguntas.as_view(),name='postpreg'),
    path('putPregunta/<int:pk>',editPregunta.as_view(), name="editPreg"),
    path('deletePregunta/<int:pk>',deletePregunta.as_view(), name="deletePreg"),

    path('inicio',views.iniciohtml, name="inicio"),
    path('menu',views.menuTodo, name="menu"),
    path('mostrar/',views.vercategorias, name="mostrar"),
    path('mostrarsubcate/',views.versubcategorias, name="mostrarsubcate"),
    path('perfil/',views.verperfil, name="perfil"),
    path('diccio/', views.palabradiccionario, name='diccio'),


    path('getcate',getCategoria.as_view(),name='getcate'),
    path('postcate',postcategoria.as_view(),name='postcate'),
    path('deletecate/<pk>',deletecategoria.as_view(),name='deletecate'),


    path('getsubcate',getsub.as_view(),name='getsubcate'),
    path('postsubcate',postsubcategoria.as_view(),name='postsubcate'),
    path('deletesubcate/<pk>',deletesubcategoria.as_view(),name='deletesubcate'),

    path('getpalabra',getpalabra.as_view(),name='getpalabra'),
    path('postpalabra',postpalabra.as_view(),name='postpalabra'),
    path('deletepalabra/<pk>',deletepalabra.as_view(),name='deletepalabra'),
    path('getpalabrita/<pk>',getPalabraT.as_view(),name='getpalabrita'),

    path('getSubcategorias/<cat>', views.subCategoriasDeCate, name='SucategoriasFiltradas')
]
