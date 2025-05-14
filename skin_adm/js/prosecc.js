function suaSanPham(id) {
    // Gọi API lấy form edit
    $.ajax({
        url: 'process.php',
        type: 'POST',
        data: {
            action: 'edit_product',
            id: id
        },
        success: function(response) {
            $('#editModal').html(response).show();
        }
    });
}

function closeEditForm() {
    $('#editModal').hide();
}

// Xử lý submit form edit
$('#editProductForm').on('submit', function(e) {
    e.preventDefault();
    
    var formData = new FormData(this);
    formData.append('action', 'update_product');
    
    $.ajax({
        url: 'process.php',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            alert(response);
            if(response.includes('thành công')) {
                closeEditForm();
                // Refresh danh sách sản phẩm
                location.reload();
            }
        }
    });
});