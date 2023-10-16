function lr --description 'List content of directories recursively' --wraps eza
	eza -gR --group-directories-first $argv;
end
