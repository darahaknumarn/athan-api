# Use a lightweight base image with Java
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY fineract-provider/build/libs/fineract-provider-0.1.0-SNAPSHOT.jar app.jar



# <-- Define your environment variables here:
ENV FINERACT_DEFAULT_TENANTDB_HOSTNAME=10.15.0.5 \
FINERACT_HIKARI_DRIVER_SOURCE_CLASS_NAME=org.mariadb.jdbc.Driver \
    FINERACT_HIKARI_JDBC_URL=jdbc:mariadb://10.15.0.5:3306/fineract_tenants
#    FINERACT_HIKARI_PASSWORD=postgres \
#    FINERACT_HIKARI_USERNAME=root
# Expose the port the application runs on

# NOTE: env vars prefixed "FINERACT_HIKARI_*" are used to configure the database connection pool



EXPOSE 8443

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
