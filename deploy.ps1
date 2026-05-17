# KPG Gramado LP - Deploy Script
# Uso: .\deploy.ps1

Write-Host "🚀 KPG Gramado LP - Deploy para Cloudflare" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

# 1. Verificar se está na pasta certa
if (-not (Test-Path "wrangler.jsonc")) {
    Write-Host "❌ Erro: wrangler.jsonc nao encontrado!" -ForegroundColor Red
    Write-Host "Execute este script da pasta do projeto" -ForegroundColor Red
    exit 1
}

# 2. Instalar dependências
Write-Host "📦 Verificando dependencias..." -ForegroundColor Yellow
if (-not (Test-Path "node_modules")) {
    npm install
}

# 3. Build TypeScript
Write-Host "🔨 Compilando TypeScript..." -ForegroundColor Yellow
npm run cf-typegen

# 4. Deploy
Write-Host "📤 Fazendo deploy na Cloudflare..." -ForegroundColor Yellow
npm run deploy

Write-Host ""
Write-Host "✅ Deploy realizado com sucesso!" -ForegroundColor Green
Write-Host "🌐 Acesso: https://kpgimoveis.blog.br" -ForegroundColor Green
Write-Host ""
