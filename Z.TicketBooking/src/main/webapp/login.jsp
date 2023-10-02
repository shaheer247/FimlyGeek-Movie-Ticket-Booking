<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  <head>
   
  
    <title>Login</title>
    
      
 
  <title>FilmyGeek - Heaven for Movie Lovers</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  
  
    
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="login.css" />
  </head>
  <body>
  
  
  
  
    <div class="login-box">
    
      <h1>Login</h1>
      <form action="LoginForm" method="post">
        <label>Email</label>
        <input type="email" placeholder="" name="email1"/>
        <label>Password</label>
        <input type="password" placeholder="" name="pass1" />
        <input type="submit" value="Login" />
        
            
      </form>
    </div>
    <p class="para-2">
      Not have an account? <a href="signup.jsp">Sign Up Here</a>
    </p>
    

    
  
 

</body>
</html>