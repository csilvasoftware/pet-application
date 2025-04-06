# Usar uma imagem base do OpenJDK para compilação
FROM maven:3.8.4-openjdk-17-slim AS build

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar o código fonte para dentro do container
COPY . .

# Rodar o build da aplicação com Maven
RUN mvn clean package -DskipTests

# Usar uma imagem mais leve para rodar a aplicação
FROM openjdk:17-jdk-slim

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar o arquivo JAR gerado para o container
COPY --from=build /app/target/pet-application.jar app.jar

# Comando para rodar a aplicação
CMD ["java", "-jar", "app.jar"]
