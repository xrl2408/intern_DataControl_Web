from django.contrib import admin
from .models import Article
from .models import Rule
from .models import firewall
# Register your models here.

admin.site.site_header = '防火墙规则管理'
admin.site.site_title = '防火墙'

class FirewallAdmin(admin.ModelAdmin):
    list_display = ('name', 'content')

class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title','pub_date','update_time')

class MyModelAdmin(admin.ModelAdmin):
    def get_queryset(self, request):
        qs = super(MyModelAdmin,self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(authon=request.user)

class RuleAdmin(admin.ModelAdmin):
    list_display = ('number','name','content','test1')
    search_fields = ('number',)
    list_per_page = 3
    # fields = ['name','number']

    #过滤器
    list_filter = ['number']

    def get_search_results(self, request, queryset, search_term):
        queryset,use_distinct = super(RuleAdmin,self).get_search_results(request,queryset,search_term)
        try:
            search_term_as_int = int(search_term)
            queryset |= self.model.object.filter(number = search_term_as_int)
        except:
            pass
        return queryset,use_distinct

class firewallAdmin(admin.ModelAdmin):
    list_display = ('name', 'process')

admin.site.register(Article,ArticleAdmin)
admin.site.register(Rule,RuleAdmin)
admin.site.register(firewall,FirewallAdmin)