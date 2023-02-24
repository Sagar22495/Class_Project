from adminapp.models import Category, Product, SubCategory
from django.contrib import messages
from django.contrib.auth.models import User, auth
from django.http import *
from django.shortcuts import redirect, render
from .models import Buynow, Cart, Orderplace, Userdata, Wishlist

# Create your views here.

## home page
def Home(request):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    
    if 'user' in request.session:
        vsess=request.session['user']
        sid=request.session['userid']
        countcart=Cart.objects.filter(uid=sid).count()
        return render(request,'home.html',{'vname':vsess,'cat':objcat,'sub':objsub,'count':countcart})
    else:
        return render(request,'home.html',{'cat':objcat,'sub':objsub})   

##(not use) to return to the previous url
def Returncurrent(request):
    return redirect(request.META['HTTP_REFERER'])

## signup 
def Signup(request):
    if request.method == "POST":
        vusername=request.POST.get('username')
        vfirestname=request.POST.get('firstname')
        vlastname=request.POST.get('lastname')
        vemail=request.POST.get('email')
        vpassword=request.POST.get('password')
        if Userdata.objects.filter(username=vusername).exists():
            messages.error(request,"username alredy exits")
            return render(request,'usersignup.html')
        else:
            new_user=Userdata()
            new_user.username=vusername
            new_user.firstname=vfirestname
            new_user.lastname=vlastname
            new_user.email=vemail
            new_user.password=vpassword
            new_user.save()
            return redirect("/login")
    else:
        return render(request,'usersignup.html')

## login
def Login(request):
    if request.method == "POST":
        vusername=request.POST.get('username')
        vpassword=request.POST.get('password')
        log_user=Userdata.objects.filter(username=vusername,password=vpassword)
        # to fetch the id of the user
        userid=0
        for n in log_user:
            userid=n.id
        num_rows=log_user.count()

        if num_rows == 1:
            request.session['user']=vusername
            request.session['userid']=userid
            
            return redirect("/")
        else:
            messages.error(request,"username or password is incorrect")
            return render(request,'userlogin.html')
    else:
        return render(request,'userlogin.html')
        
## logout (delete the session)
def Logout(request):
    request.session.flush()
    return redirect(request.META['HTTP_REFERER'])  ## return the previous url
## about page
def About(request):
    return render(request,'about.html')
## Contact page
def Contact(request):
    return render(request,'contact.html')
## category page

def CategoryName(request,catid,subid):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    objprod=Product.objects.filter(categoryindex=catid,  subcategoryindex=subid)
    
    # to show author in filter so firstly get author names
    auth=[]
    for i in objprod:
        if i.author not in auth: ## check if auth name is present or not  
            auth.append(i.author)

    if 'user' in request.session:
        vsess=request.session['user']
        sid=request.session['userid']
        ## filter data related to login user
        ## to show number of item in cart(used at cart symbol)
        countcart=Cart.objects.filter(uid=sid).count()

        ## use to check which products already are in wishlist of user(for showing red heart)
        objwish=Wishlist.objects.filter(uid=sid)
        wishlistproduct = []
        for i in objwish:
            wishlistproduct.append(i.pid)
        
        contax={'vname':vsess,'cat':objcat,'sub':objsub,'prod':objprod,'wish':wishlistproduct,'author':auth,'count':countcart}
        return render(request,'category.html',contax)

    else:
        return render(request,'category.html',{'cat':objcat,'sub':objsub,'prod':objprod,'author':auth}) 

## AJAX: filter the products as per the author name
def Getauthorfilter(request):
    auth=request.POST.getlist('chkval[]')
    catid=request.POST.get('catid')
    subid=request.POST.get('subid')
    objprod=Product.objects.filter(categoryindex=catid,  subcategoryindex=subid)
    ## if user checked on author name the upper auth list send to template and if at the end he checked and remove checked then shoe all the author realted product(when there is nothing checked)
    if len(auth)==0:
        auth=[]
        for i in objprod:
            if i.author not in auth:
                auth.append(i.author)
    
    return render(request,'getauthorfilter.html',{'auth':auth,'prod':objprod})

##AJAX: filter the products based on the high to loe , low to high etc
def Filterproducts(request):
    filterprod=request.GET.get('filterprod')
    catid=request.GET.get('catid')
    subid=request.GET.get('subid')
    if int(filterprod) == 1:
        objprod=Product.objects.filter(categoryindex=catid, subcategoryindex=subid).order_by('-id')
    elif int(filterprod) == 2:
        objprod=Product.objects.filter(categoryindex=catid, subcategoryindex=subid).order_by('id')
    elif int(filterprod) == 3:
        objprod=Product.objects.filter(categoryindex=catid, subcategoryindex=subid).order_by('discountprice')
    elif int(filterprod) == 4:
        objprod=Product.objects.filter(categoryindex=catid, subcategoryindex=subid).order_by('-discountprice')
    else:
        objprod=Product.objects.filter(categoryindex=catid, subcategoryindex=subid)

    return render(request,'filterproducts.html',{'prod':objprod})
    
## more details: when user clicked on any product
def MoreDetails(request,sid):
    objprod=Product.objects.get(id=sid) ## get id of product
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    if 'user' in request.session:
        vsess=request.session['user']
        uid=request.session['userid']
        countcart=Cart.objects.filter(uid=uid).count()  ## cart item count
        return render(request,'more_details.html',{'vname':vsess,'cat':objcat,'sub':objsub,'prod':objprod,'count':countcart})
    else:
        return render(request,'more_details.html',{'cat':objcat,'sub':objsub,'prod':objprod})

### for search bar
def Search(request):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    result=request.GET.get('search')  ##get search text
    if len(result)>50:
        objprod=[]
    else:
        objprod=Product.objects.filter(productname__icontains=result) ## check result in productname
        ##### objprodprod=Product.objects.filter(productname__icontains=result)
        ##### objproddes=Product.objects.filter(proddiscription__icontains=result)
        ##### objprod= objprodprod.union(objproddes)
        
    return render(request,'search.html',{'prod':objprod,'result':result,'cat':objcat,'sub':objsub})
## add to cart
def AddtoCart(request,pid,uid):
    objcart=Cart.objects.filter(pid=pid,uid=uid).count() ## check this peoduct is already present or not
    if objcart >=1:
        return redirect('/showcart')
    else:
        # if not present then add it
        objcart=Cart()
        objcart.pid=pid
        objcart.uid=uid
        objcart.save()
        return redirect('/showcart')
## show items in cart
def Showcart(request):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    if 'user' in request.session:
        sid=str(request.session['userid'])
        vsess=request.session['user']
        # filter the cart item as per user id(sid)
        objcart=Cart.objects.raw("select * from shop_cart join shop_userdata join adminapp_product on shop_cart.uid = shop_userdata.id and shop_cart.pid = adminapp_product.id where shop_cart.uid = '"+sid+"' order by shop_cart.id desc")
        # order by (to for new items display on top)
        sid=request.session['userid']
        objuser=Userdata.objects.get(id=sid)
        countcart=Cart.objects.filter(uid=sid).count() # to show no of item in cart
        range=[1,2,3,4,5]
        return render(request,"cart.html",{'user':objuser,'vname':vsess,'cart':objcart,'cat':objcat,'sub':objsub,'count':countcart,'range':range})
    else:
        return render(request,"cart.html",{'cat':objcat,'sub':objsub})
## AJAX: to change the quantity of product
def Productqty(request):
    qty=request.POST.get('pqty')
    cid=request.POST.get('cid')
    objcart=Cart.objects.get(id=cid)
    objcart.qty=qty
    objcart.save()
    return redirect(request.META['HTTP_REFERER'])
## Delete the Items in cart
def Delcart(request,pid,uid):
    objw=Cart.objects.filter(uid=uid,pid=pid)
    objw.delete()
    return redirect(request.META['HTTP_REFERER'])
## Buy now
def Buynowprod(request,pid,uid):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    # sid=request.session['userid']
    objbuy=Buynow.objects.filter(uid=uid).count() # to count number of objects
    obj=Buynow.objects.filter(pid=pid,uid=uid).count() # use when we update qty with same pid,uid

    range=[1,2,3,4,5] # this is for number of qty
    ## if item present , then firstly delete it
    if objbuy >=1 and obj != 1:
        objbuy=Buynow.objects.all()
        objbuy.delete()
    # it work when we update qty
    if obj == 1:
        objbuy=Buynow.objects.filter(pid=pid,uid=uid)
    # it work when we don't update qty
    else:
        objbuy=Buynow()
        objbuy.pid=pid
        objbuy.uid=uid
        objbuy.save()

    if 'user' in request.session:
        sid=str(request.session['userid'])
        vsess=request.session['user']
        # filter the cart item as per user id(sid)
        objbuy=Buynow.objects.raw("select * from shop_buynow join shop_userdata join adminapp_product on shop_buynow.uid = shop_userdata.id and shop_buynow.pid = adminapp_product.id where shop_buynow.uid = '"+sid+"'")
        sid=request.session['userid']
        objuser=Userdata.objects.get(id=sid)
        countcart=Cart.objects.filter(uid=sid).count()
        return render(request,'buynow.html',{'user':objuser,'buynow':objbuy,'vname':vsess,'cat':objcat,'sub':objsub,'range':range,'count':countcart})
    else:
        return render(request,'buynow.html',{'cat':objcat,'sub':objsub})
## change the qty of product in BUY NOW
def Buynowroductqty(request):
    if 'user' in request.session:
        qty=request.POST.get('pqty')
        cid=request.POST.get('cid')
        objbuy=Buynow.objects.get(id=cid) #cid is a id of that table
        objbuy.qty=qty
        objbuy.save()
        return redirect(request.META['HTTP_REFERER'])
    else:
        return Http404()
### checkout item From BUYNOW
def Checkout(request):
    if 'user' in request.session:
        vsess=request.session['user']
        pid=request.POST.get('pid')
        uid=request.POST.get('uid')
        qty=request.POST.get('pqty')
        price=float(request.POST.get('price'))
        objchk=Orderplace()
        objchk.pid=pid
        objchk.uid=uid
        objchk.qty=qty
        objchk.price=price
        objchk.save()
        return render(request,'chkresult.html',{'uid':uid})
    return redirect("/")
### checkout item From CART
def Cartchkout(request):
    if 'user' in request.session:
        uid=request.session['userid']
        cartitems=request.POST.getlist('cartitems[]')
        cartitemsqty=request.POST.getlist('cartitemsqty[]')
        
        finalprice=float(request.POST.get('price'))
        
        i=0
        for i in range(0,len(cartitems)):
            objchk=Orderplace()
            objchk.pid=cartitems[i]
            objchk.qty=cartitemsqty[i]
            objchk.uid=uid
            objchk.price=finalprice
            objchk.save()

        return render(request,'chkresult.html',{'uid':uid})
## to show all orders
def Showorders(request,uid):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    if 'user' in request.session:
        vsess=request.session['user']
        uid=str(uid)
        objorder=Orderplace.objects.raw("select * from shop_orderplace join adminapp_product on shop_orderplace.pid = adminapp_product.id where shop_orderplace.uid = '"+uid+"' order by shop_orderplace.id desc")
        sid=request.session['userid']
        objuser=Userdata.objects.get(id=sid)
        countcart=Cart.objects.filter(uid=sid).count()
        return render(request,'orders.html',{'user':objuser,'vname':vsess,'orders':objorder,'cat':objcat,'sub':objsub,'count':countcart})
    else:
        return redirect("/")
## Add item to wishlist
def Wishlists(request,pid,uid):
    if 'user' in request.session:
        # vsess=request.session['user']
        objw=Wishlist.objects.filter(uid=uid,pid=pid).count()
        if objw >= 1:
            # return redirect(request.META['HTTP_REFERER'])
            return redirect('/')
        else:
            objwish=Wishlist()
            objwish.pid=pid
            objwish.uid=uid
            objwish.save()
            # return redirect(request.META['HTTP_REFERER'])
            return redirect('/')
    else:
        return redirect("/showwishlist")
## Show Item In Wishlist
def Showwishlist(request):
    objcat=Category.objects.all()
    objsub=SubCategory.objects.all()
    if 'user' in request.session:
        sid=str(request.session['userid'])
        vsess=request.session['user']
        objwish=Wishlist.objects.raw("select * from shop_wishlist join shop_userdata join adminapp_product on shop_wishlist.uid = shop_userdata.id and shop_wishlist.pid = adminapp_product.id where shop_wishlist.uid = '"+sid+"' order by shop_wishlist.id desc")
        sid=request.session['userid']
        countcart=Cart.objects.filter(uid=sid).count()
        return render (request,'showwishlist.html',{"wish":objwish,'vname':vsess,'cat':objcat,'sub':objsub,'count':countcart})
    else:
        return render (request,'showwishlist.html',{'cat':objcat,'sub':objsub})
## delete items from wishlist
def Delwishlists(request,pid,uid):
    objw=Wishlist.objects.filter(uid=uid,pid=pid)
    objw.delete()
    return redirect(request.META['HTTP_REFERER'])

## profile page (name , address, phone number etc)
def Profile(request):
    if 'user' in request.session:
        if request.method =="POST":
            sid=request.session['userid']
            objuser=Userdata.objects.get(id=sid)
            vfirestname=request.POST.get('firstname')
            vlastname=request.POST.get('lastname')
            vmobile_number=request.POST.get('mobile_number')
            vaddress=request.POST.get('address')
            objuser.firstname=vfirestname
            objuser.lastname=vlastname
            objuser.mobile_number=vmobile_number
            objuser.address=vaddress
            objuser.save()
            return redirect("/profile")
        else:
            vsess=request.session['user']
            sid=request.session['userid']
            objuser=Userdata.objects.get(id=sid)
            objcat=Category.objects.all()
            objsub=SubCategory.objects.all()
            countcart=Cart.objects.filter(uid=sid).count()
            return render(request,'profile.html',{'user':objuser,'vname':vsess,'cat':objcat,'sub':objsub,'count':countcart})
    else:
        return redirect("/")

#### end ####

###        Not used in this Project ###
def Filtercheck(request):
    objcat=Category.objects.all()
    return render (request,'checkbox.html',{'cat':objcat})

# filter data with ajax (this function is not use in  project)
def Getfilterdata(request):
    data = request.POST.getlist('chkarray[]')
    # print(data)
    # convert string of list into integer of list
    for i in range(0,len(data)):
        data[i]=int(data[i])
    # print(data)
    objprod=Product.objects.filter(categoryindex__in = data) # columnname in data
    print(objprod)

    return render (request,'getfilterdata.html',{'prod':objprod})