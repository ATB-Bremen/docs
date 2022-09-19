alter table T_TAG alter column TAG_NAME_C type varchar(50);
alter table T_TAG alter column TAG_NAME_C set not null;
update T_CONFIG set CFG_VALUE_C = '28' where CFG_ID_C = 'DB_VERSION';