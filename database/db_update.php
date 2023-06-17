<?php

require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'PUT') {

  $form_data = json_decode(file_get_contents('php://input'), true);

  $id_old = $form_data['ID_Old'];
  $name_old = $form_data['NameOld'];
  $car_old = $form_data['CarOld'];
  $contact_old = $form_data['ContactOld'];

  $id_edit = $form_data['ID'];
  $name_edit = $form_data['Name'];
  $car_edit = $form_data['Car'];
  $contact_edit = $form_data['Contact'];

  $team_id = $form_data['Team'];

  $type = "Updated";

  $sql = "UPDATE people SET id = '$id_edit', name = '$name_edit', car_reg = '$car_edit', contact = '$contact_edit', team_id = '$team_id' WHERE id = $id_old";

  if (mysqli_query($conn, $sql)) {

    echo json_encode( array( 'stutus' => 'Details are updated successfully!' ) );

    require 'db_email.php';

  } else {

    echo json_encode( array( 'stutus' => 'Error updating details' ) );

  }
  
}

mysqli_close($conn);

?>
