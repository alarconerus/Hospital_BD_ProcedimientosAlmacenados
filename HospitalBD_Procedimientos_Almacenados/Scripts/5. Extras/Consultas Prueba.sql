BEGIN
      --Correcto
       --SP_HOSPITAL_REGISTRAR(1, 'Clínica San Agustin', 8, 1800.90, 4, 4, 1);
      --falla
       --SP_HOSPITAL_REGISTRAR(99, 'Hospital Falso', 10, 3000, 1, 1, 1);

      --actualizar Correcto
      --SP_HOSPITAL_ACTUALIZAR (7, 1, 'Clínica San AgustinActualizar', 20, 1800.50, 2, 2, 1);
      
      --actualizar falla
      --SP_HOSPITAL_ACTUALIZAR (99, 1, 'Clínica San AgustinActualizar', 20, 1800.50, 2, 2, 1);
   
    --ELIMINAR POR ID
    --SP_HOSPITAL_ELIMINAR(7);
      
    -- listar por distrito/sede/condicion  
    -- sp_hospital_listar(2, NULL, NULL);
    
     --listar todo
    -- sp_hospital_listar;
     
    --buscar X nombre y coincidencias
     -- SP_HOSPITAL_BUSCAR_NOMBRE('Hospital Nacional');

END;


