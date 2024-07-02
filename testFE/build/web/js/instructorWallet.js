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
        fetch('${pageContext.request.contextPath}/uploadAvatar', {
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
    fetch('${pageContext.request.contextPath}/walletBalance')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                document.getElementById("walletBalance").innerText = "Balance: " + data.balance + " VND";
            })
            .catch(error => {
                document.getElementById("walletBalance").innerText = "Error loading balance";
            });
}

document.getElementById("wallet-tab").addEventListener("click", fetchWalletBalance);

document.getElementById("withdrawForm").onsubmit = function () {
    alert('Withdrawal successful');
};
document.addEventListener('DOMContentLoaded', function () {
    fetch('${pageContext.request.contextPath}/walletBalance')
            .then(response => response.json())
            .then(data => {
                document.getElementById("walletBalance").innerText = "Balance: " + data.balance + " VND";
            })
            .catch(error => {
                document.getElementById("walletBalance").innerText = "Error loading balance";
            });

    fetch('${pageContext.request.contextPath}/getBankAccount')
            .then(response => response.json())
            .then(data => {
                if (data.accountNumber) {
                    document.getElementById('accountNumber').value = data.accountNumber;
                    document.getElementById('bankName').value = data.bankName;
                }
            })
            .catch(error => console.error('Error:', error));
});