#######################################
#FIRST HTML PAGE
#USING POWERSHELL
#######################################

$htmlpage = "
<HTML>
    <TITLE>
        First Html using powershell
    </TITLE>
    <head>
        <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    </head>
    <body>
        <div class = 'header' >
            <div class ='list'>
               <i class='material-icons' style='padding-top:px'>tag_faces &nbsp;</i>
                <div><ul class = 'listProperty'>
                    Home &nbsp; 
                    Office &nbsp; 
                    Work &nbsp;
                    Contact &nbsp;
                    About
                </div></ul>
            </div>
        </div>
        <div class = 'image'>
            <img src= 'C:\Users\Babu\Google Drive\Git_Folder\Html_Using_Powershell\google.png'>
        </div>

        <style>
        .header
            {
                padding : 10px;
                padding-bottom:5px;
                width : 100%;
                margin : -8px;
                height : 50px;
                background-color: light;
                box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important;
                            }
        .list
            {
                margin-left:50px;
                margin-top:20px;
                width : 500px;
                height : 30px;
                background-color: white;
            }
        .listProperty
            {
                margin-top:-18px;
                font-style:normal;
                font-family:verdana;
                font-size: 12px;
            }
            .image
            {
                height: 50px;
                width: 100px;
                

            }

        </style>

    </body>
</HTML>"



$htmlpage | out-file C:\Scripts\HTML.html  
Invoke-Expression C:\Scripts\HTML.html 