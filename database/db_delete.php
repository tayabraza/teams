<?php

require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {

  $form_data = json_decode(file_get_contents('php://input'), true);

  $id = $form_data['ID'];

  $team_id = $form_data['Team'];

  $type = "Deleted";

  $sql = "DELETE FROM people WHERE id = $id";

  if (mysqli_query($conn, $sql)) {

    echo json_encode( array( 'status' => 'Details are deleted successfully!' ) );

    require 'db_email.php';

  } else {

    echo json_encode( array( 'status' => 'Error deleting row' ) );

  }

}

mysqli_close($conn);

?>
