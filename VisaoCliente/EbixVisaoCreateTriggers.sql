-- Script de criação das Triggers
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para receber os objeetos

-- Triggers

/************************************
*  INPUT PARAMETERS
************************************/
DEFINE owner=DB_EXCHANGE_VISAO_TST

alter session set current_schema = &owner;

spool CreateTriggers.log

PROMPT "Creating Triggers"

CREATE TRIGGER "TG_CANAL_VENDA_02"   
 BEFORE DELETE
 ON TB_CANAL_VENDA
 FOR EACH ROW

BEGIN

declare
  -- Preposto corretor associado a empresa
  cursor cr_preposto(c_pid_empresa in number) is
  select p.id
    from tb_preposto p,
         tb_empresa e
   where e.id = c_pid_empresa
     and p.pid_pessoa = e.pid_pessoa;   
  st_preposto cr_preposto%rowtype;  
begin
  -- Recupera o preposto
  open cr_preposto(:old.pid_empresa);
  fetch cr_preposto into st_preposto;
  close cr_preposto;
  -- Excluir a associaÁ„o entre o canal e o corretor
  delete from tb_preposto_nivel_producao
   where pid_preposto = st_preposto.id
     and pid_canal_venda = :old.id;  
  -- Tudo finalizado e ok!!!
exception when others then
  raise_application_error(-20904, 'N„o foi possÌvel excluir o Canal de Venda.'||chr(10)|| sqlerrm);              
end ;

END;
/

ALTER TRIGGER "TG_CANAL_VENDA_02" ENABLE;

ALTER TRIGGER "TG_CANAL_VENDA_02" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;

prompt "Fim do Script CreateTriggers"

spool off

exit