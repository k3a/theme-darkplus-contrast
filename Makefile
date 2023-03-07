.PHONY: vsxi
vsxi:
	@if [ -z "$(VERSION)" ]; then echo "VERSION parameter required!"; exit 1; fi
	rm -rf /tmp/vsix /tmp/vsix.vsix
	cp -R package /tmp/vsix
	rsync -r --exclude .git --exclude Makefile --exclude package ./ /tmp/vsix/extension/
	sed -i '' s/VERSION/$(VERSION)/ /tmp/vsix/extension/package.json
	sed -i '' s/VERSION/$(VERSION)/ /tmp/vsix/extension.vsixmanifest
	cd /tmp/vsix && zip -r /tmp/vsix.vsix *
