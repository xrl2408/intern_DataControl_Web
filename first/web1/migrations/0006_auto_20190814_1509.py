# Generated by Django 2.2.3 on 2019-08-14 15:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web1', '0005_user_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='firewall',
            name='add_time',
            field=models.CharField(default='', max_length=400),
        ),
        migrations.AddField(
            model_name='firewall',
            name='last_change',
            field=models.CharField(default='', max_length=400),
        ),
    ]