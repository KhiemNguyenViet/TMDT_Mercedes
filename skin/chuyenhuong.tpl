<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>{title}</title>
	<meta name='description' content='Tổng kho hàng Việt Nam'>
	<link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
	<link rel="stylesheet" href="../skin/tpl/css/style.css">
	<script type="text/javascript" src="../skin/tpl/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			setTimeout(function(){
				window.location.href="{link}";
			},3000);
		});
	</script>
</head>
<body>
	<div class="main_thongbao">
		<img src="../hinhanh/loading.gif" alt="Loading" width="80">
		<div class="main_thongbao_content">{thongbao}</div>
	</div>
</body>
</html>