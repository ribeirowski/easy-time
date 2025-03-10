# Easy Time

Repositório dedicado ao projeto Easy Time, uma aplicação para gerenciamento de agendamentos em estabelecimentos. O sistema permite que usuários se cadastrem, profissionais sejam associados a estabelecimentos, serviços sejam oferecidos, e agendamentos sejam realizados de forma eficiente.

## RFs (Requisitos Funcionais)

- [ ] Deve ser possível cadastrar um profissional.
- [ ] Deve ser possível se autenticar.
- [ ] Deve ser possível cadastrar um estabelecimento.
- [ ] Deve ser possível cadastrar serviços em um estabelecimento.
- [ ] Deve ser possível definir a disponibilidade de um profissional.
- [ ] Deve ser possível criar um agendamento para um serviço com um profissional.
- [ ] Deve ser possível listar os agendamentos de um cliente.
- [ ] Deve ser possível listar os agendamentos de um profissional.
- [ ] Deve ser possível listar os serviços de um estabelecimento.
- [ ] Deve ser possível listar os profissionais de um estabelecimento.

### Detalhamento dos RFs
- **Cadastrar um profissional**: Um usuário com `role` "professional" pode ser registrado e associado a um estabelecimento via `establishment_id`.
- **Autenticar-se**: Usuários (clientes, profissionais ou proprietários) podem fazer login com email e senha.
- **Cadastrar um estabelecimento**: Um usuário com `role` "owner" pode criar um estabelecimento, fornecendo informações como nome, endereço e telefone.
- **Cadastrar serviços em um estabelecimento**: Um proprietário pode adicionar serviços ao seu estabelecimento, incluindo nome, preço e duração.
- **Definir disponibilidade de um profissional**: Um profissional pode configurar os dias e horários em que está disponível para realizar serviços.
- **Criar um agendamento**: Um cliente pode agendar um serviço com um profissional, escolhendo um horário dentro da disponibilidade do profissional.
- **Listar agendamentos (cliente e profissional)**: Clientes podem ver seus agendamentos futuros, e profissionais podem ver os agendamentos que devem atender.
- **Listar serviços e profissionais de um estabelecimento**: Usuários podem visualizar os serviços oferecidos e os profissionais disponíveis em um estabelecimento.

## RN (Regras de Negócio)

- [ ] Um profissional só pode ser associado a um único estabelecimento.
- [ ] Um serviço só pode ser cadastrado por um usuário com `role` "owner".
- [ ] Um agendamento só pode ser criado dentro dos horários de disponibilidade de um profissional.
- [ ] Não deve ser possível criar agendamentos conflitantes (mesmo horário) para o mesmo profissional.
- [ ] Um agendamento só pode ser criado para um serviço existente em um estabelecimento.
- [ ] Um usuário com `role` "client" não pode cadastrar serviços ou estabelecimentos.
- [ ] Um usuário com `role` "professional" não pode cadastrar estabelecimentos.
- [ ] O preço de um serviço deve ser um valor positivo.
- [ ] A duração de um serviço deve ser um número inteiro de minutos (e.g., 30, 60, 90).

### Detalhamento das RNs
- **Associação de profissionais**: A tabela `users` tem um campo `establishment_id`, garantindo que um profissional esteja vinculado a apenas um estabelecimento.
- **Permissões de `role`**: Apenas usuários com `role` "owner" podem criar serviços ou estabelecimentos, enquanto "professional" e "client" têm permissões limitadas.
- **Conflitos de agendamento**: Antes de criar um agendamento, o sistema deve verificar a tabela `availability` do profissional e os agendamentos existentes para evitar sobreposições.
- **Validação de dados**: O backend deve garantir que preços sejam maiores que zero e durações sejam números inteiros positivos.

## RNFs (Requisitos Não Funcionais)

- [ ] O sistema deve ser desenvolvido em Node.js com Express e TypeScript.
- [ ] O banco de dados deve ser gerenciado pelo Supabase (PostgreSQL).
- [ ] A autenticação deve ser implementada usando o sistema de autenticação do Supabase.
- [ ] O backend deve fornecer uma API RESTful para comunicação com o frontend.
- [ ] As requisições devem ser protegidas contra acesso não autorizado usando JWT (JSON Web Token).
- [ ] O código deve ser organizado em módulos (e.g., `auth.ts`, `users.ts`, `services.ts`).
- [ ] O sistema deve ser escalável para suportar múltiplos estabelecimentos e usuários.
- [ ] O tempo de resposta das APIs deve ser inferior a 2 segundos para 95% das requisições.
- [ ] O projeto deve incluir documentação da API (e.g., usando Swagger ou Postman).
- [ ] O código deve ser versionado usando Git e hospedado no GitHub.

### Detalhamento dos RNFs
- **Tecnologias**: O backend já está configurado com Node.js, Express, TypeScript, e Supabase, conforme a estrutura do projeto.
- **Autenticação**: O Supabase Auth já está implementado no `auth.ts`, usando email/senha e tokens JWT.
- **Organização**: O projeto segue uma estrutura modular (`auth.ts`, `supabase.ts`, `server.ts`, etc.).
- **Escalabilidade**: O Supabase é uma solução escalável, e o backend pode ser otimizado com índices no banco de dados e caching.
- **Documentação**: Recomenda-se usar Swagger para documentar endpoints como `/api/register`, `/api/login`, etc.

## Tecnologias Utilizadas
- **Backend**: Node.js, Fastify, TypeScript, Prisma, Zod
- **Banco de Dados**: Supabase (PostgreSQL)
- **Ferramentas**: Git, GitHub, APIDog, Cursor