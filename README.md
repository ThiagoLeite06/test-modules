# Med Clinic

Sistema de gerenciamento de clínica médica com arquitetura de microserviços.

## 🏗️ Arquitetura

Este projeto utiliza **repositórios separados** para cada microserviço (boa prática de microserviços):

- **Kong Gateway**: API Gateway (porta 8000)
- **Scheduling MS**: Microserviço de agendamento (porta 3001) - [Repositório](https://github.com/ThiagoLeite06/scheduling-ms)
- **Notification MS**: Microserviço de notificações (porta 3002) - [Repositório](https://github.com/ThiagoLeite06/notification-ms)

## 📁 Estrutura de Pastas

Os repositórios devem estar na seguinte estrutura:

```
FIAP/modulo03/
├── med-clinic/          # Este repositório (infra e orquestração)
├── scheduling-ms/       # Repositório do microserviço de agendamento
└── notification-ms/     # Repositório do microserviço de notificações
```

## 🚀 Começando

### 1. Clonar os repositórios

```bash
cd /Users/thiagoleite/Developer/FIAP/modulo03/

# Clone o repositório principal
git clone git@github.com:SEU_USUARIO/med-clinic.git

# Clone os microserviços
git clone git@github.com:ThiagoLeite06/scheduling-ms.git
git clone git@github.com:ThiagoLeite06/notification-ms.git
```

### 2. Iniciar o ambiente

```bash
cd med-clinic
chmod +x start.sh stop.sh
./start.sh
```

Isso vai:
1. Verificar se os microserviços estão nas pastas corretas
2. Fazer build das aplicações
3. Subir todos os containers

### 3. Parar o ambiente

```bash
./stop.sh
```

## 🔧 Comandos úteis

### Ver logs de todos os serviços
```bash
docker compose logs -f
```

### Ver logs de um serviço específico
```bash
docker compose logs -f scheduling-ms
docker compose logs -f notification-ms
docker compose logs -f kong
```

### Reiniciar um serviço
```bash
docker compose restart scheduling-ms
```

### Rebuild de um serviço
```bash
docker compose up -d --build scheduling-ms
```

### Entrar no container
```bash
docker exec -it scheduling-ms sh
```

## 🌐 Endpoints

- Kong Proxy: http://localhost:8000
- Kong Admin API: http://localhost:8001
- Kong Admin GUI: http://localhost:8002
- Scheduling MS: http://localhost:3001
- Notification MS: http://localhost:3002

## 🛠️ Desenvolvimento

### Desenvolvendo os Microserviços

Cada microserviço é um repositório independente. Para desenvolver:

```bash
# Entre no repositório do microserviço
cd ../scheduling-ms

# Instale as dependências
npm install

# Execute em modo de desenvolvimento
npm run dev

# Faça commits normalmente
git add .
git commit -m "feat: nova funcionalidade"
git push
```

### Atualizando o Ambiente

Quando houver mudanças nos microserviços:

```bash
cd ../scheduling-ms
git pull

cd ../notification-ms
git pull

cd ../med-clinic
./start.sh
```

## 💡 Vantagens desta Arquitetura

✅ **Independência**: Cada microserviço tem seu próprio repositório e ciclo de vida
✅ **Deploy independente**: Cada serviço pode ser deployado separadamente
✅ **Desenvolvimento paralelo**: Times podem trabalhar independentemente
✅ **Versionamento claro**: Cada serviço tem seu próprio histórico Git
✅ **CI/CD simplificado**: Pipelines independentes por serviço
