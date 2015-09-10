#! /bin/sh

source helper.sh

folder()
{
	local foldername="$1"

	if ! folder_exists "$foldername"; then
		create_folder "$foldername"
		if [[ $? -ne 0 ]]; then
		{
			report_error "* Folder $foldername could not be created"
			cat /tmp/folder.log
		}
		else
			report_success "* Folder $foldername created successfully"
		fi
	fi

}

folder_exists()
{
	local foldername="$1"

	if  [[ -d "$1" ]]; then
		report_exist "* Folder $foldername exists"
		return 0
	else
		return 1
	fi
}

create_folder()
{
	local foldername="$1"

	mkdir "$foldername" > /tmp/folder.log 2>&1
}
