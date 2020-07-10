<p align="center">
 <img src="https://user-images.githubusercontent.com/46378210/87082737-d7d46c00-c201-11ea-9724-00c8f0d83794.png"/>
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.6&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=6.0.2.2&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=TESTES&message=%3E80&color=GREEN&style=for-the-badge"/>
</p>

<p align="center">
  <img src="http://img.shields.io/static/v1?label=STATUS&message=Em Desenvolvimento&color=Yellow&style=for-the-badge"/>
</p>

## Lista de Conteúdos

:small_orange_diamond: [Descrição do Projeto](#descrição-do-projeto)

:small_orange_diamond: [Layout](#layout)

:small_orange_diamond: [Gems instaladas](#gems-instaladas)

:small_orange_diamond: [Pré-requisitos](#pré-requisitos-package)

:small_orange_diamond: [Configurações](#configurações)

:small_orange_diamond: [Rodando a aplicação](#rodando-a-aplicação-arrow_forward)

:small_orange_diamond: [Rodando os testes](#rodando-os-testes-memo)

:small_orange_diamond: [Casos de Uso](#casos-de-uso-busts_in_silhouette)

:small_orange_diamond: [Database](#database-floppy_disk)

:small_orange_diamond: [API](#api)

## Descrição do projeto 

O projeto é uma plataforma de venda de bots, onde os clientes podem criar uma conta fisica e para suas empresas, ver e realizar pedidos de bots disponíveis e realizar as compras. O sistema funciona em conjunto com outro projeto: o [Gestão Interna](https://github.com/TreinaDev/gestao_interna), que administra esss planos, a conta dos clientes incluindo bloqueios por fraude e fechamento do pagamento. 

## Layout 

## Gems instaladas

:books: [**Devise**](https://github.com/heartcombo/devise) para autenticação de usuários (recrutadores e candidatos)

:books: [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

:books: [**Capybara**](https://github.com/teamcapybara/capybara) para escrever e executar testes de integração, isto é, de alto nível

:books: [**Factory Bot Rails**](https://github.com/thoughtbot/factory_bot_rails) para otimizar a escrita de testes

:books: [**SimpleCov**](https://github.com/colszowka/simplecov) para  gerar relatórios referentes a cobertura de testes

:books: [**Faraday**](https://lostisland.github.io/faraday/usage/) para fazer requisições e enviar dados por API

:books: [**Faker**](https://github.com/faker-ruby/faker) para gerar dados fake nos testes na aplicação.

:books: [**Bootstrap**](https://github.com/twbs/bootstrap-rubygem) para utilizar layout prontos na contruição das telas da interface. 

## Pré-requisitos :package:

Algumas instalações serão necessárias antes de iniciar o projeto. 

:warning: [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.6

:warning: [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=6.0.3.2

:warning: [Node](https://nodejs.org/en/download/) versão >=10.13.0

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

:warning: [Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4 

## Configurações

### Iniciando/Configurando banco de dados

No terminal, clone o projeto: 

```
git clone https://github.com/TreinaDev/checkout_area_do_cliente
```
Entre na pasta
```
cd checkout_area_do_cliente
```
Instale as dependencias e prepare o database
```
bin/setup
```

## Rodando a aplicação :arrow_forward:

```
$ cd checkout_area_do_cliente
$ rails server or rails s
```

> Depois, acesse http://localhost:3000 para ver a aplicação

## Casos de Uso :busts_in_silhouette:

É possível acessar a plataforma como 

**Cliente** e **com** empresa cadastrada:

```
login: cliente01@gmail.com
senha: 123456
```

**Cliente** e **sem** empresa cadastrada:

```
login: cliente02@gmail.com
senha: 123456
```

**Vendedor**:

```
login: first@teste.com
senha: 123456
```

## Rodando os testes :memo:

```
$ cd checkout_area_do_cliente
$ rspec or bundle exec rspec
```

## Database :floppy_disk:

O banco de dados utilizado nesta aplicação foi o [SQLite3](https://www.sqlite.org/index.html). O banco foipreparado com o comando ``` bin/setup ```

## API

## Desenvolvedores do Checkout de Vendas

|  [<img src="https://avatars3.githubusercontent.com/u/29666613?s=400&v=4" width=115><br><sub>Alexandre Lima</sub>](https://github.com/AvilaLima) | [<img src="https://avatars2.githubusercontent.com/u/24919300?s=400&v=4" width=115><br><sub>Chistian</sub>](https://github.com/xitomoco) | [<img src="https://avatars2.githubusercontent.com/u/46378210?s=400&u=071f7791bb03f8e102d835bdb9c2f0d3d24e8a34&v=4" width=115><br><sub>Diana Regina</sub>](https://github.com/reginadiana) | [<img src="https://avatars0.githubusercontent.com/u/53353915?s=400&u=62f2e018464f214c0039d92f3c6e236b314a4c04&v=4" width=115><br><sub>Guilherme bertho luiz</sub>](https://github.com/namae-no-nai) | [<img src="https://avatars2.githubusercontent.com/u/54655097?s=400&v=4" width=115><br><sub>TenaniLucas</sub>](https://github.com/TenaniLucas) |  
| :---: | :---: | :---: | :---: | :---: |
