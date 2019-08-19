"""first URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from web1 import views
from django.conf.urls import url
urlpatterns = [
   path('admin/', admin.site.urls),
   url(r'^index/',views.index),
url(r'^search/',views.search),
# url(r'^add/',views.add),
# url(r'^delete/',views.delete),
url(r'^index1/',views.index1),
url(r'^add_page/',views.add_page),
url(r'^change_/',views.change_),
url(r'^D/',views.D),

url(r'^cover/', views.cover),
url(r'^login/', views.login),
url(r'^register/', views.register),
url(r'^logout/', views.logout),
url(r'^download/', views.download),
url(r'^back/', views.back),
url(r'^log/', views.log),
url(r'^admin_m/', views.admin_m),
url(r'^log_b/', views.log_b),
url(r'^add_b/', views.add_b),
url(r'^D_b/', views.D_b),
url(r'^Change_b/', views.Change_b),
# url(r'^info/', views.info),
url(r'^show/', views.show),
   ]
