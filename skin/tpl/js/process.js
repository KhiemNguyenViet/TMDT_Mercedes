$(document).ready(function () {
    // Hàm kiểm tra email hợp lệ
    function isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    // Chặn form reload
    $('#login-form').on('submit', function (e) {
        e.preventDefault();

        var username = $('input[name=username]').val();
        var password = $('input[name=password]').val();
        var remember = $('.remember').attr('value');

        if (username.length < 4) {
            $('input[name=username]').focus();
            return false;
        }

        if (password.length < 6) {
            $('input[name=password]').focus();
            return false;
        }

        $('.load_overlay').show();
        $('.load_process').fadeIn();

        $.ajax({
            url: "/process_login.php",
            type: "POST",
            data: {
                username: username,
                password: password,
                remember: remember
            },
            success: function (response) {
                var info = JSON.parse(response);

                setTimeout(function () {
                    $('.load_note').html(info.thongbao);
                }, 1000);

                setTimeout(function () {
                    $('.load_process').hide();
                    $('.load_note').html('Hệ thống đang xử lý');
                    $('.load_overlay').hide();

                    if (info.ok == 1) {
                        window.location.href = '/admin/dashboard';
                    } else if (info.ok == 2) {
                        window.location.href = '/index.html';
                    } 
                }, 3000);
            },
            error: function () {
                $('.load_process').hide();
                $('.load_note').html('Có lỗi xảy ra');
                $('.load_overlay').hide();
            }
        });
    });

    /////////////////////
    // Đặt giữ xe
    $('.buy-btn').click(function () {
        id = $('.info').data('product-id');
        $.ajax({
            url: '/process.php',
            type: 'POST',
            data: {
                action: 'datcho',
                id: id
            },
            success: function (response) {
                $('body').html(response);
            }
        });
    });
    /////////////////////
    // Đặt lịch lái thử xe
    $('.datlich-button').click(function () {
        // Hiển thị loading
        const $button = $(this);
        const originalText = $button.text();
        $button.prop('disabled', true).text('Đang xử lý...');

        // Lấy giá trị từ form
        username = $('input[name="fullName"]').val();
        phoneNumber = $('input[name="phoneNumber"]').val();
        email = $('input[name="email"]').val();
        testDriveDate = $('input[name="testDriveDate"]').val();
        testDriveTime = $('select[name="testDriveTime"]').val();
        notes = $('textarea[name="notes"]').val();
        diadiem = $('select[name="location"]').val();

        // Lấy productId từ URL hoặc data attribute
        productId = $('.info').data('product-id');

        // Validate dữ liệu
        if (username.length < 4) {
            alert('Tên khách hàng phải từ 4 ký tự trở lên');
            $('input[name="fullName"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (phoneNumber.length < 10 || phoneNumber.length > 11) {
            alert('Số điện thoại phải từ 10 ký tự trở lên và không quá 11 ký tự');
            $('input[name="phoneNumber"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (testDriveDate == '') {
            alert('Ngày lái thử xe không được để trống');
            $('input[name="testDriveDate"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (testDriveTime == '') {
            alert('Giờ lái thử xe không được để trống');
            $('select[name="testDriveTime"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (!productId) {
            alert('Không tìm thấy thông tin xe. Vui lòng thử lại sau.');
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (email == '') {
            alert('Email không được để trống');
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (email != '') {
            if (!isValidEmail(email)) {
                alert('Email không hợp lệ. Vui lòng nhập lại.');
                $button.prop('disabled', false).text(originalText);
                return;
            }
        }
        if (!confirm('Bạn có chắc chắn muốn đặt lịch lái thử xe này?')) {
            $button.prop('disabled', false).text(originalText);
            return;
        }
        // Gửi request đến server
        $.ajax({
            url: '../../process.php',
            method: 'POST',
            data: {
                action: 'datlich',
                fullName: username,
                phoneNumber: phoneNumber,
                email: email,
                testDriveDate: testDriveDate,
                testDriveTime: testDriveTime,
                notes: notes,
                productId: productId,
                diadiem: diadiem
            },
            dataType: 'json',
            success: function (response) {
                if (response.ok === 1) {
                    alert('Yêu cầu đặt lịch lái thử xe của Quý khách đã được gửi. Chúng tôi sẽ liên hệ lại sớm nhất!');
                    $('#bookingPopup').hide();
                    $('form#bookingForm')[0].reset();

                } else {
                    if (response.trungLich) {
                        const confirmChange = confirm(response.thongbao + '\n\nBạn có muốn chọn thời gian khác không?');
                        if (confirmChange) {
                            $('input[name="testDriveDate"]').focus();
                        }
                    } else {
                        alert(response.thongbao);
                    }
                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                alert('Có lỗi xảy ra khi gửi yêu cầu. Vui lòng thử lại sau.');
            },
            complete: function () {
                // Khôi phục trạng thái nút
                $button.prop('disabled', false).text(originalText);
            }
        });
    });
    /////////////////////
    // Đặt giữ xe
    // $('#datxe').click(function() {
    //     window.location.href = '/dat-cho-xe.html';
    // });

    /////////////////////
    // Xử lý nút tư vấn xe
    $('#openConsultPopupBtn').click(function () {
        const stock = parseInt($('.info').data('stock'));
        const productName = $('.info h2').text();

        if (stock === 0) {
            alert('Xin lỗi, sản phẩm ' + productName + ' hiện đã hết hàng. Vui lòng liên hệ với chúng tôi để được tư vấn về các sản phẩm khác.');
            return;
        }

        // Nếu còn hàng thì mở popup tư vấn
        $('#consultPopup').css('display', 'flex');
    });

    // Xử lý đặt giữ chỗ xe
    $('#xacnhan_giucho').click(function (e) {
        e.preventDefault();
        price = $('.price').data('price');
        salutation = $('select[name="salutation"]').val();
        username = $('input[name="fullName"]').val();
        phoneNumber = $('input[name="phoneNumber"]').val();
        email = $('input[name="email"]').val();
        address = $('input[name="address"]').val();
        bank_account_number = $('input[name="bank_account_number"]').val();
        bank_account_name = $('input[name="bank_account_name"]').val();
        bank_name = $('input[name="bank_name"]').val();
        bank_branch = $('input[name="bank_branch"]').val();
        dealer = $('input[name="dealer"]').val();
        sales_person = $('input[name="sales_person"]').val();
        user_id = $('.user_info').data('user-id');
        product_id = $('.car-info').data('product-id');
        $.ajax({
            url: '/process.php',
            type: 'POST',
            data: {
                action: 'xacnhan_datcho',
                salutation: salutation,
                username: username,
                phoneNumber: phoneNumber,
                email: email,
                address: address,
                bank_account_number: bank_account_number,
                bank_account_name: bank_account_name,
                bank_name: bank_name,
                bank_branch: bank_branch,
                dealer: dealer,
                sales_person: sales_person,
                user_id: user_id,
                product_id: product_id,
                price: price
            },
            success: function (response) {
                console.log(response);
                var info = JSON.parse(response);
                if (info.ok === 1) {
                    alert(info.thongbao);
                    window.location.href = '/cacmauxe.html';
                } else {
                    alert(info.thongbao);
                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                alert('Có lỗi xảy ra khi gửi yêu cầu. Vui lòng thử lại sau.');
            }
        });
    });
});