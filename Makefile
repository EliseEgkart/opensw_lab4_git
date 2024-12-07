PROJ_DIR = $(shell pwd)
SRC_DIR = $(PROJ_DIR)/src
OBJ_DIR = $(PROJ_DIR)/obj
INC_DIR = $(PROJ_DIR)/include
BIN_DIR = $(PROJ_DIR)/bin

$(BIN_DIR)/myapp: $(OBJ_DIR)/main.o $(OBJ_DIR)/add_func.o $(OBJ_DIR)/division_func.o | $(BIN_DIR)
	gcc -o $@ $^

$(BIN_DIR):
	mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	gcc -c -o $@ $< -I$(INC_DIR)

$(OBJ_DIR):
	mkdir -p $@
	
# Optional: Clean target to remove compiled files
.PHONY: clean
clean: 
	rm -f $(OBJ_DIR)/%.o $(BIN_DIR)/myapp
distclean:
	rm -f $(OBJ_DIR)/%.o $(BIN_DIR)/myapp
	rm -rf $(OBJ_DIR) $(BIN_DIR)