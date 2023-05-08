SOURCES := $(shell find . -name '*.go')
TARGET := ./dist/reactnut_darwin_amd64_v1/reactnut

run: reactnut
	./reactnut

reactnut: $(TARGET)
	cp $< $@

$(TARGET): $(SOURCES)
	gofumpt -w $<
	goreleaser build --single-target --snapshot --clean

.PHONY: clean
clean:
	rm -f reactnut
	rm -f $(TARGET)
	rm -rf dist