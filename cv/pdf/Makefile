.PHONY: watch
watch:
	typst watch main.typ main.pdf --font-path fonts/

.PHONY: compile
compile:
	typst compile main.typ main.pdf --font-path fonts/

.PHONY: release
release:
	ssh -i $(KEY_PATH) $(SERVER) "mkdir -p $(DEST_DIR)"
	scp -i $(KEY_PATH) main.pdf $(SERVER):$(DEST_DIR)/$(OUTPUT)

OUTPUT ?= main.pdf
SERVER = root@kochetov.dev
KEY_PATH = ../../keys/personal_page
DEST_DIR = /usr/share/nginx/html/cv
