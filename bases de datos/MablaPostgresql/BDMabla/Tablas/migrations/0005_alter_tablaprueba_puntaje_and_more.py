# Generated by Django 4.1.7 on 2023-08-03 13:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Tablas', '0004_remove_tablausuario_correo_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tablaprueba',
            name='puntaje',
            field=models.PositiveSmallIntegerField(verbose_name='Puntaje'),
        ),
        migrations.AlterField(
            model_name='tablaprueba',
            name='tipoPrueba',
            field=models.PositiveSmallIntegerField(),
        ),
    ]