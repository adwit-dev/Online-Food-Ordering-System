<!DOCTYPE html> 
<html lang="en"> 
  
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Feedback Form with map</title> 
    <link rel="stylesheet" href="index.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" /> 

    <style>
    /* style.css */
    @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap'); 

    body { 
        font-family: 'Poppins', sans-serif; 
        margin: 0; 
        padding: 0; 
        display: flex; 
        align-items: center; 
        justify-content: center; 
        min-height: 100vh; 
        background-image: url('https://media.istockphoto.com/id/959262284/vector/cartoon-cute-hand-drawn-fast-food-seamless-pattern.jpg?s=612x612&w=0&k=20&c=vFFQaAumzV5TeDUlP_NsGzHh5UqeXxyFNTqVVghdwQ0='); /* Replace with your actual image URL */
        background-size: cover; /* Cover the entire page */
        background-position: center; /* Center the background image */
        background-repeat: no-repeat; /* Do not repeat the image */
    } 

    .ffbox { 
        display: flex; 
        width: 80%; 
        max-width: 800px; 
        background-color: rgba(255, 255, 255, 0.9); /* Slight transparency to see the background */
        border: 3px solid #e4e4e9; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        overflow: hidden; 
        border-radius: 10px; 
        flex-wrap: wrap; 
    } 

    .ffbox1 { 
        flex: 1; 
        padding: 20px; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
    } 

    .ffbox1 label, .ffbox1 input, .ffbox1 textarea, button { 
        display: block; 
        width: 100%; 
        margin: 8px 0; 
    } 

    .ffbox1 input, .ffbox1 textarea { 
        padding: 8px; 
        box-sizing: border-box; 
        border-radius: 15px; 
        background-color: #dcdce1; 
        border: none; 
    } 

    .ffbox1 textarea { 
        resize: vertical; 
    } 

    .map-div { 
        flex: 1; 
        background-color: #eee; 
    } 

    button { 
        padding: 8px; 
        background-color: rgb(105, 152, 111); 
        color: rgb(183, 213, 179); 
        font-size: 17px; 
        font-weight: 700; 
        border-radius: 15px; 
        border: none; 
    } 

    button:hover { 
        background-color: rgb(52, 98, 58); 
    } 

    .map-div iframe { 
        border: 0; 
        width: 100%; 
        height: 95%; 
        padding: 10px; 
    } 

    .gfg { 
        text-align: center; 
        color: green; 
    } 

    </style>
</head> 
  
<body> 
    <div class="ffbox"> 
        <div class="ffbox1"> 
            <h1 class="gfg">BHOJ</h1> 
            <h2>Contact Us</h2> 
            <form> 
                <label for="fullName"> 
                    <i class="fa fa-solid fa-user" style="margin: 2px;"></i> Full Name: 
                </label> 
                <input type="text" id="fullName" name="fullName" required> 
  
                <label for="email"> 
                    <i class="fa fa-solid fa-envelope" style="margin: 2px;"></i> Email Address: 
                </label> 
                <input type="email" id="email" name="email" required> 
  
                <label for="mobile"> 
                    <i class="fa fa-solid fa-phone" style="margin: 2px;"></i> Contact No: 
                </label> 
                <input type="tel" id="mobile" name="mobile" required> 
  
                <label for="msg"> 
                    <i class="fa fa-solid fa-comment" style="margin: 2px;"></i> Write Message: 
                </label> 
                <textarea id="msg" name="msg" rows="5" required></textarea> 
  
                <button type="submit">Submit</button> 
            </form> 
        </div> 
        <div class="map-div"> 
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29967.650910267697!2d85.638211!3d20.135868!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a190a23ce977ca7%3A0xeedfaa0fde47443f!2sSKILL%20DEVELOPMENT%20INSTITUTE%20(SDI)%2C%20BHUBANESWAR!5e0!3m2!1sen!2sin!4v1713376116596!5m2!1sen!2sin" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> 
        </div> 
    </div> 
</body> 
  
</html>
