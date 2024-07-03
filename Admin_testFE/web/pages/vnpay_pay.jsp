<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="config.*" %>
<%@ page import="java.util.*" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String lastName = (String) session.getAttribute("lastName");
    String email = (String) session.getAttribute("email");
    Double total = (Double) session.getAttribute("total"); // Amount in USD
    long amountInVND = 0;
    // Check if total is not null
    if (total != null) {
        amountInVND = Math.round(total * 23000 * 100); // Convert USD to VND (assuming 1 USD = 23000 VND) and multiply by 100 for smallest currency unit
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Create New Order</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/jumbotron-narrow.css" rel="stylesheet">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <style>
            .required:after {
                content: " *";
                color: red;
            }
            .form-group {
                margin-bottom: 1.5em;
            }
            .form-group label {
                display: block;
                margin-bottom: .5em;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>
            <h3>Create New Order</h3>
            <div class="table-responsive">
                <form action="<%= request.getContextPath()%>/ajaxServlet" id="frmCreateOrder" method="post">
                    <div class="form-group">
                        <label class="required">First Name</label>
                        <input type="text" class="form-control" name="firstName" value="<%= firstName %>" readonly>
                    </div>
                    <div class="form-group">
                        <label class="required">Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="<%= lastName %>" readonly>
                    </div>
                    <div class="form-group">
                        <label class="required">Email Address</label>
                        <input type="email" class="form-control" name="email" value="<%= email %>" readonly>
                    </div>
                    <div class="form-group">
                        <label class="required">Order Total (VND)</label>
                        <input type="text" class="form-control" name="orderTotal" value="<%= amountInVND / 100 %>" readonly>
                    </div>
                    <div class="form-group">
                        <h5>Select Payment Interface Language:</h5>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="languageVN" name="language" value="vn" checked="true">
                            <label class="form-check-label" for="languageVN">Vietnamese</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="languageEN" name="language" value="en">
                            <label class="form-check-label" for="languageEN">English</label>
                        </div>
                    </div>
                    <input type="hidden" name="amountInVND" value="<%= amountInVND %>">
                    <button type="submit" class="btn btn-primary">Pay</button>
                </form>
            </div>
            <p>&nbsp;</p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function (event) {
                event.preventDefault();
                console.log("Form is being submitted...");
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                console.log("Submit URL: ", submitUrl);
                console.log("Post Data: ", postData);
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        console.log("AJAX call successful. Response: ", x);
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX call failed. Status: ", status, "Error: ", error);
                    }
                });
            });
        </script>
    </body>
</html>
