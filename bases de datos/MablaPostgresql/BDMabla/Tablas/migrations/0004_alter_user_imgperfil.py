# Generated by Django 4.1.7 on 2023-08-15 13:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Tablas', '0003_rename_senia_tablapreguntas_pregunta_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='imgPerfil',
            field=models.ImageField(blank=True, null=True, upload_to='img/'),
        ),
    ]
