from django.db import models

# Create your models here.
# class firewall_policy(models.Model):

class var(models.Model):
    var = models.CharField(default='',max_length=2000)

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