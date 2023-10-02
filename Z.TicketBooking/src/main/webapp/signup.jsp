<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
  <head>
    <title>Sign Up </title>
    
  <title>FilmyGeek - Heaven for Movie Lovers</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap"
      rel="stylesheet"
    />
      <link rel="stylesheet" href="login.css" />
  </head>
  <body>

  
    <div class="signup-box">
      <h1>Sign Up</h1>
      <h4>It's free and only takes a minute</h4>
      <form action="regForm" method="post">
        <label>First Name</label>
        <input type="text" placeholder="" name="fname1"/>
        <label>Last Name</label>
        <input type="text" placeholder="" name="lname1"/>
        <label>Email</label>
        <input type="email" placeholder="" name="email1"/>
        <label>Password</label>
        <input type="password" placeholder="" name="pass1"/>
        <label>Confirm Password</label>
        <input type="password" placeholder="" />
        <input type="submit" value="Submit" />
      </form>
    
      <p>
        By clicking the Sign Up button,you agree to our <br />
        <a href="#">Terms and Condition</a> and <a href="#">Policy Privacy</a>
      </p>
    </div>
    <p class="para-2">
      Already have an account? <a href="login.jsp">Login here</a>
    </p>
    
  
  </body>
</html>    