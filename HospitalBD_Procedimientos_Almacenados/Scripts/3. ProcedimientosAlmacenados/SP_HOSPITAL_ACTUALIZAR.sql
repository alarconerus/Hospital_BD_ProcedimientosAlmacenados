create or replace PROCEDURE SP_HOSPITAL_ACTUALIZAR(
    p_id_hospital NUMBER,
    p_id_distrito NUMBER,
    p_nombre VARCHAR2,
    p_antiguedad NUMBER,
    p_area NUMBER,
    p_id_sede NUMBER,
    p_id_gerente NUMBER,
    p_id_condicion NUMBER
) AS
BEGIN
    -- Validar si el hospital existe
    IF NOT Hospital_Utils.Existe_Hospital(p_id_hospital) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: El hospital con ID ' || p_id_hospital || ' no existe.');
        RETURN;
    END IF;

    -- Validaciones de claves foráneas usando el paquete
    IF NOT Hospital_Utils.Existe_Distrito(p_id_distrito) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: El distrito con ID ' || p_id_distrito || ' no existe.');
        RETURN;
    END IF;

    IF NOT Hospital_Utils.Existe_Sede(p_id_sede) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: La sede con ID ' || p_id_sede || ' no existe.');
        RETURN;
    END IF;

    IF NOT Hospital_Utils.Existe_Gerente(p_id_gerente) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: El gerente con ID ' || p_id_gerente || ' no existe.');
        RETURN;
    END IF;

    IF NOT Hospital_Utils.Existe_Condicion(p_id_condicion) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: La condición con ID ' || p_id_condicion || ' no existe.');
        RETURN;
    END IF;

    -- Validar si ya existe otro hospital con el mismo nombre en el mismo distrito
    IF Hospital_Utils.Existe_Hospital_Nombre(p_id_distrito, p_nombre, p_id_hospital) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: Ya existe otro hospital con el nombre "' || p_nombre || '" en este distrito.');
        RETURN;
    END IF;

    -- Actualizar el hospital
    UPDATE Hospital
    SET id_distrito = p_id_distrito,
        nombre = p_nombre,
        antiguedad = p_antiguedad,
        area = p_area,
        id_sede = p_id_sede,
        id_gerente = p_id_gerente,
        id_condicion = p_id_condicion
    WHERE id_hospital = p_id_hospital;

    -- Confirmar actualización
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('✅ Hospital "' || p_nombre || '" actualizado correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('⚠ No se realizaron cambios.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error inesperado: ' || SQLERRM);
END SP_HOSPITAL_ACTUALIZAR;
