&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* <JAG> - Support V9 (compile-time) - WIDGET-ID niet ondersteund </JAG> */

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */
define input  parameter phParent as handle      no-undo.

/* Local Variable Definitions ---                                       */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of first Frame and/or Browse and/or first Query                 */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS rsRecordExists rsMandatoryFieldMissing ~
tbLoadReadyShowLog tbLoadReadyClose btnLoad 
&Scoped-Define DISPLAYED-OBJECTS rsRecordExists rsMandatoryFieldMissing ~
tbLoadReadyShowLog tbLoadReadyClose 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON btnLoad AUTO-GO DEFAULT 
     LABEL "&Load" 
     SIZE 15 BY 1.14 TOOLTIP "load file contents to the database"
     BGCOLOR 8 .

DEFINE VARIABLE rsMandatoryFieldMissing AS INTEGER 
     VIEW-AS RADIO-SET VERTICAL
     RADIO-BUTTONS 
          "&Skip record", 1,
"&Abort Load", 3
     SIZE 21 BY 1.91 TOOLTIP "how to handle records that already exist" NO-UNDO.

DEFINE VARIABLE rsRecordExists AS INTEGER 
     VIEW-AS RADIO-SET VERTICAL
     RADIO-BUTTONS 
          "&Skip record", 1,
"&Overwrite record", 2,
"&Abort Load", 3
     SIZE 20 BY 2.62 TOOLTIP "how to handle records that already exist" NO-UNDO.

DEFINE VARIABLE tbLoadReadyClose AS LOGICAL INITIAL no 
     LABEL "&Close this window after load" 
     VIEW-AS TOGGLE-BOX
     SIZE 32 BY .81 NO-UNDO.

DEFINE VARIABLE tbLoadReadyShowLog AS LOGICAL INITIAL no 
     LABEL "Show &log after load" 
     VIEW-AS TOGGLE-BOX
     SIZE 24 BY .81 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
     rsRecordExists AT ROW 2.19 COL 41 NO-LABEL
     rsMandatoryFieldMissing AT ROW 6.48 COL 41 NO-LABEL
     tbLoadReadyShowLog AT ROW 10.52 COL 5
     tbLoadReadyClose AT ROW 11.48 COL 5
     btnLoad AT ROW 12.91 COL 69
     "If a record already exists:" VIEW-AS TEXT
          SIZE 25 BY .62 AT ROW 2.19 COL 5
     "If a mandatory field is missing:" VIEW-AS TEXT
          SIZE 29 BY .62 AT ROW 6.48 COL 5
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 135.2 BY 15.29.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
  CREATE WINDOW C-Win ASSIGN
         HIDDEN             = YES
         TITLE              = "Import"
         HEIGHT             = 15.24
         WIDTH              = 135
         MAX-HEIGHT         = 18.91
         MAX-WIDTH          = 200.8
         VIRTUAL-HEIGHT     = 18.91
         VIRTUAL-WIDTH      = 200.8
         RESIZE             = yes
         SCROLL-BARS        = no
         STATUS-AREA        = no
         BGCOLOR            = ?
         FGCOLOR            = ?
         KEEP-FRAME-Z-ORDER = yes
         THREE-D            = yes
         MESSAGE-AREA       = no
         SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW C-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME DEFAULT-FRAME
                                                                        */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON END-ERROR OF C-Win /* Import */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON WINDOW-CLOSE OF C-Win /* Import */
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME tbLoadReadyClose
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL tbLoadReadyClose C-Win
ON VALUE-CHANGED OF tbLoadReadyClose IN FRAME DEFAULT-FRAME /* Close this window after load */
, tbLoadReadyShowLog
DO:
  define variable cLoadReadyAction as character   no-undo.

  if tbLoadReadyClose  :checked then cLoadReadyAction = cLoadReadyAction + ',Close'.
  if tbLoadReadyShowLog:checked then cLoadReadyAction = cLoadReadyAction + ',ShowLog'.

  cLoadReadyAction = replace(cLoadReadyAction,",,",","). 
  cLoadReadyAction = trim(cLoadReadyAction,",").
  if cLoadReadyAction = "" then cLoadReadyAction = "Nothing".

  .setRegistry('LoadAndLoad','LoadReadyAction',cLoadReadyAction).
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK C-Win 


/* ***************************  Main Block  *************************** */

DELETE WIDGET  {&WINDOW-NAME}.
{&WINDOW-NAME} = CURRENT-WINDOW.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
   RUN disable_UI.

/* General procedures for all viewers in the MVC */
{ frLoad.i }

/* Best default for GUI applications is...                              */
PAUSE 0 BEFORE-HIDE.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  
  RUN enable_UI.

  IF NOT THIS-PROCEDURE:PERSISTENT THEN
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI C-Win  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
  THEN DELETE WIDGET C-Win.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI C-Win  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/
  DISPLAY rsRecordExists rsMandatoryFieldMissing tbLoadReadyShowLog 
          tbLoadReadyClose 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE rsRecordExists rsMandatoryFieldMissing tbLoadReadyShowLog 
         tbLoadReadyClose btnLoad 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE getFrameHandle_xxx C-Win 
PROCEDURE getFrameHandle_xxx :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  define output parameter phFrameHandle as handle      no-undo.
  
  phFrameHandle = frame {&frame-name}:handle.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

