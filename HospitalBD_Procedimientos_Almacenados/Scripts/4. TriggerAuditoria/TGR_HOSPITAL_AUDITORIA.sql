create or replace TRIGGER TRG_HOSPITAL_AUDITORIA
AFTER DELETE OR INSERT OR UPDATE ON Hospital  -- Cambiado a AFTER DELETE
FOR EACH ROW
DECLARE
BEGIN
    -- Registrar INSERT
    IF INSERTING THEN
        INSERT INTO Auditoria_Hospital (
            accion, id_hospital, 
            nombre_nuevo, antiguedad_nueva, area_nueva, 
            id_sede_nueva, id_gerente_nuevo, id_condicion_nueva, fecha
        ) VALUES (
            'INSERT', :NEW.id_hospital, 
            :NEW.nombre, :NEW.antiguedad, :NEW.area, 
            :NEW.id_sede, :NEW.id_gerente, :NEW.id_condicion, 
            SYSTIMESTAMP
        );

    -- Registrar UPDATE
    ELSIF UPDATING THEN
        INSERT INTO Auditoria_Hospital (
            accion, id_hospital, 
            nombre_anterior, nombre_nuevo, 
            antiguedad_anterior, antiguedad_nueva, 
            area_anterior, area_nueva, 
            id_sede_anterior, id_sede_nueva, 
            id_gerente_anterior, id_gerente_nuevo, 
            id_condicion_anterior, id_condicion_nueva, 
            fecha
        ) VALUES (
            'UPDATE', :OLD.id_hospital, 
            :OLD.nombre, :NEW.nombre, 
            :OLD.antiguedad, :NEW.antiguedad, 
            :OLD.area, :NEW.area, 
            :OLD.id_sede, :NEW.id_sede, 
            :OLD.id_gerente, :NEW.id_gerente, 
            :OLD.id_condicion, :NEW.id_condicion, 
            SYSTIMESTAMP
        );

    -- Registrar DELETE después de eliminar el hospital
    ELSIF DELETING THEN
        INSERT INTO Auditoria_Hospital (
            accion, id_hospital, 
            nombre_anterior, antiguedad_anterior, area_anterior, 
            id_sede_anterior, id_gerente_anterior, id_condicion_anterior, fecha
        ) VALUES (
            'DELETE', :OLD.id_hospital, 
            :OLD.nombre, :OLD.antiguedad, :OLD.area, 
            :OLD.id_sede, :OLD.id_gerente, :OLD.id_condicion, 
            SYSTIMESTAMP
        );
    END IF;
END;
