from django.db import models

# Create your models here.
# class firewall_policy(models.Model):


from django import forms

class log_b(models.Model):
    time = models.DateTimeField(auto_now_add=True)
    id_f = models.CharField(default='',max_length=128)
    operation = models.CharField(default='',max_length=16)
    user = models.CharField(default='',max_length=128)
    befor = models.CharField(default='',max_length=512)
    after = models.CharField(default='',max_length=512)

class log(models.Model):
    time = models.DateTimeField(auto_now_add=True)
    id_f = models.CharField(default='',max_length=128)
    operation = models.CharField(default='',max_length=16)
    user = models.CharField(default='',max_length=128)
    befor = models.CharField(default='',max_length=512)
    after = models.CharField(default='',max_length=512)

class var(models.Model):
    var = models.CharField(default='',max_length=2000)

class User(models.Model):
    name = models.CharField(max_length=128,unique=True)
    password = models.CharField(max_length=256)
    level = models.CharField(default='',max_length=10)
    c_time = models.DateTimeField(auto_now_add=True)
    email = models.EmailField(default='',max_length=128)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['c_time']
        verbose_name = 'user'
        verbose_name_plural = 'user'


class firewall(models.Model):
    name = models.CharField(default='',max_length=200)
    process = models.CharField(default='',max_length=200)
    local_ip = models.CharField(default='',max_length=200)
    local_port = models.CharField(default='',max_length=200)
    remote_ip = models.CharField(default='',max_length=200)
    remote_port = models.CharField(default='',max_length=200)
    protocol = models.CharField(default='',max_length=200)
    direction = models.CharField(default='',max_length=200)
    action = models.CharField(default='',max_length=200)
    type = models.CharField(default='',max_length=200)
    enalbled = models.CharField(default='',max_length=200)
    profile = models.CharField(default='',max_length=400)
    redirect_ip = models.CharField(default='',max_length=40)
    redirect_port = models.CharField(default='', max_length=40)
    # content_all = models.CharField(default='', max_length=400)
    content_all1 = models.CharField(default='', max_length=400)
    add_time = models.CharField(default='', max_length=400)
    last_change = models.CharField(default='', max_length=400)
    def __str__(self):
        return self.name

    def content(self):
        return "name:"+self.name+" process:"+self.process+" local_ip:"+self.local_ip+" local_port:"+self.local_port+" remote_ip:"+self.remote_ip+" remote_port:"+self.remote_port+" protocol:"+self.protocol+" direction:"+self.direction+" action:"+self.action+" type:"+self.type+" enalbled:"+self.enalbled+" profile:"+self.profile

class Rule(models.Model):
    number = models.IntegerField(default=0, verbose_name='序号')
    name = models.CharField(default='',max_length=20,verbose_name='标题')
    content = models.CharField(default='',max_length=1000,verbose_name='内容')

    def __str__(self):
        return self.name
    #自定义返回的数据
    def test1(self):
        if 0:
            return 0
        return self.content

    class Meta:
        db_table = 'tb_Rule'  # 指明数据库表名
        verbose_name = '规则'  # 在admin站点中显示的名称
        verbose_name_plural = verbose_name  # 显示的复数名称

    def __unicode__(self):
        return self.number

    # test1.short_dexcription = 'content'

class Article(models.Model):
    title = models.CharField(u'标题',max_length=256)
    content = models.TextField(u'内容')
    pub_date = models.DateTimeField(u'发表时间',auto_now_add=True)
    update_time = models.DateTimeField(u'更新时间',auto_now=True)

    def __str__(self):
        return self.title

    # #自定义返回的数据
    # def test1(self):
    #     if
    #         return
    #     return self.title