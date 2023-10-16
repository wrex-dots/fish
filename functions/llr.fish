function llr --description 'List content of directory, recursively, long format' --wraps eza
	eza -lgR --group-directories-first $argv;
end
