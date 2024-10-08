<?php
	
	$conf['servers'][0]['host'] = 'mypostgres';
	$conf['servers'][0]['port'] = 5432;
	$conf['extra_login_security'] = false;

    ##############################################
	
	$conf['servers'][0]['desc'] = 'PostgreSQL';
	$conf['servers'][0]['sslmode'] = 'allow';
	$conf['servers'][0]['defaultdb'] = 'template1';
	$conf['servers'][0]['pg_dump_path'] = '/usr/bin/pg_dump';
	$conf['servers'][0]['pg_dumpall_path'] = '/usr/bin/pg_dumpall';
	$conf['default_lang'] = 'auto';
	$conf['autocomplete'] = 'default on';
	$conf['owned_only'] = false;
	$conf['show_comments'] = true;
	$conf['show_advanced'] = false;
	$conf['show_system'] = false;
	$conf['min_password_length'] = 1;
	$conf['left_width'] = 200;
	$conf['theme'] = 'default';
	$conf['show_oids'] = false;
	$conf['max_rows'] = 30;
	$conf['max_chars'] = 50;
	$conf['use_xhtml_strict'] = false;
	$conf['help_base'] = 'http://www.postgresql.org/docs/%s/interactive/';
	$conf['ajax_refresh'] = 3;
	$conf['plugins'] = array();
	$conf['version'] = 19;
?>
