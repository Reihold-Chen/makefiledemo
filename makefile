## 顶层目录
TOP :=.
## 资源目录
SRC_DIR := $(TOP)/src

## Name and type of the target for this Makefile
##生成可执行文件的目录
INSTALL_APP_PATH := $(TOP)/build

##生成可执行文件的名字
APP_TARGET := myapp

## debug标志位
DEBUG = 0

#这里递归遍历3级子目录

DIRS := $(shell find $(SRC_DIR) -maxdepth 3 -type d)

#这里循环遍历目录的cpp文件
SRCS = $(foreach dir,$(DIRS),$(wildcard $(dir)/*.c))

#SRCS := $(wildcard $(SRC_DIR)/*.c)

## Libraries to include in shared object file

LIBS :=pthread dl

## Add driver-specific include directory to the search path

CFLAGS += -D_LINUX_

INC_PATH += $(TOP)/inc

LIB_PATH := $(TOP)/lib

INSTALL_LIB_PATH = $(TOP)/lib

include $(TOP)/cxxcommon.mk
