<<<<<<< HEAD
# Generated by Django 4.1.7 on 2023-08-12 17:23
=======
# Generated by Django 4.1.7 on 2023-08-14 14:01
>>>>>>> 9db00768073fa8d8d75fbff931d21134986c435a

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TablaCategoria',
            fields=[
                ('Categoria', models.TextField(max_length=30, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='TablaPrueba',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipoPrueba', models.PositiveSmallIntegerField()),
                ('puntaje', models.PositiveSmallIntegerField(verbose_name='Puntaje')),
                ('fecha', models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='TablaUsuario',
            fields=[
                ('alias', models.TextField(max_length=30, primary_key=True, serialize=False)),
                ('nombre', models.TextField()),
                ('apellido', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='TablaSubcategoria',
            fields=[
                ('subcategoria', models.TextField(max_length=30, primary_key=True, serialize=False)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria')),
            ],
        ),
        migrations.CreateModel(
            name='TablaPrueba_Pregunta',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('puntaje', models.PositiveBigIntegerField(verbose_name='Puntaje')),
                ('idCategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria')),
                ('idPrueba', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablaprueba')),
            ],
        ),
        migrations.AddField(
            model_name='tablaprueba',
            name='alias',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablausuario'),
        ),
        migrations.AddField(
            model_name='tablaprueba',
            name='idCategoria',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria'),
        ),
        migrations.CreateModel(
            name='TablaPreguntas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.PositiveIntegerField(verbose_name='Tipo')),
                ('senia', models.TextField()),
                ('respuesta', models.TextField(max_length=50)),
                ('idCategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria')),
            ],
        ),
        migrations.CreateModel(
            name='TablaPalabra',
            fields=[
                ('Palabra', models.TextField(max_length=30, primary_key=True, serialize=False)),
                ('Senia', models.TextField()),
                ('subcategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablasubcategoria')),
            ],
        ),
        migrations.CreateModel(
            name='TablaComentarios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('texto', models.TextField(max_length=150)),
                ('fecha', models.DateField(auto_now_add=True)),
                ('alias', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablausuario')),
            ],
        ),
    ]
