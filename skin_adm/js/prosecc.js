function editProduct(id) {
    // Redirect to edit page
    window.location.href = '/admincp/edit-product?id=' + id;
}

// Hoặc nếu muốn dùng Ajax load form:
function editProduct(id) {
    $.ajax({
        url: '/admincp/edit-product',
        type: 'GET',
        data: { id: id },
        success: function(response) {
            // Hiển thị form edit trong modal
            $('#editModal').html(response).show();
        },
        error: function(xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
}

// Đóng modal
function closeEditModal() {
    $('#editModal').hide();
}

// Handle form submit
$(document).on('submit', '#editProductForm', function(e) {
    e.preventDefault();
    
    var formData = new FormData(this);
    
    $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            if(response.success) {
                alert('Cập nhật thành công!');
                closeEditModal();
                location.reload(); // Refresh lại trang
            } else {
                alert('Lỗi: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
});