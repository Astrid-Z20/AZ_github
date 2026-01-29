# Write your MySQL query statement below
WITH DailySales AS (
    SELECT visited_on, SUM(amount) AS day_amount
    FROM Customer
    GROUP BY visited_on
),
MovingData AS (
    SELECT 
        visited_on,
        -- 核心逻辑：计算当前行 + 前 6 行的总和
        SUM(day_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        -- 计算平均值并保留两位小数
        ROUND(AVG(day_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        -- 顺便记录一下这是第几天，因为前 6 天是不够 7 天窗口的，得删掉
        ROW_NUMBER() OVER (ORDER BY visited_on) AS day_num
    FROM DailySales
)
SELECT visited_on, amount, average_amount
FROM MovingData
WHERE day_num >= 7  -- 只有从第 7 天开始，才算完整的 7 天窗口
ORDER BY visited_on;
