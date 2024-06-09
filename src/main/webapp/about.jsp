<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - [Your Company Name]</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+20+Charted&family=Pacifico&family=Shadows+Into+Light&display=swap" rel="stylesheet">

    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1624544056688-88e214935bc2?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-attachment: fixed;
            background-size: cover;
        }
        .header-section {
            background: rgba(248, 249, 250, 0.85);
            border-bottom: 1px solid #e3e4e6;
            padding: 20px 0;
        }
        .gallery img {
            width: 100%;
            padding: 5px;
            transition: transform 0.25s ease;
        }
        .gallery img:hover {
            transform: scale(1.05);
        }
        .content-section {
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.85);
            padding: 20px;
            border-radius: 8px;
            transition: opacity 1s ease-out;
        }
        .animated {
            opacity: 1 !important;
        }
        h1, h2, h3, p {
            font-family: "Shadows Into Light", cursive;
            font-weight: 400;
            font-style: normal;
        }

        footer {
            background-color: rgba(0, 0, 0, 0.5); /* Black background with 50% opacity */
            color: white; /* White text color for contrast */
            padding: 20px 0;
            margin-top: 40px;
            text-align: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
    <script>
        new WOW().init();
        $(window).on('scroll', function () {
            $('.content-section').each(function () {
                if ($(this).offset().top < $(window).scrollTop() + $(window).height() * 0.75) {
                    $(this).addClass('animated fadeInRight');
                }
            });
        });
    </script>
</head>
<body>
    <jsp:include page="navigation.jsp" />
    <div class="container">
        <header class="header-section text-center">
            <h1>About Us</h1>
            <p>Welcome to BHOJ, where great food meets great service!</p>
        </header>
        <!-- Additional sections can be added here -->
        <!-- Content Sections -->
        <div class="content-section">
            <!-- Content here (repeated as per your original HTML) -->
            <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <h2>Our Mission</h2>
                    
                    <p>Our mission is to deliver not just meals, but an exceptional dining experience right to your doorstep. We strive to provide fast, reliable, and convenient food delivery from a wide variety of local restaurants and eateries, ensuring that whether you're craving late-night snacks, healthy lunches, or gourmet dinners, we've got you covered.</p>
                </div>
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/685797134/photo/golden-compass-concept.jpg?s=612x612&w=0&k=20&c=E9oqdqYFq5U17PlMW0u9Tn-KqvlCowFrroexeQRchlQ=" alt="Our Mission" class="img-fluid">
                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/856679342/photo/everyone-has-a-story.jpg?s=612x612&w=0&k=20&c=h6dLM1cfCYXEV36t5KJvjd1oYYTObIasi0lxKFCkiKQ=" alt="Our Story" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h2>Our Story</h2>
                    <p>Founded in 2024 by ADWIT ROUT, BHOJ began as a small startup with one simple yet ambitious goal: to simplify the way we eat by offering quick and easy access to a variety of culinary delights.</p>
                 <p>Our journey began in a small office with a team of passionate food enthusiasts who believed in the power of technology to transform dining. As we evolved, our fleet grew, our technology advanced, and our customer base expanded. Today, we are proud to operate in multiple cities, partnering with over 40 eateries, from renowned restaurants to cherished local gems, bringing a world of flavors to our customers' doors.</p>                

                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <h2>Why Choose Us?</h2>
                    <h3>Variety of Choices:</h3>
                    <p>We are partnered with a diverse range of restaurants, including vegan, gluten-free, organic, and ethnic options, ensuring that every palate is catered to.
</p>
<h3>Quality Assurance</h3>
<p>Our commitment to quality is paramount. We carefully select restaurant partners based on stringent criteria including food quality, customer reviews, and hygiene standards. Each order is handled with utmost care to ensure it arrives in the best condition.
</p>
<h3>Advanced Technology</h3>
<p>Our state-of-the-art platform makes ordering your favorite food simple and stress-free. With real-time tracking, secure payment gateways, and user-friendly interfaces, we put the control in your hands.
</p>
<h3>Eco-Friendly Deliveries:
</h3>
<p>Understanding our responsibility to the environment, we aim to reduce our carbon footprint with eco-friendly packaging and promoting deliveries via electric bikes and scooters.
</p>
<h3>Community Support
</h3>
<p>We believe in giving back to the communities we serve. BHOJ actively participates in local events and charities, and we have a program in place to donate unsold food to shelters, reducing waste and supporting those in need.

</p>
                </div>
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/858309414/photo/why-choose-us.jpg?s=612x612&w=0&k=20&c=eagefEzm_QPMo3WFaDwlxqSA3qnfDTxN2PFuKhxuSac=" alt="Our Mission" class="img-fluid">
                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/1164312109/photo/meet-the-team-named-success.jpg?s=612x612&w=0&k=20&c=05yiErSp4LifhBU8L9hYrYi_wnMyRRWtVYG_DkLPXzk=" alt="Our Story" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h2>Our Team</h2>
                    <p>Behind BHOJ is a team of over 2 dedicated employees, from tech innovators and marketing experts to customer service professionals and delivery personnel. Each team member shares a common passion for revolutionizing the way we experience dining.
</p>
<p>Our leadership team comprises individuals with extensive experience in the culinary, tech, and logistics industries, ensuring a balanced approach to business decisions and service excellence
</p>
                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <h2>Our Values</h2>
                    <p> **Customer First:** Your satisfaction is at the core of our operations. We listen to your needs and continuously strive to improve our service based on your feedback.

</p>
                    <p> **Integrity:** We operate transparently and ethically with all our stakeholders—customers, restaurant partners, and employees.
</p>
                    <p> **Innovation:** We continually seek out new ways to enhance your dining experience by investing in technology and processes that advance our service.
                    </p>
                    <p> **Community:** We believe in the power of community and are committed to making a positive impact through our services and initiatives.
                    </p>
                </div>
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/1340631512/video/integrity-animated-word-cloud-design-animation-kinetic-typography-seamless-loop.jpg?s=640x640&k=20&c=TlxgzSvKP9Jt1HF-7EmH0DabvfTLo8cOjWiW7g2WmPY=" alt="Our Mission" class="img-fluid">
                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/1133350536/photo/water-drop-impact.jpg?s=612x612&w=0&k=20&c=r1-DbY1-uzuP8ChpmQCqiUFeopGsyBTqAkauaTQT3WQ=" alt="Our Story" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h2>Our Impact</h2>
                    <p>Over the years, BHOJ has not just delivered meals, but has also fostered relationships, supported local businesses, and contributed to local economies. Our efforts to ensure customer satisfaction have consistently earned us recognition in the form of awards and accolades in the food delivery industry.
</p>
                    <p>We have also made a significant impact on reducing food waste—a pivotal aspect of our commitment to sustainability. By carefully planning logistics and fostering responsible consumption practices, we help ensure that excess food reaches those in need rather than being discarded.
</p>
                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <h2> Future Vision
</h2>
                    <p>Looking forward, BHOJ aims to expand its reach, bringing more delightful culinary experiences to new regions while maintaining our commitment to quality, sustainability, and superior customer service. We are also on the path to incorporating more AI and machine learning into our operations, to predict trends and personalize the user experience further.
</p>
                </div>
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/500504909/photo/business-vision.jpg?s=612x612&w=0&k=20&c=sfAyloZ4GkAkZQ7KIm_Jeg33a4Z-HuR7lTijWbRN95g=" alt="Our Mission" class="img-fluid">
                </div>
            </div>
        </div>

        <div class="content-section">
            <div class="row">
                <div class="col-md-6">
                    <img src="https://media.istockphoto.com/id/1007530412/photo/motivational-and-inspirational-quote.jpg?s=612x612&w=0&k=20&c=4F0_8Zsx9DnxrzLQeaR9MwemGRS5e_pxuzjI3wNLu7M=" alt="Our Story" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h2>Join Us on Our Journey
</h2>
                    <p>Whether you are a potential customer, restaurant owner, or job seeker, we invite you to join us on this exciting journey. Experience the ease, convenience, and pleasure of BHOJ, as we continue to redefine the food delivery landscape. Visit our website, download our app, and enjoy the best your city has to offer at your fingertips.
</p>
                    <p>Thank you for choosing BHOJ—where every

 meal is a celebration.
</p>
                </div>
            </div>
        </div>

        </div>
        <div class="gallery row">
            <!-- Gallery Content -->
            <div class="col-md-4">
                <img src="https://media.istockphoto.com/id/1287186696/photo/food-delivery-app-order-with-phone-online-mobile-service-for-take-away-burger-and-pizza.jpg?s=612x612&w=0&k=20&c=s0g33OOVOT9nZiFat2wvo7HhRvmM5kx0CJBp1OSfbRE=" alt="Gallery Image 1" class="img-fluid">
            </div>
            <div class="col-md-4">
                <img src="https://media.istockphoto.com/id/1296986175/photo/young-man-working-for-a-food-delivery-service-checking-with-road-motorcycle-in-the-city.jpg?s=612x612&w=0&k=20&c=TXsIHrSIyFlkHSpJq_AhX3V0l9X_U79e9cfpdMNH5LQ=" alt="Gallery Image 2" class="img-fluid">
            </div>
            <div class="col-md-4">
                <img src="https://media.istockphoto.com/id/1287152859/photo/asian-chinese-delivery-man-with-helmet-press-door-bell-for-grocery-food-delivery.jpg?s=612x612&w=0&k=20&c=MTqRta_fmPo5fXuerkR5AVMXG-ZtgtawuQ-jZhtnLYI=" alt="Gallery Image 3" class="img-fluid">
            </div>
        </div>

       
        <footer class="text-center mt-4">
            <p>Thank you for choosing BHOJ—where every meal is a celebration.</p>
        </footer>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
