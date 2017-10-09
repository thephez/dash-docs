#!/bin/bash
#echo "$# parameters"
#echo "$@";

PARAMCOUNT=$#
#echo "$PARAMCOUNT parameters"

if [ "$PARAMCOUNT" == 1 ]; then
	FILENAME=${1,,}.md
	RPCNAME=$1
	echo "{% comment %}" >> $FILENAME
	echo "This file is licensed under the MIT License (MIT) available on" >> $FILENAME
	echo "http://opensource.org/licenses/MIT." >> $FILENAME
	echo "{% endcomment %}" >> $FILENAME
	echo '{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/'$FILENAME'" %}#' >> $FILENAME
	echo "" >> $FILENAME
	echo "##### '$RPCNAME'" >> $FILENAME
	echo "{% include helpers/subhead-links.md %}" >> $FILENAME
	echo "" >> $FILENAME
	echo "{% autocrossref %}" >> $FILENAME
	echo "" >> $FILENAME
	echo "{% assign summary_${RPCNAME,}="" %}" >> $FILENAME
	echo "" >> $FILENAME
	echo "{% endautocrossref %}" >> $FILENAME

	cat $FILENAME

	echo " "
	echo "Next copy the created file ('$FILENAME') to ../_includes/devdoc/dash-core/rpcs/rpcs"
else
	echo "Incorrect number of parameters (Should be exactly 1)"
	echo "Usage: create_empty_rpc_md RPCNAME"
	echo "Example: create_empty_rpc_md GetBlock"
fi

#This file is licensed under the MIT License (MIT) available on
#http://opensource.org/licenses/MIT.
#{% endcomment %}
#{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getaddressutxos.md" %}#
#
###### GetAddressUtxos
#{% include helpers/subhead-links.md %}
#
#{% autocrossref %}
#
#{% assign summary_getAddressUtxos="" %}
#
#
#{% endautocrossref %}
