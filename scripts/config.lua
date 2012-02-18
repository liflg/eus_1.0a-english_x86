Setup.Package
{
    vendor = "liflg.org",
    id = "eus",
    description = "Eric's Ultimate Solitaire",
    version = "1.0a-english",
    splash = "splash.png", 
    superuser = false, 
    write_manifest = true, 

    support_uninstall = true, 
    recommended_destinations =
    {
        "/usr/local/games",
	"/opt/",
	MojoSetup.info.homedir,
    }, 

    Setup.Readme
    {
        description = "README",
        source = "README.liflg"
    },

    Setup.Media
    {
        id = "eus-disc",
        description = "Eric's Ultimate Solitaire disc",
        uniquefile = "bin/x86/EricsSolitaire"
    },

    Setup.DesktopMenuItem
    {
        disabled = false,
        name = "Eric's Ultimate Solitaire",
        genericname = "Solitaire",
        tooltip = "Play Eric's Ultimate Solitaire",
        builtin_icon = false,
        icon = "icon.xpm",
        commandline = "%0/EricsSolitaire.dynamic.sh",
        category = "Game", 
    },

 
    Setup.Option
    {    
    	value = true,
	required = true,
    	disabled = false,
    	bytes = 77259271,
    	description = "Install gamedata",
    	tooltip = "Needs the LOKI-CDROM",
   
    	Setup.File
    	{
	    	wildcards = { "EricsSolitaire.sh", "EricsSolitaire.dynamic.sh", "README.liflg" },
    		filter = function(dest)
			if ( string.match ( dest, "EricsSolitaire") ) then
				return dest, "755"
			end
			return dest
		end
	},
   
    	Setup.File
    	{
    		source = "media://eus-disc/",
    		wildcards = { "Backgrounds/*", "pixmaps/*", "sounds/*", "Music/*", "timidity/*", "EUS.txt", "icon.bmp", "icon.xpm", "README" },
     		filter = function(dest)
			if ( string.match ( dest, "CVS") ) then
				return nil
			end
			return dest
		end
	   	},

    	Setup.File
    	{
    		source = "media://eus-disc/ExtraBackgrounds/",
		destination = "Backgrounds/",
    	},

	Setup.File
	{
		source = "media://eus-disc/bin/x86/",
		wildcards = { "EricsSolitaire.dynamic", "EricsSolitaire" },
		permissions = "755",
	}
    },

    Setup.Option
    {    
    	value = true,
	required = true,
    	bytes = 3010560,
    	description = "Apply Patch 1.0a",
    	tooltip = "Latest update from Loki",
	Setup.File
	{
		allowoverwrite = true,
		source = "base:///patch-1.0a.tar.xz/",
		filter = function(dest)
			if ( string.match ( dest, "EricsSolitaire") ) then
				return dest, "755"
			end
			return dest
		end
	},
    },

    Setup.Option
    {
        value = true,
        required = false,
        bytes = 1784527,
        description = "Installs GTK 1.2",
        tooltip = "current distributions do not include this library anymore",
        Setup.File
        {
             allowoverwrite = true,
             source = "base:///libgtk1.2.tar.xz/",
        },
    },

    Setup.Option
    {
        value = true,
        required = false,
        bytes = 57859,
        description = "Installs ESD",
        tooltip = "current distributions do not include this library anymore",
        Setup.File
        {
             allowoverwrite = true,
             source = "base:///libesd-alsa0_0.2.36-3_i386.tar.xz/",
        },
    },
}

