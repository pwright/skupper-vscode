curl https://raw.githubusercontent.com/skupperproject/skupper-website/master/input/start/index.md > skupper.md

kramdoc --format=GFM \
     --output=skupper.adoc \
     --wrap=ventilate \
       skupper.md

