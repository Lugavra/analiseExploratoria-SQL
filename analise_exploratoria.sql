WITH faturamento_categoria AS (
    SELECT 
        i.product_id,
        SUM(i.price) AS receita_total
    FROM olist_order_items_dataset i
    GROUP BY 1
),
pareto_calc AS (
    SELECT 
        product_id,
        receita_total,
        SUM(receita_total) OVER(ORDER BY receita_total DESC) / SUM(receita_total) OVER() AS pct_acumulado
    FROM faturamento_categoria
)
SELECT 
    product_id,
    receita_total,
    CASE 
        WHEN pct_acumulado <= 0.80 THEN 'A'
        WHEN pct_acumulado <= 0.95 THEN 'B'
        ELSE 'C'
    END AS classificacao_abc
FROM pareto_calc;

SELECT 
    customer_state,
    AVG(DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)) AS media_dias_entrega,
    COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) * 100.0 / COUNT(*) AS percentual_atraso
FROM olist_orders_dataset o
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
WHERE order_status = 'delivered'
GROUP BY 1
ORDER BY percentual_atraso DESC;
