create or replace PROCEDURE SP_HOSPITAL_BUSCAR_NOMBRE(
    p_nombre VARCHAR2
) AS
    v_count NUMBER := 0;
BEGIN
    -- Contar hospitales que coincidan con el nombre
    SELECT COUNT(*) INTO v_count
    FROM Hospital
    WHERE LOWER(nombre) LIKE '%' || LOWER(p_nombre) || '%';

    -- Si no hay coincidencias, mostrar mensaje y salir
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('⚠ No se encontraron hospitales con el nombre "' || p_nombre || '".');
        RETURN;
    END IF;

    -- Encabezado
    DBMS_OUTPUT.PUT_LINE('===============================================');
    DBMS_OUTPUT.PUT_LINE(' HOSPITALES ENCONTRADOS POR NOMBRE ');
    DBMS_OUTPUT.PUT_LINE('===============================================');

    -- Recorrer hospitales que coincidan con el nombre
    FOR h IN (
        SELECT h.id_hospital, h.nombre, h.antiguedad, h.area, 
               d.desc_distrito, s.desc_sede, g.desc_gerente, c.desc_condicion
        FROM Hospital h
        INNER JOIN Distrito d ON h.id_distrito = d.id_distrito
        INNER JOIN Sede s ON h.id_sede = s.id_sede
        INNER JOIN Gerente g ON h.id_gerente = g.id_gerente
        INNER JOIN Condicion c ON h.id_condicion = c.id_condicion
        WHERE LOWER(h.nombre) LIKE '%' || LOWER(p_nombre) || '%'
    ) LOOP
        -- Imprimir los detalles del hospital encontrado
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
END SP_HOSPITAL_BUSCAR_NOMBRE;
