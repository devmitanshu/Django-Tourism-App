from django.shortcuts import render,redirect
from .models import City, Placestostay, staypackage
from .models import Package
from .models import day
from .models import TopThingsToDo, QnA
from .models import pessanger_detail
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.mail import BadHeaderError, send_mail
from django.http import HttpResponse, HttpResponseRedirect

from .models import PostImage
from math import ceil

# Create your views here.
def index(request):
    north_india = City.objects.filter(part='North India')
    south_india = City.objects.filter(part='South India')
    east_india = City.objects.filter(part='East India')
    west_india = City.objects.filter(part='West India')
    central_india = City.objects.filter(part='Central India')
    union_territories = City.objects.filter(part='Union Territories')
    holiday_ideas = City.objects.filter(part='Holiday Ideas')
    city_wise = Placestostay.objects.filter(part='City-Wise')
    wildlife = Placestostay.objects.filter(part='Wildlife Resorts')
    beach = Placestostay.objects.filter(part='Beach Resorts')
    hotels = Placestostay.objects.filter(part='Luxury Hotels')
    packages = Package.objects.all()
    city = City.objects.all()
    
    for i in holiday_ideas:
        print(i.city_name)
    params = {'north_india':north_india, 'south_india':south_india, 'east_india':east_india, 'west_india':west_india, 'central_india':central_india, 'union_territories':union_territories, 'holiday_ideas':holiday_ideas, 'city_wise':city_wise, 'wildlife':wildlife, 'beach':beach, 'hotels':hotels, 'city':city,'packages': packages}
    return render(request,'index.html',params)


def packages(request,city):
    north_india = City.objects.filter(part='North India')
    south_india = City.objects.filter(part='South India')
    east_india = City.objects.filter(part='East India')
    west_india = City.objects.filter(part='West India')
    central_india = City.objects.filter(part='Central India')
    union_territories = City.objects.filter(part='Union Territories')
    holiday_ideas = City.objects.filter(part='Holiday Ideas')
    city_wise = Placestostay.objects.filter(part='City-Wise')
    wildlife = Placestostay.objects.filter(part='Wildlife Resorts')
    beach = Placestostay.objects.filter(part='Beach Resorts')
    hotels = Placestostay.objects.filter(part='Luxury Hotels')
    system = request.POST.get("system",None)
    try:
        city = City.objects.get(city_name=city)
        id = city.id
        c = City.objects.all()
    except City.DoesNotExist:
        city=None
        c=None
    try:
        packages = Package.objects.filter(city=city)
        # for i in packages:
        #     new=Package.objects.get(id=i.id)
        #     new.days=day.objects.filter(package_id=i).count()
        #     new.nights=(day.objects.filter(package_id=i).count())+1
        #     new.save()
    except Package.DoesNotExist:
        packages = None
    try:
        days = day.objects.filter(package_id=10)
    except Package.DoesNotExist:
        days = None
    try:
        topthings = TopThingsToDo.objects.filter(city=id)
    except Package.DoesNotExist:
        topthings=None    
    try:
        qna = QnA.objects.filter(city=id)
    except Package.DoesNotExist:
        qna=None    
  
    for i in city_wise:
        print (i.id)
    
    params = {'selected_city':city,'selected_packages':packages, "days":days, 'city':c, 'topthings':topthings,'qna':qna,'north_india':north_india, 'south_india':south_india, 'east_india':east_india, 'west_india':west_india, 'central_india':central_india, 'union_territories':union_territories, 'holiday_ideas':holiday_ideas, 'city_wise':city_wise, 'wildlife':wildlife, 'beach':beach, 'hotels':hotels}
    return render(request,'Packages.html',params)



def package_info(request,i):
    # id = request.POST.get("package",None)
    north_india = City.objects.filter(part='North India')
    south_india = City.objects.filter(part='South India')
    east_india = City.objects.filter(part='East India')
    west_india = City.objects.filter(part='West India')
    central_india = City.objects.filter(part='Central India')
    union_territories = City.objects.filter(part='Union Territories')
    holiday_ideas = City.objects.filter(part='Holiday Ideas')
    city_wise = Placestostay.objects.filter(part='City-Wise')
    wildlife = Placestostay.objects.filter(part='Wildlife Resorts')
    beach = Placestostay.objects.filter(part='Beach Resorts')
    hotels = Placestostay.objects.filter(part='Luxury Hotels')
    package = Package.objects.get(id=i)
    days = day.objects.filter(package_id=i)
    images = PostImage.objects.filter(post_id=i)


    
    n = images.count()
    n= n+1
    for i in range(1,n):
        print(i)
    params = {'package':package, "days":days, "images":images, "package_id": i, "range":range(1,n), 'north_india':north_india, 'south_india':south_india, 'east_india':east_india, 'west_india':west_india, 'central_india':central_india, 'union_territories':union_territories, 'holiday_ideas':holiday_ideas, 'city_wise':city_wise, 'wildlife':wildlife, 'beach':beach, 'hotels':hotels}
    return render(request, "Packages-itenary.html", params)

def holiday_ideas(request,type):
    north_india = City.objects.filter(part='North India')
    south_india = City.objects.filter(part='South India')
    east_india = City.objects.filter(part='East India')
    west_india = City.objects.filter(part='West India')
    central_india = City.objects.filter(part='Central India')
    union_territories = City.objects.filter(part='Union Territories')
    holiday_ideas = City.objects.filter(part='Holiday Ideas')
    city_wise = Placestostay.objects.filter(part='City-Wise')
    wildlife = Placestostay.objects.filter(part='Wildlife Resorts')
    beach = Placestostay.objects.filter(part='Beach Resorts')
    hotels = Placestostay.objects.filter(part='Luxury Hotels')
    try:
        city = City.objects.get(city_name=type)
        c = City.objects.all()
    except City.DoesNotExist:
        city=None
        c=None
    try:
        packages = Package.objects.filter(holidays=type)
        # for i in packages:
        #     new=Package.objects.get(id=i.id)
        #     new.days=day.objects.filter(package_id=i).count()
        #     new.nights=(day.objects.filter(package_id=i).count())+1
        #     new.save()
    except Package.DoesNotExist:
        packages = None
    for i in packages:
        print(i.package_name)
    params = {'packages':packages,'city':city, 'north_india':north_india, 'south_india':south_india, 'east_india':east_india, 'west_india':west_india, 'central_india':central_india, 'union_territories':union_territories, 'holiday_ideas':holiday_ideas, 'city_wise':city_wise, 'wildlife':wildlife, 'beach':beach, 'hotels':hotels}
    return render(request, 'beaches.html',params)

def placestostay(request, id):
    north_india = City.objects.filter(part='North India')
    south_india = City.objects.filter(part='South India')
    east_india = City.objects.filter(part='East India')
    west_india = City.objects.filter(part='West India')
    central_india = City.objects.filter(part='Central India')
    union_territories = City.objects.filter(part='Union Territories')
    holiday_ideas = City.objects.filter(part='Holiday Ideas')
    city_wise = Placestostay.objects.filter(part='City-Wise')
    wildlife = Placestostay.objects.filter(part='Wildlife Resorts')
    beach = Placestostay.objects.filter(part='Beach Resorts')
    hotels = Placestostay.objects.filter(part='Luxury Hotels')

    places = Placestostay.objects.get(id=id)
    stayplace = staypackage.objects.filter(place=places)
    
    # for i in holiday_ideas:
    #     print(i.city_name)
    params = {'north_india':north_india, 'south_india':south_india, 'east_india':east_india, 'west_india':west_india, 'central_india':central_india, 'union_territories':union_territories, 'holiday_ideas':holiday_ideas, 'city_wise':city_wise, 'wildlife':wildlife, 'beach':beach, 'hotels':hotels, 'places':places,'stayplace':stayplace}
    return render(request,'placetoStay-Goa.html',params)








def thankyou(request):
    return render(request, 'thankyou.html')

@login_required
def pessanger_detail_def(request):
    
    # KeyValueFormSet = formset_factory(KeyValueForm, extra=1)
    if request.method == 'POST':
        subject = "Quote"
        name = request.POST.get('name')
        # country = request.POST.get('country')
        email = request.POST.get('email')
        description = request.POST.get('description')
        date = request.POST.get('date')
        duration = request.POST.get('duration')
        persons = request.POST.get('persons')
        number = request.POST.get('number')
        message1 = "Name: "+name+"\nDescription: "+description+"\nDate: "+date+"\nDuration: "+duration+"\nPersons: "+persons+"\nPhone number: "+number
        message2 = "Thanks for contacting "+name.capitalize()+", we will get back to you!"
        from_email = email
        if subject and message1 and message2 and from_email:
            try:
                send_mail(subject, message2, 'mahimatanwani333@gmail.com', [email])
                send_mail(subject, message1, 'mahimatanwani333@gmail.com', ["dakshchavan10@gmail.com"])
                user = User.objects.get(id = request.session['id'])

                passanger_object = pessanger_detail.objects.create(user= user, name=name, email = email, description = description, date = date, duration = duration, persons = persons, number = number)

                passanger_object.save()
            except BadHeaderError:
                return HttpResponse('Invalid header found.')
            return redirect('thankyou')
        else:
        # In reality we'd use a form class
        # to get proper validation errors.
            return HttpResponse('Make sure all fields are entered and valid.')