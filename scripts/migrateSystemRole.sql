insert into systemrole values(5, 'super');
update currentusersession set systemroleid=5 where systemroleid=0;
update userorg set systemroleid=5 where systemroleid=0;
delete from systemrole where systemroleid=0;