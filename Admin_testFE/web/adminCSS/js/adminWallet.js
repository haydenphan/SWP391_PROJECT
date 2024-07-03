var modal = document.getElementById("walletModal");
var btn = document.getElementById("walletIcon");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function () {
    fetchWalletBalance();
    fetchBankAccountDetails();
    modal.style.display = "block";
};

span.onclick = function () {
    modal.style.display = "none";
};

window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};

function fetchWalletBalance() {
    console.log('Fetching wallet balance...');
    fetch(contextPath + '/walletBalance') // Adjust URL if necessary
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Received data:', data);
                if (data.balance !== undefined) {
                    document.getElementById("walletBalance").innerText = "Balance: " + data.balance + " VND";
                } else {
                    document.getElementById("walletBalance").innerText = "Error loading balance";
                }
            })
            .catch(error => {
                console.error('Error fetching wallet balance:', error);
                document.getElementById("walletBalance").innerText = "Error loading balance";
            });
}

function fetchBankAccountDetails() {
    fetch(contextPath + '/getBankAccount')
            .then(response => response.json())
            .then(data => {
                if (data.accountNumber) {
                    document.getElementById('accountNumber').value = data.accountNumber;
                    document.getElementById('bankName').value = data.bankName;
                }
            })
            .catch(error => console.error('Error:', error));
}

document.getElementById("withdrawForm").onsubmit = function () {
    alert('Withdrawal successful');
    modal.style.display = "none";
};

document.addEventListener('DOMContentLoaded', function () {
    fetch(contextPath + '/walletBalance')
            .then(response => response.json())
            .then(data => {
                document.getElementById("walletBalance").innerText = "Balance: " + data.balance + " VND";
            })
            .catch(error => {
                document.getElementById("walletBalance").innerText = "Error loading balance";
            });

    fetch(contextPath + '/getBankAccount')
            .then(response => response.json())
            .then(data => {
                if (data.accountNumber) {
                    document.getElementById('accountNumber').value = data.accountNumber;
                    document.getElementById('bankName').value = data.bankName;
                }
            })
            .catch(error => console.error('Error:', error));
});