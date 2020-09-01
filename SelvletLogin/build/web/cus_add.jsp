<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Adding Customer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
    </head>
    <body>

        <form action ="customer" method="post">
            <center>
                <h1>ADD CUSTOMER</h1> <br><br>

                <table>
                    <tr><td> Customer ID</td> 
                        <td><input id="numeric" type="text" name="id"></td>
                    </tr>

                    <tr><td> Name</td>
                        <td> <input type="text" id="alpha" name="name"></td>
                    </tr>

                    <tr><td> Contact No</td>
                        <td> <input type="text" id="numeric" name="contact"></td>
                    </tr>
                     <!-- not needed this  remove it latter -->
                    <tr><td>  Purchase(lit / Rs)</td>
                        <td><input type="text" id="numeric" name="bought"></td>
                    </tr> 

                    <tr><td> Credited(Rs)</td> 
                        <td> <input type="text" id="numeric" name="credit"></td>
                    </tr>

                    <tr><td> Debited(Rs)</td> 
                        <td> <input type="text" id="numeric" name="debit"></td> 
                    </tr>
                </table>
                <br>
                <br>
       
                <input type="submit" value="SAVE" onsubmit ="return validation();" >

                <script>

                    function validation() {
                        if (!id_validation()) {
                            return false;
                        }

                        if (!name_validation()) {
                            return false;
                        }

                        if (!contact_validation()) {
                            return false;
                        }

                        if (!bought_validation()) {
                            return false;
                        }

                        if (!credit_validation()) {
                            return false;
                        }

                        if (!debit_validation()) {
                            return false;
                        }

                        return true;
                    }

                    function id_validation() {
                        var id = docoment.getElementById("id");
                        var number = /^[0-9]+$/;
                        if (!id.value.match(number)) {
                            alert("INVALID ID,use only nos.");
                            id.focus();
                            return false;
                        }
                        return true;
                    }

                    function name_validation() {
                        var name = document.getElementById("name");
                        var letters = /^[a-zA-Z]+$/;
                        if (!name.value.match(letters)) {
                            alert("INVALID Name,use only alphabets");
                            name.focus();
                            return false;
                        }
                        return true;
                    }

                    function contact_validation() {
                        var contact = document.getElementById("contact");
                        var num = /^[0-9]+$/;
                        if (!contact.value.match(num)) {
                            alert("Invalid use nos. only");
                            contact.focus();
                            return false;
                        }
                        return true;
                    }

                    function purchased() {
                        var bought = document.getElementById("bought");
                        var num = /^[0-9]+$/;
                        if (!bought.value.match(num)) {
                            alert("Invalid use nos. only");
                            bought.focus();
                            return false;
                        }
                        return true;
                    }

                    function credited() {
                        var credit = document.getElementById("credit");
                        var num = /^[0-9]+$/;
                        if (!credit.value.match(num)) {
                            alert("Invalid use nos. only");
                            credit.focus();
                            return false;
                        }
                        return true;
                    }

                    function debited() {
                        var debit = document.getElementById("debit");
                        var num = /^[0-9]+$/;
                        if (!debit.value.match(num)) {
                            alert("Invalid use nos. only");
                            debit.focus();
                            return false;
                        }
                        return true;
                    }

                </script>

            </center>
        </form>
    </body>
</html>
