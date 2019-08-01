# Generated by Django 2.2.3 on 2019-07-23 03:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web1', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='rule',
            options={'verbose_name': '规则', 'verbose_name_plural': '规则'},
        ),
        migrations.AddField(
            model_name='rule',
            name='content',
            field=models.CharField(default='', max_length=1000, verbose_name='内容'),
        ),
        migrations.AddField(
            model_name='rule',
            name='name',
            field=models.CharField(default='', max_length=20, verbose_name='标题'),
        ),
        migrations.AddField(
            model_name='rule',
            name='number',
            field=models.IntegerField(default=0, verbose_name='序号'),
        ),
        migrations.AlterModelTable(
            name='rule',
            table='tb_Rule',
        ),
    ]