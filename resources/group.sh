#! /bin/sh

group()
{
	local groupname="$1"

	if ! group_exists "$groupname"; then
		create_group "$groupname"
		if [[ $? -ne 0 ]]; then
		{
			echo "group $groupname could not be created"
			cat /tmp/group.log
		}
		fi
	fi

}

group_exists()
{
	local groupname="$1"

	if  [[ $(grep -c "$groupname" /etc/group) -eq 1 ]]; then
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
