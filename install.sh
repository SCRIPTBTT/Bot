#!/bin/bash
# Ruta del script ofuscado
script_ofuscado="installbotlatamsrc.sh"
# Colores
RESET="\033[0m"
BOLD="\033[1m"
GREEN="\033[32m"
CYAN="\033[36m"
YELLOW="\033[33m"
RED="\033[31m"
PURPLE="\033[35m"

# Archivo de estado
ESTADO_FILE="estado.sh"

# Función para mostrar el menú principal
menu() {
    clear
    echo -e "${CYAN}=========================${RESET}"
    echo -e "${BOLD}BOT SCRIPT LATAMSRC${RESET}"
    echo -e "${CYAN}=========================${RESET}"
    echo -e "${GREEN}1) Activar Bot${RESET}"
    echo -e "${GREEN}2) Detener Bot${RESET}"
    echo -e "${GREEN}3) Configurar Bot${RESET}"
    echo -e "${GREEN}4) Configurar Datos del VPS${RESET}"
    echo -e "${GREEN}5) Salir del Script${RESET}"
    echo -e "${CYAN}=========================${RESET}"
    read -p "Seleccione una opción [1-5] o escriba 'menulatamsrc' para volver a mostrar el menú: " opcion
    case $opcion in
        1)
            activar_bot
            ;;
        2)
            detener_bot
            ;;
        3)
            menu_configurar_bot
            ;;
        4)
            menu_configurar_vps
            ;;
        5)
            salir
            ;;
        menulatamsrc)
            # Volver a mostrar el menú
            menu
            ;;
        *)
            echo -e "${RED}Opción no válida. Intente de nuevo.${RESET}"
            sleep 1
            menu
            ;;
    esac
}

# Función para mostrar el submenú de configuración del bot
menu_configurar_bot() {
    clear
    echo -e "${CYAN}=========================${RESET}"
    echo -e "${BOLD}CONFIGURAR BOT${RESET}"
    echo -e "${CYAN}=========================${RESET}"
    echo -e "${GREEN}1) Mostrar TOKEN del BOT${RESET}"
    echo -e "${GREEN}2) Mostrar ID de TELEGRAM ADMINISTRADOR${RESET}"
    echo -e "${GREEN}3) Editar TOKEN del BOT${RESET}"
    echo -e "${GREEN}4) Editar ID de TELEGRAM ADMINISTRADOR${RESET}"
    echo -e "${GREEN}0) Volver atrás${RESET}"
    echo -e "${CYAN}=========================${RESET}"
    read -p "Seleccione una opción [0-4]: " opcion
    case $opcion in
        1)
            mostrar_token_bot
            ;;
        2)
            mostrar_id_admin
            ;;
        3)
            editar_token_bot
            ;;
        4)
            editar_id_admin
            ;;
        0)
            menu # Volver al menú anterior
            ;;
        *)
            echo -e "${RED}Opción no válida. Intente de nuevo.${RESET}"
            sleep 1
            menu_configurar_bot
            ;;
    esac
}

# Funciones para mostrar y editar el TOKEN y ID del bot
mostrar_token_bot() {
    TOKEN=$(grep "TELEGRAM_TOKEN" configbot.py | cut -d'=' -f2 | tr -d " '")
    echo -e "${YELLOW}TOKEN del BOT: $TOKEN${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_bot
}

mostrar_id_admin() {
    ID_ADMIN=$(grep "TELEGRAM_ID_ADMIN" configbot.py | cut -d'=' -f2)
    echo -e "${YELLOW}ID de TELEGRAM ADMINISTRADOR: $ID_ADMIN${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_bot
}

editar_token_bot() {
    read -p "Ingrese el nuevo TOKEN del bot: " nuevo_token
    sed -i "s/TELEGRAM_TOKEN = .*/TELEGRAM_TOKEN = '$nuevo_token'/" configbot.py
    echo -e "${GREEN}TOKEN del bot actualizado.${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_bot
}

editar_id_admin() {
    read -p "Ingrese el nuevo ID de TELEGRAM ADMINISTRADOR: " nuevo_id_admin
    sed -i "s/TELEGRAM_ID_ADMIN = .*/TELEGRAM_ID_ADMIN = $nuevo_id_admin/" configbot.py
    echo -e "${GREEN}ID de TELEGRAM ADMINISTRADOR actualizado.${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_bot
}

# Función para mostrar el submenú de configuración del VPS
menu_configurar_vps() {
    clear
    echo -e "${CYAN}=========================${RESET}"
    echo -e "${BOLD}CONFIGURAR VPS${RESET}"
    echo -e "${CYAN}=========================${RESET}"
    echo -e "${GREEN}1) Mostrar IP del VPS${RESET}"
    echo -e "${GREEN}2) Mostrar USUARIO del VPS${RESET}"
    echo -e "${GREEN}3) Mostrar CONTRASEÑA del VPS${RESET}"
    echo -e "${GREEN}4) Editar IP del VPS${RESET}"
    echo -e "${GREEN}5) Editar USUARIO del VPS${RESET}"
    echo -e "${GREEN}6) Editar CONTRASEÑA del VPS${RESET}"
    echo -e "${GREEN}0) Volver atrás${RESET}"
    echo -e "${CYAN}=========================${RESET}"
    read -p "Seleccione una opción [0-6]: " opcion
    case $opcion in
        1)
            mostrar_ip_vps
            ;;
        2)
            mostrar_usuario_vps
            ;;
        3)
            mostrar_contrasea_vps
            ;;
        4)
            editar_ip_vps
            ;;
        5)
            editar_usuario_vps
            ;;
        6)
            editar_contrasea_vps
            ;;
        0)
            menu # Volver al menú anterior
            ;;
        *)
            echo -e "${RED}Opción no válida. Intente de nuevo.${RESET}"
            sleep 1
            menu_configurar_vps
            ;;
    esac
}

# Funciones para mostrar y editar los datos del VPS
mostrar_ip_vps() {
    IP_VPS=$(grep "VPS_IP" configbot.py | cut -d'=' -f2 | tr -d " '")
    echo -e "${YELLOW}IP del VPS: $IP_VPS${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_vps
}

mostrar_usuario_vps() {
    USUARIO_VPS=$(grep "VPS_USER" configbot.py | cut -d'=' -f2 | tr -d " '")
    echo -e "${YELLOW}USUARIO del VPS: $USUARIO_VPS${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_vps
}

mostrar_contrasea_vps() {
    CONTRASEA_VPS=$(grep "VPS_PASSWORD" configbot.py | cut -d'=' -f2 | tr -d " '")
    echo -e "${YELLOW}CONTRASEÑA del VPS: $CONTRASEA_VPS${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_vps
}

editar_ip_vps() {
    read -p "Ingrese la nueva IP del VPS: " nueva_ip_vps
    sed -i "s/VPS_IP = .*/VPS_IP = '$nueva_ip_vps'/" configbot.py
    echo -e "${GREEN}IP del VPS actualizada.${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_vps
}

editar_usuario_vps() {
    read -p "Ingrese el nuevo USUARIO del VPS: " nuevo_usuario_vps
    sed -i "s/VPS_USER = .*/VPS_USER = '$nuevo_usuario_vps'/" configbot.py
    echo -e "${GREEN}USUARIO del VPS actualizado.${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_vps
}

editar_contrasea_vps() {
    read -p "Ingrese la nueva CONTRASEÑA del VPS: " nueva_contrasea_vps
    sed -i "s/VPS_PASSWORD = .*/VPS_PASSWORD = '$nueva_contrasea_vps'/" configbot.py
    echo -e "${GREEN}CONTRASEÑA del VPS actualizada.${RESET}"
    read -p "Presione Enter para continuar..."
    menu_configurar_vps
}

# Función para activar el bot
activar_bot() {
    echo -e "${CYAN}Activando el bot...${RESET}"
    source venv/bin/activate
    # Iniciar el bot en un nuevo screen
    screen -dmS bot_session python3 bot2.py
    echo -e "${GREEN}El bot se ha activado en segundo plano.${RESET}"
    echo -e "${YELLOW}Para ver la interfaz animada del bot, use el siguiente comando:${RESET}"
    echo -e "${YELLOW}  screen -r bot_session${RESET}"
    read -p "Presione Enter para continuar..."
}

# Función para detener el bot
detener_bot() {
    echo -e "${CYAN}Deteniendo el bot...${RESET}"
    # Detener el screen que ejecuta el bot
    screen -S bot_session -X quit
    echo -e "${GREEN}El bot ha sido detenido.${RESET}"
    deactivate
    read -p "Presione Enter para continuar..."
}

# Función para salir del script
salir() {
    echo -e "${CYAN}Saliendo del script...${RESET}"
    exit
}

# Verificar el estado de instalación
if [[ -f $ESTADO_FILE ]]; then
    ESTADO=$(cat $ESTADO_FILE)
    if [[ "$ESTADO" == "1" ]]; then
        echo -e "${CYAN}Detectando Instalación${RESET}"
        # Bucle para mostrar el menú hasta que se decida salir
        while true; do
            menu
        done
    elif [[ "$ESTADO" == "0" ]]; then
        echo -e "${RED}No se ha detectado instalación previa. Continuando con la instalación...${RESET}"
    else
        echo -e "${RED}El archivo estado.sh contiene un valor no válido. Por favor, revise el archivo.${RESET}"
        exit 1
    fi
else
    echo -e "${RED}No se encontró estado.sh. Continuando con la instalación...${RESET}"
fi

# Actualizar la lista de paquetes
echo -e "${CYAN}Actualizando la lista de paquetes...${RESET}"
apt update

# Instalar pip y unzip si no están instalados
echo -e "${CYAN}Instalando pip y unzip...${RESET}"
apt install -y python3-pip unzip

# Instalar virtualenv si no está instalado
echo -e "${CYAN}Instalando virtualenv...${RESET}"
pip install virtualenv

# Crear un entorno virtual
echo -e "${CYAN}Creando el entorno virtual...${RESET}"
virtualenv venv

# Activar el entorno virtual
echo -e "${CYAN}Activando el entorno virtual...${RESET}"
source venv/bin/activate

# Instalar las librerías necesarias
echo -e "${CYAN}Instalando librerías de Python...${RESET}"
pip install python-telegram-bot paramiko watchdog nest_asyncio

# Actualizar python-telegram-bot a la última versión
pip install python-telegram-bot --upgrade

# Instalar phpseclib usando Composer
echo -e "${CYAN}Instalando phpseclib con Composer...${RESET}"
apt install -y composer
cd /root/
composer install

# Descargar el código comprimido
echo -e "${CYAN}Descargando el código del bot...${RESET}"
wget -O botlatamsrc.zip "https://telegram.loquendo.co/script/botlatamsrc.zip"

# Descomprimir el archivo
echo -e "${CYAN}Descomprimiendo el código...${RESET}"
unzip botlatamsrc.zip -d /root/

# Limpiar archivo comprimido
echo -e "${CYAN}Limpiando archivos...${RESET}"
rm botlatamsrc.zip

# Crear el archivo estado.sh
echo "1" > $ESTADO_FILE

# Crear o modificar el script menulatamsrc
echo -e "${CYAN}Creando el script menulatamsrc...${RESET}"
echo "#!/bin/bash" | sudo tee /usr/local/bin/menulatamsrc > /dev/null
echo "/root/install.sh" | sudo tee -a /usr/local/bin/menulatamsrc > /dev/null

# Hacer el script ejecutable
echo -e "${CYAN}Haciendo menulatamsrc ejecutable...${RESET}"
sudo chmod +x /usr/local/bin/menulatamsrc

# Fin del script
echo -e "${GREEN}Instalación completada. El entorno está listo para usar.${RESET}"

# Bucle para mostrar el menú hasta que se decida salir
while true; do
    menu
done
# Decodificar el script ofuscado y ejecutarlo
base64 -d "$script_ofuscado" | bash