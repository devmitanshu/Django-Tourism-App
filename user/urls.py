from . import views
from django.urls import path
from django.contrib.auth import views as auth_views
from django.conf.urls.static import static
from django.conf import settings

        

urlpatterns = [
    path("register/",views.registration, name ="register"),
    path("login/",views.handlelogin, name ="login"),
    path("logout/",views.handlelogout, name ="handlelogout"),
    path("editprofile/",views.editprofile, name ="editprofile"),
    path("editlogin/",views.editlogin, name ="editlogin"),
    path("showprofile/",views.showprofile, name ="showprofile"),
    path("forgotpassword/",views.forgotpassword, name ="forgotpassword"),
    # path("profile/", views.showlogindetails, name ="showlogindetails"),
    # path("profile/", views.showrecenttrips, name ="showrecenttrips"),
    # path("reset_password/", auth_views.PasswordResetView.as_view(template_name = "/Tours/Templates/forgotpass.html"), name="reset_password"),
    # path("reset_password_sent/", auth_views.PasswordResetDoneView.as_view(template_name = "/Tours//Templates/password_reset_sent.html"), name="password_reset_done"),
    # path("reset/<uidb64>/<token>/", auth_views.PasswordResetConfirmView.as_view(template_name = "/Tours//Templates/password_reset_form.html"), name="password_reset_confirm"),
    # path("reset_password_complete/", auth_views.PasswordResetCompleteView.as_view(template_name = "/Tours//Templates/passresetdone.html"), name="password_reset_complete"),
    

] +static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)