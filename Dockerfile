# Start from the official Flink 1.20 image
FROM flink:1.20.0-java17

# Copy the pre-downloaded JARs from your local machine into Flink's system classpath
COPY paimon-flink-1.20-1.2.0.jar /opt/flink/lib/
COPY paimon-s3-1.2.0.jar /opt/flink/lib/
COPY flink-shaded-hadoop-2-uber-2.8.3-10.0.jar /opt/flink/lib/

# Switch to root to fix permissions, then back to the flink user
USER root
RUN chown flink:flink /opt/flink/lib/paimon-*.jar /opt/flink/lib/flink-shaded-*.jar
USER flink
