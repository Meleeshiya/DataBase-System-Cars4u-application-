prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_default_workspace_id=>314226765380575429
);
end;
/
prompt  WORKSPACE 314226765380575429
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   11:42 Saturday May 14, 2022
--   Exported By:     C7296152
--   Export Type:     Workspace Export
--   Version:         21.1.2
--   Instance ID:     697997825618318
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_210100
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>314226765380575429);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace C7296152...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 314227034995575429
 ,p_provisioning_company_id => 314226765380575429
 ,p_short_name => 'C7296152'
 ,p_display_name => 'C7296152'
 ,p_first_schema_provisioned => 'C7296152'
 ,p_company_schemas => 'C7296152'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'C7296152'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'C7296152'
 ,p_files_version => 1
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1582672756649484,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1582592385649484,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1582441889649484,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1085381740221189318',
  p_user_name                    => 'ANTHONY',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'anton@gmail.com',
  p_web_password                 => '382349A9B193CAC0BB1A8B33546C6B1964B7190D1DB458F2A90CD6D89ED9668160C643FEE72EC72AD182B236692ACF9FFD646BD53627CCB1A8940A8B5AB7F94C',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '1582441889649484:1582592385649484:1582672756649484:',
  p_developer_privs              => '',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205110000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 1,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '314227315383575429',
  p_user_name                    => 'C7296152',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'M.JayakodyArachchigeDona7538@student.leedsbeckett.ac.uk',
  p_web_password                 => '33B40BDE97574DA5328EDE78A490D506BA6F65A1B4A581AFC312DBDAD576D2E350A75EBF167726958BCF87FA5AC3CDFBD0B8A5D1EAE492CEB7BFF88A6B474A12',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205090911','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1153066643564465414',
  p_user_name                    => 'JOEY',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'joey3456@gmail.com',
  p_web_password                 => '65092B66528F38763563D61A42E9C5796E3778434E55507A47F655AB5B31A5D593300447CBDE3CD755AE9A56EF281949843A90D072C8CAE69CE03421E0C7AD8A',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '1582441889649484:1582592385649484:1582672756649484:',
  p_developer_privs              => '',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205130000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1085381328405199736',
  p_user_name                    => 'MELEESHIYA',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'meleeshiyajayakody@gmail.com',
  p_web_password                 => '2EEE6FF2A32002DBD5AC79BA6167A109BA05428EC7DFEEA2B25A3FBCCAC3FDA718F51FCB096DA0DA0C0A2C95785D0111757BF120C5A207A76FBC294F0F74CC76',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '1582441889649484:1582592385649484:1582672756649484:',
  p_developer_privs              => '',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205110000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1153066463895468967',
  p_user_name                    => 'MONICA',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'monica5678@gmail.com',
  p_web_password                 => '3C6BE873B6755D0E696F2C2F1DFE4A830B7619C77D5ED7A86D54C6576841DA483B9E961BFC40294A6CD59061CC5802B469078B753BD4085E87E5F9CC48C333C1',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '1582441889649484:1582592385649484:1582672756649484:',
  p_developer_privs              => '',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205130000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1085381564288193703',
  p_user_name                    => 'NERANJAN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'neranjan@gmail.com',
  p_web_password                 => '65BBFE01B644CF8756132BA3849262203C6C64214C7FD5B30FBAB9B3B369B3517CA113D2E39A218D53FA5EA5460F3473FADE003339404F8DBA00197351BB3697',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '1582441889649484:1582592385649484:1582672756649484:',
  p_developer_privs              => '',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205110000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1153069583222459744',
  p_user_name                    => 'ROSS',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ross1234@gmail.com',
  p_web_password                 => 'E8772BFBD3AD50A9C4244D1E05C46D86528CAC024B5F4A8E0D500AB003B41F417861476EE75BD623DF8A4038164F244206614989BF08DA22AC24C1F44787408D',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '1582441889649484:1582592385649484:1582672756649484:',
  p_developer_privs              => '',
  p_default_schema               => 'C7296152',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202205130000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...Issue Templates
--
begin
null;
end;
/
--
prompt ...Issue Email Prefs
--
begin
null;
end;
/
--
prompt ...Label Groups
--
begin
null;
end;
/
--
prompt ...Labels
--
begin
null;
end;
/
--
prompt ... Milestones
--
begin
null;
end;
/
--
prompt ... Issues
--
begin
null;
end;
/
--
prompt ... Issue Attachments
--
begin
null;
end;
/
--
prompt ... Issues Milestones
--
begin
null;
end;
/
--
prompt ... Issues Labels
--
begin
null;
end;
/
--
prompt ... Issues stakeholders
--
begin
null;
end;
/
--
prompt ... Issues Comments
--
begin
null;
end;
/
--
prompt ... Issues Events
--
begin
null;
end;
/
--
prompt ... Issues Notifications
--
begin
null;
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
