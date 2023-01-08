from django.contrib import admin
from .models import City, Package, day, PostImage, TopThingsToDo, pessanger_detail, QnA, Placestostay, staypackage
# Register your models here.

admin.site.register(pessanger_detail)
# admin.site.register(Placestostay)

# admin.site.register(Package)  
# admin.site.register(days)

class staypackageInline(admin.StackedInline):
    model = staypackage

class staypackageAdmin(admin.ModelAdmin):
    inlines = [staypackageInline]

    class Meta:
        model=Placestostay

admin.site.register(Placestostay, staypackageAdmin)

class TopThingsInline(admin.StackedInline):
    model = TopThingsToDo

class QnAInline(admin.StackedInline):
    model = QnA

class CityAdmin(admin.ModelAdmin):
    inlines = [TopThingsInline, QnAInline]

    class Meta:
        model=City

admin.site.register(City, CityAdmin)
class daysInline(admin.StackedInline):
    model = day

class PostImageAdmin(admin.StackedInline):
    model = PostImage

class PackageAdmin(admin.ModelAdmin):
    inlines = [daysInline, PostImageAdmin]

    class Meta:
        model = Package

admin.site.register(Package, PackageAdmin)