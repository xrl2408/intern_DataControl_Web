# Generated by Django 2.2.3 on 2019-08-08 11:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web1', '0003_log_id_f'),
    ]

    operations = [
        migrations.CreateModel(
            name='log_b',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time', models.DateTimeField(auto_now_add=True)),
                ('id_f', models.CharField(default='', max_length=128)),
                ('operation', models.CharField(default='', max_length=16)),
                ('user', models.CharField(default='', max_length=128)),
                ('befor', models.CharField(default='', max_length=512)),
                ('after', models.CharField(default='', max_length=512)),
            ],
        ),
    ]
