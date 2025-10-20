# Use Debian slim as base
FROM debian:bookworm-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay bash netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH so fortune/cowsay can be found
ENV PATH="/usr/games:${PATH}"

# Copy Wisecow script
COPY wisecow.sh /wisecow.sh
RUN chmod +x /wisecow.sh

# Expose port
EXPOSE 4499

# Run the script
CMD ["/wisecow.sh"]

