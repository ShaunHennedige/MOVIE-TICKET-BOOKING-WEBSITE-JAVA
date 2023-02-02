

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>
            body {
                background-color: #ffffff !important;
                /* font-family: sans-serif; */
                margin: 0 auto;
                text-align: center;
            }

            .cat label input {
                position: absolute;
                display: none;
                color: #fff !important;
            }

            .cat {
                margin: 4px;
                background-color: #262934;
                border-radius: 4px;
                border: 1px solid #fff;
                overflow: hidden;
                /* float: left; */
            }
            .cat label {
                float: left;
                line-height: 3em;
                width: 8em;
                height: 3em;
            }

            .cat label span {
                text-align: center;
                padding: 3px 0;
                display: block;
                color: #fff !important;
            }

            .container button {
                visibility: hidden;
                cursor: pointer;
                opacity: 0.9;
                transition: all 0.15s ease;
                background-color: #ff2211 !important;
                border: none;
                border-radius: 6px;
                margin: 15px;
                padding: 15px;
                color: #ffffff;
            }

            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            input {
                cursor: pointer;
                opacity: 0.9;
                transition: all 0.15s ease;
                background-color: #ff2211 !important;
                border: none;
                border-radius: 6px;
                margin: 15px;
                padding: 15px;
                color: #ffffff !important;
            }

            .action input:checked + span {
                background-color: #04aa6d !important;
            }

            input:hover {
                font-weight: bold;
                color: black !important;
                transform: translateY(-3px) scale(1.005);
            }

            .card {

                margin: 15px;
                padding: 15px;
                margin-bottom: 100px;
            }


            #select-options{
                margin-bottom: 100px;
            }


            h5{
                margin-top: 20px;
                margin-bottom: 20px;
            }

select {
  /* Reset Select */
  appearance: none;
  outline: 0;
  border: 0;
  box-shadow: none;
  /* Personalize */
  flex: 1;
  padding: 0 1em;
  color: #fff;
  background-color: #262934;
  background-image: none;
  cursor: pointer;
}
/* Remove IE arrow */
select::-ms-expand {
  display: none;
}




/* Custom Select wrapper */
.select {
  position: relative;
  display: flex;
  width: 15em;
  height: 3em;
  border-radius: .25em;
  overflow: hidden;
}
/* Arrow */
.select::after {
  content: '\25BC';
  position: absolute;
  top: 0;
  right: 0;
  padding: 1em;
  background-color: #34495e;
  transition: .25s all ease;
  pointer-events: none;
}
/* Transition */
.select:hover::after {
  color: #f39c12;
}

        </style>

        <!--        <script>localStorage.clear();
                </script>-->





        <link rel="stylesheet" href="seatStyle.css">
    </head>
    <body>

        <!-- <a href="home.html"><button>Home page</button></a> -->
        <!--<input type="checkbox" id="example">-->

    <center>
        <div class="card" style="border: none">
            <a href="home.html"
               ><img
                    src="assets/img/movie-screen.png"
                    class="card-img-top"
                    href="home.html"
                    /></a>
        </div>
    </center>


    <form  action="config" method="POST" id="select-options">
        <center>

            <h5>Date: </h5>
                <div class="select">
                    <select id="date" class="select" >
                        <option selected disabled>Choose a show date</option>
                        <option value="2023-01-01">2023-01-01</option>
                        <option value="2023-01-02">2023-01-02</option>
                        <option value="2023-01-03">2023-01-03</option>
                        <option value="2023-01-04">2023-01-04</option>
                        <option value="2023-01-05">2023-01-05</option>
                        <option value="2023-01-06">2023-01-06</option>
                        <option value="2023-01-07">2023-01-07</option>
                        <!-- only 7 dates allowed -->
                    </select>

                </div>
                
            
            <h5>Time: </h5>
                <div class="select">
                    <select id="time"  class="select">
                        <option selected disabled>Choose a show time </option>
                       <option value="10:00 AM">10:00 AM</option>
                       <option value="02:00 PM">02:00 PM</option>
                       <option value="05:00 PM">05:00 PM</option>
                       <option value="09:00 PM">09:00 PM</option>
                       <!-- only 4 times allowed -->
                   </select>
                </div>
                
            
            <!--<p>Seats: <span id=""></span></p>-->
            <!--<input type="submit" id="submit" value="Submit" onclick="updatecard()">-->
            <!--<input type="button"  value="get seat" onclick="retrieveSelectedValues()">-->
        </center>

        <!--<input type="submit" value="Confirm Time" onclick="updatecard();" >-->
    </form> 





    <form action="config" method="POST" >
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="A1" name="seat" id="seat-count"><span>A1</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="B1" name="seat" id="seat-count"><span>B1</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="C1" name="seat" id="seat-count"><span>C1</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="D1" name="seat" id="seat-count"><span>D1</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="E1" name="seat" id="seat-count"><span>E1</span>
                            </label>
                        </div>
                    </div>

                </div>


                <div class="col">
                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="A2" name="seat" id="seat-count"><span>A2</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="B2" name="seat" id="seat-count"><span>B2</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="C2" name="seat" id="seat-count"><span>C2</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="D2" name="seat" id="seat-count"><span>D2</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="E2" name="seat" id="seat-count"><span>E2</span>
                            </label>
                        </div>
                    </div>

                </div>


                <div class="col">
                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="A3" name="seat" id="seat-count"><span>A3</span>
                            </label>
                        </div>
                    </div>
                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="B3" name="seat" id="seat-count"><span>B3</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="C3" name="seat" id="seat-count"><span>C3</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="D3" name="seat" id="seat-count"><span>D3</span>
                            </label>
                        </div>
                    </div>

                    <div class="containers">
                        <div class="cat action">
                            <label>
                                <input type="checkbox" value="E3" name="seat" id="seat-count"><span>E3</span>
                            </label>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <br><br/>

        <script>
            var seatCount = document.getElementById("seat-count").innerHTML;
            localStorage.setItem("seatCount", seatCount);
        </script>


        <input type="submit" value="Send Selected Values" onclick="redirectToSecondPage();storeSelectedValue();updatecard();" >
    </form>

    <!--<input type="button" value="Live Page" onclick="redirectToSecondPage()">-->

    <form>
        <input type="button" value="check seat numbers" onclick="getSelectedValue()">
    </form>

    <script>

        function updatecard() {


            // Get the form elements
            const dateSelect = document.getElementById("date");
            const timeSelect = document.getElementById("time");

            // Get the selected values
            const selectedDate = dateSelect.value;
            const selectedTime = timeSelect.value;

            localStorage.setItem("selectedDate", selectedDate);
            localStorage.setItem("selectedTime", selectedTime);

            // event.preventDefault();

        }
        form.addEventListener('submit', updatecard);

        document.getElementById("select-options").addEventListener("submit", function (event) {
            event.preventDefault();
            // Your code here
        });




        function getSelectedValue() {


            var selectedValues = [];
            var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            if (checkboxes.length) {
                for (var i = 0; i < checkboxes.length; i++) {
                    selectedValues.push(checkboxes[i].value);
                }
                alert("The selected values are: " + selectedValues.join(", "));
            } else {
                alert("No value selected");
            }
        }


        function storeSelectedValue() {

            var selectedSeatsarray = "";
            // Get all the selected checkboxes
            var checkboxesarray = document.querySelectorAll('input[type="checkbox"]:checked');
            for (var i = 0; i < checkboxesarray.length; i++) {
                selectedSeatsarray += checkboxesarray[i].value + ",";
            }
            var stringifiedseatArray = JSON.stringify(selectedSeatsarray);
            localStorage.setItem("selectedSeatsarray", stringifiedseatArray);
        }


        //            function sendSelectedValues() {
        //                var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        //                if (checkboxes.length) {
        //                    var selectedValues = [];
        //                    for (var i = 0; i < checkboxes.length; i++) {
        //                        selectedValues.push(checkboxes[i].value);
        //                    }
        //                    var xhr = new XMLHttpRequest();
        //                    xhr.open("POST", "F:\Nsbm\Second Year\First semester\Software Development 02\seat_02\src\java\config.java", true);
        //                    xhr.setRequestHeader("Content-Type", "application/json");
        //                    xhr.send(JSON.stringify(selectedValues));
        //                } else {
        //                    alert("No value selected");
        //                }
        //            }

        //            // Get the reserved seats from the database
        //        fetch('/getReservedSeats')
        //          .then(response => response.json())
        //          .then(reservedSeats => {
        //            // Iterate through all the checkboxes
        //            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        //                            for (var i = 0; i < checkboxes.length; i++) {
        //                                // If the seat is reserved, make the checkbox unselectable
        //                                if (reservedSeats.includes(checkboxes[i].value)) {
        //                                    checkboxes[i].disabled = true;
        //                                }
        //                            }
        //                        });


        function redirectToSecondPage() {
            var selectedSeats = "";
            // Get all the selected checkboxes
            var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            for (var i = 0; i < checkboxes.length; i++) {
                selectedSeats += checkboxes[i].value + ",";
            }
            // Redirect to the second page with the selected seats as a query parameter
            window.location.href = "seatDetails.html?selectedSeats=" + selectedSeats;
        }


        function makeReservedSeatsUnselectable() {
            // Get the reserved seats from the database
            fetch('/getReservedSeats')
                    .then(response => response.json())
                    .then(reservedSeats => {
                        // Iterate through all the checkboxes
                        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                        for (var i = 0; i < checkboxes.length; i++) {
                            // If the seat is reserved, make the checkbox unselectable
                            if (reservedSeats.includes(checkboxes[i].value)) {
                                checkboxes[i].disabled = true;
                            }

                        }
                    });
        }




    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>
