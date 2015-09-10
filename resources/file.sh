#! /bin/sh

file()
{
	local filename="$1"

	if ! file_exists "$filename"; then
		create_file "$filename"
	fi

}

file_exists()
{
	if  [[ -f "$1" ]]; then
		return 0
	else
		return 1
	fi
}

create_file()
{
	local filename="$1"

	touch "$filename"
}
