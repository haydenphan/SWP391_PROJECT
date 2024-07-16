function SendReport(){
    var title = $("#title").val();
    var content = $("#report").val();
    
    // Tạo mới report
    $.ajax({
        url: "/TestFE/ReportManage",
        method: "GET",
        data:{
            title: title,
            content: content,
            action: "createReport"
        },
        success: function (data) {
        },
        error: function () {
        }
    });
}

