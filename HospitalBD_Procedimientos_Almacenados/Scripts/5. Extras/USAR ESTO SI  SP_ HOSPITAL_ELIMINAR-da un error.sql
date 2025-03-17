SELECT constraint_name, search_condition
FROM user_constraints
WHERE table_name = 'AUDITORIA_HOSPITAL' AND constraint_type = 'C';
--si existiera una accion que  que en la columna SEARCH_CONDITION 
-- contenga esto  accion IN ('INSERT', 'UPDATE') eliminar con el siguiente comando:

ALTER TABLE Auditoria_Hospital DROP CONSTRAINT SYS_C008472;
-- ocurre cuando queremos eliminar mediante procedimiento almacenao con esto ya no habra conflicto