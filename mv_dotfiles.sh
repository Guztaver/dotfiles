#!/bin/bash

# Lista de diretórios a serem sincronizados
diretorios=$(ls -d */)

# Caminho do diretório de destino
diretorio_destino=~/.config/

# Move os scripts para a pasta .bin no seu diretório, para não dar erro na hora de exucutar o sway
mv ./scripts/ $HOME/.bin

# Loop sobre cada diretório listado

for dir in $diretorios; do
	# Construir o caminho completo do diretório de origem
	caminho_origem="$dir"

	# Construir o caminho completo do diretório de destino
	caminho_destino="$diretorio_destino$dir"

	# Construir o comando de movimentação (do local para o usuário)
	comando_mv="mv $caminho_origem $caminho_destino"

	# Executar o comando de movimentação e verificar o status de saída
	$comando_mv
	status=$?

	# Verificar se a movimentação foi bem-sucedida
	if [ $status -eq 0 ]; then
		echo "Diretório $dir movido com sucesso para $diretorio_destino"
	else
		echo "Erro ao mover o diretório $dir para $diretorio_destino. Código de saída: $status"
	fi
done

echo "Movimentação concluída."
