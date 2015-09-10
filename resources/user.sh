#! /bin/sh

source helper.sh

user()
{
	local username="$1"

	if ! user_exists "$username"; then
		create_user "$username"
		{
			if [[ $? -ne 0 ]]; then
			{
				report_error "user $username could not be created"
				cat /tmp/user.log
			}
			else
				report_success "* User $username created successfully"
			fi
		}
	fi

}

user_exists()
{
	local username="$1"
	if  [[ $(grep -c "$username" /etc/passwd) -ne 0 ]]; then
		report_exist "* User $username exists"
		return 0
	else
		return 1
	fi
}

create_user()
{
	local username="$1"

	useradd "$username" > /tmp/user.log 2>&1
}
