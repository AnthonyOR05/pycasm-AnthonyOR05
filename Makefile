CC=clang
CFLAGS=-O0 -g -fPIC
LDFLAGS=-shared
BUILD=build

all: $(BUILD)/libops.so

# Crear carpeta build si no existe
$(BUILD):
	mkdir -p $(BUILD)

# -----------------------------------------
# OBJETOS
# -----------------------------------------
$(BUILD)/ops.o: src/ops.s | $(BUILD)
	$(CC) -g -c $< -o $@

$(BUILD)/bridge.o: src/bridge.c | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

# -----------------------------------------
# LIBRERÍA
# -----------------------------------------
$(BUILD)/libops.so: $(BUILD)/ops.o $(BUILD)/bridge.o
	$(CC) $(LDFLAGS) -g -o $@ $^

# -----------------------------------------
# 🐛 DEBUG TEST BINARIO (NUEVO)
# -----------------------------------------
$(BUILD)/test: src/test.c $(BUILD)/ops.o $(BUILD)/bridge.o | $(BUILD)
	$(CC) -O0 -g src/test.c $(BUILD)/ops.o $(BUILD)/bridge.o -o $(BUILD)/test

# -----------------------------------------
# CLEAN
# -----------------------------------------
clean:
	rm -rf build/*
