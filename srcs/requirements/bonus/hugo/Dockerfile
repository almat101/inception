FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim wget git

# download and install hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.136.5/hugo_extended_0.136.5_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz \
    && tar -C /usr/local/bin -xzf /tmp/hugo.tar.gz \
    && rm /tmp/hugo.tar.gz

# Check the version
RUN hugo version

# Set up Hugo site
RUN hugo new site portfolio --format yaml

# then copy the hugo.yaml that works as config file(like hugo.toml)
COPY conf/hugo.yaml /portfolio/hugo.yaml

# Set the working directory
WORKDIR /portfolio

# Add the PaperMod theme
RUN git clone https://github.com/adityatelange/hugo-PaperMod.git /portfolio/themes/PaperMod

# Copy the entire static folder with all the assets images etc
COPY static/ /portfolio/static

# Copy the entire content folder with all the markdown files
COPY content/ /portfolio/content

# Build the site to generate the public directory
RUN hugo -D --baseURL https://localhost/portfolio/

# Expose the port for the Hugo server
EXPOSE 1313

# Command to serve the site at the base URL wihout appending the port 1313
CMD ["hugo", "server", "--bind", "0.0.0.0", "--baseURL", "https://localhost/portfolio", "--appendPort=false"]
