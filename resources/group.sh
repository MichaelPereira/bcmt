#! /bin/sh

source helper.sh

group()
{
	local groupname="$1"

	if ! group_exists "$groupname"; then
		create_group "$groupname"
		if [[ $? -ne 0 ]]; then
		{
			report_error "* Group $groupname could not be created"
			cat /tmp/group.log
		}
		else
			report_success "* Group $groupname created successfully"
		fi
	fi

}

group_exists()
{
	local groupname="$1"

	if  [[ $(egrep -c "^$groupname:" /etc/group) -eq 1 ]]; then
		report_exist "* Group $groupname exists"
		return 0
	else
		return 1
	fi
}

create_group()
{
	local groupname="$1"

	groupadd "$groupname" > /tmp/group.log 2>&1
}
