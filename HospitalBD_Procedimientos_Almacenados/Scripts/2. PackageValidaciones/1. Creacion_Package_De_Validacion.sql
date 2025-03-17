create or replace PACKAGE Hospital_Utils AS
    -- Funciones para validar existencia de registros
    FUNCTION Existe_Distrito(p_id_distrito NUMBER) RETURN BOOLEAN;
    FUNCTION Existe_Sede(p_id_sede NUMBER) RETURN BOOLEAN;
    FUNCTION Existe_Gerente(p_id_gerente NUMBER) RETURN BOOLEAN;
    FUNCTION Existe_Condicion(p_id_condicion NUMBER) RETURN BOOLEAN;
    FUNCTION Existe_Hospital(p_id_hospital NUMBER) RETURN BOOLEAN;
    FUNCTION Existe_Hospital_Nombre(p_id_distrito NUMBER, p_nombre VARCHAR2, p_id_hospital NUMBER DEFAULT NULL) RETURN BOOLEAN;
END Hospital_Utils;