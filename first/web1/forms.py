import style as style
from django import forms


class UserForm(forms.Form):
    username = forms.CharField(label="用户名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control', 'style':'margin-bottom : 40px ; margin-top : 10px'}))

    password = forms.CharField(label="密码", max_length=256, widget=forms.PasswordInput(attrs={'class': 'form-control ', 'style':' margin-top : 10px'}))


class RegisterForm(forms.Form):

    p = (

        ('1', "只读"),

        ('2', "添加删改"),

        ('3', "admin"),
    )

    username = forms.CharField(label="用户名", max_length=128, required=False, widget=forms.TextInput(attrs={'class': 'form-control'}))

    password1 = forms.CharField(label="密码", max_length=256, required=False, widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    password2 = forms.CharField(label="确认密码", max_length=256, required=False, widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    email = forms.CharField(label="邮箱地址",required=False, widget=forms.TextInput(attrs={'class': 'form-control'}))

    level = forms.CharField(label="权限", max_length=128, required=False, widget=forms.TextInput(attrs={'class': 'form-control'}))

    level2 = forms.ChoiceField(label='权限', choices=p , widget = forms.Select(attrs={'class': 'form-control'}))