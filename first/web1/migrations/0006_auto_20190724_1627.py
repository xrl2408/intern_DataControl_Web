# Generated by Django 2.2.3 on 2019-07-24 08:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web1', '0005_auto_20190724_1625'),
    ]

    operations = [
        migrations.AlterField(
            model_name='firewall',
            name='name',
            field=models.CharField(default='', max_length=2000),
        ),
        migrations.AlterField(
            model_name='firewall',
            name='process',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AlterField(
            model_name='firewall',
            name='profile',
            field=models.CharField(default='', max_length=40),
        ),
    ]