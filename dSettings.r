	��V/Jh�  8��              �                                 RZ  06AC001Butf-8 MAIN .\dSettings.w,,INPUT pcSettingsFile CHARACTER,OUTPUT plSuccess LOGICAL PROCEDURE initializeObject,, PROCEDURE enable_UI,, PROCEDURE disable_UI,, PROCEDURE btnOkChoose,, FUNCTION setRegistry,CHARACTER,INPUT pcSection CHARACTER,INPUT pcKey CHARACTER,INPUT pcValue CHARACTER FUNCTION setLinkInfo,LOGICAL,INPUT pcFieldName CHARACTER,INPUT pcValue CHARACTER FUNCTION setFilterFieldColor,LOGICAL,INPUT phWidget HANDLE FUNCTION resolveOsVars,CHARACTER,INPUT pcString CHARACTER FUNCTION isFileLocked,LOGICAL,INPUT pcFileName CHARACTER FUNCTION isDefaultFontsChanged,LOGICAL, FUNCTION getUsername,CHARACTER, FUNCTION getDatabaseName,CHARACTER,INPUT pcConvert CHARACTER,INPUT pcDatabaseName CHARACTER FUNCTION getTableList,CHARACTER,INPUT pcDatabaseFilter CHARACTER,INPUT pcTableFilter CHARACTER,INPUT plShowHiddenTables LOGICAL,INPUT pcSortField CHARACTER,INPUT plAscending LOGICAL FUNCTION getRegistry,CHARACTER,INPUT pcSection CHARACTER,INPUT pcKey CHARACTER FUNCTION getReadableQuery,CHARACTER,INPUT pcQuery CHARACTER FUNCTION getQuery,CHARACTER,INPUT pcDatabase CHARACTER,INPUT pcTable CHARACTER,INPUT piQuery INTEGER FUNCTION getProgramDir,CHARACTER, FUNCTION getPrimaryFields,CHARACTER,INPUT pcDatabaseName CHARACTER,INPUT pcTableName CHARACTER FUNCTION getOsErrorDesc,CHARACTER,INPUT piOsError INTEGER FUNCTION getMaxLength,INTEGER,INPUT pcSection CHARACTER FUNCTION getMatchesValue,CHARACTER,INPUT hFillIn HANDLE FUNCTION getLinkInfo,CHARACTER,INPUT pcFieldName CHARACTER FUNCTION getKeyList,CHARACTER, FUNCTION getImagePath,CHARACTER,INPUT pcImage CHARACTER FUNCTION getDatabaseList,CHARACTER, FUNCTION formatQueryString,CHARACTER,INPUT pcQueryString CHARACTER,INPUT plExpanded LOGICAL        �  �"              �O  ���      �
  ) H2  x �8  �  �9  � d;           �>  x  ? �D  �
ISO8859-1                                                        �  �           �          `           t<            �	 � Z�   $            �                                             PROGRESS                         �     `    X� � ��    �                 ,     `    X� � �o    �             �      T   `   q X 	 	q v�    <	   q          �      �   `   � X* D� N�    h   �          D	    �	  �   `   UX� U��    (   U         �    �  �   `   �X� ��2�       �         4    L  4   `   �X �R>    h   �             4       `   �X\ t�=�    �   �         p    �  v   �   l   �        �     > ��	 p                   >�� x     L�d ��                                                                                                                                                                                                                                                                                                                                                     d   t   �   �   �   �   �   �   �   �       $  4  D  T  d  t  �  �  �  �  �  �      d   t   �   �   �   �   �   �   �   �      $  4  D  T  d  t  �  �  �  �  �  �                      hpx�            ����                                cField  x(8)    cField      cValue  x(8)    cValue      �  ���������       �          �   i     	                                                        ����            ����            �            $,4            8@HL            P\dh            lx��                                cTableName  x(22)   Table       cDatabase   x(10)   DB      cShowDatabase   x(10)   DB      cTableDesc  x(8)    Desc        lHidden yes/no  H   no  iNumQueries zzzzz   #   0   tLastUsed   99-99-9999  Last Used   ?   �  ���������      �    �          �   i  i     	 	    % 0 : H S [ g                                   t���            ����            ����            ����                                cDatabase   x(8)    cDatabase       cTable  x(8)    cTable      iQueryNr    ->,>>>,>>9  iQueryNr    0   cQueryTxt   x(8)    cQueryTxt       �  ���������           �          �   i     	    0 y � �                                                	      
                                                       
      
              ����            ����            ����            ���                          $08@            DLT\            `lt|            ����            ����            ����            ����                         (0<            @LT`            dt|�            ����            ����            ����            �                                 lShow   yes/no      no  iOrder  >>>>>9  Order   0   cFieldName  x(40)   Name        cFullName   x(40)   Name        cDataType   x(16)   Type        cInitial    x(8)    Initial     cFormat x(24)   Format      cFormatOrg  x(8)    Format      cLabel  x(24)   Label       iOrderOrg   ->>,>>9.99  iOrderOrg   0   iExtent ->,>>>,>>9  iExtent 0   lPrimary    yes/no  Pr  no  lVisible    yes/no  Pr  no  lMetaField  yes/no  lMetaField  no  lDataField  yes/no  lDataField  no  cFilterValue    x(8)    cFilterValue        cNewValue   x(256)  New value       cOldValue   x(256)  Old value       hColumn ->>>>>>>>>9 hColumn ?   hFilter ->>>>>>>>>9 hFilter ?   �  �  ���������                  ��      �          �   i     	    � � � � � � � � � � � � $1;EM                                      8DLT            Xdlt            x���            ����            ����                                cIndexName  x(20)   Name        cIndexFlags x(14)   Flags       cIndexFields    x(80)   Fields      cFieldList  x(80)   Field List      lIndexActive    yes/no  lIndexActive    no  �  ���������     �     �          �   i     	    ]ht��  
                    ����            ����                                hWindow ->>>>>>>>>9 hWindow ?   iLockCounter    ->,>>>,>>9  iLockCounter    0   �  ����������      �          �   i     
	    ��      
      
              ����            ����            ���                                cFieldName  x(8)    cFieldName      hFieldHandle    ->>>>>>>>>9 hFieldHandle    ?   hColumnHandle   ->>>>>>>>>9 hColumnHandle   ?   �  ��������� ��    �    �    �          �   i     i     i     	 
	 
	    � ��                                              4DP`            dt|��          �����          ���           $0            4@HXT                              iConnectionNr   ->,>>>,>>9  iConnectionNr   0   cLogicalName    x(20)   cLogicalName    Logical Name        cDescription    x(28)   cDescription    Description     cDatabaseName   x(20)   cDatabaseName   Database        cParameters x(8)    cParameters     lConnected  yes/no  lConnected  Con no  �  ���������           �          �   i     	    ��".  ��                                   �      ����                      undefined             �    L <                  ��\      �,S      O ��    e�      O ��    R�      O ��    ��    formatQueryString       l   �   9     CHARACTER,INPUT pcQueryString CHARACTER,INPUT plExpanded LOGICAL    getDatabaseList �   �   �  K     CHARACTER,  getImagePath    �     , [     CHARACTER,INPUT pcImage CHARACTER   getKeyList    P  p h
     CHARACTER,  getLinkInfo \  |  � s     CHARACTER,INPUT pcFieldName CHARACTER   getMatchesValue �  �  �      CHARACTER,INPUT hFillIn HANDLE  getMaxLength    �    , �     INTEGER,INPUT pcSection CHARACTER   getOsErrorDesc    P  t �     CHARACTER,INPUT piOsError INTEGER   getPrimaryFields    `  �  � �     CHARACTER,INPUT pcDatabaseName CHARACTER,INPUT pcTableName CHARACTER    getProgramDir   �    ,	 �     CHARACTER,  getQuery      8  X
 �     CHARACTER,INPUT pcDatabase CHARACTER,INPUT pcTable CHARACTER,INPUT piQuery INTEGER  getReadableQuery    D  �  � �     CHARACTER,INPUT pcQuery CHARACTER   getRegistry �  �   �     CHARACTER,INPUT pcSection CHARACTER,INPUT pcKey CHARACTER   getTableList      T  x �     CHARACTER,INPUT pcDatabaseFilter CHARACTER,INPUT pcTableFilter CHARACTER,INPUT plShowHiddenTables LOGICAL,INPUT pcSortField CHARACTER,INPUT plAscending LOGICAL getDatabaseName d    < �     CHARACTER,INPUT pcConvert CHARACTER,INPUT pcDatabaseName CHARACTER  getUsername (  �  �      CHARACTER,  isDefaultFontsChanged   �  �  �      LOGICAL,    isFileLocked    �  �   /     LOGICAL,INPUT pcFileName CHARACTER  resolveOsVars   �  ,  P <     CHARACTER,INPUT pcString CHARACTER  setFilterFieldColor <  t  � J     LOGICAL,INPUT phWidget HANDLE   setLinkInfo �  �  � ^     LOGICAL,INPUT pcFieldName CHARACTER,INPUT pcValue CHARACTER setRegistry �    8 j     CHARACTER,INPUT pcSection CHARACTER,INPUT pcKey CHARACTER,INPUT pcValue CHARACTER   T @        D        � ߱  �$ �����        x @        h        � ߱  �$ �����        �g �       �6�              t    TD  ��            	d      tT      O ��    e�      O ��    R�      O ��    ��      � }    ��                      ��        �          ����                                      �              g              
g 	       �"�	             �	    d	T	  ��            t	      �T      O ��    e�      O ��    R�      O ��    ��      / �	                 3 ���   ��                      ��        �          ����                          	            �	              g             @g 0
       �"              �
    �
x
  ��            !�
      HT      O ��    e�      O ��    R�      O ��    ��      w �
  �
3 ���   3 ���   ��                      ��        �          ����                          <
            �
              g             � /LT    4 ���   $ 0h���        ,@               � ߱          �    ��  ��            5:       ��S    H 5�  O 5  ��      O 5  ��    / 7                  3 ��4(/ 8                  3 ��L  k 98          ��    �     / ;`                 3 ��lbtnOkChoose   h        
 �                     �     disable_UI  t�                �                     �
     enable_UI   ��                �                    �	     initializeObject    �(         �   �                  ��      ����   �                                 %              %              � +# � l? � �4 �         I%               �        �%              % 	    END-ERROR p%     btnOkChoose %      start   "       ,   � 
�        
�         � 
%   
           
�         � 
�    % 	    enable_UI _%     initializeObject ip% 
    disable_UI �              � G
           � R      $          �         �              � G
           � h      $          �         �              � G
           � ~      $          �         �              � G
           � �      $          �         �              � G
           � �      $          �         �              � G
           � �
           �        B�              � G
           � �           �     	   B�              � G
           � �           �     
   B�              � G
           � �           �        B�         �              � G
           � �            o%   o           �              � G
           � �            o%   o           �              � G
           �             o%   o           �              � G
           �             o%   o           �         �              � G
           �             o%   o           �              � G
           � '            o%   o           �              � G
           � 9            o%   o           �              � G
           � L            o%   o           �              � G
           � c            o%   o           �              � G
           � y            o%   o           �              � G
           � �            o%   o           �              � G
           � �            o%   o           �              � G
           � �            o%   o           �              � G
           � �            o%   o           �              � G
           � �            o%   o           �              � G
           � �            o%   o           �              � G
           �             o%   o           �              � G
           �             o%   o           �              � G
           � 5            o%   o           �              � G
           � M            o%   o           �         "          " 
  $T� f %               " 
  ip    " 
  $T� x
   0        " 
  �  � � T   %              " 
  �S� �     %              %                   " 
     %                  " 
     �     " 
     �              � �      ,     T    " 
     " 
  _           o%   o           %              "   _"   ip"   _"   ip"   vS"      "   _"      "   _"      "   _"   �S"   -  �        B"    �         � <    �              � G
           � R �         � <    �              � G
           � h �         � <    �              � G
           � ~ �         � <    �              � G
           � � �         � <    �              � G
           � � �        B�              � G
           � �
 �     	   B�              � G
           � � �     
   B�              � G
           � � �        B�              � G
           � �           �     L <   ��            D�\      d�S      O ��    e�      O ��    R�      O ��    ��            �           ��             P�       T       Pl � � R�    � � S�    � � T,    � � U�    � � V�    � � X(    � Yt    � Z�    � [    � ](l    4 ��X        t          ��             ^c       �T       ^0�� _h    �� `�    �� a      � bX    � e��    4 ���        �          ��             f|       �T       f�� h�    � i     � jX    ,� k�    8� l�    D� mH    P� n�    \� q�    h� r8    t� s�    �� t�    �� u(	    �� xx	    �� y�	    �� z
      � {h
    t ~�    4 ���
                  ��             �       �T       �� �<��                             3 ���
        �    ��  ��             ���     �T    � �D  O ��  e�      O ��  R�      O ��  ��       �   
           � ߱  �\ �����        , ���    4 ���
  $ ����        �
    
           � ߱  P �8@    4 ��  O ��� ��       �\d    4 ��  $ �x���        0    
           � ߱  �P � ��    �  L          ��      0       ��       ��S       ��  $ �����        �    
           � ߱  D$ �(���        �    
           � ߱    4 ���  � �    l               � ߱    $ �X���          >��
      �� �T                                                                 $   4   D          $   4   D          
     ��                      ��        �           ��                    ����                              l     L <   ��            ��\       X�S      O ��    e�      O ��    R�      O ��    ��       ��� |         ��                      ��        �          ����                              �     L <   ��            ��\       ��S      O ��    e�      O ��    R�      O ��    ��    ��    ��    ��    ��    ��    ��    ��    ��    �� 	   �� 
   ��    �    �      � ߱  �Z �l  �          �      �       �      �      �      �      �      �      �      �      � 	     � 
     �      �      �      �      �      � ߱    h ��  �          ��                      ��        �          ����                              �     L <   ��            ��\      �S      O ��    e�      O ��    R�      O ��    ��            �           ��             ��       pT       �l � $ �� ���        ,@               � ߱  $�� ���        H@        8       � ߱  @$�$���        �@        �       � ߱  p$�T���        �@        �       � ߱  �$�����        ,@               � ߱  �$�����        x@        h       � ߱   $�����        �@        �       � ߱  0$����        @        �       � ߱  `$�D���        D@        4       � ߱    $�t���        �@        t       � ߱    >�� �     �� �                                      ��                      ��        �          ����                        �   0d d     t   �8�a,  � �       �`                          � z                                 
 !       0                                             @ 0� F                      ,           	      @        8  � �
d                                     	  G   P 0� F                      4              O   �           ]bg D  ��Q                     <              }   �-	       8  P  �d                                     ?	  G 
 < 0P  �                   �                 �   � D 0P 2 r                                    �   �M	       D 0P F r                                       �h	       D 0P n r                                    *   ��	       D 0P � r                                    �   ��	       8  � �d                                     �	  G 
 < 0� F                                  
   �    8  � �d                                     
  G 
 < 0� F  	                                
   �    8  � Dd                                     /
  G   P 0� F  
                                   �   �           ��� D 0P                                     g   �B
       D 0P "                                    B   �b
       D 0P 6	                                    W   �x
       @ 0�^K                               �
      I        @ 0�^K                               �
      J        4 0
 # !1                   �                0                                                                    TXS ttLinkInfo cField cValue ttTable cTableName cDatabase cShowDatabase cTableDesc lHidden iNumQueries tLastUsed ttQuery cTable iQueryNr cQueryTxt ttField lShow iOrder cFieldName cFullName cDataType cInitial cFormat cFormatOrg cLabel iOrderOrg iExtent lPrimary lVisible lMetaField lDataField cFilterValue cNewValue cOldValue hColumn hFilter ttIndex cIndexName cIndexFlags cIndexFields cFieldList lIndexActive ttWindowLock hWindow iLockCounter ttFilter hFieldHandle hColumnHandle ttConnection iConnectionNr cLogicalName cDescription cDatabaseName cParameters lConnected FORMATQUERYSTRING GETDATABASELIST GETIMAGEPATH GETKEYLIST GETLINKINFO GETMATCHESVALUE GETMAXLENGTH GETOSERRORDESC GETPRIMARYFIELDS GETPROGRAMDIR GETQUERY GETREADABLEQUERY GETREGISTRY GETTABLELIST GETDATABASENAME GETUSERNAME ISDEFAULTFONTSCHANGED ISFILELOCKED RESOLVEOSVARS SETFILTERFIELDCOLOR SETLINKINFO SETREGISTRY pcSettingsFile plSuccess gcDB gcTable gcFileName gcLastFile gcFileViewCmd glNoRecordsWarning gcSessionNumericFormat gcSessionDateFormat glAborted strDump BtnCancel BtnOK btnRawEdit direct editing of the settings file cbDoubleClick DUMP EDIT VIEW what to do when you double click on a record in the data browse cbViewType HTML TXT XLS ficSettingsFile fiMaxColumns fiMaxQueryHistory RECT-5 tgAddDataColumnForRecid tgAddDataColumnForRowid tgAutoExpandQueryEditor tgResetBrowseColumns tgResetMessages tgResetWindowPosition tgSaveDataFilters save and restore the filter values on the databrowse tgShowHiddenTables frSettings DataDigger Settings X(256) yes/no ->,>>>,>>9 END-ERROR cLine lHelpSectionFound cMessageList iMessage DataDigger AddDataColumnForRecid AddDataColumnForRowid SaveDataFilters AutoExpandQueryEditor ShowHiddenTables MaxColumns MaxQueryHistory ViewType DataDoubleClick Window:height Window:width Window:x Window:y ColumnSortFields ColumnWidth:lShow ColumnWidth:iOrder ColumnWidth:cFieldName ColumnWidth:cDataType ColumnWidth:cFormat ColumnWidth:cLabel ColumnSortTables ColumnWidth:cTableName ColumnWidth:cDatabase ColumnWidth:iNumQueries ColumnWidth:tLastUsed ColumnSortIndexes ColumnWidth:cIndexName ColumnWidth:cIndexFlags ColumnWidth:cIndexFields [DataDigger:help] *:answer=* , = DataDigger:help BTNOKCHOOSE DISABLE_UI ENABLE_UI lSetting INITIALIZEOBJECT iPrim iQueryPrim default iFieldHandle iColumnHandle &Raw Edit &Double click on data record Save Data Filters Settings file Add Data Column For &Recid Add Data Column For R&owid Automatically &Expand The Query Editor After Right Click On Index Show &Hidden Tables In Table Browse Maximum nr of &columns in data browser Maximum nr of &queries to save Default &View Type Reset &Window Position And Size Reset &Browse Columns Reset &Messages OK Cancel $ �
<     �    (                   	 D                   , `                   !| 
    t      cLine   � 
    �      lHelpSectionFound   � 
    �      cMessageList      
    �      iMessage    H  6    d     �       btnOkChoose PRSTUVXYZ[]^_`abcefhijklmnqrstuxyz{|~����������������� �          �      disable_UI  ��l�          �      enable_UI   ���        �     lSetting    �    �    �      initializeObject    �������������  �|
    ��	�	        pDP ttLinkInfo  `     h     cField  cValue  x� ttTable �     �     �     �     �     �           cTableName  cDatabase   cShowDatabase   cTableDesc  lHidden iNumQueries tLastUsed   h ttQuery <     H     P     \     cDatabase   cTable  iQueryNr    cQueryTxt   �px ttField            (     4     @     L     X     `     l     t     �     �     �     �     �     �     �     �     �  
   �  
   lShow   iOrder  cFieldName  cFullName   cDataType   cInitial    cFormat cFormatOrg  cLabel  iOrderOrg   iExtent lPrimary    lVisible    lMetaField  lDataField  cFilterValue    cNewValue   cOldValue   hColumn hFilter l�  ttIndex (     4     @     P     \     cIndexName  cIndexFlags cIndexFields    cFieldList  lIndexActive    �t� ttWindowLock    �  
   �     hWindow iLockCounter    �� ttFilter    �     �  
   �  
   cFieldName  hFieldHandle    hColumnHandle      ttConnection    L     \     l     |     �     �     iConnectionNr   cLogicalName    cDescription    cDatabaseName   cParameters lConnected  �   �     gcDB    �   �     gcTable �   �     gcFileName           gcLastFile  ,        gcFileViewCmd   P  	 <     glNoRecordsWarning  x  
 `     gcSessionNumericFormat  �   �     gcSessionDateFormat �   �     glAborted   �   �     cbDoubleClick   �   �     cbViewType          ficSettingsFile 4   $     fiMaxColumns    X   D     fiMaxQueryHistory   �   h     tgAddDataColumnForRecid �   �     tgAddDataColumnForRowid �   �     tgAutoExpandQueryEditor �   �     tgResetBrowseColumns    	   	     tgResetMessages @	   (	     tgResetWindowPosition   d	   P	     tgSaveDataFilters        t	     tgShowHiddenTables  �	     �	  pcSettingsFile         �	  plSuccess   �	    X�	  ttLinkInfo  �	  X�	  ttTable 
  X�	  ttQuery 
  X
  ttField ,
  X$
  ttIndex H
  X8
  ttWindowLock    `
  XT
  ttFilter        Xl
  ttConnection    ��/05789:;    ɲ   .\DataDigger.i �
3r   .\dSettings.w  