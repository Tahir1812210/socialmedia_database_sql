select R.ID, R.EngName, R.moule_id, M.EngName  from sys_Regions R join sys_moules M on R.moule_id = M.id

select *from sys_moules

update sys_moules set EngName='mouleB_eng' , ArbName='mouleB_arb' where id = 2