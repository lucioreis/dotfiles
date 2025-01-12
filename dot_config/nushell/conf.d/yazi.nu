def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
    if (((which zoxide z) | length) == 2) {
      z $cwd
    } else {
		  cd $cwd
    }
	}
	rm -fp $tmp
}
