<?php
include('../includes/tlca_world.php');

function getMonthlyRevenue($conn)
{
    $revenue = array_fill(1, 12, 0);

    $query = "SELECT 
                MONTH(created_at) as month, 
                SUM(amount) as total 
              FROM orders_car 
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
$monthly_revenue = [
    1 => 5200000000,  // Tháng 1: 5.2 tỷ
    2 => 6100000000,  // Tháng 2: 6.1 tỷ
    3 => 7500000000,  // Tháng 3: 7.5 tỷ
    4 => 6800000000,  // Tháng 4: 6.8 tỷ
    5 => 8200000000,  // Tháng 5: 8.2 tỷ
    6 => 9100000000,  // Tháng 6: 9.1 tỷ
    7 => 8500000000,  // Tháng 7: 8.5 tỷ
    8 => 9800000000,  // Tháng 8: 9.8 tỷ
    9 => 10200000000, // Tháng 9: 10.2 tỷ
    10 => 11500000000, // Tháng 10: 11.5 tỷ
    11 => 12800000000, // Tháng 11: 12.8 tỷ
    12 => 15000000000, // Tháng 12: 15 tỷ
];

$total_revenue = array_sum($monthly_revenue);

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

header('Content-Type: application/json');
echo json_encode([
    'monthly_revenue' => $monthly_revenue,
    'total_revenue' => $total_revenue,
    'chart_data' => $chart_data,
    'monthly_changes' => $monthly_changes
]);
