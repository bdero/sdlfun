# GNUmakefile for sdlfun
# github.com/CheeseKeg/sdlfun

ifneq (,)
This makefile requires GNU Make.
endif

# debug or release
build = release

bin = bin/
src = src/
cc = g++

programs = helloworld regulatefps rectangle keyhandling loadimage colorkey blitimage animation ttf opengl-intro opengl-basiccolors opengl-transformations opengl-displaylist opengl-cube opengl-lighting opengl-textures opengl-objloader opengl-fog opengl-matrix opengl-alphablend opengl-objloader2 opengl-smoothnormals opengl-fpscamera
#binaries = $(addprefix $(bin), $(programs))
#progexec = $(addprefix exec., $(programs))

lflags = -lSDL
glflags = -lGL -lGLU

ifeq ($(build), debug)
cflags = -Wall -O0 -g
endif

ifeq ($(build), release)
cflags = -Wall -O2
endif

.PHONY : main
main : help

.PHONY : help
help :
	@echo GNUmakefile for sdlfun
	@echo ------------------------------
	@echo github.com/CheeseKeg/sdlfun
	@echo
	@echo \* Available build options:
	@echo \*---\> all $(programs)
#	@echo \* Available execute options \(must build first\):
#	@echo \*---\> $(progexec)
	@echo \* Clean junk files and binaries:
	@echo \*---\> clean
	@echo \* View this help:
	@echo \*---\> help
	@echo
	@echo Example: make all

.PHONY : all
all : $(programs)

.PHONY : clean
clean :
	rm -f $(bin)*
	find ./ -name *~* -exec rm {} +

clink = $(cc) $(lflags) -o $@

#.PHONY : $(programs)

t1 = helloworld
$(t1) : $(bin)$(t1)
$(bin)$(t1) : $(bin)$(t1).o
	$(clink) $^

t2 = regulatefps
$(t2) : $(bin)$(t2)
$(bin)$(t2) : $(bin)$(t2).o
	$(clink) $^

t3 = rectangle
$(t3) : $(bin)$(t3)
$(bin)$(t3) : $(bin)$(t3).o
	$(clink) $^

t4 = keyhandling
$(t4) : $(bin)$(t4)
$(bin)$(t4) : $(bin)$(t4).o
	$(clink) $^

t5 = loadimage
$(t5) : $(bin)$(t5)
$(bin)$(t5) : $(bin)$(t5).o
	$(clink) $^

t6 = colorkey
$(t6) : $(bin)$(t6)
$(bin)$(t6) : $(bin)$(t6).o
	$(clink) $^

t7 = blitimage
$(t7) : $(bin)$(t7)
$(bin)$(t7) : $(bin)$(t7).o
	$(clink) $^

t8 = animation
$(t8) : $(bin)$(t8)
$(bin)$(t8) : $(bin)$(t8).o
	$(clink) $^

t9 = ttf
$(t9) : $(bin)$(t9)
$(bin)$(t9) : $(bin)$(t9).o
	$(clink) -lSDL_ttf $^

t10 = opengl-intro
$(t10) : $(bin)$(t10)
$(bin)$(t10) : $(bin)$(t10).o
	$(clink) $(glflags) $^

t11 = opengl-basiccolors
$(t11) : $(bin)$(t11)
$(bin)$(t11) : $(bin)$(t11).o
	$(clink) $(glflags) $^

t12 = opengl-transformations
$(t12) : $(bin)$(t12)
$(bin)$(t12) : $(bin)$(t12).o
	$(clink) $(glflags) $^

t13 = opengl-displaylist
$(t13) : $(bin)$(t13)
$(bin)$(t13) : $(bin)$(t13).o
	$(clink) $(glflags) $^

t14 = opengl-cube
$(t14) : $(bin)$(t14)
$(bin)$(t14) : $(bin)$(t14).o
	$(clink) $(glflags) $^

t15 = opengl-lighting
$(t15) : $(bin)$(t15)
$(bin)$(t15) : $(bin)$(t15).o
	$(clink) $(glflags) $^

t16 = opengl-textures
$(t16) : $(bin)$(t16)
$(bin)$(t16) : $(bin)$(t16).o
	$(clink) $(glflags) $^

t17 = opengl-objloader
$(t17) : $(bin)$(t17)
$(bin)$(t17) : $(bin)$(t17).o
	$(clink) $(glflags) $^

t18 = opengl-fog
$(t18) : $(bin)$(t18)
$(bin)$(t18) : $(bin)$(t18).o $(bin)functions.o
	$(clink) $(glflags) $^

t19 = opengl-matrix
$(t19) : $(bin)$(t19)
$(bin)$(t19) : $(bin)$(t19).o $(bin)functions.o
	$(clink) $(glflags) $^

t20 = opengl-alphablend
$(t20) : $(bin)$(t20)
$(bin)$(t20) : $(bin)$(t20).o $(bin)functions.o
	$(clink) $(glflags) $^

t21 = opengl-objloader2
$(t21) : $(bin)$(t21)
$(bin)$(t21) : $(bin)$(t21).o $(bin)objloader.o
	$(clink) $(glflags) $^

t22 = opengl-smoothnormals
$(t22) : $(bin)$(t22)
$(bin)$(t22) : $(bin)$(t22).o $(bin)objloader.o
	$(clink) $(glflags) $^

t23 = opengl-fpscamera
$(t23) : $(bin)$(t23)
$(bin)$(t23) : $(bin)$(t23).o $(bin)objloader.o $(bin)Camera.o
	$(clink) $(glflags) $^

$(bin)%.o : $(src)%.cpp
	$(cc) $(cflags) -c -o $@ $<

#.PHONY : $(progexec)
#$(progexec) :
#	./$(bin)$(removeprefix exec., $@)
