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
        success: function (response) {
            // Hiển thị form edit trong modal
            $('#editModal').html(response).show();
        },
        error: function (xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
}

// Đóng modal
function closeEditModal() {
    $('#editModal').hide();
}

// Handle form submit
$(document).on('submit', '#editProductForm', function (e) {
    e.preventDefault();

    var formData = new FormData(this);

    $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            if (response.success) {
                alert('Cập nhật thành công!');
                closeEditModal();
                location.reload(); // Refresh lại trang
            } else {
                alert('Lỗi: ' + response.message);
            }
        },
        error: function (xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
});
$(document).ready(function () {
    window.updateStatus = function (id, status) {
        // Message for confirm/cancel
        let message = '';
        switch (status) {
            case 'confirmed':
                message = 'Xác nhận đơn đặt lịch này?'
                break;
            case 'completed':
                message = 'Xác nhận hoàn thành đơn đặt lịch này?';
                break;
            case 'cancelled':
                message = 'Bạn có chắc muốn hủy đơn này?';
                break;
            default:
                alert('Trạng thái không hợp lệ');
                return;
        }

        if (!confirm(message)) {
            return;
        }

        $.ajax({
            url: 'process.php',
            type: 'POST',
            data: {
                action: 'update_test_drive_status',
                id: id,
                status: status
            },
            success: function (response) {
                try {
                    let result = JSON.parse(response);
                    if (result.success) {
                        alert('Cập nhật trạng thái thành công!');
                        location.reload();
                    } else {
                        alert('Lỗi: ' + result.message);
                    }
                } catch (e) {
                    console.error('Parse error:', e);
                    alert('Có lỗi xảy ra khi xử lý dữ liệu!');
                }
            },
            error: function (xhr, status, error) {
                console.error('Ajax error:', error);
                alert('Có lỗi khi kết nối đến server!');
            }
        });
    };
    window.status_update = function(id, status) {
        let message = '';
        switch (status) {
            case 'processing':
                message = 'Xác nhận xử lý đơn hàng này?'
                break;
            case 'completed':
                message = 'Xác nhận hoàn thành đơn hàng này?';
                break;
            case 'cancelled':
                message = 'Bạn có chắc muốn hủy đơn hàng này?';
                break;
            default:
                alert('Trạng thái không hợp lệ');
                return;
        }

        if (!confirm(message)) {
            return;
        }

        $.ajax({
            url: 'process.php',
            type: 'POST',
            data: {
                action: 'update_order_status',
                id: id,
                status: status
            },
            success: function (response) {
                try {
                    let result = JSON.parse(response);
                    if (result.success) {
                        alert('Cập nhật trạng thái thành công!');
                        location.reload();
                    } else {
                        alert('Lỗi: ' + result.message);
                    }
                } catch (e) {
                    console.error('Parse error:', e);
                    alert('Có lỗi xảy ra khi xử lý dữ liệu!');
                }
            },
            error: function (xhr, status, error) {
                console.error('Ajax error:', error);
                alert('Có lỗi khi kết nối đến server!');
            }
        });
    }
});
