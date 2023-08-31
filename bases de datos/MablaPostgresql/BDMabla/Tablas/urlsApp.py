from django.urls import path
from .viewLogin import *
from .views import *
from . import views
from django.conf import settings
from django.conf.urls.static import static 

urlpatterns = [
    #path('insertUser',insertTablaUser.as_view(), name='insertUser'),
    #path('insertUserForm/inicio.html',views.formInsertUser, name='insertUserForm'),
    path('register',registerUser.as_view(), name='register'),
    #path('login',views.formIniciarSesion, name='login'),
    #path('registroForm',registerUser.as_view(), name='registroForm'),
    path('ingresar',IniciarSesionView.as_view(), name='ingresar'),
    #path('users',getUser.as_view(), name='users'),
    path('tablaComment',getTablaComment.as_view(), name='tablaComment'),
    #path('editUser/<pk>',editTablaUser.as_view(),name='editUser'),
    path('postComment',postComment.as_view(),name='insertComment'),
    path('editComment/<pk>',editComment.as_view(),name='editComment/<pk>'),
    path('deleteComment/<pk>',deleteComment.as_view(),name='deleteComment/<pk>'),
    path('tablaPrueba',getTablaPrueba.as_view(),name='tablaPrueba'),
    path('insertPrueba',insertPrueba.as_view(),name='insertPrueba'),

    path('getPreguntas/',getPreguntas.as_view(),name='getpreg'),
    path('postPreguntas/',PostPreguntas.as_view(),name='postpreg'),
    path('putPregunta/<int:pk>',editPregunta.as_view(), name="editPreg"),
    path('deletePregunta/<int:pk>',deletePregunta.as_view(), name="deletePreg"),

    path('',views.iniciohtml, name="inicio"),
    path('iniciosesion',views.inicioConSesion, name="iniciosesion"),
    path('quiz',views.viewQuiz, name="quiz"),
    path('menu',views.menuTodo, name="menu"),
    path('mostrar/',views.vercategorias, name="mostrar"),
    path('mostrarsubcate/',views.versubcategorias, name="mostrarsubcate"),
    path('perfil',profile.as_view(), name="perfil"),
    path('diccio/', views.palabradiccionario, name='diccio'),

    path('getcate',getCategoria.as_view(),name='getcate'),
    path('getcategoria',ListaConsultando.as_view(),name='getcate'),
    path('postcate',postcategoria.as_view(),name='postcate'),
    path('deletecate/<pk>',deletecategoria.as_view(),name='deletecate'),


    path('getsubcate',getsub.as_view(),name='getsubcate'),
    path('postsubcate',postsubcategoria.as_view(),name='postsubcate'),
    path('deletesubcate/<pk>',deletesubcategoria.as_view(),name='deletesubcate'),

    path('getpalabra',verpalabra.as_view(),name='getpalabra'),
    #path('getpalsubcate',getPalabrassubcate.as_view(),name='getpalsubcate'),
    path('postpalabra',postpalabra.as_view(),name='postpalabra'),
    path('deletepalabra/<pk>',deletepalabra.as_view(),name='deletepalabra'),
    path('getpalabrita/<pk>',getPalabraT.as_view(),name='getpalabrita'),

    #path('getSubcategorias/<cat>', views.subCategoriasDeCate, name='SucategoriasFiltradas'),

    path('getSubcategorias/<cat>', views.subCategoriasDeCate, name='SucategoriasFiltradas'),
    path('getpalabrassub/<subcate>', views.palabrasdesubcate, name='palabrasFiltradas'),
    path('getpalabrasdiccio/<inicial>', views.buscar_por_inicial, name='getpalabrasdiccio'),


    
    path('preguntas/<ti>/<cat>', views.pregTipoCat, name='PreguntasFiltradas'),
    path('listaCatSub', ListaCategoriaSub.as_view(), name='listaCatSub'),

] + static(settings.MEDIA_URL, document_root= settings.MEDIA_ROOT)


