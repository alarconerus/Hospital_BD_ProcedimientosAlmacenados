create or replace PACKAGE BODY Hospital_Utils AS

    -- Validar si el distrito existe
    FUNCTION Existe_Distrito(p_id_distrito NUMBER) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Distrito WHERE id_distrito = p_id_distrito;
        RETURN v_count > 0;
    END Existe_Distrito;

    -- Validar si la sede existe
    FUNCTION Existe_Sede(p_id_sede NUMBER) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Sede WHERE id_sede = p_id_sede;
        RETURN v_count > 0;
    END Existe_Sede;

    -- Validar si el gerente existe
    FUNCTION Existe_Gerente(p_id_gerente NUMBER) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Gerente WHERE id_gerente = p_id_gerente;
        RETURN v_count > 0;
    END Existe_Gerente;

    -- Validar si la condición existe
    FUNCTION Existe_Condicion(p_id_condicion NUMBER) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Condicion WHERE id_condicion = p_id_condicion;
        RETURN v_count > 0;
    END Existe_Condicion;

    -- Validar si el hospital existe por ID
    FUNCTION Existe_Hospital(p_id_hospital NUMBER) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Hospital WHERE id_hospital = p_id_hospital;
        RETURN v_count > 0;
    END Existe_Hospital;

    -- Validar si ya existe un hospital con el mismo nombre en el mismo distrito
    FUNCTION Existe_Hospital_Nombre(p_id_distrito NUMBER, p_nombre VARCHAR2, p_id_hospital NUMBER DEFAULT NULL) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count 
        FROM Hospital 
        WHERE id_distrito = p_id_distrito AND nombre = p_nombre 
        AND (p_id_hospital IS NULL OR id_hospital <> p_id_hospital);

        RETURN v_count > 0;
    END Existe_Hospital_Nombre;

END Hospital_Utils;
