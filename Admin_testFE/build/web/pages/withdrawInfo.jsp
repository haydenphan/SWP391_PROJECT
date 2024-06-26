<!--<!DOCTYPE html>
<html>
<head>
    <title>Withdraw Money</title>
     Include necessary CSS and JS libraries 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>Withdraw Money</h2>
        <form id="withdrawForm" action="${pageContext.request.contextPath}/withdraw" method="post">
            <div class="form-group">
                <label for="accountNumber">Account Number:</label>
                <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
            </div>
            <div class="form-group">
                <label for="bankName">Bank Name:</label>
                <input type="text" class="form-control" id="bankName" name="bankName" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
            </div>
            <button type="submit" class="btn btn-primary">Withdraw</button>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            // Fetch bank account details if they exist
            fetch('${pageContext.request.contextPath}/getBankAccount')
                .then(response => response.json())
                .then(data => {
                    if (data.accountNumber) {
                        $('#accountNumber').val(data.accountNumber);
                        $('#bankName').val(data.bankName);
                    }
                })
                .catch(error => console.error('Error:', error));
        });
    </script>
</body>
</html>
    -->