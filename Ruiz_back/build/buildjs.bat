echo start compressing js...

java -jar yuicompressor-2.3.4.jar --type js --charset utf-8 -o ../web/js/ajax.min.js ../web/js/ajax.js

echo end compressing js...