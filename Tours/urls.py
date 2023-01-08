from . import views
from django.urls import path
from django.contrib.auth import views as auth_views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path("", views.index, name ="Home"),
    path(r'^packages/(?P<city>\w+)/$', views.packages, name ="packages"),
    path(r'^package_info/(?P<i>\d{1})/$', views.package_info, name ="package_info"),
    path(r'^holiday_ideas/(?P<type>\w+)/$', views.holiday_ideas, name ="holiday_ideas"),
    path("thankyou", views.thankyou, name ="thankyou"),
    path("passengerdetail", views.pessanger_detail_def, name ="passengerdetail"),
    path(r'^placestostay/(?P<id>\d{1})/$', views.placestostay, name ="placestostay"),
    path("reset_password/", auth_views.PasswordResetView.as_view(template_name = "forgotpass.html"), name="reset_password"),
    path("reset_password_sent/", auth_views.PasswordResetDoneView.as_view(template_name = "password_reset_sent.html"), name="password_reset_done"),
    path("reset/<uidb64>/<token>/", auth_views.PasswordResetConfirmView.as_view(template_name = "password_reset_form.html"), name="password_reset_confirm"),
    path("reset_password_complete/", auth_views.PasswordResetCompleteView.as_view(template_name = "passresetdone.html"), name="password_reset_complete"),
    
] +static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
