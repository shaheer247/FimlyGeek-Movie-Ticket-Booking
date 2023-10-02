<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>

    <!-- Required meta tags -->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>FilmyGeek - Heaven for Movie Lovers</title>
</head>

<body>

    <!-- Navbar -->

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">FilmyGeek</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
               
             
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
            </form>
            <div class="mx-2">
                <button class="btn btn-danger" data-toggle="modal" data-target="#loginModal">Login</button>
                <button class="btn btn-danger" data-toggle="modal" data-target="#signupModal">SignUp</button>
            </div>
        </div>
    </nav>
    
    <div class="col-lg-4">

        <h2 class="fw-normal">Theatre A</h2>
        <p>Rayachoti</p>
        <div class="container text-center bg-">
            <div class="row">
              <div class="col order-first">
                <p><a class="btn btn-success" href="booking.jsp">10:00 AM</a></p>
              </div>
              <div class="col">
                <p><a class="btn btn-success" href="booking.jsp">2:00 PM</a></p>
              </div>
              <div class="col">
                <p><a class="btn btn-success" href="booking.jsp">7:00 PM</a></p>
              </div>
              <div class="col order-last">
                <p><a class="btn btn-success" href="booking.jsp">10:00 PM</a></p>
                      
              </div>
             
            </div>
          </div>
      </div>

      <div class="col-lg-4">

        <h2 class="fw-normal">Theatre B</h2>
        <p>Rayachoti</p>
        <div class="container text-center bg-">
            <div class="row">
              <div class="col order-first">
                <p><a class="btn btn-success" href="booking.jsp">10:00 AM</a></p>
              </div>
              <div class="col">
                <p><a class="btn btn-success" href="booking.jsp">2:00 PM</a></p>
              </div>
              <div class="col">
                <p><a class="btn btn-success" href="booking.jsp">7:00 PM</a></p>
              </div>
              <div class="col order-last">
                <p><a class="btn btn-success" href="booking.jsp">10:00 PM</a></p>
                
              </div>
             
            </div>
          </div>
      </div>

      
    <div class="col-lg-4">

        <h2 class="fw-normal">Theatre C</h2>
        <p>Rayachoti</p>
        <div class="container text-center bg-">
            <div class="row">
              <div class="col order-first">
                <p><a class="btn btn-success" href="booking.jsp">10:00 AM</a></p>
              </div>
              <div class="col">
                <p><a class="btn btn-success" href="booking.jsp">2:00 PM</a></p>
              </div>
              <div class="col">
                <p><a class="btn btn-success" href="booking.jsp">7:00 PM</a></p>
              </div>
              <div class="col order-last">
                <p><a class="btn btn-success" href="booking.jsp">10:00 PM</a></p>
              </div>
             
            </div>
          </div>
      </div>

   
      
    

      
    
    

    <!-- Footer -->

    <footer class="py-5 text-center text-body-secondary bg-body-tertiary bg-dark text-white">
        <p>FilmyGeek <a href=""></a> by <a href="">@Coding Hustlers</a>.
        </p>
        <p class="mb-0">
          <a href="#">Back to top</a>
        </p>
    </footer> 


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>