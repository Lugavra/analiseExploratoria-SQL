# 📊 E-commerce Business Intelligence: EDA & Segmentação RFM com SQL

## 📌 Sobre o Projeto
Este projeto apresenta uma análise exploratória de dados (EDA) completa e uma segmentação estratégica de clientes utilizando o dataset público da **Olist** (maior marketplace do Brasil). 

O objetivo é transformar dados transacionais brutos em insights acionáveis para as áreas de Marketing, Logística e Vendas, demonstrando o uso de técnicas avançadas de SQL para suporte à decisão.

---

## 🛠️ Tecnologias e Técnicas Utilizadas
- **Linguagem:** SQL (Compatível com PostgreSQL, MySQL e BigQuery)
- **Principais Técnicas:**
  - **CTEs (Common Table Expressions):** Para organização e legibilidade do código.
  - **Window Functions:** Utilizadas para rankings, cálculos de acumulados (Pareto) e segmentação estatística (`NTILE`).
  - **Lógica de Negócio:** Aplicação do framework **RFM** (Recency, Frequency, Monetary).

---


## 🔍 Perguntas de Negócio Respondidas

### 1. Visão Geral e Performance
* Qual a evolução mensal do faturamento e do ticket médio?
* Quais categorias de produtos representam 80% da receita total (Curva ABC)?

### 2. Eficiência Logística
* Qual o lead time médio de entrega por estado?
* Quais regiões possuem os maiores índices de atraso em relação à data estimada?

### 3. Inteligência de Cliente (Segmentação RFM)
Através do cálculo de Recência (dias desde a última compra), Frequência (total de pedidos) e Valor (gasto total), os clientes foram segmentados em:
* **Campeões:** Compras recentes, frequentes e alto valor.
* **Potencialmente Fiéis:** Clientes com bom histórico mas que precisam de estímulo.
* **Em Risco / Churn:** Clientes que não compram há muito tempo.

---

## 💡 Principais Insights
* **Concentração de Receita:** Identificamos que aproximadamente 20% dos SKUs geram a maior parte do faturamento, sugerindo foco em otimização de estoque para esses itens.
* **Gargalo Logístico:** Estados da região X apresentam um desvio de entrega significativamente maior, o que impacta diretamente na satisfação do cliente.
* **Oportunidade de Marketing:** A segmentação RFM revelou um grupo de clientes "Hibernando" com alto valor histórico, representando uma oportunidade de recuperação através de campanhas de remarketing.

---

## 🚀 Como utilizar este repositório

1.  **Dados:** O dataset utilizado é o [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2.  **Execução:**
    * Importe os arquivos CSV para o seu banco de dados de preferência.
    * Execute o script `01_exploratory_analysis.sql` para uma visão macro.
    * Execute o script `02_customer_segmentation_rfm.sql` para gerar a tabela de segmentação de clientes.

---

**Autor:** Luiz Felipe Quineli Gavranich  


