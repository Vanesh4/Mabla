# Generated by Django 4.1.7 on 2023-08-03 14:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Tablas', '0006_alter_tablaprueba_puntaje_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tablausuario',
            name='telefono',
        ),
    ]
