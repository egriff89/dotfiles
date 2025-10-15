# config.nu
#
# Installed by:
# version = "0.107.0"
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

mkdir ($nu.data-dir | path join "vendor/autoload")

$env.config = {
	buffer_editor: "nvim"
	show_banner: false

	hooks: {
		pre_prompt: [{ ||
			if (which direnv | is-empty) {
				return
			}

			direnv export json | from json | default {} | load-env
			if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
				$env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
			}
		}]
	}
}

# Autoload
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
