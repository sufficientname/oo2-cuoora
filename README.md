# oo2-cuoora

# TP 1 OO2

## Requerimientos
- Pharo 8
- Seaside (instalar paquete "Bootstrap" desde el Catalog Browser)
- Clonar el repositorio con Iceberg o hacer "File In" de los archivos en el directorio fileout
- ejecutar en el Playground las siguiente lineas
```smalltalk
| app |
CuOOra soleInstanceFill
app := WAAdmin register: CuOOraEntryComponent asApplicationAt: 'cuoora'.
app sessionClass: CuOOraSession.
```
