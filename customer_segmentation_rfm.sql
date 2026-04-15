-- Calculando Recência, Frequência e Valor por Cliente
WITH rfm_base AS (
    SELECT 
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS ultima_compra,
        COUNT(o.order_id) AS frequencia,
        SUM(p.payment_value) AS valor_total,
        -- Calculando a recência em dias a partir da data máxima do dataset
        DATE_DIFF(
            (SELECT MAX(order_purchase_timestamp) FROM `project.dataset.orders`), 
            MAX(o.order_purchase_timestamp), 
            DAY
        ) AS recencia_dias
    FROM `project.dataset.orders` o
    JOIN `project.dataset.customers` c ON o.customer_id = c.customer_id
    JOIN `project.dataset.payments` p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY 1
),

-- Criando os Quartis (Scores de 1 a 5)
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recencia_dias DESC) AS R, -- Menor recência = Score maior
        NTILE(5) OVER (ORDER BY frequencia ASC) AS F,
        NTILE(5) OVER (ORDER BY valor_total ASC) AS M
    FROM rfm_base
)

-- Segmentação Final
SELECT 
    customer_unique_id,
    recencia_dias,
    frequencia,
    valor_total,
    (R + F + M) / 3.0 AS rfm_score_medio,
    CASE 
        WHEN (R + F + M) >= 13 THEN 'Campeão / Fiel'
        WHEN (R + F + M) >= 9 THEN 'Potencialmente Fiel'
        WHEN (R + F + M) >= 5 THEN 'Atenção / Risco de Churn'
        ELSE 'Hibernando'
    END AS segmento_cliente
FROM rfm_scores
ORDER BY valor_total DESC;
