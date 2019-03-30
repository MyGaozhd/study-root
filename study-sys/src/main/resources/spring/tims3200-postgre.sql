----------------------------------------------------------
--TIMS-Server影像系统postgre数据库初始化脚本
----------------------------------------------------------
create extension "uuid-ossp"; 

----------------------------------------------------------
---------------------1.表结构部分------------------------
----------------------------------------------------------
create table active_conf
(	id int primary key not null,
	objid varchar(64),
	weburl varchar(128),
	cmip varchar(20),
	cmport varchar(5),
	yonyouweburl varchar(128),
	compress varchar(4),
	compress_ratio varchar(4),
	sub_black varchar(2),
	turn_correct varchar(2),
	recognize_ocr varchar(2),
	uppertolowercase varchar(2),
	other_file_format varchar(2),
	combine varchar(2),
	owerid int,
	combinedirection varchar(2),
	phonescanner varchar(2),
	doc_direct_turn_correct varchar(2),
	file_encrypt varchar(2),
	multi_label varchar(2),
	export_image varchar(2),
	appscantimeout varchar(16),
	appregistertimeout varchar(16),
	integrate_style varchar(32)
) ;
create table active_ower
(	id int primary key not null,
	objid varchar(64),
	org_id varchar(24),
	systemcode varchar(16),
	deptid varchar(16),
	status varchar(1),
	statusname varchar(16),
	createtime varchar(64),
	createuser varchar(64)
) ;
create table act_ge_bytearray
(	id_ varchar(64) primary key not null,
	rev_ int,
	name_ varchar(255),
	bytes_ bytea,
	generated_ int
) ;
create table act_re_model
(	id_ int primary key not null,
	objid_ varchar(255) not null,
	rev_ int,
	name_ varchar(255),
	billtypes_ varchar(255),
	appsystem_ varchar(255),
	departs_ varchar(255),
	cateuser_ varchar(255),
	create_time_ timestamp (6),
	last_update_time_ timestamp (6),
	deployment_type_ varchar(255),
	meta_info_ varchar(2000),
	editor_source_value_id_ varchar(64),
	editor_source_extra_value_id_ varchar(64),
	tenant_id_ varchar(255) default ''
) ;
create table act_rn_process
(	id_ varchar(233) primary key not null,
	nodeid_ varchar(255),
	name_ varchar(255),
	authority_ varchar(255),
	documentatio_ varchar(2000),
	previousid_ varchar(255),
	nextid_ varchar(255),
	modelid_ varchar(255)
) ;
create table amount_range
(	id int primary key not null,
	objid varchar(64),
	amount_range varchar(128),
	amount_start int,
	amount_end int
) ;
create table appsystem
(	id int,
	objid varchar(64),
	app_id varchar(64),
	app_name varchar(128),
	app_status varchar(1),
	createuser varchar(32),
	createtime varchar(32)
) ;
create table billacceptmanager
(	departnum varchar(32),
	departname varchar(128),
	tel varchar(32),
	usernum varchar(32),
	username varchar(32),
	id varchar(32),
	userid varchar(32),
	commit_flag varchar(4),
	commit_flag_name varchar(32)
) ;
create table billtask
(	id varchar(32),
	bill_no varchar(32),
	bill_date varchar(32),
	system_code varchar(32),
	scan_man varchar(32),
	scan_man_name varchar(32),
	money varchar(32),
	bill_man varchar(32),
	bill_man_name varchar(32),
	scan_time varchar(32),
	attach_amount varchar(10),
	paste_amount varchar(10),
	submit_status char(10),
	submit_time varchar(32),
	accept_man varchar(32),
	accept_man_name varchar(32),
	accept_status char(10),
	accept_time varchar(32),
	package_flag char(10),
	package_no varchar(64),
	bill_order int,
	submit_status2 varchar(32),
	billtype varchar(32),
	billtypename varchar(32),
	busi_serial_no varchar(32),
	orgcode varchar(32),
	orgname varchar(64),
	billstatus varchar(4),
	billstatus_name varchar(64),
	bill_flag varchar(4),
	centerbillacceptnum varchar(32),
	centerbillacceptname varchar(32),
	billidentrlt varchar(4),
	billidentrltname varchar(32),
	billidentrltp varchar(4),
	billidentrltnamep varchar(32),
	bhyy varchar(512),
	comparisonresult varchar(64),
	checkresult varchar(64)
) ;
create table classifyrelation
(	id int primary key not null,
	c_objid varchar(64),
	s_objid varchar(64),
	b_objid varchar(64),
	d_objid varchar(64),
	sequence varchar(20)
) ;
create table clientcontral
(	id varchar(255) primary key not null,
	client_version varchar(255),
	client_ip varchar(255),
	client_mac varchar(255),
	ifeffective varchar(255)
) ;
create table client_controller
(	id int primary key not null,
	objid varchar(32),
	c_departname varchar(32),
	c_systemname varchar(32),
	c_depetname varchar(32),
	c_client_ip varchar(32),
	c_client_mac varchar(32),
	c_status varchar(1),
	c_status_name varchar(32)
) ;
create table client_controller_all
(	id int primary key not null,
	objid varchar(32),
	c_status varchar(1)
) ;
create table cm_conf_info
(	conifg_id int primary key not null,
	branch_no varchar(8),
	cf_key varchar(36),
	cf_value varchar(36)
) ;
create table cm_file_info
(	file_id varchar(64) primary key not null,
	cm_version varchar(16),
	cip varchar(32),
	batch_id varchar(64),
	doc_desc varchar(128),
	doc_name varchar(128),
	file_name varchar(516),
	file_format varchar(4),
	file_type varchar(2),
	file_size varchar(32),
	remark_size varchar(32),
	file_md5 varchar(64),
	file_seq varchar(512),
	operate_state varchar(2),
	operate_msg varchar(128),
	operate_date varchar(10),
	operate_time timestamp (6),
	file_state varchar(2),
	sip varchar(32),
	sport varchar(8),
	backup varchar(2),
	state varchar(2),
	ocrstatus varchar(2),
	checker varchar(64),
	relatedfileid varchar(64)
) ;
create table cm_info
(	content_id varchar(32) primary key not null,
	system_code varchar(32),
	branch_no varchar(32),
	user_no varchar(32),
	busi_serial_no varchar(32),
	batch_id varchar(64),
	operate_date varchar(10),
	operate_time timestamp (6),
	trade_type varchar(2),
	client_batch_id varchar(64),
	backup varchar(2),
	updatecode varchar(2),
	batchstate varchar(4),
	batch_type varchar(2),
	isrelated varchar(2),
	relatedbatchid varchar(64)
) ;
create table configparam
(	id varchar(255) primary key not null,
	modetype varchar(255),
	customized_param varchar(255)
) ;
create table currenttask
(	id varchar(32) primary key not null,
	billnum varchar(32),
	busi_serial_no varchar(64),
	billtypename varchar(256),
	cash varchar(256),
	billtype varchar(256),
	user_no varchar(64),
	departcode varchar(8),
	systemcode varchar(8),
	modulename varchar(32),
	taskstate varchar(32),
	objid varchar(48),
	orgcode varchar(96),
	user_name varchar(32),
	billdate varchar(64),
	ocrstatus varchar(16),
	taskstatename varchar(64),
	a_billnum varchar(32),
	scantype varchar(2),
	scantypename varchar(16),
	billpaperfrom varchar(2),
	opersuggest varchar(256),
	remark varchar(256),
	tasktype varchar(2),
	orgname varchar(256),
	tasktypename varchar(64),
	applytype varchar(2),
	sharedbatches varchar(1024),
	sharetype varchar(2),
	isrelated varchar(2),
	project varchar(64),
	contract varchar(64),
	projectname varchar(128),
	contractname varchar(128),
	billstatename varchar(16),
	billstate varchar(2),
	approvalstate varchar(2),
	approvalstatename varchar(1024),
	storagenum varchar(200),
	createtime varchar(30),
	isidentify varchar(2) default 0,
	groupid varchar(64),
	relatedbusi_serial_no varchar(64),
	user_num varchar(32),
	pk_billtype varchar(32),
	pk_tradetype varchar(32)
) ;
create table customizedparam
(	id varchar(255) primary key not null,
	modetype varchar(255),
	customized_param varchar(255)
) ;
create table errorcode
(	id int primary key not null,
	error_code varchar(4),
	error_code_name varchar(30)
) ;
create table event
(	id int primary key not null,
	eventno varchar(4),
	eventname varchar(30),
	eventdate varchar(10),
	logtype int
) ;
create table generalparam
(	id varchar(255) primary key not null,
	param_num varchar(255),
	param_type varchar(255),
	"default" varchar(255),
	length varchar(255),
	range varchar(255)
) ;
create table historytask
(	id varchar(32) primary key not null,
	billnum varchar(16),
	busi_serial_no varchar(16),
	depart_code varchar(4),
	area_code varchar(4),
	cash varchar(64),
	billtype varchar(32),
	billstate varchar(2),
	user_no varchar(8),
	operate_date varchar(8),
	operate_time date,
	orc_id varchar(32)
) ;
create table imageclassify
(	id int primary key not null,
	objid varchar(64),
	categoryname varchar(64),
	categorycode varchar(64)
) ;
create table mobile_scan
(	bsn varchar(64),
	createtime timestamp (6),
	flag int,
	imei varchar(64)
) ;
create table modu
(	id varchar(255) primary key not null,
	mode_num varchar(255),
	mode_name varchar(255)
) ;
create table ocrinfo
(	id int primary key not null,
	objid varchar(32),
	fileid varchar(64),
	invnum varchar(20),
	invdate varchar(64),
	sellertaxpayername varchar(1024),
	sellertaxpayercode varchar(64),
	sellertaxpayeraddrandtel varchar(256),
	sellertaxpayeraccount varchar(256),
	passwd varchar(120),
	sumamount varchar(64),
	sumtax varchar(64),
	uppercase varchar(64),
	lowercase varchar(64),
	taxpayername varchar(1024),
	taxpayercode varchar(64),
	taxpayeraddrandtel varchar(256),
	taxpayeraccount varchar(256),
	remark varchar(1024),
	payee varchar(64),
	reviewer varchar(64),
	drawer varchar(64),
	patten varchar(6),
	invcode varchar(20)
) ;
create table ocr_details_info
(	id int primary key not null,
	objid varchar(64),
	name varchar(128),
	tax varchar(24),
	rate varchar(10),
	amount varchar(24),
	price varchar(24),
	count varchar(10),
	unit varchar(24),
	standard varchar(256),
	fileid varchar(64)
) ;
create table ocr_info
(	id int primary key not null,
	ocr_id varchar(32),
	ocr_code varchar(64),
	ocr_code_name varchar(128),
	ocr_info varchar(256),
	file_id varchar(64)
) ;
create table operobj
(	id int primary key not null,
	operobjno varchar(4),
	operobjname varchar(30),
	sceneno varchar(4),
	operobjdate varchar(10)
) ;
create table out_interface
(	id int,
	objid varchar(64),
	interfacename varchar(64),
	interfacesystemcode varchar(64),
	interfaceurl varchar(64),
	interfacemethod varchar(64),
	paramtype varchar(64),
	paramname varchar(64),
	parammodel varchar(1024)
) ;
create table packagelogs
(	id varchar(32) primary key not null,
	bill_no varchar(32),
	zdman varchar(32),
	operatintype_name varchar(1024),
	operationname varchar(32),
	result varchar(32),
	operationtime varchar(32),
	occupied varchar(32),
	alloccupied varchar(32)
) ;
create table package_billnums
(	id varchar(32) primary key not null,
	packagenum varchar(64),
	billnum varchar(64),
	accessorycount varchar(32),
	pastelistcount varchar(32),
	orgname varchar(32)
) ;
create table parcelacceptmanager
(	
	id varchar(32) primary key default uuid_generate_v4(),
	departnum varchar(32),
	departname varchar(128),
	tel varchar(32),
	usernum varchar(32),
	username varchar(32),
	userid varchar(32),
	comaddress varchar(128)
) ;
create table posttask
(	id varchar(32) primary key not null,
	package_no varchar(64),
	package_date varchar(32),
	package_time varchar(32),
	system_code varchar(32),
	package_man varchar(32),
	package_man_name varchar(32),
	bill_amount varchar(10),
	post_status varchar(10),
	post_time varchar(32),
	post_code varchar(32),
	sign_man varchar(32),
	sign_man_name varchar(32),
	sign_time varchar(32),
	unpack varchar(10),
	accessorycount varchar(10),
	pastelistcount varchar(10),
	post_status_name varchar(32),
	orgcode varchar(32),
	orgname varchar(64),
	express varchar(32),
	mail_address varchar(128)
) ;
create table scene
(	id int,
	sceneno varchar(4),
	scenename varchar(30),
	scenedate varchar(10)
) ;
create table softupdate
(	id int primary key not null,
	objid varchar(64),
	filename varchar(256),
	version varchar(64),
	updateinfo varchar(2048),
	filepath varchar(256),
	statusname varchar(64),
	level int,
	status varchar(64),
	createtime varchar(32),
	createuser varchar(32)
) ;
create table sys_log
(	id int,
	eventno varchar(4),
	opttime varchar(20),
	optuser varchar(16),
	optdepart varchar(16),
	optarget varchar(50),
	optcontent varchar(512),
	optresult int
) ;
create table sys_log_bak
(	id int,
	eventno varchar(4),
	opttime varchar(20),
	optuser varchar(16),
	optdepart varchar(16),
	optarget varchar(50),
	optcontent varchar(512),
	optresult int,
	importdate varchar(8)
) ;
create table t_app_system
(	id int primary key not null,
	objid varchar(64),
	sys_id varchar(64),
	sys_name varchar(128),
	sys_status varchar(1),
	createuser varchar(64),
	createtime varchar(32),
	sys_status_name varchar(4)
) ;
create table t_bill_type
(	id int primary key not null,
	objid varchar(64),
	type_name varchar(256),
	type_id varchar(256),
	parentnum varchar(256),
	isidentify varchar(2) default '0',
	pk_org varchar(64),
	system_code varchar(64),
	system_name varchar(64),
	parent_system varchar(64)
) ;
create table t_config_log
(	id int primary key not null,
	objid varchar(32),
	user_id varchar(32),
	name varchar(64),
	scene varchar(4),
	oper_obj varchar(4),
	oper_action int,
	oper_time varchar(32),
	oper_status int,
	oper_descr varchar(2048),
	channel varchar(32),
	forobjid varchar(32)
) ;
create table t_config_log_bak
(	id int,
	objid varchar(32),
	user_id varchar(32),
	name varchar(64),
	scene varchar(4),
	oper_obj varchar(4),
	oper_action int,
	oper_time varchar(32),
	oper_status int,
	oper_descr varchar(2048),
	channel varchar(32),
	forobjid varchar(32),
	importdate varchar(8)
) ;
create table t_depart
(	id int primary key not null,
	departnum varchar(96),
	departname varchar(256),
	departaddress varchar(32),
	parentnum varchar(96),
	departstatus varchar(2),
	departtype varchar(2),
	code varchar(128)
) ;
create table t_dept_org
(	id int primary key not null,
	objid varchar(64),
	dept_id varchar(64),
	dept_name varchar(128),
	dept_status varchar(1),
	dept_status_name varchar(4),
	createuser varchar(64),
	createtime varchar(32)
) ;
create table t_flowconifg
(	id int primary key not null,
	objid varchar(64),
	processname varchar(64),
	processid varchar(64),
	afterid varchar(64),
	beforeid varchar(64),
	processstatus varchar(64),
	processtype varchar(64),
	taskstate varchar(2),
	taskstatename varchar(32)
) ;
create table t_login_log
(	id int primary key not null,
	objid varchar(32),
	user_id varchar(32),
	name varchar(64),
	login_time varchar(32),
	logout_time varchar(32),
	ip varchar(32),
	channel varchar(32)
) ;
create table t_login_log_bak
(	id int,
	objid varchar(32),
	user_id varchar(32),
	name varchar(64),
	login_time varchar(32),
	logout_time varchar(32),
	ip varchar(32),
	channel varchar(32),
	importdate varchar(8)
) ;
create table t_menu
(	id int primary key not null,
	m_menuid int,
	m_menuname varchar(164),
	m_icon varchar(3),
	m_url varchar(128),
	m_parentnum varchar(9),
	m_level varchar(16),
	m_type varchar(4)
) ;
create table t_module_param
(	id int primary key not null,
	modulename1 varchar(32),
	modulename2 varchar(32),
	moduleparam varchar(128)
) ;
create table t_node_define
(	id int primary key not null,
	objid varchar(255),
	name varchar(255),
	node_num int,
	node_type varchar(2)
) ;
create table t_param_common
(	id int primary key not null,
	paramkey varchar(32),
	paramvalue varchar(64),
	paramtype varchar(2),
	paramname varchar(32),
	classifytype varchar(32)
) ;
create table t_param_custom
(	id int primary key not null,
	moduleid varchar(32),
	customparam varchar(128),
	modulestatus varchar(2),
	creator varchar(32),
	creatortime varchar(32),
	lastmodifier varchar(32),
	lastmodifytime varchar(32)
) ;
create table t_privilege
(	id int primary key not null,
	objid varchar(64),
	p_departnum varchar(2048),
	p_billtype varchar(128),
	p_amountrange varchar(128),
	p1 varchar(128),
	p2 varchar(128),
	roleid varchar(64),
	p_taskstate varchar(128)
) ;
create table t_privilege_type
(	id int primary key not null,
	objid varchar(64),
	type_name varchar(64)
) ;
create table t_role
(	id int primary key not null,
	rolenum varchar(64),
	rolename varchar(32),
	rolestatus varchar(64),
	menulist varchar(64),
	operlist varchar(64),
	createuser varchar(64),
	createtime varchar(32),
	rolestatusname varchar(32)
) ;
create table t_role_bill
(	id int primary key not null,
	objid varchar(64),
	type_id varchar(128),
	roleid varchar(64)
) ;
create table t_role_depart
(	id int primary key not null,
	objid varchar(64),
	p_departnum varchar(128),
	roleid varchar(64)
) ;
create table t_role_menus
(	id int primary key not null,
	rolenum varchar(32),
	menunum varchar(32),
	objid varchar(32)
) ;
create table t_role_privileges
(	id int primary key not null,
	role_id varchar(16),
	privilege_id varchar(16)
) ;
create table t_sys_log
(	id int primary key not null,
	busi_serial_no varchar(32),
	channel varchar(32),
	username varchar(32),
	billcode varchar(32),
	clkno varchar(32),
	clkname varchar(64),
	opttime varchar(20),
	tasktype int,
	error_code varchar(4),
	error_message varchar(256)
) ;
create table t_sys_log_bak
(	id int,
	busi_serial_no varchar(32),
	channel varchar(32),
	username varchar(32),
	billcode varchar(32),
	clkno varchar(32),
	clkname varchar(64),
	opttime varchar(20),
	tasktype int,
	error_code varchar(4),
	error_message varchar(256),
	importdate varchar(8)
) ;
create table t_user
(	id int primary key not null,
	username varchar(128),
	usernum varchar(32),
	departnum varchar(48),
	sex varchar(1),
	password varchar(32),
	telephonenum varchar(12),
	address varchar(64),
	roles varchar(512),
	creater varchar(64),
	createtime varchar(32),
	customprivilege varchar(128),
	defaultprivilege varchar(64),
	status varchar(32),
	lastmodifyuser varchar(32),
	lastmodifytime varchar(32),
	lastmodifyreason varchar(32),
	statusname varchar(32),
	objid varchar(64),
	systemcode varchar(10)
) ;
create table t_users_roles
(	id int primary key not null,
	objid varchar(64),
	user_objid varchar(64),
	role_objid varchar(64)
) ;
--凭证联查使用表
create table combine_query (
	id varchar(64) primary key not null,
	bsns varchar(4000),
	createtime timestamp default now()
);
--外键
alter table act_re_model 
  add constraint act_fk_model_source foreign key (editor_source_value_id_) 
	references act_ge_bytearray (id_);
alter table act_re_model 
	add constraint act_fk_model_source_extra foreign key (editor_source_extra_value_id_) 
	references act_ge_bytearray (id_);

----------------------------------------------------------
------------------2.自增序列部分------------------------
----------------------------------------------------------
create sequence active_conf_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table active_conf alter column id set default nextval('active_conf_seq');

create sequence active_ower_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table active_ower alter column id set default nextval('active_ower_seq');

create sequence act_model_sequence increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;

create sequence amount_range_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table amount_range alter column id set default nextval('amount_range_seq');

create sequence classifyrelation_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table classifyrelation alter column id set default nextval('classifyrelation_seq');

create sequence client_controller_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table client_controller alter column id set default nextval('client_controller_seq');

create sequence cm_conf_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 10 cache 10;
alter table cm_conf_info alter column conifg_id set default nextval('cm_conf_seq');

create sequence errorcode_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 10 cache 10;
alter table errorcode alter column id set default nextval('errorcode_seq');

create sequence event_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 100 cache 10;
alter table event alter column id set default nextval('event_seq');

create sequence imageclassify_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table imageclassify alter column id set default nextval('imageclassify_seq');

create sequence ocrinfo_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table ocrinfo alter column id set default nextval('ocrinfo_seq');

create sequence ocr_details_info_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table ocr_details_info alter column id set default nextval('ocr_details_info_seq');

create sequence ocr_info_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table ocr_info alter column id set default nextval('ocr_info_seq');

create sequence operobj_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 100 cache 10;
alter table operobj alter column id set default nextval('operobj_seq');

create sequence out_interface_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table out_interface alter column id set default nextval('out_interface_seq');

create sequence scene_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 10 cache 10;
alter table scene alter column id set default nextval('scene_seq');

create sequence softupdate_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table softupdate alter column id set default nextval('softupdate_seq');

create sequence t_app_system_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_app_system alter column id set default nextval('t_app_system_seq');

create sequence t_bill_type_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_bill_type alter column id set default nextval('t_bill_type_seq');

create sequence t_config_log_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_config_log alter column id set default nextval('t_config_log_seq');

create sequence t_depart_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_depart alter column id set default nextval('t_depart_seq');

create sequence t_depart_org_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_dept_org alter column id set default nextval('t_depart_org_seq');

create sequence t_flowconifg_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 10 cache 10;
alter table t_flowconifg alter column id set default nextval('t_flowconifg_seq');

create sequence t_login_log_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_login_log alter column id set default nextval('t_login_log_seq');

create sequence t_menu_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 500 cache 10;
alter table t_menu alter column id set default nextval('t_menu_seq');

create sequence t_node_sequence increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;

create sequence t_privilege_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 100 cache 10;
alter table t_privilege alter column id set default nextval('t_privilege_seq');

create sequence t_privilege_type_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_privilege_type alter column id set default nextval('t_privilege_type_seq');

create sequence t_role_bill_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_role_bill alter column id set default nextval('t_role_bill_seq');

create sequence t_role_depart_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_role_depart alter column id set default nextval('t_role_depart_seq');

create sequence t_role_menus_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_role_menus alter column id set default nextval('t_role_menus_seq');

create sequence t_role_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_role alter column id set default nextval('t_role_seq');

create sequence t_sys_log_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_sys_log alter column id set default nextval('t_sys_log_seq');

create sequence t_users_roles_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_users_roles alter column id set default nextval('t_users_roles_seq');

create sequence t_user_seq increment 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 10;
alter table t_user alter column id set default nextval('t_user_seq');

----------------------------------------------------------
------------------3.初始数据部分------------------------
----------------------------------------------------------
insert into active_conf (id,objid,weburl,cmip,cmport,yonyouweburl,compress,compress_ratio,sub_black,turn_correct,recognize_ocr,uppertolowercase,other_file_format,combine,owerid,combinedirection,phonescanner,doc_direct_turn_correct,file_encrypt,multi_label,export_image,appscantimeout,appregistertimeout,integrate_style) values (0,'1dc68d4e2547423c8ffb07c91bbeaf8b','http://20.10.80.190:8777/TIMS-Server/services/ContentInfoService','20.10.80.190','28390',null,'1','80','0','0','1','0','1','0',0,'0','1','0','0','0','0','3','5','OEM');

insert into active_ower (id,objid,org_id,systemcode,deptid,status,statusname,createtime,createuser) values (0,'fa7f5153e63d4231953d23cc90b9db2b','0','0','0','0','已配置','20160819152438','admin');

insert into amount_range (id,objid,amount_range,amount_start,amount_end) values (0,'7b7b02c9a51c4fc4ac18f9ac16c800b9','1112.0-1113.0',1112,1113);

insert into cm_conf_info (conifg_id,branch_no,cf_key,cf_value) values (1,'01','SIP','127.0.0.1');
insert into cm_conf_info (conifg_id,branch_no,cf_key,cf_value) values (2,'01','SPORT','8777');

insert into errorcode (id,error_code,error_code_name) values (1,'0000','成功');
insert into errorcode (id,error_code,error_code_name) values (2,'1000','添加失败');
insert into errorcode (id,error_code,error_code_name) values (3,'1001','更新失败');
insert into errorcode (id,error_code,error_code_name) values (4,'1002','删除失败');
insert into errorcode (id,error_code,error_code_name) values (5,'1003','NC调用失败');
insert into errorcode (id,error_code,error_code_name) values (6,'1004','任务状态不一致');

insert into event (id,eventno,eventname,eventdate,logtype) values (41,'0001','用户登录','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (42,'0002','用户退出','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (43,'0003','修改密码','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (44,'0004','用户添加','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (45,'0005','用户修改','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (46,'0006','用户删除','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (47,'0007','用户停用','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (48,'0008','用户启用','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (49,'0009','密码初始化','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (50,'0010','角色添加','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (51,'0011','角色修改','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (52,'0012','角色删除','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (53,'0013','菜单权限分配','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (54,'0014','操作权限分配','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (55,'0015','菜单添加','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (56,'0016','菜单修改','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (57,'0017','菜单删除','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (58,'0018','权限添加','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (59,'0019','权限修改','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (60,'0020','权限删除','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (61,'0021','单据登记','20160601',2);
insert into event (id,eventno,eventname,eventdate,logtype) values (62,'0022','单据扫描','20160601',2);
insert into event (id,eventno,eventname,eventdate,logtype) values (63,'0023','单据审核','20160601',2);
insert into event (id,eventno,eventname,eventdate,logtype) values (64,'0024','单据比对','20160601',2);
insert into event (id,eventno,eventname,eventdate,logtype) values (65,'0025','任务录入','20160601',2);
insert into event (id,eventno,eventname,eventdate,logtype) values (66,'0026','控件参数','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (67,'0027','机构管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (68,'0028','应用系统管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (69,'0029','部门管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (70,'0030','单据类型管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (71,'0031','金额范围管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (72,'0032','外部接口管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (73,'0033','影像分类管理','20160601',3);
insert into event (id,eventno,eventname,eventdate,logtype) values (74,'0034','审批流配置','20160601',6);
insert into event (id,eventno,eventname,eventdate,logtype) values (75,'0035','软件升级管理','20160601',7);
insert into event (id,eventno,eventname,eventdate,logtype) values (76,'0036','升级控制管理','20160601',7);
insert into event (id,eventno,eventname,eventdate,logtype) values (77,'0037','日志导出','20160601',1);
insert into event (id,eventno,eventname,eventdate,logtype) values (78,'0038','日志导入','20160601',1);

insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (1,'1001','用户管理','1000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (2,'1002','角色管理','1000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (3,'1003','功能菜单','1000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (4,'1004','系统日志','1000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (5,'2001','控件参数','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (6,'2002','机构管理','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (7,'2003','应用系统管理','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (8,'2004','部门管理','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (9,'2005','单据类型管理','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (10,'2006','外部接口管理','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (11,'2007','影像分类管理','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (12,'2008','影像分类关联','2000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (13,'3001','登录日志','3000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (14,'3002','配置日志','3000','20160629');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (15,'4001','单据接收人员管理','4000','20180426');
insert into operobj (id,operobjno,operobjname,sceneno,operobjdate) values (16,'4002','邮包签收人员管理','4000','20180426');

insert into scene (id,sceneno,scenename,scenedate) values (1,'1000','系统管理','20160629');
insert into scene (id,sceneno,scenename,scenedate) values (2,'2000','参数管理','20160629');
insert into scene (id,sceneno,scenename,scenedate) values (3,'3000','平台日志','20160629');
insert into scene (id,sceneno,scenename,scenedate) values (4,'4000','邮包管理','20180426');

insert into softupdate (id,objid,filename,version,updateinfo,filepath,statusname,level,status,createtime,createuser) values (0,'06a1191306c64362aac7e4c287e0fb51','TIMS-Client3.0.8.2.exe','3.0.8.2','TIMS-Client3.0.8.','D:/20171107softpath/software/3.0.8.2/TIMS-Client3.0.8.2.exe','有效',null,'0','20180115133830','admin');

insert into t_app_system (id,objid,sys_id,sys_name,sys_status,createuser,createtime,sys_status_name) values (0,'d90db6df6cb14bf4b83d900011f9e6ea','NC','NC','1','admin','20160524110538','是');

insert into t_bill_type (id,objid,type_name,type_id,parentnum,isidentify,pk_org,system_code,system_name,parent_system) values (0,'07447aafdd4b4471adaf37c9aeb5f37a','票据类型根目录','0','-1','0',null,null,null,null);

insert into t_depart (id,departnum,departname,departaddress,parentnum,departstatus,departtype,code) values (0,'0','机构根目录','1','-1','0','-1',null);

insert into t_flowconifg (id,objid,processname,processid,afterid,beforeid,processstatus,processtype,taskstate,taskstatename) values (1,'91dc3c7aa0544bb8924c6700ba45f0c7','登记','1','2','0','0','0','0','登记');
insert into t_flowconifg (id,objid,processname,processid,afterid,beforeid,processstatus,processtype,taskstate,taskstatename) values (2,'4b47d80150ac447fb78930b2251180b3','扫描','2','999','1','0','2','1','扫描');

insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (21,25,'单据查询','ico','/TIMS-Server/imageManagerController/toBillsQuery.action','0','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (171,33,'影像分类管理','ico','/TIMS-Server/classifyController/classifyList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (141,11,'待办任务','ico','/TIMS-Server/imageManagerController/toImageListall.action','0','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (11,22,'机构管理','ico','/TIMS-Server/departController/departList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (13,23,'应用系统管理','ico','/TIMS-Server/systemController/systemList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (3,0,'影像管理','ico',null,'-1','0',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (4,1,'参数管理','ico',null,'-1','0',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (8,5,'软件管理','ico',null,'-1','0',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (9,6,'平台日志','ico',null,'-1','0',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (58,10,'系统管理','ico',null,'-1','0',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (59,-1,'菜单根目录','ico',null,'-2','-1',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (99,27,'单据类型管理','ico','/TIMS-Server/billTypeController/billList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (64,15,'用户管理','ico','/TIMS-Server/userController/userList.action','10','1',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (65,16,'角色管理','ico','/TIMS-Server/roleController/roleList.action','10','1',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (66,17,'功能菜单','ico','/TIMS-Server/menuController/menuList.action','10','1',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (67,18,'日志管理','ico','/TIMS-Server/sysLogController/sysLogList.action','10','1',null);
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (71,20,'控件参数配置','ico','/TIMS-Server/activeParamController/activeControllerList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (73,21,'软件升级管理','ico','/TIMS-Server/softController/softUpdate.action','5','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (100,28,'金额范围管理','ico','/TIMS-Server/amountController/amountList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (12,37,'影像分类关联管理','ico','/TIMS-Server/classifyRelateController/queryRelationList.action','1','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (202,39,'登录日志','ico','/TIMS-Server/loginLogController/loginLogList.action','6','1','0');
insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (203,40,'配置日志','ico','/TIMS-Server/configLogController/configLogList.action','6','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (102,43,'邮包管理','ico',null,'-1','0','0');
-- insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (103,44,'票据提交待办','ico','/TIMS-Server/commitBillController/toPage.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (104,45,'票据接收待办','ico','/TIMS-Server/acceptBillController/toList.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (105,46,'邮包管理','ico','/TIMS-Server/postManagerController/listPackage.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (106,47,'邮包签收待办','ico','/TIMS-Server/acceptpackcontroller/listPackage.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (107,48,'纸质票据跟踪','ico','/TIMS-Server/paperBillTrackController/QueryList.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (108,49,'单据接收人员管理','ico','/TIMS-Server/billAcceptManagerController/QueryList.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (109,50,'邮包签收人员管理','ico','/TIMS-Server/parcelAcceptManagerController/QueryList.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (110,51,'共享中心单据签收待办','ico','/TIMS-Server/acceptBillController/CenterbillsList.action','43','1','0');
--insert into t_menu (id,m_menuid,m_menuname,m_icon,m_url,m_parentnum,m_level,m_type) values (120,52,'单据补入','ico','/TIMS-Server/acceptpackcontroller/relistPackage.action','43','1','0');

insert into t_privilege (id,objid,p_departnum,p_billtype,p_amountrange,p1,p2,roleid,p_taskstate) values (13,'6927f7a21544412c8d5886415b7a588d',null,null,'[0-*]',null,null,'9de04ea9874f4edfa8a2a1ce3ebe196d','2');
insert into t_privilege (id,objid,p_departnum,p_billtype,p_amountrange,p1,p2,roleid,p_taskstate) values (21,'517bc89146d6473b95a1a5e569fd0245',null,null,'[0-*]',null,null,'d2f4e5a8fddc44f6ade173bb1442c36f','0');
insert into t_privilege (id,objid,p_departnum,p_billtype,p_amountrange,p1,p2,roleid,p_taskstate) values (22,'9422346220e949739133072bce103776',null,null,'[0-*]',null,null,'bc35221018114158a4e7af8dcf3364df','1');
insert into t_privilege (id,objid,p_departnum,p_billtype,p_amountrange,p1,p2,roleid,p_taskstate) values (1,'1fa4c38b0e68471aaf945f26fe56c267',null,null,'[0-*]',null,null,'ea072fcdb569470ebc6206860763aea2','-1');
insert into t_privilege (id,objid,p_departnum,p_billtype,p_amountrange,p1,p2,roleid,p_taskstate) values (25,'3275add67a7a49928d74bb58d983b405',null,null,'[0-*]',null,null,'7e37de7295bd4e0996ec2dc2cb65ccd3','0');

insert into t_role (id,rolenum,rolename,rolestatus,menulist,operlist,createuser,createtime,rolestatusname) values (0,'81c210f2b39d472386dc3d2a99ca25ef','超级管理员(admin)','0',null,null,'admin','20160105221615','新建');

insert into t_users_roles (id,objid,user_objid,role_objid) values (0,'9128732cd2c4483d8fa9295ed9a1eece','4aff0bc4da994249a14c6afa230360a8','81c210f2b39d472386dc3d2a99ca25ef');

insert into t_user (id,username,usernum,departnum,sex,password,telephonenum,address,roles,creater,createtime,customprivilege,defaultprivilege,status,lastmodifyuser,lastmodifytime,lastmodifyreason,statusname,objid,systemcode) values (0,'admin','admin','1','0','4297f44b13955235245b2497399d7a93','119','天创',null,'admin','20160105221732',null,null,'0','admin','20160222175840',null,'有效','4aff0bc4da994249a14c6afa230360a8',null);

--影像分类表增加类型字段
alter table imageclassify add boxtype varchar(32);
--影像分类中间表
create table billtype_classify(
  uuid varchar(64) primary key not null,
  bill_type_id varchar(64) not null,
  classify_objid varchar(64) not null,
  create_time varchar(32) not null
);
--系统出厂预置一个影像分类
insert into imageclassify (id,objid,categoryname,categorycode,boxtype) values (0,'a8541e198faa4e1089bb1654b4b0c3f7','预置分类1','0','sys');

alter table t_depart add nsrsbh varchar(256);
alter table currenttask add code varchar(256);
alter table currenttask add nsrsbh varchar(256);

--存储税务云查验SaveToken数据，用于提交到税务云
create table save_token (
	uuid varchar(64) primary key not null,
	bsn varchar(64),
	invcode varchar(64),
	invnum varchar(64),
	submitter varchar(64),
	datetime varchar(64),
	token varchar(64)
);

commit;