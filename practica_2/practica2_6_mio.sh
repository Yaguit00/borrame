#!/bin/bash
#878417, Torres García, Yago, T, 3, A
#870959, Pueyo Soria, Nicolas, T, 3, A


#!/bin/bash

directorio_viejo=$(find ~/ -type d -name "bin*" -print -exec stat -c "%n,%Y" {} \; | sort -nk2 | head -n 1)

if [ -d "$directorio_viejo" ]; then
  target_dir="$directorio_viejo"
  echo "Directorio destino de copia: $directorio_viejo"
else
  target_dir=$(mktemp -d ~/bin3K4)
  echo "Se ha creado el directorio $target_dir"
fi

echo "Directorio destino de copia: $target_dir"

for file in .; do  # Iterate directly within target directory
  if [ -x file ]; then
    cp -p "$file" "$target_dir"  # Use -p flag to preserve permissions
    echo "$file ha sido copiado a $target_dir"
  fi
done

echo "Executable files copied to: $target_dir"

