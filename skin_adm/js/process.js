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
        // Tạo thông báo xác nhận
        let message = '';
        switch (status) {
            case 'completed':
                message = 'Xác nhận đơn đặt lịch này?';
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
                        // Cập nhật trạng thái trực tiếp trên giao diện
                        let trangThai = status === 'completed' ? 'Đã hoàn thành' : 'Đã hủy';
                        let mauBadge = status === 'completed' ? 'success' : 'danger';

                        // Cập nhật text trạng thái
                        $(`#order_${id} .status-badge`).text(trangThai)
                            .removeClass('status-pending status-completed status-cancelled')
                            .addClass(`status-${status}`);

                        // Ẩn nút thao tác và hiển thị badge
                        $(`#order_${id} .action-buttons`).html(
                            `<span class="badge badge-${mauBadge}">${trangThai}</span>`
                        );

                        alert('Cập nhật trạng thái thành công!');
                    } else {
                        alert('Lỗi: ' + result.message);
                    }
                } catch (e) {
                    console.error('Lỗi xử lý:', e);
                    alert('Có lỗi xảy ra khi xử lý dữ liệu!');
                }
            },
            error: function (xhr, status, error) {
                console.error('Lỗi Ajax:', error);
                alert('Có lỗi khi kết nối đến máy chủ!');
            }
        });
    };
    //////////////////////////////////////////

});
$(document).ready(function () {
    $(document).on('click', '.button.delete', function () {
        var userId = $(this).closest('tr').attr('id').replace('user_', '');
        var $boxConfirm = $('.box_confirm');

        $boxConfirm.fadeIn(200).css('display', 'flex');

        $(document).on('click', '#confirm_yes', function () {
            $('.load_overlay').show();
            $('.load_process').fadeIn();

            $.ajax({
                url: 'process.php',
                type: 'POST',
                data: {
                    action: 'delete_user',
                    id: userId
                },
                dataType: 'json',
                success: function (response) {
                    try {
                        setTimeout(function () {
                            $('.load_note').html(response.message);
                        }, 1000);

                        setTimeout(function () {
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                            $boxConfirm.fadeOut(200);

                            if (response.ok === 1) {
                                location.reload();
                            }
                        }, 500);
                    } catch (e) {
                        console.error('Lỗi:', e);
                        $('.load_note').html('Có lỗi xử lý dữ liệu');
                        setTimeout(function () {
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                            $boxConfirm.fadeOut(200);
                        }, 500);
                    }
                },
                error: function () {
                    $('.load_note').html('Có lỗi xảy ra');
                    setTimeout(function () {
                        $('.load_process').hide();
                        $('.load_overlay').hide();
                        $boxConfirm.fadeOut(200);
                    }, 500);
                }
            });

            $(document).off('click', '#confirm_yes');
        });

        $(document).on('click', '#confirm_no', function () {
            $boxConfirm.fadeOut(200);
            $(document).off('click', '#confirm_yes');
            $(document).off('click', '#confirm_no');
        });
    });
});
function showNotification(message) {
    $('.success-notification').fadeIn(300)
        .find('.notification-text').text(message);

    setTimeout(function () {
        $('.success-notification').fadeOut(300);
    }, 3000);
}
////////////////////////////////////////
$(document).ready(function () {
    $(document).on('click', '.btn-delete', function () {
        var productId = $(this).closest('tr').attr('id').replace('product-', '');
        var $boxConfirm = $('.box_confirm');

        // Hiện box confirm
        $boxConfirm.fadeIn(200).css('display', 'flex');

        // Bind event cho nút Thực hiện
        $(document).on('click', '#confirm_yes', function () {
            $('.load_overlay').show();
            $('.load_process').fadeIn();

            $.ajax({
                url: 'process.php',
                type: 'POST',
                data: {
                    action: 'delete_product',
                    id: productId
                },
                dataType: 'json',
                success: function (response) {
                    try {
                        setTimeout(function () {
                            $('.load_note').html(response.message);
                        }, 1000);

                        setTimeout(function () {
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                            $boxConfirm.fadeOut(200);

                            if (response.ok === 1) {
                                $('#product-' + productId).remove(); // Xóa hàng khỏi bảng
                                location.reload(); // Reload trang
                            }
                        }, 500);
                    } catch (e) {
                        console.error('Lỗi:', e);
                        $('.load_note').html('Có lỗi xử lý dữ liệu');
                        setTimeout(function () {
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                            $boxConfirm.fadeOut(200);
                        }, 500);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('AJAX error:', status, error);
                    $('.load_note').html('Có lỗi xảy ra');
                    setTimeout(function () {
                        $('.load_process').hide();
                        $('.load_overlay').hide();
                        $boxConfirm.fadeOut(200);
                    }, 500);
                }
            });

            // Unbind event sau khi xử lý
            $(document).off('click', '#confirm_yes');
        });

        // Bind event cho nút Hủy
        $(document).on('click', '#confirm_no', function () {
            $boxConfirm.fadeOut(200);
            // Unbind các event
            $(document).off('click', '#confirm_yes');
            $(document).off('click', '#confirm_no');
        });
    });
});