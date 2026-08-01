# 1. Utiliza a versão oficial do Node.js 24 baseada em Alpine (versão leve)
FROM node:24-alpine

# 2. Define o diretório de trabalho interno no container
WORKDIR /app

# 3. Copia primeiro os arquivos de dependências para aproveitar o cache do Docker
COPY package*.json ./

# 4. Executa a instalação das dependências do Node.js
RUN npm install

# 5. Copia todo o restante do código-fonte da API para dentro do container
COPY . .

# 6. Expõe a porta 3000 (conforme configurado na aplicação original)
EXPOSE 3000

# 7. Define o comando padrão para iniciar a API
CMD ["node", "server.js"]