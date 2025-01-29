# Étape 1 : Construire l'application avec Maven et OpenJDK 11
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app

# Copier uniquement les fichiers nécessaires pour Maven en premier pour optimiser le cache Docker
COPY pom.xml .
RUN mvn dependency:go-offline

# Copier le code source et construire le projet
COPY src ./src
RUN mvn clean package -DskipTests

# Étape 2 : Exécuter l'application avec OpenJDK 11
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copier le JAR généré depuis l'étape précédente
COPY --from=build /app/target/webapp-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port sur lequel votre application Web écoute
EXPOSE 8080

# Commande pour démarrer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
