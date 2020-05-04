# README

## Sobre

Projeto desenvolido para solucionar o desafio da https://olist.com/ no https://www.megahack.com.br/ 2ª edição.

Para acessar a API acesse https://megahack2-olist-team4.herokuapp.com/.

Nesse repositório você encontra a API que fornece os dados para a extensão do respositório https://github.com/megahack2-olist-team4/chrome-extension.

## Olist

A Olist é a maior loja de produtos em marketplaces no Brasil inteiro, tendo nesta vitrine mais de 1 milhão de produtos diferentes anunciados, com mais de 400 mil vendas por mês. Empoderando o comércio brasileiro, ajudando comerciantes locais de pequenos, médios e grande portes a ter mais visibilidades e janelas de vendas distribuídas. Além de toda a gestão logística de envios desses produtos e de todo o fluxo de repasse financeiro.

### Desafios

O segmento de comércio online é muito dinâmico e robusto. O volume em número de pedidos passam de 120 milhões em 2019. O grande volume do pedido consequentemente gera um volume gigantesco de dúvidas e questionamentos nos itens em questão. Ao mesmo tempo, um atendimento efetivo e em até 1h ao consumidor final pode aumentar a chance de conversão de venda em até 14%.

Esse grande fluxo de perguntas em diversos sites de marketplace, prejudica não só a experiência do consumidor final, mas atrapalha a logística do vendedor, que necessita ficar acompanhando de tempos em tempos se há novas perguntas e, podendo perder o timing da venda.

Geralmente, as dúvidas dos consumidores finais são relativamente simples, como:  "ainda está disponível", "qual a cor",  "tem a cor preta", "qual prazo de entrega", muitas dessas perguntas, estão descritas na própria descrição do anúncio ou são passíveis de automatização.

Em apenas um canal de venda, recebemos em média mais de 200 mil perguntas por mês. Sabendo disso, como podemos resolver os seguintes desafios:

- Melhorar a experiência de consumo a informação do produto;
- Facilitar a tomada de decisão na hora da compra;
- Proporcionar ao vendedor uma gestão mais fluída e otimizada;

## Enpoints

### 1. Listagem de sites

#### Requisição:

```
GET   /api/v1/sites(.:format)     api/v1/sites#index {:format=>"json"}
```

#### Resposta:

```json
{
  "data": [
    {
      "id": "456ad9e5-2a61-4be0-be1a-2bc6631706ec",
      "type": "site",
      "attributes": {
        "name": "Mercado Livre",
        "description": null,
        "url": "https://www.mercadolivre.com.br"
      },
      "relationships": {},
      "links": {
        "self": "/api/v1/sites/456ad9e5-2a61-4be0-be1a-2bc6631706ec"
      }
    },
    ...
  ],
  "meta": {
    "total": 5
  }
}
```

### 2. Exibição dos dados do site e suas respectivas perguntas

#### Requisição:

```
GET   /api/v1/sites/:id(.:format) api/v1/sites#show {:format=>"json"}
```

#### Resposta:

```json
{
  "data": {
    "id": "456ad9e5-2a61-4be0-be1a-2bc6631706ec",
    "type": "site",
    "attributes": {
      "name": "Mercado Livre",
      "description": null,
      "url": "https://www.mercadolivre.com.br"
    },
    "relationships": {
      "questions_sites": {
        "data": [
          {
            "id": "e01d96fc-c04c-4184-87e6-5dc39ed15825",
            "type": "question"
          },
          ...
        ]
      }
    },
    "links": {
      "self": "/api/v1/sites/456ad9e5-2a61-4be0-be1a-2bc6631706ec"
    }
  },
  "included": [
    {
      "id": "e01d96fc-c04c-4184-87e6-5dc39ed15825",
      "type": "question",
      "attributes": {
        "description": "Envia por PAC?",
        "keywords": null,
        "public": true,
        "answer_xpath": null
      }
    },
    ...
  ]
}
```

### 3. Consulta base de perguntas e referências do site

#### Requisição:

```
PATCH /api/v1/sites/:id(.:format) api/v1/sites#load {:format=>"json"}

Body:

{
  "url": "https://www.mercadolivre.com.br/samsung-galaxy-j2-core-dual-sim-16-gb-preto-1-gb-ram/p/MLB15030554",
  "title": "Samsung Galaxy J2 Core Dual SIM 16 GB Preto 1 GB RAM - R$ 629,00",
  "description": "Desbloqueado. | Tela PLS TFT de 5&quot;. | Câmera traseira de 8Mpx. | Câmera frontal de 5Mpx. | Processador Exynos 7570 Quad-Core de 1.4GHz com 1GB de RAM. | Bateria de 2600mAh. | Memória interna 16GB. Adequado para cartão SD de 256GB. | Sistema operacional Android 8.1 Oreo.",
  "image": "https://http2.mlstatic.com/D_NQ_NP_911899-MLA32445402855_102019-O.webp"
}
```

#### Resposta:

```json
{
  "data": {
    "id": "456ad9e5-2a61-4be0-be1a-2bc6631706ec",
    "type": "site",
    "attributes": {
      "name": "Mercado Livre",
      "description": null,
      "url": "https://www.mercadolivre.com.br"
    },
    "relationships": {
      "questions_sites": {
        "data": [
          {
            "id": "e01d96fc-c04c-4184-87e6-5dc39ed15825",
            "type": "question"
          },
          ...
        ]
      }
    },
    "links": {
      "self": "/api/v1/sites/456ad9e5-2a61-4be0-be1a-2bc6631706ec"
    }
  },
  "included": [
    {
      "id": "e01d96fc-c04c-4184-87e6-5dc39ed15825",
      "type": "question",
      "attributes": {
        "description": "Envia por PAC?",
        "keywords": null,
        "public": true,
        "answer_xpath": null
      }
    },
    ...
  ]
}
```

## Setup

### Requisitos

* Docker https://docs.docker.com/get-docker/
* Docker Compose https://docs.docker.com/compose/install/

### Execução do projeto

```bash
docker-compose up --build
```
