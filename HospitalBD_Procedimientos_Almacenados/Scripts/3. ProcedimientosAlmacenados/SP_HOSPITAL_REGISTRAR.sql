create or replace PROCEDURE SP_HOSPITAL_REGISTRAR(
   p_id_distrito NUMBER,
   p_nombre VARCHAR2,
   p_antiguedad NUMBER,
   p_area NUMBER,
   p_id_sede NUMBER,
   p_id_gerente NUMBER,
   p_id_condicion NUMBER
) AS
BEGIN
    -- Validar si el distrito existe
    IF NOT Hospital_Utils.Existe_Distrito(p_id_distrito) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: El distrito con ID ' || p_id_distrito || ' no existe.');
        RETURN;
    END IF;

    -- Validar si la sede existe
    IF NOT Hospital_Utils.Existe_Sede(p_id_sede) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: La sede con ID ' || p_id_sede || ' no existe.');
        RETURN;
    END IF;

    -- Validar si el gerente existe
    IF NOT Hospital_Utils.Existe_Gerente(p_id_gerente) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: El gerente con ID ' || p_id_gerente || ' no existe.');
        RETURN;
    END IF;

    -- Validar si la condición existe
    IF NOT Hospital_Utils.Existe_Condicion(p_id_condicion) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: La condición con ID ' || p_id_condicion || ' no existe.');
        RETURN;
    END IF;

    -- Validar si ya existe un hospital con el mismo nombre en el mismo distrito
    IF Hospital_Utils.Existe_Hospital_Nombre(p_id_distrito, p_nombre) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: Ya existe un hospital con el nombre "' || p_nombre || '" en este distrito.');
        RETURN;
    END IF;

    -- Insertar el hospital
    INSERT INTO Hospital (id_distrito, nombre, antiguedad, area, id_sede, id_gerente, id_condicion)
    VALUES (p_id_distrito, p_nombre, p_antiguedad, p_area, p_id_sede, p_id_gerente, p_id_condicion);

    DBMS_OUTPUT.PUT_LINE('✅ Hospital "' || p_nombre || '" registrado correctamente.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error inesperado: ' || SQLERRM);
END SP_HOSPITAL_REGISTRAR;
