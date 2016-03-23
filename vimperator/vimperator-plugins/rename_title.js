// PLUGIN_INFO {{{
let PLUGIN_INFO = xml`
<VimperatorPlugin>
      <name>rename-title</name>
      <name lang="cn">rename-title</name>
      <description>rename buffer title</description>
      <description lang="cn">重命名标签页</description>
      <version>1.0.0</version>
      <author mail="nkuysharp@gmail.com" homepage="">Ysharp</author>
      <minVersion>3.9</minVersion>
      <maxVersion>3.9</maxVersion>
      <detail lang="cn"><![CDATA[
          == Command ==
          :rename <title>
	  rename tilte of current tab

        ]]></detail>
    </VimperatorPlugin>`;
// }}}


var RenameMe = {
    init: function() {
	//this.document = gBrowser.contentDocument;
    },
    rename: function(title)
    {
	if (title.length == 0)
	{
	    return;
	}
	var document = gBrowser.contentDocument;
	document.title = title;
    }
};

RenameMe.init();

commands.addUserCommand(
    ['rename'],
    'rename title of the current tab',
    function(args) {
	var title = args.string;
	RenameMe.rename(title);
    }
);

