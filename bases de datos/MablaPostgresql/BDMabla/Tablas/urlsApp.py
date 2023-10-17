from django.urls import path
from .viewLogin import *
from .views import *
from . import viewLogin
from . import views
from . import viewsPlantillas
from django.conf import settings
from django.conf.urls.static import static
from rest_framework_simplejwt.views import TokenRefreshView
from rest_framework_simplejwt.views import TokenObtainPairView 
from django.contrib.auth.views import PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView  
from django.contrib.auth import views as auth_views

urlpatterns = [
    #path('insertUser',insertTablaUser.as_view(), name='insertUser'),
    #path('insertUserForm/inicio.html',views.formInsertUser, name='insertUserForm'),
    path('verificarS', viewLogin.verificarS, name='verificarS'),
    path('register',registerUser.as_view(), name='register'),
    #path('login',views.formIniciarSesion, name='login'),
    #path('registroForm',registerUser.as_view(), name='registroForm'),
    path('ingresar',IniciarSesionView.as_view(), name='ingresar'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),  # Ruta para obtener el token JWT
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),  # Ruta para refrescar el token JWT
    path('logOut', viewsPlantillas.cerrarSesion, name='logOut'),
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

    path('',viewsPlantillas.iniciohtml, name="inicio"),
    path('iniciosesion',viewsPlantillas.inicioConSesion, name="iniciosesion"),
    path('quizTipo1',viewsPlantillas.viewQuiz1, name="quiz1"),
    path('quizTipo2',viewsPlantillas.viewQuiz2, name="quiz2"),
    path('menu',viewsPlantillas.menuTodo, name="menu"),
    path('animacion',viewsPlantillas.cont321, name="animacion quiz"),
    path('mostrar/',viewsPlantillas.vercategorias, name="mostrar"),
    path('mostrarsubcate/',viewsPlantillas.versubcategorias, name="mostrarsubcate"),
    path('perfil',profile.as_view(), name="perfil"),
    path('diccio/', viewsPlantillas.palabradiccionario, name='diccio'),
    path('prueba',viewsPlantillas.prueba, name='prueba'),

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

    
    path('reset_password/', auth_views.PasswordResetView.as_view(), name="password_reset"),
    path('reset_password_send/', auth_views.PasswordResetDoneView.as_view(), name="password_reset_done"),
    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),

] +static(settings.MEDIA_URL, document_root= settings.MEDIA_ROOT)

""" path('reset/password_reset', auth_views.PasswordResetView.as_view(template_name='rClave/password_reset_form.html', email_template_name='rClave/password_reset_email.html'), name="password_reset"),
    path('reset/password_reset_done', auth_views.PasswordResetDoneView.as_view(template_name='rClave/password_reset_done.html'), name="password_reset_done"),
    path('reset/password_reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='rClave/password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset/password_reset/done', auth_views.PasswordResetCompleteView.as_view(template_name='rClave/password_reset_complete.html'), name='password_reset_complete'), """
    