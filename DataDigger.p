&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12
&ANALYZE-RESUME
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Procedure 
/*------------------------------------------------------------------------
    File        : 
    Purpose     :

    Syntax      :

    Description :

    Author(s)   :
    Created     :
    Notes       :
  ----------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* <JAG> - Support V9 (compile-time) */
&if integer(entry(1, proversion, ".")) >= 10 &then
  &scoped-define datetime-v datetime
  &scoped-define datetime-f "99-99-9999 HH:MM:SS"
  &scoped-define now        now
  &scoped-define time-now   INTEGER(TRUNCATE(MTIME(pDateTime) / 1000, 0 ))
&else
  &scoped-define datetime-v date
  &scoped-define datetime-f "99-99-9999"
  &scoped-define now        today
  &scoped-define time-now   time
&endif
/* </JAG> - Support V9 (compile-time) */

define variable giNumDiggers as integer   no-undo.
define variable gcProgramDir as character no-undo.

define temp-table ttOsFile no-undo
  field cFileName     as character      format 'x(30)'
  field cFileType     as character      format 'x(8)'
  field dtModified    as {&datetime-v}  format {&datetime-f}  /* <JAG> - Support V9 (compile-time) - </JAG> */
  field iModified     as integer        format '>>>>>9'       /* <JAG> - Support V9 (compile-time) - </JAG> */
  field cModified     as character      format 'x(19)'
  field cFullPathname as character      format 'x(60)'
  field cBaseName     as character      format 'x(40)'
  field cRecompile    as character      format 'x(20)'

  index iPrim is primary cBaseName cFileType
  .

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure
&Scoped-define DB-AWARE no



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&IF DEFINED(EXCLUDE-getTimeStamp) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getTimeStamp Procedure 
FUNCTION getTimeStamp RETURNS CHARACTER
  ( input pDateTime as {&datetime-v}    /* <JAG> - Support V9 (compile-time) - </JAG> */
  , input pTime     as integer          /* <JAG> - Support V9 (compile-time) - </JAG> */
  ) FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-isRecompileNeeded) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD isRecompileNeeded Procedure 
FUNCTION isRecompileNeeded RETURNS logical
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Procedure
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: CODE-ONLY COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Procedure ASSIGN
         HEIGHT             = 9.71
         WIDTH              = 46.2.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure 


/* ***************************  Main Block  *************************** */


run initializeObject.

/* Find out if a recompile is needed (change in source files / newer version / older version) */
if isRecompileNeeded() then 
do:
  publish "timerCommand" ("start", "Recompile").
  run recompileSelf.
  publish "timerCommand" ("stop", "Recompile").

  publish "timerCommand" ("start", "startDiggerLib").
  run startDiggerLib(input true).
  publish "timerCommand" ("stop", "startDiggerLib").
end.

/* Notifications of starts and stops of DataDigger windows */
subscribe to 'DataDigger' anywhere. 

/* <JAG> - Support V9 (verbetering) - voor hergebruik */
{ statusMessage.i
  &mode  = show
  &tekst = "Digging the schema, please wait"
  }
/* </JAG> - Support V9 (verbetering) */

run value(gcProgramDir + 'wDataDigger.w') persistent.

/* <JAG> - Support V9 (verbetering) - voor hergebruik */
{ statusMessage.i &mode = hide }
/* </JAG> - Support V9 (verbetering) */

/* Sit back and relax */
wait-for close of this-procedure. 
if session:first-procedure:file-name matches '*DataDiggerLib.p' then quit.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&IF DEFINED(EXCLUDE-DataDigger) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DataDigger Procedure 
PROCEDURE DataDigger :
/*------------------------------------------------------------------------
  Name         : DataDigger
  Description  : Notifications of starts and stops of DataDigger windows 
  ----------------------------------------------------------------------*/
  define input parameter piChange as integer. 

  giNumDiggers = giNumDiggers + piChange.
  if giNumDiggers = 0 then apply 'close' to this-procedure.

END PROCEDURE. /* DataDigger */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getSourceFiles) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE getSourceFiles Procedure 
PROCEDURE getSourceFiles :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  define input  parameter pcDirectory as character   no-undo.
  define output parameter table for ttOsFile.

  define variable cAttributes    as character   no-undo.
  define variable cExtension     as character   no-undo.
  define variable cFileName      as character   no-undo.
  define variable cFullPathName  as character   no-undo.

  define buffer bOsFile for ttOsFile.

  /* Read contents of progdir */
  empty temp-table bOsFile.
  input from os-dir (pcDirectory).

  fileLoop:
  repeat:
    import cFileName cFullPathName cAttributes.
    
    /* Only files */
    if not cAttributes begins 'F' then next fileLoop. 
    cExtension = entry(num-entries(cFileName, '.'),cFileName,'.').
  
    /* Only valid file types (src + obj) */
    if lookup(cExtension,'r,i,w,p,cls') = 0 then next fileLoop. 

    /* get info modified */
    file-info:file-name = cFullPathName.
  
    /* Create it */
    create bOsFile.
    assign
      bOsFile.dtModified    = DATE(string(file-info:file-mod-date))                 /* <JAG> - Support V9 (compile-time) - </JAG> */
      bOsFile.iModified     = file-info:file-mod-time                               /* <JAG> - Support V9 (compile-time) - </JAG> */
      bOsFile.cModified     = getTimeStamp(bOsFile.dtModified, bOsFile.iModified)   /* <JAG> - Support V9 (compile-time) - </JAG> */
      bOsFile.cFileName     = cFileName
      bOsFile.cBaseName     = substring(cFileName,1,r-index(cFileName,'.') - 1)
      bOsFile.cFullPathname = cFullPathName
      bOsFile.cFileType     = cExtension
      .
    
  end.
  input close.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-initializeObject) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE initializeObject Procedure 
PROCEDURE initializeObject :
/*------------------------------------------------------------------------
  Name         : initializeObject
  Description  : Initialize all kind of things. 
  ----------------------------------------------------------------------
  16-04-2010 pti Created
  ----------------------------------------------------------------------*/
  
  define variable cDebuggerStart as character no-undo. 
  define variable cDebuggerPath  as character no-undo. 

  /* Where are we running from? */
  if '{&uib_is_running}' <> '' then 
    gcProgramDir = 'c:\temp\DD\'.
  else do:
    file-info:file-name = this-procedure:file-name.
    gcProgramDir = substring(file-info:full-pathname,1,r-index(file-info:full-pathname,'\')). 
  end.

  /* Add program dir to propath (if not already in) */
  if search('datadigger.i') = ? then
    propath = gcProgramDir + ',' + propath.

  /* If the general ini file does not exist, create it */
  if search(gcProgramDir + 'DataDigger.ini') = ? then
  do:
    output to value(gcProgramDir + 'DataDigger.ini').
    output close. 
  end.

  /* In any case, load it */
  load 'DataDigger' dir gcProgramDir base-key 'ini' no-error.

  /* See if there is a path stored to the dwpdebugger */
  use 'DataDigger.ini'.
  get-key-value section 'debugger' key 'start' value cDebuggerStart.
  get-key-value section 'debugger' key 'path'  value cDebuggerPath.
  use ''.
  
  /* Start debugger if needed */
  if logical(cDebuggerStart) then run value(cDebuggerPath) persistent. 
  publish "timerCommand" ("start", "Startup").

  /* Read all files from program dir. */
  publish "timerCommand" ("start", "getSourceFiles").
  run getSourceFiles(input gcProgramDir, output table ttOsFile).
  publish "timerCommand" ("stop", "getSourceFiles").

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-recompileSelf) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE recompileSelf Procedure 
PROCEDURE recompileSelf :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  define variable cExpectedDateTime  as character no-undo.
  define variable lCompileError      as logical   no-undo.

  define buffer bOsFile for ttOsFile.

  /* <JAG> - Support V9 (verbetering) - voor hergebruik */
  { statusMessage.i
    &mode  = show
    &tekst = "Please wait while DataDigger is recompiled."
    }
  /* </JAG> - Support V9 (verbetering) */

  /* Open log */
  output to value(gcProgramDir + 'DataDigger.log').
  put unformatted 'DataDigger recompile as of ' string({&now}, {&datetime-f}).   /* <JAG> - Support V9 (compile-time) - </JAG> */

  put unformatted skip(1) 'List of current files:'.
  for each bOsFile:

    use 'DataDigger'.
    get-key-value section 'DataDigger:files' key bOsFile.cFileName value cExpectedDateTime.
    use ''.

    display 
      bOsFile.cFileName  column-label 'File name'
      bOsFile.dtModified column-label 'File date'
      cExpectedDateTime  column-label 'Expected' format 'x(19)'
      bOsFile.cRecompile column-label 'Status'
      with width 120 stream-io.
  end.

  /* Delete old .r files */
  put unformatted skip(1) 'Deleting old .r files'.
  for each bOsFile where bOsFile.cFileType = 'r':
    os-delete value(bOsFile.cFullPathname).
  end.
  
  /* Recompile */
  put unformatted skip(1) 'Recompiling'.

  for each bOsFile 
    where bOsFile.cFileType = 'p'
       or bOsFile.cFileType = 'cls'
       or bOsFile.cFileType = 'w':

    message 'Compiling:' bOsFile.cFullPathName.
    compile value(bOsFile.cFullPathName) save.

    if compiler:error then lCompileError = true.
  end.

  /* Reread dir to catch new date/times of .r files */
  run getSourceFiles(input gcProgramDir, output table bOsFile).

  /* Save date/time of all files in INI-file */
  for each bOsFile: 
    use 'DataDigger'.
    put-key-value section 'DataDigger:files' key bOsFile.cFileName value string(bOsFile.cModified).
    use ''.
  end.

  if not lCompileError then 
    put unformatted skip(1) 'All files successfully compiled.'.
  else 
    put unformatted 
      skip(1) 'Error while recompiling (see above). If this is not in one of your own files and' 
      skip    'you have not messed with DataDigger, please report this to patrick@tingen.net'.

  /* Close the log */
  output close. 

  /* Show the window at least two seconds, otherwise it will flash, which is annoying */
  repeat while etime < 2000:
  end.

  if lCompileError then 
    message 'An error occurred while recompiling. ~n~nPlease check "DataDigger.log" in the DataDigger directory.'
      view-as alert-box info buttons ok.

  /* Clean up */
  empty temp-table bOsFile.

  /* <JAG> - Support V9 (verbetering) - voor hergebruik */
  { statusMessage.i &mode = hide }
  /* </JAG> - Support V9 (verbetering) */

end procedure. /* recompileSelf */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-startDiggerLib) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE startDiggerLib Procedure 
PROCEDURE startDiggerLib :
/*------------------------------------------------------------------------
  Name         : startDiggerLib
  Description  : Start DiggerLib if it has not already been started

  If the lib was already started, it might be a lib of a previous version if you
  install DataDigger over a running version. To avoid errors, we get the version 
  of the running instance and see if it matches the version of the window. 
  If not, close all other windows (these are old and if we restart the lib then
  in turn THEY will be out of sync with the lib) and restart the lib.

  ----------------------------------------------------------------------
  21-10-2009 pti Created
  ----------------------------------------------------------------------*/
  
  define input parameter plForcedRestart as logical     no-undo.

  define variable hDiggerLib   as handle      no-undo.
  define variable cLibVersion  as character   no-undo.

  /* Call out to see if the lib has been started for this build nr */
  publish 'DiggerLib' (output hDiggerLib). 

  /* Get version of current lib */
  if valid-handle(hDiggerLib) then
    run getLibVersion in hDiggerLib(output cLibVersion) no-error.


  /* If we MUST restart (after recompile), or if there is a new version, kill the library */
  if plForcedRestart or cLibVersion <> '{&BuildNr}' then
  do:
    /* Publish a close to all open digger windows. The one that issues
     * this publish will not be closed because we are not subscribed yet. 
     */
    publish 'DataDiggerClose'.
    delete procedure hDiggerLib no-error.
    hDiggerLib = ?.
  end.

  /* Now, start the lib */
  if not valid-handle(hDiggerLib) then 
  do:
    run value(gcProgramDir + 'DataDiggerLib.p') persistent set hDiggerLib.
    session:add-super-procedure(hDiggerLib, search-target).
  end.

end procedure. /* startDiggerLib */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

/* ************************  Function Implementations ***************** */

&IF DEFINED(EXCLUDE-getTimeStamp) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getTimeStamp Procedure 
FUNCTION getTimeStamp RETURNS CHARACTER
  ( input pDateTime as {&datetime-v}    /* <JAG> - Support V9 (compile-time) - </JAG> */
  , input pTime     as integer          /* <JAG> - Support V9 (compile-time) - </JAG> */
  ) :  

  /* Return a timestamp in the form "YYYY-MM-DD HH:MM:SS" */

  return 
    substitute('&1-&2-&3 &4'
              , string(year(pDateTime),'9999')
              , string(month(pDateTime),'99')
              , string(day(pDateTime),'99')
              , string(pTime , 'HH:MM:SS' )   /* <JAG> - Support V9 (compile-time) - </JAG> */
              ).

END FUNCTION. /* getTimeStamp */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-isRecompileNeeded) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION isRecompileNeeded Procedure 
FUNCTION isRecompileNeeded RETURNS logical
  ( /* parameter-definitions */ ) :

  define variable lRecompileNeeded  as logical    no-undo.
  define variable cRegistryValue    as character  no-undo.
  define variable cDoRecompile      as character  no-undo.

  define buffer bOsFile for ttOsFile.

  /* <JAG> - Support V9 (verbetering) - niet altijd alles willen hercompileren */
  use 'DataDigger'.
  get-key-value section "DataDigger:preferences" key "DoRecompile" value cDoRecompile.
  use ''.

  if can-do("no,false", cDoRecompile) then
    RETURN NO.
  /* </JAG> - Support V9 (verbetering) */

  /* If we run a version of Progress that does not allow compilation
   * we simply return that no recompile is needed.
   */
  if lookup(progress, 'Full,Query') = 0 then return false. 

  /* Has any of the source files changed since the last run? */
  for each bOsFile where can-do('i,p,w,cls', bOsFile.cFileType):

    use 'DataDigger'.
    get-key-value section 'DataDigger:files' key bOsFile.cFileName value cRegistryValue.
    use ''.

    if cRegistryValue = ? then bOsFile.cRecompile = 'Status unknown'.
    else
    if cRegistryValue <> bOsFile.cModified then bOsFile.cRecompile = 'File modified'.
  end.

  /* Does every source has an object? */
  for each bOsFile where can-do('p,w,cls', bOsFile.cFileType):

    if not can-find(ttOsFile where ttOsFile.cBaseName = bOsFile.cBaseName
                               and ttOsFile.cFileType = 'R') then 
      bOsFile.cRecompile = 'File has no .r'.
  end.

  /* Need to recompile? */
  return can-find(first bOsFile where bOsFile.cRecompile <> '').

end function. /* isRecompileNeeded */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF
