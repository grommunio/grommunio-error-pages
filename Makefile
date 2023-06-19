prefix = /usr
datadir = ${prefix}/share
gepdir = ${datadir}/grommunio-error-pages
cssdir = ${gepdir}/_errors
nglocdir = ${datadir}/grommunio-common/nginx/locations.d
INSTALL = install
MKDIR_P = mkdir -p

all:
	./generate.py
clean:
	find . -maxdepth 1 -iname '[0-9][0-9][0-9].html' -not -iname '418.html' -print -delete
install:
	${MKDIR_P} ${DESTDIR}${gepdir} ${DESTDIR}${cssdir} ${DESTDIR}${imgdir} ${DESTDIR}${nglocdir}
	${INSTALL} -m0644 *.html ${DESTDIR}${gepdir}/
	${INSTALL} -m0644 _errors/*.css ${DESTDIR}${cssdir}/
	${INSTALL} -m0644 snippets/grommunio-error-pages.conf ${DESTDIR}${nglocdir}/
