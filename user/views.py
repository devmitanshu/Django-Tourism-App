from telnetlib import LOGOUT
from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout 
from django.contrib.auth import logout as auth_logout
from django.contrib import messages
from user.models import Profile
from Tours.models import pessanger_detail
from Tours.models import Package
from django.conf import settings
from django.core.mail import send_mail


# Create your views here.




def registration(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        pass1 = request.POST['pass1']
        pass2 = request.POST['pass2']
    
        if len(username)>10:
            messages.warning(request, "Username must be under 10 characters")
            return redirect("register")
        if pass1 != pass2:
            messages.warning(request, "Passwords do not match")
            return redirect("register")

        myuser = User.objects.create_user(username, email, pass1)
        profile_obj = Profile.objects.create(user = myuser , name = username, country = "", gender = "", number = 123456789, image = "")
        profile_obj.save()


        myuser.save()
        return redirect('Home') #redirect to login page

    return redirect("Home")



    # form =  SignupForm(request.POST)
    # if request.method == 'POST':
    #     if form.is_valid():
    #         form.save()
    #     else:
    #         form = SignupForm(request.POST)
    # return render(request,'register.html', {'form': form})

def handlelogin(request):

    if request.user.is_authenticated:
        messages.success(request, "You are already logged in!")
        return redirect("Home")
    else:
        if request.method =="POST":
            username = request.POST.get('username')
            password= request.POST.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                request.session['id']= user.id
                login(request, user)
                
                messages.success(request, "Login successfull!")
                return redirect("Home") #authenticate page
                # login(request, user)
                # request.session['pk']=user.pk
                # fname=user.first_name
        # form = AuthenticationForm()
            else:
                messages.warning(request, "Invalid Credentials. Please try again.")
                return redirect("login")
        
            

        return redirect("Home")

def handlelogout(request):
    try:
        del request.session['id']
    except KeyError:
        pass
    logout(request)
    auth_logout(request)
    messages.success(request, "Logged out successfully!")
    return redirect("Home")


@login_required()
def editprofile(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        number = request.POST.get('number')
        gender = request.POST.get('gender')
        country = request.POST.get('country')
        image = request.POST.get('image')


        user = User.objects.get(id=request.session['id'])    

        prof_obj = Profile.objects.get(user=user)
        prof_obj.name = name
        prof_obj.number = number
        prof_obj.gender = gender
        prof_obj.country = country
        prof_obj.image = image
        prof_obj.save()
        return redirect('showprofile')

    return render(request, 'ProfileDashboard.html')


@login_required()
def editlogin(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
    


        user = User.objects.get(id=request.session['id'])    

        user.email = email
        user.set_password(password)
        user.save()
        
        return redirect('Home')

    return render(request, 'ProfileDashboard.html')


@login_required()
def showprofile(request):
    # user = User.objects.get(id = request.session['id'])
    profile = Profile.objects.get(user_id=request.session['id'])
    recent_trips = pessanger_detail.objects.filter(user_id=request.session['id'])
    packages=[]
    for i in recent_trips:
        if i.Booked==1:
            packages.append(i.package)
    print(packages)
    package_details=[]
    for package in packages:
        package_details.append(Package.objects.filter(package_name=package))
 
 
    return render(request, 'ProfileDashboard.html', {'profile':profile,'package_details':package_details,'packages':packages})

@login_required()
def showlogindetails(request):
    user = User.objects.get(id = request.session['id'])

    return render(request, 'ProfileDashboard.html', {'user':user})


@login_required()
def showrecenttrips(request):
    user = User.objects.get(id = request.session['id'])
    detail = pessanger_detail.objects.get(user = user)

    return render(request, 'ProfileDashboard.html', {'detail':detail})


def forgotpassword(request):
    return render(request, 'forgotpass.html')


def success(request):
    return render(request , 'success.html')


def token_send(request):
    return render(request , 'token_send.html')


def verify(request , auth_token):
    try:
        profile_obj = Profile.objects.filter(auth_token = auth_token).first()
    

        if profile_obj:
            if profile_obj.is_verified:
                messages.success(request, 'Your account is already verified.')
                return redirect('/login')
            profile_obj.is_verified = True
            profile_obj.save()
            messages.success(request, 'Your account has been verified.')
            return redirect('/login')
        else:
            return redirect('/error')
    except Exception as e:
        print(e)
        return redirect('/')

def error_page(request):
    return  render(request , 'error.html')

# def forgotpassword(request):
#     return render(request , 'forgotpass.html')

# def passwordresetdone(request):
#     return render(request , 'passresetdone.html')




def send_mail_after_registration(email , token):
    subject = 'Your accounts need to be verified'
    message = f'Hi paste the link to verify your account http://127.0.0.1:8000/verify/{token}'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email]
    send_mail(subject, message , email_from ,recipient_list )
