# ASP.NET Core MVC (Multitier)

## Características do projeto
  Versão completa do Projeto inicial: [ASP.NET Core MVC](https://github.com/gbLw1/ASP.NET-Core-MVC-WebApp)

  .NET SDK Version: [net6.0](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)

  Estilo Arquitetural: [Client-Server](https://pt.wikipedia.org/wiki/Modelo_cliente%E2%80%93servidor), [Multicamada](https://pt.wikipedia.org/wiki/Arquitetura_multicamada)

  Padrão arquitetural: [MVC](https://pt.wikipedia.org/wiki/MVC), [Repository](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design#:~:text=The%20Repository%20pattern%20is%20a,working%20with%20a%20data%20source.&text=A%20repository%20performs%20the%20tasks,of%20domain%20objects%20in%20memory.)

  Segurança: [ASP.NET Identity](https://docs.microsoft.com/en-US/aspnet/identity/overview/getting-started/introduction-to-aspnet-identity)

  ORM: [EntityFramework Core](https://pt.wikipedia.org/wiki/Entity_Framework)

---

## Camadas da aplicação

 - Apresentação
 - Negócios
 - Acesso a dados

---

## Desenvolvimento da aplicação
 - [x] Criação do repositório
 - [x] Criação do projeto
 - [x] Criação das camadas
 - [x] Modelagem das entidades
 - [x] Instalação das dependências do EF Core
 - [x] Referenciar os projetos
 - [x] Mapeamento das entidades para o banco de dados (Fluent API)
 - [x] Implementação do Repository Pattern
 - [x] Mapeamento das entidades em ViewModels (AutoMapper)
 - [x] Scaffolding das Controllers e Views
 - [x] Customização das Views
 - [x] Upload de imagens
 - [x] Globalização do projeto em pt-BR
 - [x] Modal Window para tela de edição
 - [x] Ajax para preenchimento do CEP
 - [x] Organização e otimização da aplicação
 - [x] Roteamento inteligente
 - [x] Validação das entidades de negócio (Fluent Validation)
 - [x] Regras de negócio e eventos de notificações (ViewComponent)
 - [x] Segurança com Identity
 - [x] Tratamento de erros (Client-side requests)
 - [x] Evitando falhas de segurança (CSRF)

--- 

## Como Testar meu projeto?

  - Aplicar as migrations em ambos os contextos (ApplicationDbContext + MeuDbContext)
    - Para isso, abra seu terminal na raíz do projeto e execute as duas linhas de comando abaixo.
  
    Tabelas do sistema (MeuDbContext):
    ```
    dotnet ef database update -v -s .\src\MVC.App\MVC.App.csproj -p .\src\MVC.Data\MVC.Data.csproj -c MeuDbContext
    ```
    Tabelas do Identity (ApplicationDbContext):
    ```
    dotnet ef database update -v -s .\src\MVC.App\MVC.App.csproj -p .\src\MVC.Data\MVC.Data.csproj -c ApplicationDbContext
    ```

  - Em seguida, inicie a aplicação e cadastre um usuário (Home → Nova Conta)
    ```
    dotnet run
    ```
  - Definir as Claims de acesso para o usuário no banco (Tabela: dbo.AspNetUserClaims)
    - UserId: (guid do usuário cadastrado previamente)
    - ClaimType: Fornecedor
    - ClaimValue: Adicionar,Editar,Excluir
  - :+1:
---

## NuGet Packages

  ### MVC.App
  - [x] Microsoft.AspNetCore.Diagnostics.EntityFramework
  - [x] Microsoft.AspNetCore.Identity.EntityFrameworkCore
  - [x] Microsoft.AspNetCore.Identity.UI
  - [x] Microsoft.EntityFrameworkCore.SqlServer
  - [x] Microsoft.EntityFrameworkCore.Tools
  - [x] AutoMapper.Extensions.Microsoft.DependencyInjection

  ### MVC.Business
  - [x] FluentValidation

  ### MVC.Data
  - [x] Microsoft.EntityFrameworkCore
  - [x] Microsoft.EntityFrameworkCore.Tools
  - [x] Microsoft.EntityFrameworkCore.Design
  - [x] Microsoft.EntityFrameworkCore.SqlServer

---

  Plataforma de aprendizagem : [desenvolvedor.io](https://desenvolvedor.io/cursos)  
  Curso : [Dominando o ASP.NET MVC Core](https://desenvolvedor.io/curso-online-dominando-o-asp-net-mvc-core)  
  Instrutor : [Eduardo Pires](https://desenvolvedor.io/instrutor/eduardo-pires)
