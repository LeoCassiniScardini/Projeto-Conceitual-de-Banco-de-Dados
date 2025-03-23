# Projeto conceitual de banco de dados -- E-Commerce

Refine o modelo apresentado acrescentando os seguintes pontos:
  Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
  Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
  Entrega – Possui status e código de rastreio;

Adicionado tabelas:
  Cliente PJ
  Cliente PF
  Entrega
  Pagamenteo
  Pedido_pagamento (tabela associativa de pedido e pagamento)

O pedido pode ter varias formas de pagamento associados a ele
O pedido possui detalhes da entrega
O cliente pode ser PJ ou PF, uma só tabela existirá, não sendo possivel um cliente ter ambas
