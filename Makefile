all: ## Build wheel
	zip -r \
        --exclude=".git/*" \
        --exclude="/venv/*" \
        --exclude="*.csv" \
        --exclude="*__pycache__/*" \
        $(shell basename $$PWD).qz .

setup-linux: ## Create venv and install dependencies on it
	tar -xzf wave-0.11.0-linux-amd64.tar.gz
	cp start_waved.py wave-0.11.0-linux-amd64/
	cd wave-0.11.0-linux-amd64 && python3 start_waved.py

setup-darwin: ## Create venv and install dependencies on it
	tar -xzf wave-0.11.0-darwin-amd64.tar.gz
	cp start_waved.py wave-0.11.0-darwin-amd64/
	cd wave-0.11.0-darwin-amd64 && python3 start_waved.py

install: ## Install dependencies on active python environment
	ARCHFLAGS="-arch x86_64" pip install -r requirements.txt

clean: ## Clean
	rm -rf dist venv *.whl *.qz

help: ## List all make tasks
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
