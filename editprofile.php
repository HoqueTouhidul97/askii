<?php 
	 include ('includes/header.php');
	 include ('includes/navbar.php');

	  $username=$_SESSION['username'];
	  $email=$_SESSION['email'];
	  $statusMsg = '';

  	if (!isset($_SESSION['username'])) {
  	$_SESSION['msg'] = "You must log in first";
  	header('location: login.php');
  }
  if (isset($_GET['logout'])) {
  	session_destroy();
  	unset($_SESSION['username']);
  	header("location: login.php");
  }
 
 

  

  $query=mysqli_query($db,"SELECT * FROM students where Email='$email'")or die(mysqli_error());
  $row=mysqli_fetch_array($query);

?>
<div class="edit-form">
<div class="container" style="background: linear-gradient(45deg, #daecff, transparent);">
	<div class="avatar">
		<img src="./uploads/<?php echo $row['img']; ?>">
	</div>
	<div class="points">
		<div class="star-img">
			<i class="fas fa-star"></i>
		</div>
		<p >You have <?php echo $row['points']; ?> Points Left </p>
	</div>
    <div class="title"><?php echo $row['username']; ?>, Update Information</div>
    <div class="content">
      <form  method="post" enctype="multipart/form-data" action="editprofile.php">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" value="<?php echo $row['Full_Name']; ?>" name="fullname">
          </div>
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" value="<?php echo $row['username']; ?>" name="username" >
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" value="<?php echo $row['Email']; ?>" name="email" >
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" value="<?php echo $row['phone']; ?>" name="phone">
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="text" value="<?php echo $row['Password']; ?>"  name="password">
          </div>
          <div class="input-box">
            <span class="details">Rank</span>
            <input type="text" value="<?php echo $row['Rank']; ?>" disabled>
          </div>
          <div class="input-box">
            <span class="details">Upload Profile Picture</span>
				<input type="file" name="uploadfile" class="form-control">
          </div>
        </div>
        <div class="button">
          <input type="submit" name="submit" value="Update">
        </div>
      </form>
      <?php

      	

      if(isset($_POST['submit'])){

      	$filename = $_FILES["uploadfile"]["name"];
	    $tempname = $_FILES["uploadfile"]["tmp_name"];
	    $folder = "./uploads/" . $filename;
        $fullname = $_POST['fullname'];
        $username = $_POST['username'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $password = $_POST['password'];
        
        $query2 = "UPDATE students SET Full_Name = '$fullname', img='$filename',
                      username = '$username', Phone = '$phone', Email = '$email', Password='$password'
                      WHERE username='$username'";
        $result = mysqli_query($db, $query2) or die("Query Unsuccessful.");
            if (move_uploaded_file($tempname, $folder)) {
		        echo "";
		    } else {
		        echo "<h3>  Failed to upload image!</h3>";
		    }
		        if ($result) {
            echo "<div class='form'>
                  <h3>Account Info Updated successfully.</h3><br/>
                  </div>
                  ";
        }

        
    }?>
    </div>
  </div>
  </div>

 <?php include ('includes/footer.php'); ?>

