import hashlib
import re
import time

from django.db.models.functions import window
from django.shortcuts import render, redirect
from django.shortcuts import HttpResponse
import pymysql
from web1 import models
from django.contrib import messages
import tkinter as tk
from web1.forms import UserForm, RegisterForm
from tkinter import filedialog


def hash_code(s, salt='test1'):# 加点盐

    h = hashlib.sha256()

    s += salt

    h.update(s.encode())  # update方法只接收bytes类型

    return h.hexdigest()
def D_b(request):
    if  not (request.session.get('is_login', None) and request.session.get('level') =='3'):
        return redirect('/login')
    else:
        v = request.get_full_path().split("id=", 1)[1]
        tmp = models.User.objects.get(pk=v)
        models.User.objects.filter(id=v).delete()
        models.log_b.objects.create(operation='Delete', user=request.session['user_name'], befor=tmp.name+" level:"+tmp.level,
                                  after='',
                                  id_f=v)

        user_list = models.User.objects.all()

        return render(request, 'back.html', {'li': user_list})
def Change_b(request):
    # if request.session.get('is_login', None):
    #     # 登录状态不允许注册。你可以修改这条原则！
    #     pass
    # else:
    #     return redirect("/login/")
    if  not (request.session.get('is_login', None) and request.session.get('level') =='3'):
        return redirect('/login')
    if request.method == "POST":
        # name1 = request.POST['name_b']
        if 'back_regi_back' in request.POST:
            return redirect("/back/")
        tmp1 = models.User.objects.get(pk=request.session['id_back'])

        p1 = request.POST['password1_b']
        p2 = request.POST['password2_b']
        power = request.POST['power_b']
        email = request.POST['email_b']
        # power = request.POST['level2']
        messages = ''
        values1 = {'v1':tmp1.name,'message': messages, 'v2': '', 'v3': '', 'v4': '','v5':''}
        if p1 != p2:
            messages = "两次输入密码不同"
            values1 = {'v1':tmp1.name,'message': messages, 'v2': '', 'v3': '', 'v4': power,'v5':email}
            return render(request, 'back_regi.html', values1)
        else :
            if power != '1' and power !='2' and power != '3':
                messages = "权限错误"
                values1 = {'v1':tmp1.name,'message': messages, 'v2': p1, 'v3': p2, 'v4': '','v5':email}
                return render(request, 'back_regi.html', values1)

            same_email_user = models.User.objects.filter(email=email)
            if same_email_user :  # 邮箱地址唯一
                if not (len(same_email_user) == 1 and  same_email_user[0].id == tmp1.id):
                    messages = '该邮箱地址已被注册，请使用别的邮箱！'
                    values1 = {'v1': tmp1.name, 'message': messages, 'v2': p1, 'v3': p2, 'v4': power, 'v5': ''}
                    return render(request, 'back_regi.html', values1)
            if not re.match(r'^[0-9a-zA-Z_]{0,19}@[0-9a-zA-Z]{1,13}\.[com,cn,net]{1,3}$', email):
                messages = '邮箱地址错误'
                values1 = {'v1': tmp1.name, 'message': messages, 'v2': p1, 'v3': p2, 'v4': power, 'v5': ''}
                return render(request, 'back_regi.html', values1)
            else:
                if p1 == tmp1.password:
                    models.User.objects.filter(id=request.session['id_back']).update(level=power, email=email)
                else:
                    models.User.objects.filter(id=request.session['id_back']).update(password = hash_code(p1) ,level = power,email = email)
                tmp2 = models.User.objects.get(pk=request.session['id_back'])
                models.log_b.objects.create(operation='Change', user=request.session['user_name'],
                                            befor=tmp1.name+ " level:" + tmp1.level+" email:"+tmp1.email,
                                            after=tmp2.name+ " level:" + tmp2.level+" email:"+tmp2.email,
                                            id_f=tmp1.id)
                return redirect("/back/")
    # if request.POST['power_b']=='':
    request.session['id_back'] = request.get_full_path().split("id=", 1)[1]

    tmp = models.User.objects.get(pk=request.session['id_back'])
    values = {'v1':tmp.name,'message':'','v2':tmp.password , 'v3':tmp.password ,'v4':tmp.level,'v5':tmp.email}


    return render(request, 'back_regi.html', values)
def log_b(request):
    if  not (request.session.get('is_login', None) and request.session.get('level') =='3'):
        return redirect('/login')
    v = request.get_full_path().split("id=", 1)
    if len(v) == 1:

        user_log_list = models.log_b.objects.all()
    else:
        user_log_list = models.log_b.objects.filter(id_f = v[1])
    if 'back' in request.POST:
        return redirect("/back/")

    list = []

    for li in user_log_list:
        list.append(li.time.strftime("%Y-%m-%d %H:%M")+' id: '+li.id_f+' operator: '+li.user+' operation: '+li.operation+' befor: '+li.befor+' after: '+li.after)

    return render(request, 'log_back.html', {'li': user_log_list})
def add_b(request):
    pass
    # return render(request, 'back_regi.html')
def cover(request):
    pass

    return render(request, 'cover.html')
def login(request):
    #避免重复登陆
    if request.session.get('is_login', None):
        return redirect('/login')

    if request.method == "POST":

        login_form = UserForm(request.POST)

        message = "请检查填写的内容！"

        if login_form.is_valid():

            username = login_form.cleaned_data['username']

            password = login_form.cleaned_data['password']

            try:

                user = models.User.objects.get(name=username)

                if user.password == hash_code(password):

                    request.session['is_login'] = True

                    request.session['user_id'] = user.id

                    request.session['user_name'] = user.name

                    request.session['level'] = user.level

                    request.session.set_expiry(0)

                    return redirect('/index/')

                else:

                    message = "密码不正确！"

            except:

                message = "用户不存在！"

        return render(request, 'login.html', locals())

    login_form = UserForm()

    return render(request, 'login.html', locals())
def back(request):
    if request.session.get('log_info'):
        request.session.pop('log_info')
    if  not (request.session.get('is_login', None) and request.session.get('level') =='3'):
        return redirect('/login')
    user_list = models.User.objects.all()
    if 'log_b' in request.POST:
        return redirect("/log_b/")
    if 'register' in request.POST:
        return redirect("/register/")
    if 'search' in request.POST:
        rule_list = models.User.objects.all().filter(name__icontains=request.POST['search_name'])
        return render(request, 'back.html', {'li': rule_list})
    return render(request,'back.html',{'li':user_list})
def register(request):

        # if request.session.get('is_login', None):
        #     # 登录状态不允许注册。你可以修改这条原则！
        #
        #     return redirect("/index/")
        if not (request.session.get('is_login', None) and request.session.get('level') == '3'):
            return redirect('/login')
        if 'CreatUser_back' in request.POST:
            return redirect("/back/")
        if request.method == "POST":

            print('no back')
            register_form = RegisterForm(request.POST)

            message = "请检查填写的内容！"

            if register_form.is_valid():  # 获取数据

                username = register_form.cleaned_data['username']

                password1 = register_form.cleaned_data['password1']

                password2 = register_form.cleaned_data['password2']

                email = register_form.cleaned_data['email']
                # level = register_form.cleaned_data['level']
                level = register_form.cleaned_data['level2']

                if password1 == '' or password2 == '' or username =='' or level == '':
                    message = "不能为空！"

                    return render(request, 'CreateUser.html', locals())

                if password1 != password2:  # 判断两次密码是否相同

                    message = "两次输入的密码不同！"

                    return render(request, 'CreateUser.html', locals())

                else:

                    same_name_user = models.User.objects.filter(name=username)

                    if same_name_user:  # 用户名唯一

                        message = '用户已经存在，请重新选择用户名！'

                        return render(request, 'CreateUser.html', locals())

                    same_email_user = models.User.objects.filter(email=email)

                    if same_email_user:  # 邮箱地址唯一

                        message = '该邮箱地址已被注册，请使用别的邮箱！'

                        return render(request, 'CreateUser.html', locals())

                    if not (level == '1' or level == '2' or level == '3'):
                        message = '权限设置错误'

                        return render(request, 'CreateUser.html', locals())

                    if not re.match(r'^[0-9a-zA-Z_]{0,19}@[0-9a-zA-Z]{1,13}\.[com,cn,net]{1,3}$', email):
                        message = '邮箱地址错误'

                        return render(request, 'CreateUser.html', locals())
                    # 当一切都OK的情况下，创建新用户

                    new_user = models.User.objects.create()

                    new_user.name = username

                    new_user.password = hash_code(password1)

                    new_user.level = level

                    new_user.email = email

                    new_user.save()

                    models.log_b.objects.create(operation='Add', user=request.session['user_name'],
                                                befor='',
                                                after=username + " level:" + level+" email:"+email,
                                                id_f=new_user.id)

                    return redirect('/back/')  # 自动跳转到登录页面

        register_form = RegisterForm()
        return render(request, 'CreateUser.html', locals())
def logout(request):

    if not request.session.get('is_login', None):

        # 如果本来就未登录，也就没有登出一说

        return redirect("/login/")

    request.session.flush()

    # 或者使用下面的方法

    # del request.session['is_login']

    # del request.session['user_id']

    # del request.session['user_name']

    return redirect("/login/")
def download(request):


    root = tk.Tk()

    root.withdraw()

    file_path = filedialog.asksaveasfilename(title=u'保存文件', filetypes=[("TXT",".txt")])
    print(file_path+".txt")
    rule_list = models.firewall.objects.all()

    f = open(file_path+".txt", 'a')
    for li in rule_list:
        f.write(li.content_all1)

        f.write('\n')
    root.destroy()
    return render(request, 'info_all.html', {'li': rule_list})
def check(a,b,type):
    ok = 1
    #name
    if not a['v1']:
        b['error1'] = '不能为空'
        a['v1'] = ''
        ok = 0;
    else:
        pass
    #process
    if not a['v2']:
        b['error2'] = '不能为空'
        a['v2'] = ''
        ok = 0;
    else:
        pass
    #local_ip
    if not a['v3']:
        b['error3'] = '不能为空'
        a['v3'] = ''
        ok = 0;
    else:
        x = a['v3'].split("/")
        if len(x) ==1:

            if re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", x[0])\
                    or re.match(r"^(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}$", x[0], re.I):
                pass
            else:
                b['error3'] = 'IP invaild'
                a['v3'] = ''
                ok = 0;
        else:
            if (re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", x[0])\
                  and  x[1].isdigit() and 0<=int(x[1])<=32 )or (re.match(r"^(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}$", x[0], re.I)and  x[1].isdigit() and 0<=int(x[1])<=128):
                pass
            else:
                b['error3'] = 'IP invaild'
                a['v3'] = ''
                ok = 0;
    #local_port
    if not a['v4']:
        b['error4'] = '不能为空'
        a['v4'] = ''
        ok = 0;
    else:
        x = a['v4'].split("/")
        if len(x) == 1:
            if x[0] == "any":
                pass
            else:
                if x[0].isdigit():
                    if(0<=int(x[0])<=65535):
                        pass
                    else:
                        b['error4'] = 'port invaild'
                        a['v4'] = ''
                        ok = 0;
                else:
                    y = x[0].split("-")
                    if len(y) == 2 and y[0].isdigit() and y[1].isdigit() and 0 <= int(y[0]) <= 65535 and 0 <= int(y[1]) <= 65535:
                        pass
                    else:
                        b['error4'] = 'port invaild'
                        a['v4'] = ''
                        ok = 0;
        else:
            for xx in x:
                if xx.isdigit() and 0<int(xx)<65535:
                    pass
                else:
                    # y = xx.split("-")
                    # if len(y) == 2 and y[0].isdigit() and y[1].isdigit() and 0<=int(y[0])<=65535 and 0<=int(y[1])<=65535:
                    #     pass
                    # else:
                        b['error4'] = 'port invaild'
                        a['v4'] = ''
                        ok = 0;
    #remote_ip
    if not a['v5']:
        b['error5'] = '不能为空'
        a['v5'] = ''
        ok = 0;
    else:
        x = a['v5'].split("/")
        if len(x) ==1:

            if re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", x[0])\
                    or re.match(r"^(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}$", x[0], re.I):
                pass
            else:
                b['error3'] = 'IP invaild'
                a['v3'] = ''
                ok = 0;
        else:
            if (re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", x[0])\
                  and  x[1].isdigit() and 0<=int(x[1])<=32 )or (re.match(r"^(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}$", x[0], re.I)and  x[1].isdigit() and 0<=int(x[1])<=128):
                pass
            else:
                b['error3'] = 'IP invaild'
                a['v3'] = ''
                ok = 0;
    #remote_port
    if not a['v6']:
        b['error6'] = '不能为空'
        a['v6'] = ''
        ok = 0;
    else:
        x = a['v6'].split("/")
        if len(x) == 1:
            if x[0] == "any":
                pass
            else:
                if x[0].isdigit():
                    if (0 <= int(x[0]) <= 65535):
                        pass
                    else:
                        b['error6'] = 'port invaild'
                        a['v6'] = ''
                        ok = 0;
                else:
                    y = x[0].split("-")
                    if len(y) == 2 and y[0].isdigit() and y[1].isdigit() and 0 <= int(y[0]) <= 65535 and 0 <= int(
                            y[1]) <= 65535:
                        pass
                    else:
                        b['error6'] = 'port invaild'
                        a['v6'] = ''
                        ok = 0;
        else:
            for xx in x:
                if xx.isdigit() and 0 < int(xx) < 65535:
                    pass
                else:
                    # y = xx.split("-")
                    # if len(y) == 2 and y[0].isdigit() and y[1].isdigit() and 0 <= int(y[0]) <= 65535 and 0 <= int(
                    #         y[1]) <= 65535:
                    #     pass
                    # else:
                        b['error6'] = 'port invaild'
                        a['v6'] = ''
                        ok = 0;
    #protocol
    if not a['v7']:
        b['error7'] = '不能为空'
        a['v7'] = ''
        ok = 0;
    else:
        pass
    #direction
    if not a['v8']:
        b['error8'] = '不能为空'
        a['v8'] = ''
        ok = 0;
    else:
        if a['v8'] == "inbound" or a['v8'] == "outbound":
            pass
        else:
            b['error8'] = 'invaild direction'
            a['v8'] = ''
            ok = 0;
    #action
    if not a['v9']:
        b['error9'] = '不能为空'
        a['v9'] = ''
        ok = 0;
    else:
        if a['v9'] == "permit" or a['v9'] == "direct" or a['v9'] == "redirect":
            pass
        else:
            b['error9'] = 'invaild action'
            a['v9'] = ''
            ok = 0;
    #type
    if not a['v10']:
        b['error10'] = '不能为空'
        a['v10'] = ''
        ok = 0;
    else:
        if a['v10'] == "system" or a['v10'] == "control":
            pass
        else:
            b['error10'] = 'invaild type'
            a['v10'] = ''
            ok = 0;
    #enalbled
    if not a['v11']:
        b['error11'] = '不能为空'
        a['v11'] = ''
        ok = 0;
    else:
        if a['v11'] == "false" or a['v11'] == "true":
            pass
        else:
            b['error11'] = 'invaild type'
            a['v11'] = ''
            ok = 0;
    #profile
    if not a['v12']:
        b['error12'] = '不能为空'
        a['v12'] = ''
        ok = 0;
    else:
        if a['v12'] =="public|private|domain" or a['v12'] =="public|private" or a['v12'] =="public|domain" or a['v12'] =="private|domain" or a['v12'] =="public" or a['v12'] =="private" or a['v12'] =="domain" :
            pass
        else:
            b['error12'] = 'invaild profile'
            a['v12'] = ''
            ok = 0;
            #redirect_ip
    if a['v9'] == "redirect":

        if not a['v14']:
            b['error14'] = '不能为空'
            a['v14'] = ''
            ok = 0;
        else:
            if a['v14'].isdigit() and 0<=int(a['v14'])<=65535:
                pass
            else:
                b['error14'] = 'refirect_port invaild'
                a['v14'] = ''
                ok = 0;
        if not a['v13']:
            b['error13'] = '不能为空'
            a['v13'] = ''
            ok = 0;
        else:
            if re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
                        a['v13']) \
                    or re.match(r"^(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}$", a['v13'], re.I):
                pass
            else:
                b['error13'] = 'redirect_ip invaild'
                a['v13'] = ''
                ok = 0;
    else:
        if a['v13']:
            b['error13'] = 'redirect_ip invaild'
            a['v13'] = ''
            ok = 0;
        if a['v14']:
            b['error14'] = 'redirect_ip invaild'
            a['v14'] = ''
            ok = 0;
    return a,b,ok
def abc(request):
    messages.success(request, "哈哈哈")
def add_page(request,c = 0):
    if  request.session.get('is_login', None):
        if request.method == "POST":
            if 'f_submit' in request.POST:
                name1 = request.POST['name']
                process1 = request.POST['process']
                local_ip1 = request.POST['local_ip']
                local_port1 = request.POST['local_port']
                remote_ip1 = request.POST['remote_ip']
                remote_port1 = request.POST['remote_port']
                protocol1 = request.POST['protocol']
                direction1 = request.POST['direction']
                action1 = request.POST['action']
                type1 = request.POST['type']
                enalbled1 = request.POST['enalbled']
                if not request.POST.get('public') == None:
                    profile1 = 'public'
                else:
                    profile1 = ''

                if not request.POST.get('private') == None:
                    if profile1 == '':
                        profile1 = 'private'
                    else:
                        profile1 += '|private'

                if not request.POST.get('domain') == None:
                    if profile1 == '':
                        profile1 = 'domain'
                    else:
                        profile1 += '|domain'
                redirect_ip1 = request.POST['redirect_ip']
                redirect_port1 = request.POST['redirect_port']

                values = {'v1': name1, 'v2': process1, 'v3': local_ip1, 'v4': local_port1, 'v5': remote_ip1,
                          'v6': remote_port1, 'v7': protocol1, 'v8': direction1, 'v9': action1, 'v10': type1,
                          'v11': enalbled1, 'v12': profile1,'v13':redirect_ip1,'v14':redirect_port1 }

                empty_error = {'error1': '', 'error2': '', 'error3': '', 'error4': '', 'error5': '', 'error6': '',
                               'error7': '', 'error8': '', 'error9': '', 'error10': '', 'error11': '', 'error12': '','error13':'','error14':'' }
                ok = 1;

                values, empty_error, ok = check(values, empty_error, 1)
                # ttest1 = {}
                # for iter1 in models.firewall.objects.all():
                #     ttest1[iter1.name] = iter1.name

                if ok == 1:
                    print("add")
                    if action1 == "redirect":
                        content_all = "name:"+name1+" process:"+process1+" local_ip:"+local_ip1+" local_port:"+local_port1+" remote_ip:"+remote_ip1+" remote_port:"+remote_port1+" protocol:"+protocol1+" direction:"+direction1+" action:"+action1+" type:"+type1+" enalbled:" + enalbled1+" profile:"+profile1+" redirect_ip:"+redirect_ip1+" redirect_port:"+redirect_port1
                    else:
                        content_all = "name:"+name1+" process:"+process1+" local_ip:"+local_ip1+" local_port:"+local_port1+" remote_ip:"+remote_ip1+" remote_port:"+remote_port1+" protocol:"+protocol1+" direction:"+direction1+" action:"+action1+" type:"+type1+" enalbled:" + enalbled1+" profile:"+profile1

                    tmp = models.firewall.objects.create(name=name1, process=process1, local_ip=local_ip1,
                                                   local_port=local_port1,
                                                   remote_ip=remote_ip1, remote_port=remote_port1, protocol=protocol1,
                                                   direction=direction1,
                                                   action=action1, type=type1, enalbled=enalbled1, profile=profile1,
                                                   redirect_ip = redirect_ip1,redirect_port = redirect_port1,
                                                   content_all1=content_all,add_time=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())+" User:"+request.session['user_name'],
                                                         last_change = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())+" User:"+request.session['user_name'])
                    models.log.objects.create(operation='Add',user = request.session['user_name'] , befor='',after=content_all,id_f=tmp.id)
                    rule_list = models.firewall.objects.all()
                    return render(request, 'info_all.html', {'li': rule_list})
                else:
                    from collections import Counter

                    z = {**values, **empty_error}
                    return render(request, 'info_add_page.html', z)
            else:
                rule_list = models.firewall.objects.all()
                return render(request, 'info_all.html', {'li': rule_list})
    else:
        return redirect('/login')
def search(request):
    if request.session.get('is_login', None):
        if 'search' in request.POST:
            rule_list = models.firewall.objects.all().filter(name__icontains=request.POST['search_name'])
            return render(request, 'info_all.html', {'li': rule_list})
        elif 'log' in request.POST:
            log_list = models.log.objects.all()
            return render(request,'info_log.html',{'li':log_list})
        elif 'download' in request.POST:
            root = tk.Tk()

            root.withdraw()

            file_path = filedialog.asksaveasfilename(title=u'保存文件', filetypes=[("TXT", ".txt")])
            print(file_path + ".txt")
            rule_list = models.firewall.objects.all().order_by('id').order_by('type')

            f = open(file_path + ".txt", 'a')
            for li in rule_list:
                f.write('id:'+str(li.id)+' '+li.content_all1)
                f.write('\n')
            root.destroy()
            rule_list = models.firewall.objects.all()
            return render(request, 'info_all.html', {'li': rule_list})
        else:
            return render(request, 'info_add_page.html')
    else:
        return redirect('/login')
def admin_m(request):
    pass
def log(request):
    # log_list = models.log.objects.all()
    if 'back' in request.POST:
        if request.session.get('log_info'):
            request.session.pop('log_info')
        return redirect("/index/")
    t = request.get_full_path().split("id=", 1)
    print(len(t))

    if len(t) > 1:
        v = request.get_full_path().split("id=", 1)[1]
        log_list = models.log.objects.filter(id_f=v)
        request.session['log_info'] = v
    else:
        if(not request.session.get('log_info')):
            log_list = models.log.objects.all()
        else:
            log_list = models.log.objects.filter(id_f=request.session['log_info'])
    if 'search_log' in request.POST:
        # t = request.get_full_path().split("id=", 1)
        s = request.POST['search_name'].lower()
        if  re.search(s, 'add') or  re.search(s, 'delete') or  re.search(s, 'change'):
            log_list = log_list.filter(operation__icontains=s)
        else:
            log_list = log_list.filter(user__icontains=s)
        return render(request, 'info_log.html', {'li': log_list})
    # v = request.get_full_path().split("id=", 1)[1]
    # log_list = models.log.objects.filter(id_f = v)
    # t = request.get_full_path().split("id=", 1)
    # v = request.get_full_path().split("id=", 1)[1]
    # log_list = models.log.objects.filter(id_f=v)
    return render(request, 'info_log.html', {'li': log_list})
def D(request):
    if request.session.get('is_login', None):
        v = request.get_full_path().split("id=", 1)[1]
        tmp = models.firewall.objects.get(pk = v)
        models.firewall.objects.filter(id=v).delete()
        models.log.objects.create(operation='Delete', user=request.session['user_name'], befor=tmp.content_all1, after='',
                                  id_f=v)

        rule_list = models.firewall.objects.all()
        return render(request, 'info_all.html', {'li': rule_list})
    else:
        return redirect('/login')
def change_(request):
    if  request.session.get('is_login', None):
        if request.method == "POST":
            print("00")
            if 'c_submit' in request.POST:
                print("01")
                print(request.POST['direction'])
                print(request.POST['action'])
                print(request.POST['type'])
                print(request.POST['enalbled'])
                print(request.POST.get('public'))
                print(request.POST.get('private'))
                print(request.POST.get('domain'))
                name1 = request.POST['name']
                process1 = request.POST['process']
                local_ip1 = request.POST['local_ip']
                local_port1 = request.POST['local_port']
                remote_ip1 = request.POST['remote_ip']
                remote_port1 = request.POST['remote_port']
                protocol1 = request.POST['protocol']
                direction1 = request.POST['direction']
                action1 = request.POST['action']
                type1 = request.POST['type']
                enalbled1 = request.POST['enalbled']

                if not request.POST.get('public') == None:
                    profile1 = 'public'
                else :
                    profile1 = ''

                if not request.POST.get('private') == None:
                    if profile1 == '':
                        profile1 = 'private'
                    else:
                        profile1 +='|private'

                if not request.POST.get('domain') == None:
                    if profile1 == '':
                        profile1 = 'domain'
                    else:
                        profile1 +='|domain'


                print(profile1)
                # profile1 = request.POST['profile']
                redirect_ip1 = request.POST['redirect_ip']
                redirect_port1 = request.POST['redirect_port']

                values_t = {'v1': name1, 'v2': process1, 'v3': local_ip1, 'v4': local_port1, 'v5': remote_ip1,
                            'v6': remote_port1,
                            'v7': protocol1, 'v8': direction1, 'v9': action1, 'v10': type1, 'v11': enalbled1,
                            'v12': profile1,'v13':redirect_ip1,'v14':redirect_port1}

                empty_error = {'error1': '', 'error2': '', 'error3': '', 'error4': '', 'error5': '', 'error6': '',
                               'error7': '',
                               'error8': '', 'error9': '', 'error10': '', 'error11': '', 'error12': '','error13': '','error14': '', }

                values_t, empty_error, ok = check(values_t, empty_error, 2)

                # ok = 1  #
                if ok == 1:
                    print(1)
                    # v = tmp = models.var.objects.get(pk = 1).var
                    # tmp1 = models.var.objects.filter(id=1)
                    # v = 0
                    # for ttmp1 in tmp1:
                    #     v = ttmp1.var
                    # tmp2 = models.firewall.objects.filter(id = v)
                    # content_all_tmp2 = ''
                    # for ttmp2 in tmp2:
                    #     content_all_tmp2 = ttmp2.content_all1
                    # models.firewall.objects.filter(id=v).delete()

                    tmp = models.firewall.objects.get(pk=request.session['id_c_c'])

                    if action1 == "redirect":
                        content_all = "name:" + name1 + " process:" + process1 + " local_ip:" + local_ip1 + " local_port:" + local_port1 + " remote_ip:" + remote_ip1 + " remote_port:" + remote_port1 + " protocol:" + protocol1 + " direction:" + direction1 + " action:" + action1 + " type:" + type1 + " enalbled:" + enalbled1 + " profile:" + profile1 + " redirect_ip:" + redirect_ip1 + " redirect_port:" + redirect_port1
                    else:
                        content_all = "name:" + name1 + " process:" + process1 + " local_ip:" + local_ip1 + " local_port:" + local_port1 + " remote_ip:" + remote_ip1 + " remote_port:" + remote_port1 + " protocol:" + protocol1 + " direction:" + direction1 + " action:" + action1 + " type:" + type1 + " enalbled:" + enalbled1 + " profile:" + profile1

                    models.firewall.objects.filter(id = request.session['id_c_c']).update(name=name1, process=process1, local_ip=local_ip1,
                                                   local_port=local_port1,
                                                   remote_ip=remote_ip1, remote_port=remote_port1, protocol=protocol1,
                                                   direction=direction1,
                                                   action=action1, type=type1, enalbled=enalbled1, profile=profile1,
                                                   redirect_ip=redirect_ip1, redirect_port=redirect_port1,
                                                   content_all1=content_all,last_change = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())+" User:"+request.session['user_name'])

                    models.log.objects.create(operation='Change', user=request.session['user_name'], befor=tmp.content_all1,
                                              after=content_all, id_f=request.session['id_c_c'])

                else:
                    z = {**values_t, **empty_error}
                    return render(request, 'info_change_page.html', z)

            else:
                pass
            rule_list = models.firewall.objects.all()
            return render(request, 'info_all.html', {'li': rule_list})
        request.session['id_c_c'] = ar=request.get_full_path().split("id=", 1)[1]
        # models.var.objects.filter(id=1).delete()  # = request.get_full_path().split("id=", 1)[1]
        # models.var.objects.create(id=1, var=request.get_full_path().split("id=", 1)[1])
        rule_list = models.firewall.objects.all().filter(id=request.session['id_c_c'])
        for li in rule_list:
            name1 = li.name
            process1 = li.process
            local_ip1 = li.local_ip
            local_port1 = li.local_port
            remote_ip1 = li.remote_ip
            remote_port1 = li.remote_port
            protocol1 = li.protocol
            direction1 = li.direction
            action1 = li.action
            type1 = li.type
            enalbled1 = li.enalbled
            profile1 = li.profile
            redirect_ip1 = li.redirect_ip
            redirect_port1 = li.redirect_port
        values = {'v1': name1, 'v2': process1, 'v3': local_ip1, 'v4': local_port1, 'v5': remote_ip1, 'v6': remote_port1,
                  'v7': protocol1, 'v8': direction1, 'v9': action1, 'v10': type1, 'v11': enalbled1, 'v12': profile1,'v13':redirect_ip1,'v14':redirect_port1 }
        print(values['v1'])
        return render(request, 'info_change_page.html', values)
    else:
        return redirect('/login')
def index(request):
    if request.session.get('log_info'):
        request.session.pop('log_info')
    rule_list = models.firewall.objects.all()
    value1 = []
    value2 = []
    a = 1
    if request.method == "POST":
        rule_list = models.firewall.objects.all()
    return render(request,'info_all.html',{'li':rule_list})
def index1(request):
    if request.method == "POST":
        models.Rule.objects.filter(number=request.POST['number']).delete()
    rule_list = models.Rule.objects.all()
    return render(request,'info_all.html',{'li':rule_list})
def show(request):
    if  request.session.get('is_login', None):
        if 's_back' in request.POST:
            rule_list = models.firewall.objects.all()
            return render(request, 'info_all.html', {'li': rule_list})
        request.session['id_c_c'] = ar=request.get_full_path().split("id=", 1)[1]
        # models.var.objects.filter(id=1).delete()  # = request.get_full_path().split("id=", 1)[1]
        # models.var.objects.create(id=1, var=request.get_full_path().split("id=", 1)[1])
        rule_list = models.firewall.objects.all().filter(id=request.session['id_c_c'])
        for li in rule_list:
            name1 = li.name
            process1 = li.process
            local_ip1 = li.local_ip
            local_port1 = li.local_port
            remote_ip1 = li.remote_ip
            remote_port1 = li.remote_port
            protocol1 = li.protocol
            direction1 = li.direction
            action1 = li.action
            type1 = li.type
            enalbled1 = li.enalbled
            profile1 = li.profile
            redirect_ip1 = li.redirect_ip
            redirect_port1 = li.redirect_port
            content1 = li.content_all1
        values = {'v1': name1, 'v2': process1, 'v3': local_ip1, 'v4': local_port1, 'v5': remote_ip1, 'v6': remote_port1,
                  'v7': protocol1, 'v8': direction1, 'v9': action1, 'v10': type1, 'v11': enalbled1, 'v12': profile1,'v13':redirect_ip1,'v14':redirect_port1,'v15':content1 }
        print(values['v1'])
        return render(request, 'info_one.html', values)
    else:
        return redirect('/login')