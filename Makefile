CC=clang
CFLAGS=-O0 -g -fPIC
LDFLAGS=-shared
BUILD=build

all: $(BUILD)/libops.so

# Crear carpeta build si no existe
$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/ops.o: src/ops.s | $(BUILD)
	$(CC) -c $< -o $@

$(BUILD)/bridge.o: src/bridge.c | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/libops.so: $(BUILD)/ops.o $(BUILD)/bridge.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -rf build/*
