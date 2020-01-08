# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mtuomine <mtuomine@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/28 19:30:09 by mtuomine          #+#    #+#              #
#    Updated: 2019/12/05 08:13:23 by mtuomine         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = clang

NAME = libftprintf.a

FLAGS = -Wall -Wextra -Werror

LIBFT = libft

DIR_S = src

DIR_O = temporary

HEADER = inc

SOURCES = 	ft_printf.c \
pf_write.c \
pf_args.c \
pf_parsers.c \
pf_ftoa.c \
pf_pad_cut.c \
pf_print_hex.c \
pf_print_uint.c \
pf_print_percent.c \
pf_print_decimal.c \
pf_print_char.c \
pf_print_float.c \
pf_print_pointer.c \
pf_print_octal.c \
pf_flags.c \
pf_print_string.c \
pf_print_binary.c

SRCS = $(addprefix $(DIR_S)/,$(SOURCES))

OBJS = $(addprefix $(DIR_O)/,$(SOURCES:.c=.o))

all: $(NAME)

$(NAME): $(OBJS)
	@make -C $(LIBFT)
	@cp libft/libft.a ./$(NAME)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

$(DIR_O)/%.o: $(DIR_S)/%.c
	@mkdir -p temporary
	@$(CC) $(FLAGS) -I $(HEADER) -o $@ -c $<

clean:
	@rm -f $(OBJS)
	@rm -rf $(DIR_O)
	@make clean -C $(LIBFT)

main: all
	clang -I inc -o main main.c -L. -lftprintf

fclean: clean
	@rm -f $(NAME)
	@make fclean -C $(LIBFT)

re: fclean all
