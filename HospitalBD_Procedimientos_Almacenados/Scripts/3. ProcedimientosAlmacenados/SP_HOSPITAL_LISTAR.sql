create or replace PROCEDURE SP_HOSPITAL_LISTAR(
    p_id_distrito  NUMBER DEFAULT NULL,
    p_id_sede      NUMBER DEFAULT NULL,
    p_id_condicion NUMBER DEFAULT NULL
) AS
    v_count NUMBER := 0;
BEGIN
    -- Contar hospitales antes de listar
    SELECT COUNT(*) INTO v_count
    FROM Hospital h
    WHERE (p_id_distrito  IS NULL OR h.id_distrito  = p_id_distrito)
      AND (p_id_sede      IS NULL OR h.id_sede      = p_id_sede)
      AND (p_id_condicion IS NULL OR h.id_condicion = p_id_condicion);

    -- Si no hay hospitales, mostrar mensaje y salir
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('⚠ No se encontraron hospitales con los filtros proporcionados.');
        RETURN;
    END IF;

    -- Encabezado
    DBMS_OUTPUT.PUT_LINE('===============================================');
    DBMS_OUTPUT.PUT_LINE(' LISTADO DE HOSPITALES ');
    DBMS_OUTPUT.PUT_LINE('===============================================');

    -- Recorrer hospitales con información completa
    FOR h IN (
        SELECT h.id_hospital, h.nombre, h.antiguedad, h.area, 
               d.desc_distrito, s.desc_sede, g.desc_gerente, c.desc_condicion
        FROM Hospital h
        INNER JOIN Distrito d ON h.id_distrito = d.id_distrito
        INNER JOIN Sede s ON h.id_sede = s.id_sede
        INNER JOIN Gerente g ON h.id_gerente = g.id_gerente
        INNER JOIN Condicion c ON h.id_condicion = c.id_condicion
        WHERE (p_id_distrito  IS NULL OR h.id_distrito  = p_id_distrito)
        AND   (p_id_sede      IS NULL OR h.id_sede      = p_id_sede)
        AND   (p_id_condicion IS NULL OR h.id_condicion = p_id_condicion)
    ) LOOP
        -- Separar la salida en varias líneas para evitar truncamiento
        DBMS_OUTPUT.PUT_LINE('ID: ' || h.id_hospital || ' | Nombre: ' || h.nombre);
        DBMS_OUTPUT.PUT_LINE('Antigüedad: ' || h.antiguedad || ' años | Área: ' || h.area || ' m2');
        DBMS_OUTPUT.PUT_LINE('Distrito: ' || h.desc_distrito || ' | Sede: ' || h.desc_sede);
        DBMS_OUTPUT.PUT_LINE('Gerente: ' || h.desc_gerente || ' | Condición: ' || h.desc_condicion);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===============================================');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error inesperado: ' || SQLERRM);
END SP_HOSPITAL_LISTAR;
