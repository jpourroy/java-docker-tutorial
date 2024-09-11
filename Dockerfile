# FROM openjdk:21-jdk-slim - ~462MB
 # ~350MB
FROM eclipse-temurin:21-jdk-alpine


# Set the working directory in the container
WORKDIR /app

COPY app/Hello.java .

# Compile the code
RUN javac Hello.java

# Create the manifest file
RUN mkdir META-INF
COPY META-INF/* META-INF/

# Package the jar file
RUN jar cmvf META-INF/MANIFEST.MF hello.jar Hello.class

# Run the Hello World
CMD ["java", "-jar", "hello.jar"]