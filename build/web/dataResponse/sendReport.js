$(document).ready(function () {
    SetDataTable();
    getReports();
    U.hideProcess();
});

function SetDataTable() {
    $('#tableListReport').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": false,
        "info": true,
        "autoWidth": false,
        "responsive": true,
    });
}

function SendReport(){
    var title = $("#title").val();
    var content = $("#report").val();
    
    // Tạo mới report
    $.ajax({
        url: "/TestFE/Report",
        method: "GET",
        beforeSend: function (xhr) {
            U.showProcess();
        },
        data:{
            title: title,
            content: content,
            action: "createReport"
        },
        success: function (data) {
            if (data == "fail") {
                U.messageBox("Message", "fail to update");
                return;
            } else {
                U.messageBox("Message", "Thank for your reported");
                $("#title").val("");
                $("#report").val("");
            }
            U.hideProcess();
        },
        error: function () {
            U.messageBox("ERROR", "ERROR to process call api!!");
            U.hideProcess();
        }
    });
}

