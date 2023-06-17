<?php

require 'db_connect.php';

// Array to store the retrieved team names
$data = array(
    "team1" => array(),
    "team2" => array(),
    "team3" => array(),
    "team4" => array(),
    "team5" => array(),
    "team6" => array(),
    "team7" => array(),
    "team8" => array()
);


$sql = "SELECT  id, name, car_reg, contact, team_id FROM people";

// Loop through the result set and add data to the appropriate team in the array
if ($result = mysqli_query($conn, $sql)) {
    while ($row = mysqli_fetch_assoc($result)) {
        $team = "team".$row["team_id"];
        //$data[$team][] = $row;
        
        $people = array(
            "id" => $row["id"],
            "name" => $row["name"],
            "carReg" => $row["car_reg"],
            "contact" => $row["contact"]
        );

        array_push($data[$team], $people);
    }

   echo json_encode($data);

}

mysqli_close($conn);

?>
