#!"C:\xampp\php\php.exe"
<?php
    echo "Content-type:application/json; charset=utf-8\r\n\r\n";

    $connect = mysqli_connect('localhost','root','');
    mysqli_select_db($connect, 'webservices');
    
    $result = mysqli_query($connect, "SELECT * FROM news LIMIT 40000");
    $array = mysqli_fetch_all($result);
    
    for ($i = 0; $i < sizeof($array); $i++) {
        $a1 = $array[$i];        
        $temp = "";
       
        $j = 0;
        while ($j++ < 2) {
            $temp .= $a1[2];
            $temp = str_replace("Lorem ipsum dolor sit amet", "This is real text", $temp);
        }
        $a1[2] = $temp;
        $array[$i] = $a1;
    }
    echo json_encode($array);
    
    mysqli_close($connect);
?>