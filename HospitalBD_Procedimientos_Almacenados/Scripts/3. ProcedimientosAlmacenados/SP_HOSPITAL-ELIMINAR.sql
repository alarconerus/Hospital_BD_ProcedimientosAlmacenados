create or replace PROCEDURE SP_HOSPITAL_ELIMINAR(
    p_id_hospital NUMBER
) AS
BEGIN
    -- Validar si el hospital existe antes de eliminar
    IF NOT Hospital_Utils.Existe_Hospital(p_id_hospital) THEN
        DBMS_OUTPUT.PUT_LINE('⚠ Error: El hospital con ID ' || p_id_hospital || ' no existe.');
        RETURN;
    END IF;

    -- Intentar eliminar el hospital
    DELETE FROM Hospital WHERE id_hospital = p_id_hospital;

    -- Confirmar eliminación
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('✅ Hospital con ID ' || p_id_hospital || ' eliminado correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('⚠ No se eliminó ningún registro.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN  -- Error ORA-02292: Restricción de clave foránea
            DBMS_OUTPUT.PUT_LINE('❌ Error: No se puede eliminar el hospital porque tiene registros asociados.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('❌ Error inesperado: ' || SQLERRM);
        END IF;
END SP_HOSPITAL_ELIMINAR;
