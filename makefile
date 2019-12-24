TARGET := libeasysave.a

SRC_DIRS := source
INC_DIRS := include

SRCS := $(shell find $(SRC_DIRS) -name "*.cpp")
OBJS += $(filter %.o, $(patsubst %.cpp, %.o, $(SRCS)))

CXXFLAGS := -Wall -Wextra -std=c++17
CXXFLAGS += $(foreach dir, $(INC_DIRS), -I$(dir))

.PHONY: all clean docs

all: $(TARGET)

clean:
	-@rm -r $(TARGET) $(OBJS)

docs:
	@doxygen doxyfile

$(TARGET): $(OBJS)
	$(AR) -rcs $(TARGET) $(OBJS)