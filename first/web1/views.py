import re

# import global
from django.db.models.functions import window
from django.shortcuts import render, redirect
from django.shortcuts import HttpResponse
import pymysql
from web1 import models
from django.contrib import messages


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
        if re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", a['v3']):
            pass
        else:
            a['v3'] = 'IP invaild'
            ok = 0;
    #local_port
    if not a['v4']:
        b['error4'] = '不能为空'
        a['v4'] = ''
        ok = 0;
    else:

        pass
    #remote_ip
    if not a['v5']:
        b['error5'] = '不能为空'
        a['v5'] = ''
        ok = 0;
    else:
        if (re.match(r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
                    a['v3'])):
            pass
        else:
            a['v3'] = 'IP invaild'
            ok = 0;
    #remote_port
    if not a['v6']:
        b['error6'] = '不能为空'
        a['v6'] = ''
        ok = 0;
    else:
        pass
    if not a['v7']:
        b['error7'] = '不能为空'
        a['v7'] = ''
        ok = 0;
    else:
        pass
    if not a['v8']:
        b['error8'] = '不能为空'
        a['v8'] = ''
        ok = 0;
    else:
        pass
    if not a['v9']:
        b['error9'] = '不能为空'
        a['v9'] = ''
        ok = 0;
    else:
        pass
    if not a['v10']:
        b['error10'] = '不能为空'
        a['v10'] = ''
        ok = 0;
    else:
        pass
    if not a['v11']:
        b['error11'] = '不能为空'
        a['v11'] = ''
        ok = 0;
    else:
        pass
    if not a['v12']:
        b['error12'] = '不能为空'
        a['v12'] = ''
        ok = 0;
    else:
        pass
    return a,b,ok
def abc(request):
    messages.success(request, "哈哈哈")
def add_page(request,c = 0):

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
            profile1 = request.POST['profile']

            values = {'v1': name1, 'v2': process1, 'v3': local_ip1,'v4': local_port1,'v5': remote_ip1,'v6': remote_port1,'v7': protocol1,'v8': direction1,'v9': action1,'v10': type1,'v11': enalbled1,'v12': profile1,}

            empty_error = {'error1': '', 'error2': '', 'error3': '','error4': '','error5': '','error6': '','error7': '','error8': '','error9': '','error10': '','error11': '','error12': '',}
            ok = 1;

            values,empty_error,ok = check(values,empty_error,1)
            # ttest1 = {}
            # for iter1 in models.firewall.objects.all():
            #     ttest1[iter1.name] = iter1.name

            if ok ==1:
                models.firewall.objects.create(name=name1, process=process1, local_ip=local_ip1, local_port=local_port1,
                                               remote_ip=remote_ip1, remote_port=remote_port1, protocol=protocol1,
                                               direction=direction1,
                                               action=action1, type=type1, enalbled=enalbled1, profile=profile1)
                rule_list = models.firewall.objects.all()
                return render(request, 't1.html', {'li': rule_list})
            else:
                from collections import Counter

                z = {**values,**empty_error}
                return render(request, 't2.html',z)
        else:
            rule_list = models.firewall.objects.all()
            return render(request, 't1.html', {'li': rule_list})
def search(request):
    if 'search' in request.POST:
        rule_list = models.firewall.objects.all().filter(name__icontains=request.POST['search_name'])
        return render(request, 't1.html', {'li': rule_list})
    else:
        return render(request, 't2.html')
def delete(request):
    rule_list = models.firewall.objects.all()
    if request.method == "POST":
        if len(request.POST['delete_number'])>0:
            models.firewall.objects.filter(id=request.POST['delete_number']).delete()
            rule_list = models.firewall.objects.all()
            return render(request, 't1.html', {'li': rule_list})
    return render(request, 't1.html', {'li': rule_list})
def D(request):
    v = request.get_full_path().split("id=", 1)[1]
    models.firewall.objects.filter(id=v).delete()
    rule_list = models.firewall.objects.all()
    return render(request, 't1.html', {'li': rule_list})


def change_(request):
    if request.method == "POST":
        print("00")
        if 'c_submit' in request.POST:
            print("01")
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
            profile1 = request.POST['profile']

            values_t = {'v1': name1, 'v2': process1, 'v3': local_ip1, 'v4': local_port1, 'v5': remote_ip1,
                        'v6': remote_port1,
                        'v7': protocol1, 'v8': direction1, 'v9': action1, 'v10': type1, 'v11': enalbled1,
                        'v12': profile1, }

            empty_error = {'error1': '', 'error2': '', 'error3': '', 'error4': '', 'error5': '', 'error6': '',
                           'error7': '',
                           'error8': '', 'error9': '', 'error10': '', 'error11': '', 'error12': '', }

            values_t,empty_error,ok = check(values_t,empty_error,2)



            # ok = 1  #
            if ok==1:
                print(1)
                tmp1 = models.var.objects.filter(id = 1)
                v = 0
                for ttmp1 in tmp1:
                    v = ttmp1.var
                models.firewall.objects.filter(id=v).delete()
                models.firewall.objects.create(name=name1, process=process1, local_ip=local_ip1, local_port=local_port1,
                                               remote_ip=remote_ip1, remote_port=remote_port1, protocol=protocol1,
                                               direction=direction1,
                                               action=action1, type=type1, enalbled=enalbled1, profile=profile1)
            else:
                z = {**values_t, **empty_error}
                return render(request, 't3.html', z)

        else:
            pass
        rule_list = models.firewall.objects.all()
        return render(request, 't1.html', {'li': rule_list})
    models.var.objects.filter(id = 1).delete() #= request.get_full_path().split("id=", 1)[1]
    models.var.objects.create(id = 1,var = request.get_full_path().split("id=", 1)[1])
    rule_list = models.firewall.objects.all().filter(id=request.get_full_path().split("id=", 1)[1])
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
    values = {'v1': name1, 'v2': process1, 'v3': local_ip1, 'v4': local_port1, 'v5': remote_ip1, 'v6': remote_port1,
              'v7': protocol1, 'v8': direction1, 'v9': action1, 'v10': type1, 'v11': enalbled1, 'v12': profile1, }
    print(values['v1'])
    return render(request, 't3.html', values)

def index(request):
    rule_list = models.firewall.objects.all()
    if request.method == "POST":
     rule_list = models.firewall.objects.all()
    return render(request,'t1.html',{'li':rule_list})
def index1(request):
    if request.method == "POST":
        models.Rule.objects.filter(number=request.POST['number']).delete()
    rule_list = models.Rule.objects.all()
    return render(request,'t1.html',{'li':rule_list})