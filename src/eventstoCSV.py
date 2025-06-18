import csv
import xml.etree.ElementTree as ET

# Ruta del archivo XML de entrada
xml_file_path = "/Users/raul/Documents/parcial2/data/raw/eventosMarid.xml"

# Ruta del archivo CSV de salida
csv_file_path = "/Users/raul/Documents/parcial2/data/clean/df_eventos_madrid.csv"

# Parsear el XML
tree = ET.parse(xml_file_path)
root = tree.getroot()

# Obtener nombres de columnas desde el primer evento
columnas = [elem.tag for elem in root[0]]

# Crear y escribir en el archivo CSV
with open(csv_file_path, mode="w", newline="", encoding="utf-8") as archivo_csv:
    writer = csv.writer(archivo_csv)
    writer.writerow(columnas)  # Escribir encabezados

    for evento in root:
        fila = [evento.find(col).text if evento.find(col) is not None else "" for col in columnas]
        writer.writerow(fila)

print("Conversión a CSV completada correctamente.")
