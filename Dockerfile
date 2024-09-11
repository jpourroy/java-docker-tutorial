# FROM openjdk:21-jdk-slim ~462MB
# FROM eclipse-temurin:21-jdk-alpine AS builder ~350MB
FROM chainguard/jdk:latest-dev AS builder

# Set the working directory in the container
WORKDIR /app

# Copy Java source code
COPY app/Hello.java .

# Compile the Java source code
RUN javac Hello.java

# Create the manifest directory and file
RUN mkdir META-INF
COPY META-INF/* META-INF/

# Package the jar file
RUN jar cmvf META-INF/MANIFEST.MF hello.jar Hello.class

# Final stage using Distroless
#FROM gcr.io/distroless/java21-debian12

FROM chainguard/jdk:latest-dev

# Set the working directory
WORKDIR /app

# Copy the jar file from the builder stage
COPY --from=builder /app/hello.jar /app/

# Run the JAR file
CMD ["java", "-jar", "hello.jar"]
