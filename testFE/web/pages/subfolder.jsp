<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subfolder</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #toolbar {
            width: 100%;
            background-color: #f1f1f1;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            box-shadow: 0px 2px 4px rgba(0,0,0,0.1);
            position: relative;
        }
        #folder-list {
            width: 80%;
            margin: 20px 0;
            display: flex;
            flex-wrap: wrap;
        }
        .folder {
            background-color: #e0e0e0;
            padding: 20px;
            margin: 10px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 120px;
            height: 100px;
            text-align: center;
            flex-direction: column;
            position: relative;
            cursor: pointer;
        }
        .folder-icon {
            width: 40px;
            height: 40px;
            background-color: #FFD700;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .folder-name {
            margin-bottom: 10px;
        }
        .folder-menu {
            display: none;
            position: absolute;
            top: 0;
            right: 0;
            background-color: white;
            box-shadow: 0px 2px 4px rgba(0,0,0,0.2);
            border-radius: 4px;
            overflow: hidden;
            z-index: 1;
        }
        .folder-menu button {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: white;
            text-align: left;
        }
        .folder-menu button:hover {
            background-color: #f1f1f1;
        }
        .folder-options {
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        #menu {
            display: none;
            position: absolute;
            top: 50px;
            left: 10px;
            background-color: white;
            box-shadow: 0px 2px 4px rgba(0,0,0,0.2);
            border-radius: 4px;
            overflow: hidden;
        }
        #menu button {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: white;
            text-align: left;
        }
        #menu button:hover {
            background-color: #f1f1f1;
        }
        /* Modal styles */
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 300px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="toolbar">
        <button id="back-btn">Back</button>
        <button id="new-btn">+ New</button>
        <div id="menu">
            <button id="new-folder-btn">New Folder</button>
        </div>
    </div>
    <div id="folder-list">
        <!-- Folders will be displayed here -->
    </div>

    <!-- Modal structure -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h2>New folder</h2>
            </div>
            <div>
                <input type="text" placeholder="Untitled folder" id="folderName">
            </div>
            <div style="margin-top: 20px; display: flex; justify-content: space-between;">
                <button id="cancelBtn">Cancel</button>
                <button id="createBtn">Create</button>
            </div>
        </div>
    </div>

    <script>
        // Show/Hide menu
        document.getElementById('new-btn').addEventListener('click', function() {
            let menu = document.getElementById('menu');
            if (menu.style.display === 'none' || menu.style.display === '') {
                menu.style.display = 'block';
            } else {
                menu.style.display = 'none';
            }
        });

        // Show modal
        document.getElementById('new-folder-btn').addEventListener('click', function() {
            document.getElementById('myModal').style.display = 'block';
            document.getElementById('menu').style.display = 'none';
        });

        // Close modal
        document.getElementsByClassName('close')[0].addEventListener('click', function() {
            document.getElementById('myModal').style.display = 'none';
        });
        document.getElementById('cancelBtn').addEventListener('click', function() {
            document.getElementById('myModal').style.display = 'none';
        });

        // Create folder
        document.getElementById('createBtn').addEventListener('click', function() {
            let folderName = document.getElementById('folderName').value;
            if (folderName) {
                createFolder(folderName);
                saveFoldersToLocalStorage();
                document.getElementById('myModal').style.display = 'none';
                document.getElementById('folderName').value = ''; // Reset input field
            } else {
                alert("Folder name cannot be empty!");
            }
        });

        function createFolder(name) {
            let folderList = document.getElementById('folder-list');
            let folder = document.createElement('div');
            folder.className = 'folder';

            let folderIcon = document.createElement('div');
            folderIcon.className = 'folder-icon';

            let folderName = document.createElement('span');
            folderName.className = 'folder-name';
            folderName.textContent = name;

            let folderOptions = document.createElement('span');
            folderOptions.className = 'folder-options';
            folderOptions.textContent = '?';

            let folderMenu = document.createElement('div');
            folderMenu.className = 'folder-menu';

            let renameBtn = document.createElement('button');
            renameBtn.textContent = 'Rename';
            renameBtn.addEventListener('click', function() {
                let newName = prompt('Enter new name:', name);
                if (newName) {
                    folderName.textContent = newName;
                    saveFoldersToLocalStorage();
                }
                folderMenu.style.display = 'none';
            });

            let deleteBtn = document.createElement('button');
            deleteBtn.textContent = 'Delete';
            deleteBtn.addEventListener('click', function() {
                folderList.removeChild(folder);
                saveFoldersToLocalStorage();
            });

            folderMenu.appendChild(renameBtn);
            folderMenu.appendChild(deleteBtn);

            folder.appendChild(folderIcon);
            folder.appendChild(folderName);
            folder.appendChild(folderOptions);
            folder.appendChild(folderMenu);

            folderList.appendChild(folder);

            folderOptions.addEventListener('click', function() {
                if (folderMenu.style.display === 'none' || folderMenu.style.display === '') {
                    folderMenu.style.display = 'block';
                } else {
                    folderMenu.style.display = 'none';
                }
            });

            folder.addEventListener('dblclick', function() {
                window.location.href = 'subfolder.html?folder=' + encodeURIComponent(name);
            });
        }

        // Hide menu if click outside
        document.addEventListener('click', function(event) {
            if (!event.target.closest('#toolbar')) {
                document.getElementById('menu').style.display = 'none';
            }
            if (!event.target.closest('.folder')) {
                let menus = document.getElementsByClassName('folder-menu');
                for (let menu of menus) {
                    menu.style.display = 'none';
                }
            }
        });

        // Hide modal if click outside
        window.onclick = function(event) {
            if (event.target == document.getElementById('myModal')) {
                document.getElementById('myModal').style.display = 'none';
            }
        }

        // Get folder name from URL and display it
        function getFolderNameFromURL() {
            let params = new URLSearchParams(window.location.search);
            return params.get('folder') || 'Subfolder';
        }

        document.addEventListener('DOMContentLoaded', function() {
            let folderName = getFolderNameFromURL();
            document.title = folderName;
            let header = document.createElement('h1');
            header.textContent = folderName;
            document.body.insertBefore(header, document.getElementById('toolbar'));
            loadFoldersFromLocalStorage();
        });

        // Save folders to local storage
        function saveFoldersToLocalStorage() {
            let folders = [];
            let folderElements = document.getElementsByClassName('folder');
            for (let folderElement of folderElements) {
                let folderName = folderElement.querySelector('.folder-name').textContent;
                folders.push(folderName);
            }
            localStorage.setItem('folders', JSON.stringify(folders));
        }

        // Load folders from local storage
        function loadFoldersFromLocalStorage() {
            let folders = JSON.parse(localStorage.getItem('folders')) || [];
            for (let folderName of folders) {
                createFolder(folderName);
            }
        }

        // Back button functionality
        document.getElementById('back-btn').addEventListener('click', function() {
            window.history.back();
        });
    </script>
</body>
</html>

</html>
