RM := rm -rfv

SRCS=$(wildcard */*.scad)
OBJS=$(SRCS:%.scad=%.stl)

all:${OBJS}
	echo ${OBJS}

clean:
	-$(RM) ${OBJS}
	-${RM} */*~
	-@echo ' '

%.stl: %.scad
	openscad -o $@ $<
