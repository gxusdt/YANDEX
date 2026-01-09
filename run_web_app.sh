#!/bin/bash
set -e

PROJECT_DIR="test-project"
IMAGE_NAME="my-web-app:latest"
CONTAINER_NAME="my-web-app"

echo "Создаём директорию проекта..."
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo "Создаём index.html..."
cat <<EOF > index.html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Web App</title>
</head>
<body>
    <h1>Hello from Kenchik</h1>
</body>
</html>
EOF

echo "Создаём Dockerfile..."
cat <<EOF > Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EOF

echo "Собираем Docker-образ..."
docker build -t "$IMAGE_NAME" .

echo "Останавливаем старый контейнер, если есть..."
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "Запускаем контейнер..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p 8080:80 \
  "$IMAGE_NAME"

echo "Готово! Открой http://localhost:8080"
