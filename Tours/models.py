from django.db import models
from django.db.models import Q
from django.contrib.auth.models import User

# Create your models here.

class City(models.Model):
    city_name = models.CharField(max_length=50)
    desc = models.CharField(max_length=5000)
    date = models.DateField()
    image = models.ImageField(upload_to = "Tours/images",default="")
    image2 = models.ImageField(upload_to = "Tours/images",default="")
    part = models.CharField(max_length=100, choices=(('North India','North India'),('South India','South India'),('East India','East India'),('West India','West India'),('Central India','Central India'),('Union Territories','Union Territories'), ('Holiday Ideas','Holiday Ideas'),  ('Places to Stay','Places to Stay'),),default="")
    tagline = models.CharField(max_length=100,default='')

    def __str__(self):
        return self.city_name


class Package(models.Model):
    package_name = models.CharField(max_length=255)
    image = models.FileField(upload_to = "Tours/images",default="")
    description= models.CharField(max_length=5000)
    days= models.IntegerField(default=0)
    nights= models.IntegerField(default=0)
    price= models.FloatField(default=0)


    ci=[]
    ty=[]
    c = City.objects.filter(~Q(part="Holiday Ideas"))
    for i in c:
        ty.append(i.city_name)
        ty.append(i.city_name)
        ty=tuple(ty)
        ci.append(ty)
        ty=[]
    ci.append(('None','None'))
    
    city = models.CharField(max_length=100,choices=ci,default="")
    ci=[]
    ty=[]
    c = City.objects.filter(part="Holiday Ideas")
    for i in c:
        ty.append(i.city_name)
        ty.append(i.city_name)
        ty=tuple(ty)
        ci.append(ty)
        ty=[]
    ci.append(('None','None'))
    holidays = models.CharField(max_length=100,choices=ci,default="")
    def __str__(self):
        return self.package_name



class Placestostay(models.Model):
    city_name = models.CharField(max_length=50)
    desc = models.CharField(max_length=5000)
    date = models.DateField()
    image = models.ImageField(upload_to = "Tours/images",default="")
    image2 = models.ImageField(upload_to = "Tours/images",default="")
    part = models.CharField(max_length=100, choices=(('City-Wise','City-Wise'),('Wildlife Resorts','Wildlife Resorts'),('Beach Resorts','Beach Resorts'),('Luxury Hotels','Luxury Hotels')),default="")
    tagline = models.CharField(max_length=100,default='')

    def __str__(self):
        return self.city_name

class staypackage(models.Model):
    place = models.ForeignKey(Placestostay,related_name='+', on_delete=models.CASCADE)
    title=models.CharField(max_length=100, default="")
    description=models.CharField(max_length=5000)
    image = models.FileField(upload_to = 'Tours/images/')
 
    def __str__(self):
        return self.title



        

class day(models.Model):
    package=models.ForeignKey(Package,related_name='+', on_delete=models.CASCADE)
    title=models.CharField(max_length=100, default="")
    description=models.CharField(max_length=5000)

    def __str__(self):
        return str(self.package)

class PostImage(models.Model):
    post = models.ForeignKey(Package, default=None, on_delete=models.CASCADE)
    images = models.FileField(upload_to = 'Tours/images/')
 
    def __str__(self):
        return self.post.package_name

class TopThingsToDo(models.Model):
    city=models.ForeignKey(City,related_name='+', on_delete=models.CASCADE)
    title=models.CharField(max_length=100, default="")
    description=models.CharField(max_length=5000)
    image = models.FileField(upload_to = "Tours/images",default="")

    def __str__(self):
        return str(self.city)


class QnA(models.Model):
    city=models.ForeignKey(City,related_name='+', on_delete=models.CASCADE)
    question=models.CharField(max_length=3000, default="")
    answer=models.CharField(max_length=5000)

    def __str__(self):
        return str(self.city)


class pessanger_detail(models.Model):
    name = models.CharField(max_length=200)

    email = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    date = models.DateField()
    duration = models.CharField(max_length=200)
    persons = models.IntegerField(max_length=200)
    number = models.IntegerField(max_length=20)
    
    ci=[]
    ty=[]
    c = Package.objects.all()
    for i in c:
        ty.append(i.package_name)
        ty.append(i.package_name)
        ty=tuple(ty)
        ci.append(ty)
        ty=[]
    ci.append(('None','None'))
    
    package = models.CharField(max_length=100,choices=ci,default="")
    Booked= models.BooleanField(default=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    # Trip_id = models.AutoField(primary_key=True)
    # # Trip_same_id = models.IntegerField(default=1)
    # first_name = models.CharField(max_length=15)
    # last_name = models.CharField(max_length=15)
    # age = models.IntegerField(default=10)
    # # username = models.CharField(max_length=10)
    # Trip_date = models.DateField()
    # payment = models.IntegerField(default=50)
    # package = models.CharField(max_length=20)
    # pay_done = models.IntegerField(default=0)

    def __str__(self):
        return str(self.name)



class Pl(models.Model):
    city_name = models.CharField(max_length=50)
    desc = models.CharField(max_length=5000)
    date = models.DateField()
    image = models.ImageField(upload_to = "Tours/images",default="")
    image2 = models.ImageField(upload_to = "Tours/images",default="")
    part = models.CharField(max_length=100, choices=(('North India','North India'),('South India','South India'),('East India','East India'),('West India','West India'),('Central India','Central India'),('Union Territories','Union Territories'), ('Holiday Ideas','Holiday Ideas')),default="")
    tagline = models.CharField(max_length=100,default='')

    def __str__(self):
        return self.city_name