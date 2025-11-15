# Med Clinic

Sistema de gerenciamento de clínica médica com arquitetura de microserviços.

## 🏗️ Arquitetura

- **Kong Gateway**: API Gateway (porta 8000)
- **Scheduling MS**: Microserviço de agendamento (porta 3001)
- **Notification MS**: Microserviço de notificações (porta 3002)

## 🚀 Começando

### Clonar o projeto

```bash
git clone --recurse-submodules git@github.com:SEU_USUARIO/med-clinic.git
cd med-clinic
```

Se já clonou sem os submódulos:

```bash
git submodule update --init --recursive
```

### Iniciar o ambiente

```bash
chmod +x start.sh stop.sh
./start.sh
```

Isso vai:
1. Atualizar os submódulos
2. Fazer build das aplicações
3. Subir todos os containers

### Parar o ambiente

```bash
./stop.sh
```

## 🔧 Comandos úteis

### Ver logs de todos os serviços
```bash
docker-compose logs -f
```

### Ver logs de um serviço específico
```bash
docker-compose logs -f scheduling-ms
docker-compose logs -f notification-ms
docker-compose logs -f kong
```

### Reiniciar um serviço
```bash
docker-compose restart scheduling-ms
```

### Rebuild de um serviço
```bash
docker-compose up -d --build scheduling-ms
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

## 👥 Trabalhando com Submódulos

### Atualizar submódulos para a versão mais recente
```bash
git submodule update --remote
```

### Fazer alterações em um submódulo
```bash
cd scheduling-ms
git checkout main
# faça suas alterações
git add .
git commit -m "sua mensagem"
git push

# Volte ao repositório principal e atualize a referência
cd ..
git add scheduling-ms
git commit -m "Atualiza referência do scheduling-ms"
git push
```

### Atualizar seu ambiente com mudanças de outros devs
```bash
git pull
git submodule update --init --recursive
./start.sh
```

## 🛠️ Desenvolvimento

Para desenvolver localmente sem Docker:

1. Entre no submódulo desejado
2. Instale as dependências
3. Execute o projeto normalmente

Os submódulos são repositórios Git independentes e podem ser desenvolvidos separadamente.
