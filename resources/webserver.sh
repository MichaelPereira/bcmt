#! /bin/sh

source helper.sh


webserver()
{
	local webservername="$1"

	package "$webservername"

	if ! webserver_is_running "$webservername"; then
		run_webserver "$webservername"
		if [[ $? -ne 0 ]]; then
		{
			report_error "* Webserver $webservername could not be started"
			cat /tmp/webserver.log
		}
		else
			report_success "* Webserver $webservername started successfully"
		fi
	fi
}

webserver_is_running()
{
	local webservername="$1"

	if  [[ $(service "$webservername" status | grep -c "not running") -eq 0 ]]; then
		report_exist "* Webserver $webservername is running"
		return 0
	else
		return 1
	fi
}

run_webserver()
{
	local webservername="$1"

	service "$webservername" start > /tmp/webserver.log 2>&1
}
