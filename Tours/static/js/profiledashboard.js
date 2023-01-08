const body = document.querySelector("body"),
    sidebar = body.querySelector(".sidebar"),
    bok = body.querySelector(".bok"),
    toggle = body.querySelector(".toggle"),
    xyz = body.querySelector(".xyz");

    toggle.addEventListener("click", () =>{
        sidebar.classList.toggle("close"),
        bok.classList.toggle("bok"),
        xyz.classList.toggle("xyz");

    });

const image_input = document.querySelector("#image_input")
var uploaded_image="";


image_input.addEventListener("change",function(){
    const reader = new FileReader();
    reader.addEventListener("load", () =>{
        uploaded_image = reader.result;
        document.querySelector(".profile").style.backgroundImage = `url(${uploaded_image})`
    });
    reader.readAsDataURL(this.files[0]);
})

function side1(){
    document.getElementById("newHome").style.backgroundColor = "white";
    document.getElementById("Home").style.backgroundColor = "#0D0213";
    document.getElementById("About").style.backgroundColor = "white";
    document.getElementById("Services").style.backgroundColor = "white";
    document.getElementById("Contact_Us").style.backgroundColor = "white";
    document.getElementById("newHome").style.color = "black";
    document.getElementById("Home").style.color = "white";
    document.getElementById("About").style.color = "black";
    document.getElementById("Services").style.color = "black";
    document.getElementById("Contact_Us").style.color = "black";
    swap2();
}

function side2(){
    document.getElementById("newHome").style.backgroundColor = "white";
    document.getElementById("Home").style.backgroundColor = "white";
    document.getElementById("About").style.backgroundColor = "#0D0213";
    document.getElementById("Services").style.backgroundColor = "white";
    document.getElementById("Contact_Us").style.backgroundColor = "white";
    document.getElementById("newHome").style.color = "black";
    document.getElementById("Home").style.color = "black";
    document.getElementById("About").style.color = "white";
    document.getElementById("Services").style.color = "black";
    document.getElementById("Contact_Us").style.color = "black";
    swap4();
}

function side3(){
    document.getElementById("newHome").style.backgroundColor = "white";
    document.getElementById("Home").style.backgroundColor = "white";
    document.getElementById("About").style.backgroundColor = "white";
    document.getElementById("Services").style.backgroundColor = "#0D0213";
    document.getElementById("Contact_Us").style.backgroundColor = "white";
    document.getElementById("newHome").style.color = "black";
    document.getElementById("Home").style.color = "black";
    document.getElementById("About").style.color = "black";
    document.getElementById("Services").style.color = "white";
    document.getElementById("Contact_Us").style.color = "black";
    swap1();
    document.querySelector('.profile_save').style.display = 'none';
    document.querySelector('.rc_trips').style.display = 'block';
}

function side4(){
    document.getElementById("newHome").style.backgroundColor = "white";
    document.getElementById("Home").style.backgroundColor = "white";
    document.getElementById("About").style.backgroundColor = "white";
    document.getElementById("Services").style.backgroundColor = "white";
    document.getElementById("Contact_Us").style.backgroundColor = "#0D0213";
    document.getElementById("newHome").style.color = "black";
    document.getElementById("Home").style.color = "black";
    document.getElementById("About").style.color = "black";
    document.getElementById("Services").style.color = "black";
    document.getElementById("Contact_Us").style.color = "white";
}

function side5(){
    document.getElementById("newHome").style.backgroundColor = "#0D0213";
    document.getElementById("Home").style.backgroundColor = "white";
    document.getElementById("About").style.backgroundColor = "white";
    document.getElementById("Services").style.backgroundColor = "white";
    document.getElementById("Contact_Us").style.backgroundColor = "white";
    document.getElementById("newHome").style.color = "white";
    document.getElementById("Home").style.color = "black";
    document.getElementById("About").style.color = "black";
    document.getElementById("Services").style.color = "black";
    document.getElementById("Contact_Us").style.color = "black";
}

function swap1(){
    document.querySelector('.profile_edit').style.display = 'none';
    document.querySelector('.profile_save').style.display = 'block';
    document.querySelector('.lgd_edit').style.display = 'none';
    document.querySelector('.lgd_save').style.display = 'none';
    document.querySelector('.rc_trips').style.display = 'none';
}

function swap2(){
    document.querySelector('.profile_edit').style.display = 'block';
    document.querySelector('.profile_save').style.display = 'none';
    document.querySelector('.lgd_edit').style.display = 'none';
    document.querySelector('.lgd_save').style.display = 'none';
    document.querySelector('.rc_trips').style.display = 'none';
}

function swap3(){
    document.querySelector('.profile_edit').style.display = 'none';
    document.querySelector('.profile_save').style.display = 'none';
    document.querySelector('.lgd_edit').style.display = 'none';
    document.querySelector('.lgd_save').style.display = 'block';
    document.querySelector('.rc_trips').style.display = 'none';
}

function swap4(){
    document.querySelector('.profile_edit').style.display = 'none';
    document.querySelector('.profile_save').style.display = 'none';
    document.querySelector('.lgd_edit').style.display = 'block';
    document.querySelector('.lgd_save').style.display = 'none';
    document.querySelector('.rc_trips').style.display = 'none';
}