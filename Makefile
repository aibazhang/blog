utc_now := $(shell date -u +%Y-%m-%dT%H:%M:%S+00:00)
today := $(shell date -u +%Y%m%d)
filename := content/posts/$(today).md

tech:
	@echo "Creating post: $(filename)"; \
    cp -r archetypes/tech.md $(filename); \
	sed -i '' "s/^date: .*/date: $(utc_now)/" $(filename)

life:
	@echo "Creating post: $(filename)"; \
	cp -r archetypes/life.md $(filename); \
	sed -i '' "s/^date: .*/date: $(utc_now)/" $(filename)

life-img:
	@echo "Creating post: $(filename)"; \
	mkdir -p content/posts/$(today)/images; \
    cp -r archetypes/life-img.md content/posts/$(today)/index.md; \
	sed -i '' "s/^date: .*/date: $(utc_now)/" content/posts/$(today)/index.md; \

update:
	@git submodule update --init --recursive
	@echo "Submodules updated."

serve:
	@hugo server --disableFastRender --ignoreCache
