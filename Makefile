all: ## Build wheel
	zip -r \
        --exclude=".git/*" \
        --exclude="/venv/*" \
        --exclude="*.csv" \
        --exclude="*__pycache__/*" \
        $(shell basename $$PWD).qz .

setup: ## Create venv and install dependencies on it
	tar -xzf wave-0.11.0-linux-amd64.tar.gz
	./wave-0.11.0-linux-amd64/waved
	wave run src.app

install: ## Install dependencies on active python environment
	ARCHFLAGS="-arch x86_64" pip install -r requirements.txt

clean: ## Clean
	rm -rf dist venv *.whl *.qz

help: ## List all make tasks
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
