/*----------------------------------------------------------------------------
              
                (c) Copyright 2018

 Naam         : statusMessage.i
 Pakket       : DataDigger
 Omschrijving : Tonen sttaus message
 Parameters   : mode  m i-ch  show, hide
                tekst m o-ch  te tonen status message
 Opmerkingen  : nvt
 
 -----------------------------------------------------------------------------
 versie datum      door omschrijving
 ------ ---------- ---- ------------------------------------------------------
  1.0   21-09-2018  JAG Initieel aangemaakt
----------------------------------------------------------------------------*/

&if defined(mode) = 0 &then
  &message {0}: mode is a mandatory argument.
&endif

&if defined(tekst) = 0 &then
  &scoped-define tekst ?
&endif

&if "{&mode}" = "show" &then
  define variable winCompile as handle no-undo.

  define frame infoFrame
    "{&tekst}" view-as text size 43 by .62 at row 1.48 col 3 
   with 1 down no-box keep-tab-order overlay side-labels 
   no-underline three-d at col 1 row 1 size 45.6 by 2.14.

  /* *************************  Create Window  ************************** */
  create window winCompile assign
         title         = "DataDigger"
         /* <JAG> - Support V9 (verbetering) - betere positionering */
         x             = 100
         y             = 150
         /* </JAG> - Support V9 (verbetering) */
         height        = 2.14
         width         = 45.6
         status-area   = no
         message-area  = no
         sensitive     = yes.
  etime(yes).

  /* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
  assign current-window                = winCompile.
         this-procedure:current-window = winCompile.
         default-window = winCompile.

  /* Start the timer. We want the message to appear at least a certain time 
   * to avoid flashing of windows 
   */
  etime(yes).
  
  /* <JAG> - Support V9 (verbetering) - betere positionering */
  assign
    winCompile:x  = (session:width-pixels / 2)  - (winCompile:width-pixels / 2)
    winCompile:y  = (session:height-pixels / 2) - (winCompile:height-pixels / 2).
  /* </JAG> - Support V9 (verbetering) */
  
  view frame infoFrame in window winCompile.
  view winCompile.
&endif

&if "{&mode}" = "hide" &then
  delete widget winCompile.
&endif
