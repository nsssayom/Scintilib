
     
    // POST Function 
    function reqResPOST(url, requestedData, responseData) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            responseData(this);
            }
        };
            xhr.send(requestedData);
        }
    
    
    
        // GET Function 
        function reqResGET(url, responseData) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            responseData(this);
            }
        };
            xhr.open("GET", url, true);
            xhr.send();
        }   

        // JSON Parser (request with a JSON and get string back ) 

        function jsonParse(data , response){
            let myArr = JSON.parse(data.responseText);
            let test = myArr[0].status;
            response(test);
    }