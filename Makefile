install:
	sudo chmod +x make_repo.sh
	sudo chmod +x register_repo_on_github.sh
	ln -s $(shell pwd)/make_repo.sh ~/.local/bin/make_repo.sh
	ln -s $(shell pwd)/register_repo_on_github.sh ~/.local/bin/register_repo_on_github.sh

