# Use a imagem oficial do Ruby 2.7 como base
FROM ruby:2.7

# Define a pasta de trabalho no container
WORKDIR /app

# Instalação das dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copia os arquivos Gemfile e Gemfile.lock para o container
COPY Gemfile Gemfile.lock ./

# Instala as gemas
RUN gem install bundler && bundle install

# Copia o restante dos arquivos para o container
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Comando para iniciar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]

