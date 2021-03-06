# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: helkhatr < helkhatr@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/25 16:22:32 by helkhatr          #+#    #+#              #
#    Updated: 2020/12/09 14:08:32 by helkhatr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= minishell
SRC_PATH= srcs
HDR_PATH= includes
OBJ_PATH= obj
LIB_PATH= libft


SRC_NAME=init.c\
		search_env.c\
		env.c\
		minishell.c\
		read_line.c\
		pwd.c\
		execute.c\
		tools.c\
    	directory.c\
		parse.c\
		ft_split.c\
		cd.c\

HDR_NAME=minishell.h 

OBJ_NAME= $(SRC_NAME:.c=.o)

OBJ= $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))
SRC= $(addprefix $(SRC_PATH)/,$(SRC_NAME))
HDR= $(addprefix $(HDR_PATH)/,$(HDR_NAME))

LIB= libft.a
FLAGS= 
LLIB_FLAG= -L$(LIB_PATH) libft/libft.a
H_FLAG= -I $(HDR_PATH)
#***************************************************************************** #

COMP= gcc

all: lib  $(NAME) 

$(NAME) : $(LIB_PATH)/$(LIB) $(OBJ)
	@rm -rf miniRT
	@$(COMP) $(H_FLAG) $(LLIB_FLAG) $(OBJ) -o $@
	@echo "													 Made by : \033[1;91mSqatim\033[m"
	@echo "      ___                       ___                       ___           ___           ___                                  "
	@echo "     /__/\        ___          /__/\        ___          /  /\         /__/\         /  /\                                 "
	@echo "    |  |::\      /  /\         \  \:\      /  /\        /  /:/_        \  \:\       /  /:/_                                "
	@echo "    |  |:|:\    /  /:/          \  \:\    /  /:/       /  /:/ /\        \__\:\     /  /:/ /\    ___     ___   ___     ___  "
	@echo "  __|__|:|\:\  /__/::\      _____\__\:\  /__/::\      /  /:/ /::\   ___ /  /::\   /  /:/ /:/_  /__/\   /  /\ /__/\   /  /\ "
	@echo " /__/::::| \:\ \__\/\:\__  /__/::::::::\ \__\/\:\__  /__/:/ /:/\:\ /__/\  /:/\:\ /__/:/ /:/ /\ \  \:\ /  /:/ \  \:\ /  /:/ "
	@echo " \  \:\~~\__\/    \  \:\/\ \  \:\~~\~~\/    \  \:\/\ \  \:\/:/~/:/ \  \:\/:/__\/ \  \:\/:/ /:/  \  \:\  /:/   \  \:\  /:/  "
	@echo "  \  \:\           \__\::/  \  \:\  ~~~      \__\::/  \  \::/ /:/   \  \::/       \  \::/ /:/    \  \:\/:/     \  \:\/:/   "
	@echo "   \  \:\          /__/:/    \  \:\          /__/:/    \__\/ /:/     \  \:\        \  \:\/:/      \  \::/       \  \::/    "
	@echo "    \  \:\         \__\/      \  \:\         \__\/       /__/:/       \  \:\        \  \::/        \__\/         \__\/     "
	@echo "     \__\/                     \__\/                     \__\/         \__\/         \__\/                                 "
	@echo "						Compilation of $(NAME):  \033[1;32mOK\033[m"

lib:
	@make -sC $(LIB_PATH)

$(OBJ_PATH)/%.o:  $(SRC_PATH)/%.c $(HDR)
	@mkdir -p $(OBJ_PATH) 
	@$(COMP) $(FLAGS) $(H_FLAG)  -o $@ -c $<

clean:
	@rm -rf $(OBJ_PATH)
	@make clean -C $(LIB_PATH)
	@echo "\033[1;33m>> all objects files are deleted.\033[0m" 

fclean: clean
	@rm -rf $(NAME)
	@make fclean -C $(LIB_PATH)
	@echo "\033[0;31m>> $(NAME) && all obbjects are deleted.\033[0m" 

re : fclean all
