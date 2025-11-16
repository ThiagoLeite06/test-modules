#!/bin/bash

echo "🚀 Iniciando Med Clinic..."
echo ""

# Verifica se os microserviços existem
echo "🔍 Verificando microserviços..."
if [ ! -d "../scheduling-ms" ]; then
    echo "❌ Erro: Pasta ../scheduling-ms não encontrada"
    echo "   Certifique-se que os repositórios estão em: /Users/thiagoleite/Developer/FIAP/modulo03/"
    exit 1
fi

if [ ! -d "../notification-ms" ]; then
    echo "❌ Erro: Pasta ../notification-ms não encontrada"
    echo "   Certifique-se que os repositórios estão em: /Users/thiagoleite/Developer/FIAP/modulo03/"
    exit 1
fi

echo "✅ Microserviços encontrados!"
echo ""

# Sobe todos os serviços
echo "🐳 Subindo containers..."
docker compose up -d --build

echo ""
echo "✅ Ambiente iniciado com sucesso!"
echo ""
echo "📋 Serviços disponíveis:"
echo "   Kong Gateway (Proxy): http://localhost:8000"
echo "   Kong Admin API:       http://localhost:8001"
echo "   Kong Admin GUI:       http://localhost:8002"
echo "   Scheduling MS:        http://localhost:3001"
echo "   Notification MS:      http://localhost:3002"
echo ""
echo "📊 Para ver logs: docker compose logs -f [service-name]"
echo "🛑 Para parar: ./stop.sh"
