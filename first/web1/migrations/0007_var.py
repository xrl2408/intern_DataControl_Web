# Generated by Django 2.2.3 on 2019-07-29 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web1', '0006_auto_20190724_1627'),
    ]

    operations = [
        migrations.CreateModel(
            name='var',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('var', models.CharField(default='', max_length=2000)),
            ],
        ),
    ]
