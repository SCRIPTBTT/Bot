import os
import subprocess

def ofuscar_script(ruta_script, ruta_ofuscado):
    # Compilar el script utilizando shc
    comando = f"shc -f {ruta_script} -o {ruta_ofuscado}"
    resultado = subprocess.run(comando, shell=True)

    if resultado.returncode == 0:
        print(f'Script ofuscado guardado como {ruta_ofuscado}')
    else:
        print('Error al ofuscar el script. Asegúrate de que shc esté instalado y en tu PATH.')

def desofuscar_script(ruta_ofuscado, ruta_desofuscado):
    # shc no permite descompilar, así que solo podemos indicar que el archivo ofuscado no puede ser desofuscado.
    print('El script ofuscado no se puede desofuscar. Se ha convertido en un binario ejecutable.')

if __name__ == "__main__":
    # Rutas de los scripts
    ruta_script_original = 'install.sh'  # Cambia esto por la ruta de tu script original
    ruta_script_ofuscado = 'installbotlatamsrc'  # Sin extensión `.sh`, ya que shc crea un binario
    ruta_script_desofuscado = 'installbotlatamsrc_desofuscado.sh'  # No será usado

    # Ofuscar el script
    ofuscar_script(ruta_script_original, ruta_script_ofuscado)

    # Desofuscar el script (no se puede hacer)
    desofuscar_script(ruta_script_ofuscado, ruta_script_desofuscado)
