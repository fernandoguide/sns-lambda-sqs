# Use a imagem base do Node.js
FROM node:18

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie os arquivos de dependências para o container
COPY package*.json ./

# Instale as dependências
RUN npm install

# Instale o Serverless Framework globalmente
RUN npm install -g serverless

# Copie o restante dos arquivos da aplicação
COPY . .

# Defina a variável de ambiente para a chave de licença
# ENV SERVERLESS_ACCESS_KEY=AKlfw9K2hw8VGUj1d4uPLgEUrntjJu0rSwoPSB2vP6GQ5
ENV SERVERLESS_ACCESS_KEY=test
# Compile o código TypeScript
RUN npm run build

# Exponha a porta da aplicação (opcional, se necessário)
EXPOSE 3000

# Comando para iniciar o deployment usando o Serverless Framework
CMD ["serverless", "deploy"]
