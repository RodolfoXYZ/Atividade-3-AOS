# Etapa 1: Imagem de build (Maven + OpenJDK 22)
FROM jelastic/maven:3.9.4-openjdk-22.ea-b17 AS build

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo pom.xml e os arquivos de código-fonte para o container
COPY pom.xml .
COPY src ./src

# Executar o Maven para fazer o build da aplicação
RUN mvn clean package -DskipTests

# Etapa 2: Imagem de runtime (OpenJDK 22)
FROM openjdk:22-jdk


# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o JAR gerado da etapa de build para a imagem de runtime
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expor a porta que a aplicação vai usar
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]