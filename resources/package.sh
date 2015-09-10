#! /bin/sh

source helper.sh

package()
{
	local packagename="$1"

	if ! package_is_installed "$packagename"; then
		install_package "$packagename"
		if [[ $? -ne 0 ]]; then
		{
			report_error "* Package $packagename could not be created"
			cat /tmp/package.log
		}
		else
			report_success "* Package $packagename created successfully"
		fi
	fi
}

package_is_installed()
{
	local packagename="$1"

	if  [[ $(dpkg-query -W -f='${Status}' "$packagename" 2>/dev/null | grep -c "ok installed") -eq 1 ]]; then
		report_exist "* Package $packagename exists"
		return 0
	else
		return 1
	fi
}

install_package()
{
	local packagename="$1"

	apt-get install "$packagename" > /tmp/package.log 2>&1
}
