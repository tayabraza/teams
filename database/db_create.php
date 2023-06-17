<?php

require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

  $form_data = json_decode(file_get_contents('php://input'), true);
    
  $id = $form_data['ID'];
  $name = $form_data['Name'];
  $car_reg = $form_data['Car'];
  $contact = $form_data['Contact'];
  $team_id = $form_data['Team'];

  $type = "Added";
  
  $sql = "INSERT INTO people (id, name, car_reg, contact, team_id) VALUES ('$id', '$name', '$car_reg', '$contact', '$team_id')";

  if (mysqli_query($conn, $sql)) {

    echo json_encode( array( 'stutus' => 'Details are added successfully!' ) ); 

    require 'db_email.php';

  } else {

    echo json_encode( array( 'stutus' => 'Error adding details' ) );

  }

}

mysqli_close($conn);

?>
