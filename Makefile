CSS     = css
IMG     = images
JS      = js
POST    = posts
DATA    = data
PUBLISH = publish

all: containers contents docx

containers: $(PUBLISH)/$(CSS) $(PUBLISH)/$(IMG) $(PUBLISH)/$(JS)
$(PUBLISH)/%:
	mkdir -p $@

contents:
	rsync $(POST)/$(IMG)/*		$(IMG)/
	rsync $(CSS)/*			$(PUBLISH)/$(CSS)/
	rsync $(IMG)/*			$(PUBLISH)/$(IMG)/
	rsync $(JS)/*			$(PUBLISH)/$(JS)/
	rsync $(POST)/*.html		$(PUBLISH)/
	rsync $(DATA)/*			$(PUBLISH)/

docx: $(PUBLISH)/features.docx
$(PUBLISH)/features.docx: $(POST)/features.raw.org
	cat $^ | perl -p -e "s/\[\[file:/[[/gi;" | pandoc -f org -o $@

qn: qiniu
qiniu:
	qrsync ~/conf/sob.json

gh: github
github:
	git add -A && git commit -m "lazy commit" && git push

clean:
	rm -fr $(PUBLISH)/*
