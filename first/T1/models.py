from django.db import models

# Create your models here.
class firewall(models.Model):
    name = models.CharField(default='',max_length=2000)
    process = models.CharField(default='',max_length=200)
    local_ip = models.CharField(default='',max_length=20)
    local_port = models.CharField(default='',max_length=20)
    remote_ip = models.CharField(default='',max_length=20)
    remote_port = models.CharField(default='',max_length=20)
    protocol = models.CharField(default='',max_length=20)
    direction = models.CharField(default='',max_length=20)
    action = models.CharField(default='',max_length=20)
    type = models.CharField(default='',max_length=20)
    enalbled = models.CharField(default='',max_length=20)
    profile = models.CharField(default='',max_length=40)