<footer class="footer">
    <script src="https://app.tudongchat.com/js/chatbox.js"></script>
<script>
  const tudong_chatbox = new TuDongChat('-TVbUq1fKEv5X-i8FL8zN')
  tudong_chatbox.initial()
</script>
    <div class="footer-content">
        <div class="footer-column">
            <h3 style="margin-left: 0px;">HỆ THỐNG ĐẠI LÝ MERCEDES-BENZ</h3>
            <ul>
                <li>Mercedes-Benz Hà Nội</li>
                <li>Số 46 Láng Hạ, Phường Láng Hạ, Quận Đống Đa, Hà Nội</li>
                <li>Số 5 Lê Thánh Tông, Hoàn Kiếm, Hà Nội</li>
                <li>Số 386 Nguyễn Văn Linh, Long Biên, Hà Nội</li>
                <li>Số 256 Kim Giang, Đại Kim, Hoàng Mai, Hà Nội</li>
                <li>Số 11 Phạm Hùng, Mỹ Đình, Từ Liêm, Hà Nội</li>
                <li>Email: mercedes.benz.vietnamhn@gmail.com</li>
                <li>Hotline: 035 399 5555</li>
                <li>Website: <a href="https://mercedes-benz-vn.com/" target="_blank"
                        rel="noopener noreferrer">mercedes-benz-vn.com</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3 style="margin-left: 0px;">Hỗ trợ khách hàng</h3>
            <ul>
                <li>Chính sách mua hàng</li>
                <li>Chính sách bảo hành</li>
                <li>Chính sách khuyến mại</li>
                <li>Hotline: <a href="tel:0353995555">035 399 5555</a></li>
            </ul>
        </div>
        <div class="map-container">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4854095468893!2d105.81174731531906!3d21.01752699333044!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab7d91a1d589%3A0xb5cb460f346d6f44!2zNDYgTMOhbmcgSOG6oSwgTMOhbmcgSOG6oSwgxJDhu5FuZyDEkGEsIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1653445287612!5m2!1svi!2s"
                width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
    <div class="footer-bottom">
        © Copyright Mercedes-benz-vn. All rights reserved.
    </div>
</footer>
</div>
<style>
    .footer {
        background-color: #000;
        color: #fff;
        padding: 40px 0 20px;
    }

    .footer-content {
        display: grid;
        grid-template-columns: 1fr 1fr 2fr;
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }

    .footer-column h3 {
        height:7%;
        color: #fff;
        font-size: 18px;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #333;
    }

    .footer-column ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-column ul li {
        margin-bottom: 12px;
        font-size: 14px;
        color: #ccc;
        transition: color 0.3s ease;
    }

    .footer-column ul li:hover {
        color: #fff;
    }

    .footer-column a {
        color: #ccc;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-column a:hover {
        color: #fff;
        text-decoration: underline;
    }

    .map-container {
        width: 100%;
        height: 450px;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease;
    }

    .map-container:hover {
        transform: translateY(-5px);
    }

    .map-container iframe {
        width: 100%;
        height: 100%;
        border: none;
    }

    .footer-bottom {
        text-align: center;
        padding-top: 20px;
        margin-top: 40px;
        border-top: 1px solid #333;
        color: #666;
        font-size: 14px;
    }

    /* Responsive Design */
    @media (max-width: 992px) {
        .footer-content {
            grid-template-columns: 1fr 1fr;
        }

        .map-container {
            grid-column: span 2;
            height: 400px;
        }
    }

    @media (max-width: 768px) {
        .footer-content {
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .map-container {
            grid-column: span 1;
            height: 350px;
        }

        .footer-column h3 {
            font-size: 16px;
        }

        .footer-column ul li {
            font-size: 13px;
        }
    }
</style>