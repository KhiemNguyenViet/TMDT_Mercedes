<?php
include('../includes/tlca_world.php');

function getMonthlyRevenue($conn)
{
    $revenue = array_fill(1, 12, 0);

    $query = "SELECT 
                MONTH(created_at) as month, 
                SUM(total_amount) as total 
              FROM orders 
              WHERE 
                YEAR(created_at) = YEAR(CURRENT_DATE) 
                AND status = 'completed' 
              GROUP BY MONTH(created_at)";

    $result = mysqli_query($conn, $query);

    while ($row = mysqli_fetch_assoc($result)) {
        $revenue[$row['month']] = $row['total'];
    }

    return $revenue;
}

// Lấy doanh thu hàng tháng từ cơ sở dữ liệu
$monthly_revenue = getMonthlyRevenue($conn);

// Tính tổng doanh thu
$total_revenue = array_sum($monthly_revenue);

// Chuẩn bị dữ liệu cho biểu đồ
$chart_data = [
    'labels' => [
        'Tháng 1',
        'Tháng 2',
        'Tháng 3',
        'Tháng 4',
        'Tháng 5',
        'Tháng 6',
        'Tháng 7',
        'Tháng 8',
        'Tháng 9',
        'Tháng 10',     
        'Tháng 11',
        'Tháng 12'
    ],
    'values' => array_values($monthly_revenue)
];

// Tính toán sự thay đổi hàng tháng
$monthly_changes = [];
for ($i = 1; $i <= 12; $i++) {
    $current = $monthly_revenue[$i];
    $previous = $i > 1 ? $monthly_revenue[$i - 1] : 0;

    if ($previous > 0) {
        $change_percent = (($current - $previous) / $previous) * 100;
    } else {
        $change_percent = 0;
    }

    $monthly_changes[$i] = [
        'amount' => $current,
        'change' => $change_percent
    ];
}

// Trả về dữ liệu dưới dạng JSON
header('Content-Type: application/json');
echo json_encode([
    'monthly_revenue' => $monthly_revenue,
    'total_revenue' => $total_revenue,
    'chart_data' => $chart_data,
    'monthly_changes' => $monthly_changes
]);
