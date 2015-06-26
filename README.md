# Delphi solutions and examples

**This project ABANDONED! There is no wiki, issues and no support. There will be no future updates. Unfortunately, you're on your own.**

Here you have various, very old and untested, solutions and examples for Delphi. Last time I was dealing with this examples around 2008, so yeah -- they're quite old and pretty useless. In addition, many of them **are in Polish** what makes them even more useless for non-Polish speakers. It was a dump of Delphi examples, collected around 1999-2003 and left untouched until I decided to quit Delphi at all.

Most of these files were written or gathered in period of 1996-2003, that is during regime of Delphi 1.0-4.0 and Windows 95 / XP. Wherever it was possible I tested for compliance with my Windows 7, but **only as for running `.exe` files** and nothing more. I don't have any copy of Delphi currently installed and therefore I'm unable to test source codes itself.

**95% of these files, examples and project are NOT authored by me. It is up to you to find information about proper author and possible license, if you want to use any of these files in your own projects**!

A very short and limited list of descriptions:

- `agitacja_game` -- a deadly-old (1998) Polish strategic game for two players; set your pawns against your enemy, but be careful, because if your agitators comes to close to your enemy's ones, they'll turn side and become enemy's agitators,

- `banners_animation` -- very simple and very old (1998) banner animation (simple fade effect between images); has slide left/right, shutter horizontal/vertical and unroll effects... and A/V error when exiting! :>,

- `calmira_shell_replacer` -- very-very old (1996-1997) sources of [Calmira][https://en.wikipedia.org/wiki/Calmira] shell replacer for Windows 3.1 and 95; in case, you'd like to write your own Windows shell; more information [here](http://calmira.net/) or [here](http://calmira.de/),

- `column_click` -- an example implementation of column click event for list view (sorting etc.),

- `console_application` -- an example console application written in Delphi, 15 years old (2000),

- `control_sums` -- implementation various Polish control sums checking (2001), including PESEL, NIP, Regon, ISBN and bank account number (only old, short, not any more used Polish numbers + unimplemented example algorithm for calculating IBAN),

- `convert_exe_to_dpr` -- as name says, it is `.exe` to `.dpr` converter (**not** decomplier!), which can extract all project forms and data modules with all assigned properties and events, but without code of course (it is not a decompiler), which can save some time in case of real crisis; it was tested for Delphi 1.0-4.0 and C++Builder 3.0 projects and is most likely pretty useless for all newer versions,

- `convert_nrg_to_iso` -- pure Delphi image files converter, able to convert Nero images to `.iso` files,

- `convert_pas_to_html` -- very old (1998) class descriptor, which can convert your `.pas` file to `.html` document as a begin process for documentation writing; notice date (1998!) and imagine, that produced files can be far, far beyond todays HTML 5 standards,

- `custom_shape_form` -- a toy to create non-rectangular window for your program, maybe matching shape of your cool logo?; I'm really surprised, that it works in Windows 7,

- `delphi_and_matroska` -- Matroska (`.mkv`) meta tag reader; more information [here](http://www.alexander-noe.com/),

- `delphi_tlbs` -- an OLE automation files for Office (all programs and all versions 97-2010), necessary for controlling Office program from your Delphi application; I only tested Excel 2007 automation and it turned out to be deadly powerful; I could do actually everything in Excel, including generating extremely complex sheets and diagrams and saving them as `.xlsx` files,

- `dividing_files` -- I have absolutely no idea, what is this?

- `downloading_files` -- OpenOffice.org dictionaries downloader, which can be used as an example for implementing download of any files in your Delphi application,

- `eldos_sound` -- first and probably one of most famous audio library for Delphi allowing to enrich your application with support for playing `.mp1`, `.mp2`, `.mp3`, `.ogg`, `.wav` and `.wma`; it can use DirectSound for simultaneously playing more than one file/sound at once and has also `Play to .wav` file feature, which makes it actually a file converter allowing you to convert all mentioned audio formats to `.wav` format; tip -- if you get nasty error messages when running `Player.exe` then try to install missing libraries before, by running `WMASetup.exe`,

- `encoding_mp3` -- Delphi application, that uses BladeEnc DLL for encoding `.wav` files to `.mp3`,

- `encrypt` -- cipher libraries, implementations and examples for Delphi, including _ElAES_, _MD5_, _Rot13_, _Multi-ROT_ and some others,

- `file_type_registration` -- an example of how to register own extension in Windows; useful for setups and applications that are able to open, save and operate on own file types,

- `flash_demo` -- simple, example Flash player for Delphi,

- `get_ip_address` -- an example on reading username of currently logged in (to Windows) user and local IP address; in Polish; don't be surprised, after running and clicking the button, you'll see absolutely no effect, however a file named `c:\IP.txt` should be created with all above mentioned information; work's of course for LAN IPs only,

- `get_version_info` -- an example on reading `.exe` file's version information,

- `help-like_search` -- nearly fifteen (2001) years only Polish example of help-like seeker; type anything and closest match will be selected on list below,

- `hit_the_rat` -- a **marvellous** game written in Delphi, in which you have to hit as many rats as you can during one minute; offers outstanding (as for its times -- 1999) graphic design, UI and gameplay; even though quite old, still can bring some knowledge to beginners in Delphi gaming industry,

- `jpeg` -- in case you don't know, there was **no** JPEG support in early versions of Delphi and you were limited to `.bmp` only; this piece of code (Delphi implementation + C sources) fills this gap,

- `lzw` -- same as above; ready to compile Delphi sources for LZSS (LZ77) compression algorithm, which has no native in-Delphi support,

- `miniamp` -- an example of MP3 player (XAudio engine) in Delphi,

- `move_objects_with_mouse` -- very old and thus very early example of drag-n-drop technique for very early versions of Delphi,

- `mpeg_player` -- Delphi implementation of native Windows support for playing `.avi`, `.mpg`, `.mid` and `.wav` files; in Polish and containing some nasty bugs (try to hit `Cancel` in `Open` dialog),

- `only_one_instance` -- how to force user to run only one instance of your application and how to pass run parameters from another copy to the one already running,

- `outlook` -- how to implement old-Outlook-like toolbar without extra components, only using native Delphi components,

- `post_to_newsgroup` -- an example for senting e-mails/posts to some Internet forums; in Polish and old,

- `program_shortcuts` -- Polish implementation allowing Delphi applications to create desktop shortcuts to any program or file, 

- `structured_storage` -- a few examples and documents on creating storage files, that is a files that can contain any number of other files; full support for managing such files (reading, writing, browsing); it uses a very weak or even no compression algorithm, so you're not going to write another WinRAR using this example; but, since all operations are in-memory on-the-fly operations, you may consider this code for creating own, complex container files for your application,

- `two_apps_communication` -- how to communicate between two totally separated Delphi applications,

- `windows_explorere_like_file_list` -- a nearly complete Delphi example of writing own Windows Explorer-like file browser,

- `zip` -- various zip/unzip components, libraries, implementations and examples.

**This project ABANDONED! There is no wiki, issues and no support. There will be no future updates. Unfortunately, you're on your own.**