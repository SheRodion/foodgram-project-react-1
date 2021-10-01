# Generated by Django 3.2.7 on 2021-10-01 11:39

import colorfield.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tags',
            name='color',
            field=colorfield.fields.ColorField(default='#FFFFFF', max_length=7, verbose_name='Hex code for tag color'),
        ),
    ]