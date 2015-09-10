#! /bin/sh

source helper.sh

file()
{
	local filename="$1"

	if ! file_exists "$filename"; then
		create_file "$filename"
		if [[ $? -ne 0 ]]; then
		{
			report_error "* File $filename could not be created"
			cat /tmp/file.log
		}
		else
			report_success "* File $filename created successfully"
		fi
	fi

}

file_exists()
{
	local filename="$1"

	if  [[ -f "$1" ]]; then
		report_exist "* File $filename exists"
		return 0
	else
		return 1
	fi
}

create_file()
{
	local filename="$1"

	touch "$filename" > /tmp/file.log 2>&1
}
