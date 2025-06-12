<!DOCTYPE html>
<html>
<head>
    <script>
        function showImage(src) {
            // Tạo modal container
            const modal = document.createElement('div');
            modal.style.position = 'fixed';
            modal.style.zIndex = '9999';
            modal.style.left = '0';
            modal.style.top = '0';
            modal.style.width = '100%';
            modal.style.height = '100%';
            modal.style.backgroundColor = 'rgba(0,0,0,0.9)';
            modal.style.display = 'flex';
            modal.style.alignItems = 'center';
            modal.style.justifyContent = 'center';
            modal.style.cursor = 'pointer';

            // Tạo ảnh phóng to
            const img = document.createElement('img');
            img.src = src;
            img.style.maxWidth = '90%';
            img.style.maxHeight = '90%';
            img.style.objectFit = 'contain';

            // Thêm ảnh vào modal
            modal.appendChild(img);

            // Thêm modal vào body
            document.body.appendChild(modal);

            // Đóng modal khi click
            modal.onclick = function() {
                document.body.removeChild(modal);
            };
        }
    </script>
</head> 