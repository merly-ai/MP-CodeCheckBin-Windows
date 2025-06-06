FROM alpine:3.20.3 AS base

# Metadata Labels
LABEL org.opencontainers.image.title="Merly Mentor Assets"
LABEL org.opencontainers.image.description="Serves static files for the Merly Mentor Application. Contact: Debugging Department, Merly, Inc. (debugging@merly.ai)"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.url="https://github.com/merly-ai/MP-CodeCheckBin-Windows"
LABEL org.opencontainers.image.vendor="Merly, Inc."
LABEL org.opencontainers.image.licenses="Proprietary"
LABEL org.opencontainers.image.documentation=""
LABEL org.opencontainers.image.maintainers="Urs C. Muff <urs.muff@merly.ai>, Justin Gottschlich <justin@merly.ai>"
LABEL org.opencontainers.image.authors="Urs C. Muff <urs.muff@merly.ai, Saif Zaman <saif.zaman@merly.ai>"

# Security: Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY models/CPP_model.bin /app/.models/CPP_model.bin
COPY models/C_SHARP_model.bin /app/.models/C_SHARP_model.bin
COPY models/FORTRAN_model.bin /app/.models/FORTRAN_model.bin
COPY models/GO_model.bin /app/.models/GO_model.bin
COPY models/JAVA_model.bin /app/.models/JAVA_model.bin
COPY models/JAVASCRIPT_model.bin /app/.models/JAVASCRIPT_model.bin
COPY models/OBJ_C_model.bin /app/.models/OBJ_C_model.bin
COPY models/PHP_model.bin /app/.models/PHP_model.bin
COPY models/PYTHON_model.bin /app/.models/PYTHON_model.bin
COPY models/RUST_model.bin /app/.models/RUST_model.bin
COPY models/TYPESCRIPT_model.bin /app/.models/TYPESCRIPT_model.bin
COPY models/VHDL_model.bin /app/.models/VHDL_model.bin

# Change ownership of files to the non-root user
RUN chown -R appuser:appgroup /app

# Stage for runtime
FROM base AS final

# Ensure the base image is as lightweight as possible
RUN apk --no-cache add ca-certificates && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /var/lib/apt/lists/*

# Switch to the non-root user
USER appuser

# Set correct file permissions (best practice to avoid permission issues)
RUN chmod -R 755 /app/.models
