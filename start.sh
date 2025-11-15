#!/bin/bash

echo "🚀 Iniciando Med Clinic..."
echo ""

# Atualiza os submódulos
echo "📦 Atualizando submódulos..."
git submodule update --init --recursive

# Sobe todos os serviços
echo "🐳 Subindo containers..."
docker-compose up -d --build

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
echo "📊 Para ver logs: docker-compose logs -f [service-name]"
echo "🛑 Para parar: ./stop.sh"
