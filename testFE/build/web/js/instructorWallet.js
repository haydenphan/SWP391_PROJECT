document.addEventListener('DOMContentLoaded', function () {
    // Check if the elements exist before adding event listeners or fetching data
    const walletTab = document.getElementById("wallet-tab");
    const withdrawForm = document.getElementById("withdrawForm");

    if (walletTab) {
        walletTab.addEventListener("click", fetchWalletBalance);
    } else {
        console.error('Element with ID "wallet-tab" not found.');
    }

    if (withdrawForm) {
        withdrawForm.onsubmit = function () {
            alert('Withdrawal successful');
        };
    } else {
        console.error('Element with ID "withdrawForm" not found.');
    }

    // Fetch wallet balance on page load
    fetch(contextPath + '/walletBalance')
            .then(response => {
                if (response.headers.get('content-type').includes('application/json')) {
                    return response.json();
                } else {
                    throw new Error('Server returned non-JSON response');
                }
            })
            .then(data => {
                document.getElementById("walletBalance").innerText = "Balance: " + data.balance + " VND";
            })
            .catch(error => {
                document.getElementById("walletBalance").innerText = "Error loading balance";
            });

    // Fetch bank account details on page load
    fetch(contextPath + '/getBankAccount')
            .then(response => {
                if (response.headers.get('content-type').includes('application/json')) {
                    return response.json();
                } else {
                    throw new Error('Server returned non-JSON response');
                }
            })
            .then(data => {
                if (data.accountNumber) {
                    document.getElementById('accountNumber').value = data.accountNumber;
                    document.getElementById('bankName').value = data.bankName;
                }
            })
            .catch(error => console.error('Error:', error));
});

function changeAva() {
    const fileInput = document.getElementById('avatarUpload');
    const avatarImage = document.getElementById('avatarImage');
    const file = fileInput.files[0];

    if (file) {
        // Update the avatar preview
        avatarImage.src = window.URL.createObjectURL(file);

        // Prepare form data
        const formData = new FormData();
        formData.append('avatar', file);

        // Send the file to the server
        fetch(contextPath + '/uploadAvatar', {
            method: 'POST',
            body: formData
        })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        console.log('Avatar uploaded successfully');
                    } else {
                        console.error('Error uploading avatar');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
    }
}

function fetchWalletBalance() {
    fetch(contextPath + '/walletBalance')
            .then(response => {
                if (response.headers.get('content-type').includes('application/json')) {
                    return response.json();
                } else {
                    throw new Error('Server returned non-JSON response');
                }
            })
            .then(data => {
                document.getElementById("walletBalance").innerText = "Balance: " + data.balance + " VND";
            })
            .catch(error => {
                document.getElementById("walletBalance").innerText = "Error loading balance";
            });
}
