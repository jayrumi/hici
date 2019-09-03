set define off
set serveroutput on

begin
  for i in (select count(*) cnt
              from user_tables 
             where table_name = 'XX_FROM_JENKINS_TBL')
  loop
    if i.cnt = 0 then
      execute immediate 
          'CREATE TABLE XX_FROM_JENKINS_TBL (
                  ID_NUMBER              NUMBER  
                , DESCRIPTION            VARCHAR2(4000)
            )  ';

      dbms_output.put_line('The table XX_FROM_JENKINS_TBL has been created.');
    else
      dbms_output.put_line('The table XX_FROM_JENKINS_TBL already exists.');    
    end if;

    dbms_output.put_line('Done.');
  end loop;           
end;
/
