# SNS-Lambda-SQS Project

Este projeto demonstra a integração de SNS, Lambda e SQS usando o Serverless Framework e LocalStack. O objetivo é criar um tópico SNS que aciona uma função Lambda, que então envia mensagens para uma fila SQS.

## Requisitos

- Docker e Docker Compose
- Node.js e npm
- Serverless Framework

## Estrutura do Projeto

- **`docker-compose.yml`**: Configuração dos containers Docker para LocalStack e o ambiente de aplicação.
- **`serverless.yml`**: Configuração do Serverless Framework para deploy dos recursos na LocalStack.
- **`src/`**: Código-fonte da função Lambda.
- **`handler.ts`**: Código da função Lambda em TypeScript.

## Configuração

### 1. Clonar o Repositório

```
git clone https://github.com/fernandoguide/sns-lambda-sqs.git
cd sns-lambda-sqs
```

### 2. Configurar Dependências

Instale as dependências do Node.js:

```
npm install
```

### 3. Configurar Docker

Certifique-se de que o Docker e o Docker Compose estão instalados e em execução.

### 4. Iniciar LocalStack

Execute os containers Docker:

```
docker-compose up
```

### 5. Deploy dos Recursos

Com o LocalStack em execução, faça o deploy dos recursos com o Serverless Framework:

```
npx serverless deploy
```

### 6. Testar

Envie uma mensagem para o tópico SNS para testar a configuração:

```
aws sns publish \
  --topic-arn arn:aws:sns:us-east-1:000000000000:my-topic \
  --message "Test message" \
  --endpoint-url=http://localhost:4566
```

Verifique se a mensagem foi recebida na fila SQS:

```
aws sqs receive-message --queue-url http://localhost:4566/000000000000/my-queue
```

## Estrutura do Projeto

- **`docker-compose.yml`**: Define os serviços LocalStack e o ambiente de aplicação.
- **`serverless.yml`**: Configuração para deploy de recursos (SNS, Lambda, SQS).
- **`src/`**: Contém o código-fonte da função Lambda.
- **`handler.ts`**: Função Lambda em TypeScript que processa mensagens do SNS e envia para a fila SQS.

## Contribuição

Contribuições são bem-vindas! Por favor, abra uma issue ou um pull request se você encontrar um problema ou quiser adicionar uma nova funcionalidade.

## Licença

Este projeto está licenciado sob a MIT License. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Se você tiver alguma dúvida ou precisar de ajuda, entre em contato com [fernandoguide2014@gmail.com](mailto:seu-email@dominio.com).


