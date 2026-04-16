CC=clang
CFLAGS=-O0 -g -fPIC
LDFLAGS=-shared
BUILD=build

# -----------------------------------------
# TARGET PRINCIPAL (ARREGLADO)
# -----------------------------------------
all: $(BUILD) $(BUILD)/libops.so $(BUILD)/test

# -----------------------------------------
# CREAR DIRECTORIO BUILD
# -----------------------------------------
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
# TEST BINARIO (DEBUG GDB)
# -----------------------------------------
$(BUILD)/test: src/test.c $(BUILD)/ops.o $(BUILD)/bridge.o | $(BUILD)
	$(CC) -O0 -g src/test.c $(BUILD)/ops.o $(BUILD)/bridge.o -o $@

# -----------------------------------------
# CLEAN
# -----------------------------------------
clean:
	rm -rf build/*
