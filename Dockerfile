FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /src
COPY src ./src
RUN mkdir /out && javac --add-modules jdk.httpserver -d /out $(find src -name '*.java')
RUN java --add-modules jdk.httpserver -cp /out com.example.q012.HealthTest

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app && mkdir data && chown -R app:app /app
USER app
COPY --from=build /out /app/classes
EXPOSE 8312
ENTRYPOINT ["java", "--add-modules", "jdk.httpserver", "-cp", "/app/classes", "com.example.q012.App"]
