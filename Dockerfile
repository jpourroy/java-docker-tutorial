FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Create the jar file
RUN jar cf helloworld.jar Hello.java

# Copy the jar file into the container
COPY app/*.jar helloworld.jar

# Run the Hello World
CMD ["java", "-jar", "helloworld.jar"]