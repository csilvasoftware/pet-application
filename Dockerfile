# Usando uma imagem base com OpenJDK 17
FROM openjdk:17-jdk-slim

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Copiar o JAR da aplicação gerado para o container
COPY target/pet-application.jar app.jar

# Expor a porta que o Spring Boot vai rodar
EXPOSE 8080

# Comando para rodar o JAR da aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]