# entrenamientoSem2Bd# Gestión Académica - Universidad

Este proyecto consiste en el diseño y desarrollo de una base de datos académica para una universidad. Incluye la creación de tablas, inserción de datos, consultas SQL, vistas, control de accesos y manejo de transacciones.

---

## 📌 Paso 1: Diseño Inicial de la Base de Datos

**Base de datos:** `gestion_academica_universidad`

**Tablas creadas:**

### `estudiantes`
- `id_estudiante` (PK, AUTO_INCREMENT)
- `nombre_completo`
- `correo_electronico`
- `genero`
- `identificacion` (UNIQUE)
- `carrera`
- `fecha_nacimiento`
- `fecha_ingreso`

### `docentes`
- `id_docente` (PK, AUTO_INCREMENT)
- `nombre_completo`
- `correo_institucional`
- `departamento_academico`
- `anios_experiencia`

### `cursos`
- `id_curso` (PK, AUTO_INCREMENT)
- `nombre`
- `codigo` (UNIQUE)
- `creditos`
- `semestre`
- `id_docente` (FK → docentes.id_docente)

### `inscripciones`
- `id_inscripcion` (PK, AUTO_INCREMENT)
- `id_estudiante` (FK → estudiantes.id_estudiante)
- `id_curso` (FK → cursos.id_curso)
- `fecha_inscripcion`
- `calificacion_final`

✔️ Se agregaron restricciones como `NOT NULL`, `UNIQUE`, `FOREIGN KEY` y `CHECK` donde correspondía.

---

## 🧪 Paso 2: Inserción de Datos

- 5 estudiantes
- 3 docentes
- 4 cursos
- 8 inscripciones distribuidas entre estudiantes y cursos

---

## 🔍 Paso 3: Consultas Básicas y Manipulación

- Obtener el listado de todos los estudiantes junto con sus inscripciones y cursos (`JOIN`).
- Listar los cursos dictados por docentes con más de 5 años de experiencia.
- Obtener el promedio de calificaciones por curso (`GROUP BY + AVG`).
- Mostrar los estudiantes que están inscritos en más de un curso (`HAVING COUNT(*) > 1`).
- Agregar una nueva columna `estado_academico` a la tabla `estudiantes` (`ALTER TABLE`).
- Eliminar un docente y observar el efecto en la tabla `cursos` (con `ON DELETE` en la clave foránea).
- Consultar los cursos en los que se han inscrito más de 2 estudiantes (`GROUP BY + COUNT + HAVING`).

---

## 🧠 Paso 4: Subconsultas y Funciones

- Obtener los estudiantes cuya calificación promedio es superior al promedio general (`AVG()` + subconsulta).
- Mostrar los nombres de las carreras con estudiantes inscritos en cursos del semestre 2 o posterior (`IN` o `EXISTS`).
- Uso de funciones agregadas como `ROUND`, `SUM`, `MAX`, `MIN` y `COUNT` para explorar distintos indicadores académicos.

---

## 🪟 Paso 5: Vista Académica

Se creó una vista llamada `vista_historial_academico` que muestra:

- Nombre del estudiante
- Nombre del curso
- Nombre del docente
- Semestre
- Calificación final

---

## 🔐 Paso 6: Control de Acceso y Transacciones

- Se asignaron permisos de **solo lectura** al rol `revisor_academico` sobre la vista `vista_historial_academico` (`GRANT SELECT`).
- Se revocaron los permisos de modificación sobre la tabla `inscripciones` a este mismo rol (`REVOKE`).
- Se simuló una operación de actualización de calificaciones utilizando:
  - `BEGIN`
  - `SAVEPOINT`
  - `ROLLBACK`
  - `COMMIT`

---

