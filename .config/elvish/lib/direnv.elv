## hook for direnv
set @edit:before-readline = $@edit:before-readline {
	try {
		var m = [("/home/eric/.local/share/mise/installs/direnv/2.37.1/direnv" export elvish | from-json)]
		if (> (count $m) 0) {
			set m = (all $m)
			keys $m | each { |k|
				if $m[$k] {
					set-env $k $m[$k]
				} else {
					unset-env $k
				}
			}
		}
	} catch e {
		echo $e
	}
}
