/*:VRX         Main
*/
/*
 * Colors 4 HTML (gismo)
 *
 * - history -
 * Version 0.10 (08.Jan.97)
 * > 基本的な機能を搭載。
 * Version 0.11 (09.Jan.97)
 * > `AlwaysCopy' functionの追加。
 * > 設定をInitial Fileに記録する機能の追加。
 * > その他、作り込み... ほぼ第一弾は完成。
 * Version 0.12 (10.Jan.97)
 * > `Always copy'をcheckしても機能しないバグを修正。
 * Version 0.13 (11.Jan.97)
 * > Initial fileの`AlwaysCopy'と`ColorMode'をenable
 * Version 1.00 (13.Jan.97)
 * > Tune up
 * > 公開バージョン。
 * Version 1.01 (14.Jan.97)
 * > ColorListの表示がスムーズになるように修正。
 * Version 1.10 (02.Mar.97) since 04.Feb.97
 * > 文字の前景・背景で色の組み合わせを判断できるように仕様変更。
 * > その他、細かい修正・変更。
 * Version 1.20 (13.Jun.97) 1.19 beta since 28.Apr.97
 * > Tag Template機能の追加。
 * > WindowのFontを変更できるように仕様変更。
 * > 前回使用した設定を保存するように仕様変更(Fore/Back Radio Button, 前景・背景の色)。
 * Version 1.50 (22.Feb.98) 1.49 beta since 16.Aug.97
 * > Hue Sort Functionの実装の準備(start from 16.Aug.97)。
 * > Exit時の色の設定を記憶しない不具合を修正(16.Aug.97)。
 * > Hue/Name Sort Functionの実装(20.Feb.98) since 13.Sep.97。
 *   - Hue/Name sortの実装 (beta 2, 13.Sep.07)
 *   - Saturation/Value sortの実装(beta 3, 04.Oct.97)  
 * 
 *       Special thanks for Hue/Name Sort routine idea and code...
 *               robo@muenchen.org (Robert Boeck)
 *
 * > Install Programを追加。
 * Version 1.51 (01.Mar.98) since 25.Feb.98 
 * > 英語環境でSliederが奇麗に表示できるように修正(24.Feb.98 Version 1.50.a)。
 * > System Proportional Fontで奇麗に表示できるように画面デザインを変更(25.Feb.98 Version 1.50.c)。
 * > FONTを変更するSub Windowを作成(25.Feb.98 Version 1.50.c)。
 * > Ribbon Sliderの色をFixed Color, Dynamic Colorで選択できるように機能追加(01.Mar.98 Version 1.51 beta 1)
 * Version 2.00 (04.Apr.98) since 08.Mar.98
 * > Color Grid Table機能の追加(08.Mar.98 Version 1.59 beta 1)
 *       Special thanks to Hue/Name Sort routine idea...
 *               robo@muenchen.org (Robert Boeck)
 * > Color Grid Table機能作り込み(10.Mar.98 Version 1.59 beta 2,3,4)
 * > ColorNumber Text Areaで値の変更ができるように仕様変更(10.Mar.98 Version 1.59 beta 3)
 * > Sharewareに変更(22.Mar.98 Version 1.59 beta 6)
 * > Tag Templateの機能強化(25.Mar.98 Version 1.59 beta 7)
 *          %c : 選択された色のName/Number
 *          %f : foregroundで選択された色のName/Number
 *          %b : backgroundで選択された色のName/Number
 * Version 2.05 (19.Apr.98) 
 * > Unregistered Versionで起動時にSortが正しくされない不具合を修正(19.Apr.98 Version 2.05)
 * > `G' Buttonのフォントが変更されない不具合を修正(19.Apr.98 Version 2.05)
 * > Color Numberの表示をDecimal(10進数)でも表示できるように仕様変更(19.Apr.98 Version 2.05)
 * Version 2.10 (08.Aug.98) since 19.Apr.98
 * > Tag Templateを移動可能(Movable)に出来るように仕様変更(19.Apr.98 2.06 beta 1)
 * > Hex/Dec Changeover Buttonの追加(19.Apr.98 Version 2.06 beta 1)
 * > Minimized Buttonの表示(23.Apr.98 Version 2.06 beta 2)
 * > Netscape 216 Color(6x6x6)に対応(01.May.98 Version 2.06 beta 3)
 * > Color Grid TableがEnable時にExitしてもPositionをSaveしない不具合を修正(01.May.98 Version 2.06 beta 3)
 * > Color Grid TableのサイズをColor Modeに対応して変更するように仕様変更(01.May.98 Version 2.06 beta 4)
 * > Color Grid TableがDisable時にColor Modeを変更するとErrorが起こる問題を修正(02.May.98 Version 2.06 beta 5)
 * > TagTemplateWindowのData表示部をDescriptiveTextからEntryFieldに変更(02.May.98 Version 2.06 beta 5)
 * > Regitry WindowのPositionの調整(02.May.98 Version 2.06 beta 5)
 * > 216 Color Mode時のCustom Color Grid Table機能の強化(24.May.98 Version 2.06 beta 6)
 * > 各色の値をSpin Buttonで調整ができるように仕様変更(24.May.98 Version 2.06 beta 6)
 * > Color Spin Buttonを押しても最初のClickに反応しない不具合を修正(01.Aug.98, 2.06 beta 7) <- まだ直っていない???
 * > Color Spin Buttonの設定値の不具合を修正(07.Aug.98, 2.06 beta 8)
 * > Preference Windowsのfontが一部反映されない不具合を修正(08.Aug.98 2.06 beta 8)
 * > 2.06 beta 8を2.10として公開(08.Aug.98)
 * Version 2.11 (01.Oct.98) since 09.Sep.98
 * > Color Numberの最大値以上の数字が初期設定値にある場合の不具合を修正(09.Sep.98 2.11 beta 1)
 * > 下記Errorへの対処(13.Sep.98 2.11. beta 2)
 *
 *      Line 29 of DDCB_BasisColorList_Change in Window1.VRM:
 *      +++         ok = VRSet('SPIN_RedValue', 'Value',   
 *       x2d(left(selected_color_number, 2)));
 *
 * > その他、不具合の修正等(Through all beta version)
 * > 216 Color Palette Mode時にName/RGBの選択が無効になるのでRadio ButtonをDisableにするように仕様変更(29.Sep.98 2.11 beta 3)
 * Version 2.12 (26.Sep.98) since 27.Oct.98
 * > Tuning (Ver.2.12 beta 1 27.Oct.98) 
 * > Registryされた場合のAbout画面の見え方を変更 (2.12 beta 2, 08.Sep.1999)
 * > DEMO版用機能追加とそれに伴う仕様変更 (2.12 beta 2, 08.Sep.1999)
 * > Version 2.12公開 (26.Sep.1999)
 * Version 2.13 (11.Dec.1999) since 28.Sep.1999
 * > Window Fontを最初の起動時に設定するように仕様変更 (2.13 beta 1, 28.Sep.1999)
 * > Registration WindowのFontにwindow_fontを使用するように仕様変更 (2.13 beta 1, 28.Sep.1999)
 * > Version 2.13公開 (11.Dec.1999)
 * Version 2.14 (04.Jan.2000)
 * > 一部GUIのMinor Update (Ribbon Margin)。
 * > window_fontが正しくセットされない不具合の修正。
 * > About Windowを表示しないように仕様変更。代わりにRegistration Windowを表示。
 * Version 2.15 (  .   .    ) since 24.Sep.2000
 * > Hex/Dec切替え後にColor Grid Tableの表示をするとサイズが`216 Color Palette'のサイズになる問題を修正 (2.15 beta 1, 24.Sep.2000)
 * > Tag Template使用時に`G' Buttonを押すと`#'がRGB値の前に余分に追加されてしまう不具合を修正 (2.19 beta 1, 01.May.2001)
 * > Color Grid Tableに表示されている配色でColor PaletteをDesktopに作成する機能の追加 (2.19 beta 1, 01.May.2001)
 *      Special thanks for this function - Idea and Source code,
 *
 *          Lutz Pescht <Lutz@periplaneta.de>
 *
 * > Gismo Color Palette作り込み (2.19 beta 2, 02.May.2001)
 * > New Installer (Gismo Color Palette Objectsを作成する) (2.19 beta 2, 02.May.2001)
 * > PB_CreateColorPaletteのFont指定時に発生する不具合を修正 (2.19 beta 3, 15.Jul.2001)
 *
 *
 *
 */
/*  Main
*/
Main:
/*  Process the arguments.
    Get the parent window.
*/
debug_mode = 0

    parse source . calledAs .
    parent = ""
    argCount = arg()
    argOff = 0
    if( calledAs \= "COMMAND" )then do
        if argCount >= 1 then do
            parent = arg(1)
            argCount = argCount - 1
            argOff = 1
        end
    end; else do
        call VROptions 'ImplicitNames'
    end
    InitArgs.0 = argCount
    if( argCount > 0 )then do i = 1 to argCount
        InitArgs.i = arg( i + argOff )
    end
    drop calledAs argCount argOff

/*  Load the windows
*/
    call VRInit
    parse source . . spec
    _VREPrimaryWindowPath = ,
        VRParseFileName( spec, "dpn" ) || ".VRW"
    _VREPrimaryWindow = ,
        VRLoad( parent, _VREPrimaryWindowPath )
    drop parent spec
    if( _VREPrimaryWindow == "" )then do
        call VRMessage "", "Cannot load window:" VRError(), ,
            "Error!"
        _VREReturnValue = 32000
        signal _VRELeaveMain
    end

/*  Process events
*/
    call Init
    signal on halt
    do while( \ VRGet( _VREPrimaryWindow, "Shutdown" ) )
        _VREEvent = VREvent()
        interpret _VREEvent
    end
_VREHalt:
    _VREReturnValue = Fini()
    call VRDestroy _VREPrimaryWindow
_VRELeaveMain:
    call VRFini
exit _VREReturnValue

VRLoadSecondary:
    __vrlsWait = abbrev( 'WAIT', translate(arg(2)), 1 )
    if __vrlsWait then do
        call VRFlush
    end
    __vrlsHWnd = VRLoad( VRWindow(), VRWindowPath(), arg(1) )
    if __vrlsHWnd = '' then signal __vrlsDone
    if __vrlsWait \= 1 then signal __vrlsDone
    call VRSet __vrlsHWnd, 'WindowMode', 'Modal' 
    __vrlsTmp = __vrlsWindows.0
    if( DataType(__vrlsTmp) \= 'NUM' ) then do
        __vrlsTmp = 1
    end
    else do
        __vrlsTmp = __vrlsTmp + 1
    end
    __vrlsWindows.__vrlsTmp = VRWindow( __vrlsHWnd )
    __vrlsWindows.0 = __vrlsTmp
    do while( VRIsValidObject( VRWindow() ) = 1 )
        __vrlsEvent = VREvent()
        interpret __vrlsEvent
    end
    __vrlsTmp = __vrlsWindows.0
    __vrlsWindows.0 = __vrlsTmp - 1
    call VRWindow __vrlsWindows.__vrlsTmp 
    __vrlsHWnd = ''
__vrlsDone:
return __vrlsHWnd

/*:VRX         AddTagTemplate
*/
AddTagTemplate: 
if debug_mode = 1 then say "AddTagTemplate"

    TagTemplateNumber = TagTemplate.0 + 1

    tag_template = VRGet( "DDCB_TagTemplateList", "Value" )
    TagTemplate.TagTemplateNumber = tag_template
    TagTemplate.0 = TagTemplateNumber

    call WriteInitialFile
    call SetTagTemplateList

return

/*:VRX         CB_AlwaysCopy_Click
*/
CB_AlwaysCopy_Click: 
if debug_mode = 1 then say "CB_AlwaysCopy_Click"

    set = VRGet( "CB_AlwaysCopy", "Set" )
    if set = 1 then do
        always_copy = "Yes"    
        ok = VRSet( "PB_Copy", "Enabled", 0 )
    end
    if set = 0 then do
        always_copy = "No"    
        ok = VRSet( "PB_Copy", "Enabled", 1 )
    end

    /*
    call WriteInitialFile
    */

return



/*:VRX         CB_ColorGridTable_Click
*/
CB_ColorGridTable_Click: 
if debug_mode = 1 then say "CB_ColorGrid_Click"

    set = VRGet( "CB_ColorGridTable", "Set" )
    select
        when set = 1 then do
            color_grid_table = "Enabled"
            ok = VRLoadSecondary( "SW_ColorGridTable", )
            ok = VRSet( "PB_Gradation", "Visible", 1 )
        end
        when set = 0 then do
            color_grid_table = "Disabled"
            color_grid_table = 0

            call GetColorGridTablePosition

            ok = VRDestroy( "SW_ColorGridTable" )

            ok = VRSet( "PB_Gradation", "Visible", 0 )
        end
    end

return

/*:VRX         CB_HexDecChangeoverButton_Click
*/
CB_HexDecChangeoverButton_Click: 
if debug_mode = 1 then say "CB_HexDecChangeoverButton_Click"

    set = VRGet( "CB_HexDecChangeoverButton", "Set" )
    select 
        when set = 1 then do
            hex_dec_changeover_button = "Enabled"
            ok = VRSet( "PB_HexDec", "Visible", 1 )
            ok = VRSet( "EF_ColorNumber", "Width", color_number_window_width_short )
        end
        when set = 0 then do
            hex_dec_changeover_button = "Disabled"
            ok = VRSet( "PB_HexDec", "Visible", 0 )
            ok = VRSet( "EF_ColorNumber", "Width", color_number_window_width_long )
        end
    end

return

/*:VRX         CB_MovableTagTemplateWindow_Click
*/
CB_MovableTagTemplateWindow_Click: 
if debug_mode = 1 then say "CB_MovableTagTemplateWindow_Click"

    set = VRGet( "CB_MovableTagTemplateWindow", "Set" )
    select 
        when set = 1 then
            movable_tag_template_window = "Enabled"
        when set = 0 then 
            movable_tag_template_window = "Disabled"
    end

    if tag_template_window = "Enabled" then do    

        call SetTagTemplateWindowTitleBar

        if movable_tag_template_window = "Disabled" then do    
            ok = VRDestroy(SW_TagTemplateWindow)
            call OpenTagTemplateWindow
        end
    end


return

/*:VRX         CB_TagTemplate_Click
*/
CB_TagTemplate_Click: 
if debug_mode = 1 then say "CB_TagTemplate_Click"

    call SetPosition

    set = VRGet( "CB_TagTemplate", "Set" )
    if set = 1 then do
        tag_template_window = "Enabled"
        call OpenTagTemplateWindow
    end
    else if set = 0 then do
        tag_template_window = "Disabled"
        call GetTagTemplateWindowPosition
        ok = VRDestroy(SW_TagTemplateWindow)
    end

return

/*:VRX         ChangeColorValue
*/
ChangeColorValue: 
if debug_mode = 1 then say "ChangeColorValue"
/*
 * This sub-routine is run when slider (one of any 3 slider bars) bar is changed
 *
 */
    if sort_type <> "Custom" then do
        sort_type_old = sort_type
        sort_type = "Custom"
    end
    
    backcolor = VRGet( "LB_ColorList", "BackColor" )
    if backcolor <> "PaleGray" then do
        ok = VRSet( "LB_ColorList", "BackColor", "PaleGray" )
    end

    forecolor = VRGet( "LB_ColorList", "ForeColor" )
    if forecolor <> "DarkGray" then do
        ok = VRSet( "LB_ColorList", "ForeColor", "DarkGray" )
    end

    selected_color_number = red""green""blue
    selected_color_name = "#"selected_color_number

    flug_colnum = "ON"
    /*
    flug_spin_red   = "ON"
    flug_spin_green = "ON"
    flug_spin_blue  = "ON"
    */

    if color_number_indicate_type = "Hexadecimal" then do
        ok = VRSet( "EF_ColorNumber", "Value", selected_color_number )
    end
    else if color_number_indicate_type = "Decimal" then do
        ok = VRSet( "EF_ColorNumber", "Value", right(x2d(red), 3, 0)""right(x2d(green), 3, 0)""right(x2d(blue), 3, 0) )
    end
    ok = VRSet( "SPIN_RedValue",   "Value", x2d(red) )
    ok = VRSet( "SPIN_GreenValue", "Value", x2d(green) )
    ok = VRSet( "SPIN_BlueValue",  "Value", x2d(blue) )

    /* change color grid table */
    if color_grid_table = "Enabled" then do
        rr = x2d(red)
        gg = x2d(green)
        bb = x2d(blue)
        cmin = 0 
        cmax = 255

        if sort_type = "Custom" then grid_max = 10 * 22
        else                         grid_max = color.0

        do i = 1 to grid_max
            rr2 = rr - grid_max/2 + i 
            if rr2 > cmax then rr2 = cmax
            if rr2 < cmin then rr2 = cmin
            gg2 = gg - grid_max/2 + i 
            if gg2 > cmax then gg2 = cmax
            if gg2 < cmin then gg2 = cmin
            bb2 = bb - grid_max/2 + i 
            if bb2 > cmax then bb2 = cmax
            if bb2 < cmin then bb2 = cmin

            if (rr2 = rr) & (gg2 = gg) & (bb2 = bb) then ii = i

            color_rgb.i = "("rr2","gg2","bb2")"
            custom_color.i = right(d2x(rr2), 2, 0)""right(d2x(gg2), 2, 0)""right(d2x(bb2), 2, 0)
        end
        color_rgb.0 = grid_max
        custom_color.0 = grid_max
        ok = VRMethod( "VS_ColorGrid", "SetAttributes", "Values", "color_rgb." )
        ok = VRSet( "VS_ColorGrid", "Selected", ii )
        ok = VRSet("SW_ColorGridTable", "Caption", "Gismo - Color Grid Table ("sort_type")" )   
        ok = VRSet( "DT_ColorName", "Caption", "Custom RGB:"custom_color.ii )
    end
    /*   */

    call SetColors

    if tag_template_window = "Enabled" then call SetTagText

    if always_copy = "Yes" then call CopyToClipboard

return

/*:VRX         CheckRegistration
*/
CheckRegistration: 

    /* Registry */
    RegisterNumber.0 = 6
    RegisterNumber.1 = "GC71585M01" /* Previous User */
    RegisterNumber.2 = "GC71585N02" /* New User */
    RegisterNumber.3 = "GC71585F03" /* Friends */
    RegisterNumber.4 = "GC71585IBM" /* IBMer */
    RegisterNumber.5 = "GC71585S05" /* Special Version */
    RegisterNumber.6 = "DEMO1999"   /* Special Version */

    do i = 1 to RegisterNumber.0 
        if register_number = RegisterNumber.i then Registry = "Registered"
    end

    /* DEMO用にTime Bomb機能を追加 */
    if left(register_number, 4) = "DEMO" then do
        CurDate = date("s")
        TimeBombDate = "20000101"  /* 1999年12月31日まで使用可 */

        if CurDate < TimeBombDate then do
            nop
        end
        else do
            Registry = "TIME IS UP"
        end
    end

    if Registry <> "Registered" then do
        registry_sleep = 15
        registry_mode = "Startup"
        ok = VRLoadSecondary( "SW_Registry", "w" )
        registry_mode = "Normal"
    end

return

/*:VRX         Color_X2D
*/
Color_X2D: 
if debug_mode = 1 then say "Color_X2D"

        red   = substr(selected_color_number,1,2)
        green = substr(selected_color_number,3,2)
        blue  = substr(selected_color_number,5,2)

        red_dec   = x2d(red)
        green_dec = x2d(green)
        blue_dec  = x2d(blue)

return

/*:VRX         Comparison
*/
Comparison: 
/*
if debug_mode = 1 then say "comparison"
*/
    method = arg(1)
   
    select    
        when method = "Hue" then do
            if hue_rowdata.i = hue_rowdata.j then do
                if saturation_rowdata.i = saturation_rowdata.j then do
                    less = (value_rowdata.j < value_rowdata.i)
                end
                else do
                    less = (saturation_rowdata.j < saturation_rowdata.i)
                end
            end
            else do
                less = (hue_rowdata.j < hue_rowdata.i)
            end
        end

        when method = "Saturation" then do
            if saturation_rowdata.i = saturation_rowdata.j then do
                if value_rowdata.i = value_rowdata.j then do
                    less = (hue_rowdata.j < hue_rowdata.i)
                end
                else do
                    less = (value_rowdata.j < value_rowdata.i)
                end
            end
            else do
                less = (saturation_rowdata.j < saturation_rowdata.i)
            end
        end

        when method = "Value" then do
            if value_rowdata.i = value_rowdata.j then do
                if saturation_rowdata.i = saturation_rowdata.j then do
                    less = (hue_rowdata.j < hue_rowdata.i)
                end
                else do                
                    less = (saturation_rowdata.j < saturation_rowdata.i)
                end
            end
            else do
                less = (value_rowdata.j < value_rowdata.i)
            end
        end
 
        when method = "Name" then do
            less = (color_rowdata.i < color_rowdata.j)
        end

        otherwise  
            nop /* Custom */
    end
    
return

/*:VRX         CopyToClipboard
*/
CopyToClipboard: 
if debug_mode = 1 then say "CopyToClipboard"

    if tag_template_window = "Disabled" then do
        if color_mode = "Number" then do    
            ok = VRMethod("Application", "PutClipboard", "#"selected_color_number)
        end
        if color_mode = "Name" then do    
            ok = VRMethod("Application", "PutClipboard", selected_color_name)
        end
    end
    else if tag_template_window = "Enabled" then do
        ok = VRMethod("Application", "PutClipboard", tag_text)
    end

return

/*:VRX         DDCB_BasisColorList_Change
*/
DDCB_BasisColorList_Change: 
if debug_mode = 1 then say "DDCB_BasisColorList_Change"

    ok = VRMethod( "LB_ColorList", "Clear" )
    call SetAllGridToBlack

    value = VRGet( "DDCB_BasisColorList", "Value" )
    select 
        when value = "Color Name" then do
            basis_color_list = "ColorName"
            if color_grid_table = "Enabled" then do
                ok = VRSet( "SW_ColorGridTable", "Height", color_grid_table_height_short )
            end

            ok = VRSet( "RB_RGB",      "Enabled", 1 )
            ok = VRSet( "RB_RealName", "Enabled", 1 )

            call ReadColorList
        end
        when value = "216 Color Palette" then do
            basis_color_list = "216ColorPalette"
            if color_grid_table = "Enabled" then do
                ok = VRSet( "SW_ColorGridTable", "Height", color_grid_table_height_long )
            end

            ok = VRSet( "RB_RGB",      "Enabled", 0 )
            ok = VRSet( "RB_RealName", "Enabled", 0 )

            call Set216ColorList
        end
    end

    if color_grid_table = "Enabled" then do
        call SetColorGridTableColor
    end

return

/*:VRX         DDCB_SortType_Change
*/
DDCB_SortType_Change: 
if debug_mode = 1 then say "DDCB_SortType_Change"

    gismo_height = VRGet( "Window1", "Height" )

    selectedtext = VRGet( "DDCB_SortType", "SelectedText" )

    ok = VRMethod( "LB_ColorList", "Clear" )

    fcs_old = color.fore_color_selected
    bcs_old = color.back_color_selected

    select 
        when selectedtext = "Sort by Name"       then sort_type = "Name"
        when selectedtext = "Sort by Hue"        then sort_type = "Hue"
        when selectedtext = "Sort by Saturation" then sort_type = "Saturation"
        when selectedtext = "Sort by Value"      then sort_type = "Value"
        otherwise nop
    end

    /* sort */
    call Sort sort_type

    ok = VRMethod( "LB_ColorList", "AddStringList", "color." )
    ok = VRSet( "LB_ColorList", "Selected", 1 )

    do i = 1 to color.0
        if fcs_old = color.i then do
            fore_color_selected = i
        end
        if bcs_old = color.i then back_color_selected = i
    end

    call SetSelectedColor

    if color_grid_table = "Enabled" then do
        call SetColorGridTableColor
    end
    
return
/*:VRX         DDCB_TagTemplateList_Change
*/
DDCB_TagTemplateList_Change: 
if debug_mode = 1 then say "DDCB_TagTextList_Change"

    tag_template_selected = VRGet( "DDCB_TagTemplateList", "Selected" )

    call SetTagText

return

/*:VRX         DDCB_TagTemplateList_KeyPress
*/
DDCB_TagTemplateList_KeyPress: 
if debug_mode = 1 then say "DDCB_TagTextList_KeyPress"

    keystring = VRGet( "DDCB_TagTemplateList", "KeyString" )

    if keystring = "{Newline}" then do
        call AddTagTemplate
    end

return

/*:VRX         DefaultValue
*/
DefaultValue: 
if debig_mode = 1 then say "DefaultValue"

    Mode = "Normal"

    gismo_words = "Gismo"

    font = "14.Helvetica"
    window_font = "<NONE>" /* Normal Fontだけ最初の起動時に設定するように仕様変更 */
    color_number_font = "12.Helvetica"

    color_position = "Background"
    fore_color_selected = 1
    back_color_selected = 1

    fore_color_name   = "NULL"
    fore_color_number = 1
    back_color_name   = "NULL"
    back_color_number = 1
    selected          = 1

    ok = VRSet( "RB_Background", "Set", 1 )
    ok = VRSet( "RB_Foreground", "Set", 0 )
  
    flug_red   = "OFF"
    flug_green = "OFF"
    flug_blue  = "OFF"

    flug_colnum = "OFF"

    flug_spin_red   = "OFF"
    flug_spin_green = "OFF"
    flug_spin_blue  = "OFF"

    red   = 0
    green = 0
    blue  = 0

    color_mode = "Name"
    ok = VRSet( "RB_RGB",      "Set", 0 )
    ok = VRSet( "RB_RealName", "Set", 1 )
    
    always_copy = "No"
    ok = VRSet( "CB_AlwaysCopy", "Set", 0 )
    ok = VRSet( "PB_Copy", "Enabled", 1 )
    
    position_x = 0
    position_y = 0

    preference_x = 0
    preference_y = 0

    ok = VRSet( "LB_ColorList", "BackColor", "White" )    

    tag_template_window = "Disabled"
    about_window = "Disabled"

    sort_type = "Name"

    ribbon_color = "DynamicColor"

    color_grid_table = "Disabled"
    ok = VRSet( "PB_Gradation", "Visible", 0 )
    color_grid_table_pos_x = 3000
    color_grid_table_pos_y = 2000

    color_number_indicate_type = "Hexadecimal"

    /* HexDec Button (Default is Disabled) */
    hex_dec_changeover_button = "Disabled"
    ok = VRSet( "PB_HexDec", "Visible", 0 )
    ok = VRSet( "EF_ColorNumber", "Width", color_number_window_width_long )

    register_number = "Unregistered"

    color_number_window_width_short = 1457
    color_number_window_width_long  = 1879

    tag_template_window_height_short = 1060
    tag_template_window_height_long = 1337

    movable_tag_template_window = "Disabled"

/*
    color_grid_table_height_short = 3497
    color_grid_table_height_long  = 5107
*/
    color_grid_table_height_short = 3497 + 420
    color_grid_table_height_long  = 5107 + 420

return

/*:VRX         EF_ColorNumber_Change
*/
EF_ColorNumber_Change: 
if debug_mode = 1 then say "EF_ColorNumber_Change"

    if flug_colnum = "OFF" then do
        value = VRGet( "EF_ColorNumber", "Value" )

        this_is_not_number = "No"
        ok = VRSet( "EF_ColorNumber", "BackColor", "Black" )

        if color_number_indicate_type = "Hexadecimal" then do
            if length(value) = 6 then do
                n1 = left(right(value, 6), 1)
                n2 = left(right(value, 5), 1)
                n3 = left(right(value, 4), 1)
                n4 = left(right(value, 3), 1)
                n5 = left(right(value, 2), 1)
                n6 = right(value, 1)

                if n1 > F then this_is_not_number = "Yes"            
                if n2 > F then this_is_not_number = "Yes"            
                if n3 > F then this_is_not_number = "Yes"            
                if n4 > F then this_is_not_number = "Yes"            
                if n5 > F then this_is_not_number = "Yes"            
                if n6 > F then this_is_not_number = "Yes"            

                if this_is_not_number = "No" then do
                    selected_color_number = right(value, 6)
    
                    flug_red   = "ON"
                    flug_green = "ON"
                    flug_blue  = "ON"
                    
                    /*
                    flug_spin_red   = "ON"
                    flug_spin_green = "ON"
                    flug_spin_blue  = "ON"
                    */
                    call SetColorBars
                    call ChangeColorValue
                end
                else do
                    ok = VRSet( "EF_ColorNumber", "BackColor", "Red" )
                end
            end
        end
        else if color_number_indicate_type = "Decimal" then do
            if length(value) = 9 then do
                if datatype(value) <> "NUM" then do
                    this_is_not_number = "Yes"
                end

                red_dec   = substr(value, 1, 3)
                green_dec = substr(value, 4, 3)
                blue_dec  = substr(value, 7, 3)

                select 
                    when red_dec > 255 then 
                        ok = VRSet( "EF_ColorNumber", "BackColor", "Red" )
                    when green_dec > 255 then 
                        ok = VRSet( "EF_ColorNumber", "BackColor", "Red" )
                    when blue_dec > 255 then 
                        ok = VRSet( "EF_ColorNumber", "BackColor", "Red" )
                    otherwise do
                        if this_is_not_number = "No"  then do
                            selected_color_number = right(d2x(red_dec), 2, 0)""right(d2x(green_dec), 2, 0)""right(d2x(blue_dec), 2, 0)

                            flug_red   = "ON"
                            flug_green = "ON"
                            flug_blue  = "ON"
                            
                            /*
                            flug_spin_red   = "ON"
                            flug_spin_green = "ON"
                            flug_spin_blue  = "ON"
                            */
                            call SetColorBars
                            call ChangeColorValue
                        end
                        else do
                            ok = VRSet( "EF_ColorNumber", "BackColor", "Red" )
                        end
                    end
                end
            end
        end
    end 
    flug_colnum = "OFF"

return

/*:VRX         EF_RegistoryNumber_Change
*/
EF_RegistoryNumber_Change: 

    ok = VRSet( "PB_Registory", "Enabled", 1 )

return

/*:VRX         Fini
*/
Fini:
    window = VRWindow()
    call VRSet window, "Visible", 0
    drop window
return 0

/*:VRX         GetColorGridTablePosition
*/
GetColorGridTablePosition: 
if debug_mode = 1 then say "GetColorGridTablePosition"

    color_grid_table_pos_x = VRGet("SW_ColorGridTable", "Left")            
    color_grid_table_pos_y = VRGet("SW_ColorGridTable", "Top" )            

    call WriteInitialFile

return

/*:VRX         GetTagTemplateWindowPosition
*/
GetTagTemplateWindowPosition: 
if debug_mode = 1 then say "GetTagTemplateWindowPosition"

    extension_x = VRGet( "SW_TagTemplateWindow", "Left" )
    extension_y = VRGet( "SW_TagTemplateWindow", "Top" )

    call WriteInitialFile

return

/*:VRX         Halt
*/
Halt:
    signal _VREHalt
return

/*:VRX         Init
*/
Init:

    Gismo_version = "2.19 beta 3"

    call VRSet "console", "WindowListTitle", ""

    call rxfuncadd sysloadfuncs, rexxutil, sysloadfuncs
    call sysloadfuncs

    ok = VRSet("Window1", "Caption", "Gismo "Gismo_version)
    ok = VRSet("Window1", "WindowListTitle", "Gismo for OS/2 "Gismo_version )

    call DefaultValue

    gismo_directory = VRCurrDrive()||VRCurrDir()

    ini_file = gismo_directory"\Gismo.ini"
    rc = SysFileTree( gismo_directory"\color.lst", "color_list.", "of" )
    select 
        when color_list.0 = 1 then do

        end
        otherwise do
            call VRMessage VRWindow(), "GISMO ERROR! : NO COLOR LIST FILE!          ", "Gismo Error"         
            call Quit
        end
    end

    /* default color */
    selected_color_name   = color.1
    selected_color_number = number.1

    /* sort items */
    sort_type_list.0 = 4
    sort_type_list.1 = "Sort by Name"
    sort_type_list.2 = "Sort by Hue"
    sort_type_list.3 = "Sort by Saturation"
    sort_type_list.4 = "Sort by Value"

    ok = VRMethod( "DDCB_SortType", "AddStringList", "sort_type_list.",  )

    /* Basis Color List */
    basis_color_list.0 = 2
    basis_color_list.1 = "Color Name"
    basis_color_list.2 = "216 Color Palette" 

    ok = VRMethod( "DDCB_BasisColorList", "AddStringList", "basis_color_list.",  )

    /* 256 Color List */
    do i = 1 to 256
        spin_color.i = i - 1
    end
    spin_color.0 = i - 1
    ok = VRMethod( "SPIN_RedValue",   "SetStringList", "spin_color." )
    ok = VRMethod( "SPIN_GreenValue", "SetStringList", "spin_color." )
    ok = VRMethod( "SPIN_BlueValue",  "SetStringList", "spin_color." )

/*
    if basis_color_list = "216ColorPalette" then do
        ok = VRSet( "DDCB_BasisColorList", "Value", "216 Color Palette" )
        call Set216ColorList
        
        if fore_color_selected > Color216.0 then fore_color_selected = Color216.0
        if back_color_selected > Color216.0 then back_color_selected = Color216.0
    end
    else do 
        ok = VRSet( "DDCB_BasisColorList", "Value", "Color Name" )
        call ReadColorList

        if fore_color_selected > color_list.0 then fore_color_selected = color_list.0
        if back_color_selected > color_list.0 then back_color_selected = color_list.0
    end

    select
        when sort_type = "Name"       then ok = VRSet( "DDCB_SortType", "Selected", 1 )                        
        when sort_type = "Hue"        then ok = VRSet( "DDCB_SortType", "Selected", 2 ) 
        when sort_type = "Saturation" then ok = VRSet( "DDCB_SortType", "Selected", 3 ) 
        when sort_type = "Value"      then ok = VRSet( "DDCB_SortType", "Selected", 4 ) 
        otherwise do
            sort_type = "Name"
            ok = VRSet( "DDCB_SortType", "Selected", 1 ) 
        end
    end                    
    old_sort_type = sort_type
*/
    /* read initial file */
    call ReadInitialFile

    if basis_color_list = "216ColorPalette" then do
        ok = VRSet( "DDCB_BasisColorList", "Value", "216 Color Palette" )
        call Set216ColorList
        
        if fore_color_selected > Color216.0 then fore_color_selected = Color216.0
        if back_color_selected > Color216.0 then back_color_selected = Color216.0
    end
    else do 
        ok = VRSet( "DDCB_BasisColorList", "Value", "Color Name" )
        call ReadColorList

        if fore_color_selected > color_list.0 then fore_color_selected = color_list.0
        if back_color_selected > color_list.0 then back_color_selected = color_list.0
    end

    select
        when sort_type = "Name"       then ok = VRSet( "DDCB_SortType", "Selected", 1 )                        
        when sort_type = "Hue"        then ok = VRSet( "DDCB_SortType", "Selected", 2 ) 
        when sort_type = "Saturation" then ok = VRSet( "DDCB_SortType", "Selected", 3 ) 
        when sort_type = "Value"      then ok = VRSet( "DDCB_SortType", "Selected", 4 ) 
        otherwise do
            sort_type = "Name"
            ok = VRSet( "DDCB_SortType", "Selected", 1 ) 
        end
    end                    
    old_sort_type = sort_type

    select 
        when color_position = "Foreground" then do
            ok = VRSet( "LB_ColorList", "Selected", fore_color_selected )
            selected = fore_color_selected
        end
        when color_position = "Background" then do
            ok = VRSet( "LB_ColorList", "Selected", back_color_selected )
            selected = back_color_selected
        end
        otherwise
            nop
    end    
    call SetSelectedColor

    /* Tag Template */
    if tag_template_window = "Enabled" then do
        call OpenTagTemplateWindow
    end

    /* Color Grid Table */
    select 
        when color_grid_table = "Enabled" then do
            ok = VRSet( "CB_ColorGridTable", "Set", 1 )
            ok = VRLoadSecondary( "SW_ColorGridTable", )
            ok = VRSet( "PB_Gradation", "Visible", 1 )
        end
        otherwise
            nop
    end

    /* Set window_font at first startup time */
    if (window_font = "<NONE>") then do
        Font_old = "9.WarpSans"
        Font = VRFontDialog( VRWindow(), "9.WarpSans", "Jasmine - Set font, anyway" )
        StatusFont = Font
        window_font = Font
        if Font = "" then do
            Font       = Font_old
            StatusFont = Font_old
            window_font = Font_old
        end
    end

    call SetWindowFont

    call CheckRegistration





    /* Window Initialize */
    window = VRWindow()
    call VRMethod window, "CenterWindow"

    ok = VRSet( "Window1", "Left", position_x)
    ok = VRSet( "Window1", "Top",  position_y)

    call VRSet window, "Visible", 1
    call VRMethod window, "Activate"
    drop window

return

/*:VRX         LB_ColorList_Click
*/
LB_ColorList_Click: 
if debug_mode = 1 then say "LB_ColorList_Click"

    if sort_type = "Custom" then do
        sort_type = sort_type_old
        if color_grid_table = "Enabled" then do
            call SetAllGridToBlack
            call SetColorGridTableColor
        end
    end

    flug_red   = "ON"
    flug_green = "ON"
    flug_blue  = "ON"
    flug_colnum = "ON"

    flug_spin_red   = "ON"
    flug_spin_green = "ON"
    flug_spin_blue  = "ON"

    backcolor = VRGet( "LB_ColorList", "BackColor" )
    if backcolor <> "White" then do
        ok = VRSet( "LB_ColorList", "BackColor", "White" )    
    end

    forecolor = VRGet( "LB_ColorList", "ForeColor" )
    if forecolor <> "Black" then do
        ok = VRSet( "LB_ColorList", "ForeColor", "Black" )
    end

    selected = VRGet( "LB_ColorList", "Selected" )
    
    selected_color_name   = color.selected
    selected_color_number = number.selected

    if color_number_indicate_type = "Hexadecimal" then do
        ok = VRSet( "EF_ColorNumber", "Value", selected_color_number )
    end
    else if color_number_indicate_type = "Decimal" then do
        ok = VRSet( "EF_ColorNumber", "Value", right(x2d(substr(selected_color_number, 1, 2)), 3, 0)""right(x2d(substr(selected_color_number, 3, 2)), 3, 0)""right(x2d(substr(selected_color_number, 5, 2)), 3, 0) )
    end

    ok = VRSet( "SPIN_RedValue",   "Value", x2d(left(selected_color_number, 2)) )
    ok = VRSet( "SPIN_GreenValue", "Value", x2d(left(right(selected_color_number, 4), 2)) )
    ok = VRSet( "SPIN_BlueValue",  "Value", x2d(right(selected_color_number, 2)) )

    call SetColorBars

    if color_position = "Foreground" then do
        fore_color_selected = selected
        back_color_selected = back_selected
    end
    if color_position = "Background" then do
        fore_color_selected = fore_selected
        back_color_selected = selected
    end

    if tag_template_window = "Enabled" then call SetTagText

    if always_copy = "Yes" then call CopyToClipboard

    /* Color Grid Table */
    if color_grid_table = "Enabled" then do
        if cgt_flug2 = "ON" then do
            ok = VRSet( "VS_ColorGrid", "Selected", selected )
            cgt_flug1 = "OFF"
        end
        else do
            cgt_flug2 = "ON"
        end
    end
    
return

/*:VRX         OpenTagTemplateWindow
*/
OpenTagTemplateWindow: 
if debug_mode = 1 then say "OpenTagTemplateWindow"

    gismo_height = VRGet( "Window1", "Height" )

    if movable_tag_template_window = "Disabled" then do
        extension_x = position_x
        extension_y = position_y + gismo_height
    end

    call VRLoadSecondary "SW_TagTemplateWindow" 

    /*
    call SetWindowFont
    */

return

/*:VRX         PB_Add_Click
*/
PB_Add_Click: 
if debug_mode = 1 then say "PB_Add_Click"

    call AddTagTemplate

return

/*:VRX         PB_ChangeColorNumberFont_Click
*/
PB_ChangeColorNumberFont_Click: 

    color_number_font_old = color_number_font
    color_number_font = VRFontDialog( VRWindow(), color_number_font, "Choose a font!")
    if color_number_font = "" then color_number_font = color_number_font_old

    ok = VRSet( "DT_Colors", "Font", color_number_font )

    ok = VRMethod( "LB_ColorList", "SetFocus" )

    ok = VRSet( "EF_ColorNumberFont", "Value", color_number_font )
/*  ok = VRSet( "EF_ColorNumberFont", "Font", color_number_font ) */

    ok = VRSet( "EF_ColorNumber", "Font", color_number_font )

return

/*:VRX         PB_ChangeFont_Click
*/
PB_ChangeFont_Click: 
if debug_mode = 1 then say "PB_ChangeFont_Click"

    font_old = window_font
    window_font = VRFontDialog( VRWindow(), window_font, "Choose a font!")    
    if window_font = "" then window_font = font_old

    call SetWindowFont

    call SetPreferenceWindowFont

    ok = VRMethod( "LB_ColorList", "SetFocus" )

    ok = VRSet( "EF_Font", "Value", window_font )

return

/*:VRX         PB_ChangeForeColorTextFont_Click
*/
PB_ChangeForeColorTextFont_Click: 

    font_old = font
    font = VRFontDialog( VRWindow(), font, "Choose a font!")
    if font = "" then font = font_old

    ok = VRSet( "DT_Colors", "Font", font )

    ok = VRMethod( "LB_ColorList", "SetFocus" )

    ok = VRSet( "EF_ForeColorTextFont", "Value", font )
/*  ok = VRSet( "EF_ForeColorTextFont", "Font", font ) */

return

/*:VRX         PB_CloseChangeFontWindow_Click
*/
PB_CloseChangeFontWindow_Click: 
if debug_mode = 1 then say "PB_CloseChangeFontWindow_Click"

    /* Preference Window Position */
    preference_x = VRGet( "SW_Preference", "Left" )
    preference_y = VRGet( "SW_Preference", "Top" )

    ok = VRSet( "PB_WindowFont", "Enabled", 1 )

    ok = VRDestroy( SW_Preference )

return

/*:VRX         PB_Copy_Click
*/
PB_Copy_Click: 
if debug_mode = 1 then say "PB_Copy_Click"

    call CopyToClipboard
    ok = VRMethod( "LB_ColorList", "SetFocus" )

return

/*:VRX         PB_CreateColorPalette_Click
*/
PB_CreateColorPalette_Click: 

/*
basis_color_list = "ColorName"
basis_color_list = "216ColorPalette"
sort_type = "Name"
sort_type = "Hue"
sort_type = "Saturation"
sort_type = "Value"
*/

    if      basis_color_list = "ColorName"       then GcpBaseColorList = "Color Name"
    else if basis_color_list = "216ColorPalette" then GcpBaseColorList = "216 Color Palette"

    if sort_type = "Custom" then do
        caption = VRGet( "DT_ColorName", "Caption" )
        parse var caption . ":" gcp_grid_base_color
        GismoColorPaletteName = "Gismo Color Palette^Grid Table^Base Color RGB : "gcp_grid_base_color
    end
    else do
        GismoColorPaletteName = "Gismo Color Palette^"GcpBaseColorList"^Sort by "sort_type  
    end 

    if sort_type = "Custom" then do
        GismoColorPalettePram.1 = "OBJECTID=<GCP_GRIDTABLE_"gcp_grid_base_color">"
    end
    else do
        GismoColorPalettePram.1 = "OBJECTID=<GCP_"basis_color_list"_"sort_type">"
    end

    GismoColorPalettePram.2 = "AUTOSETUP=HIRES"

    GismoColorPalettePram.3 = "XCELLCOUNT=10"

    if basis_color_list = "ColorName" then do
        GismoColorPalettePram.4 = "YCELLCOUNT=14"
    end
    else if basis_color_list = "216ColorPalette" then do
        GismoColorPalettePram.4 = "YCELLCOUNT=22"
    end

    GismoColorPalettePram.5 = "XCELLWIDTH=30"
    GismoColorPalettePram.6 = "YCELLHEIGHT=20"

    GismoColorPalettePram.7 = "XCELLGAP=5"
    GismoColorPalettePram.8 = "YCELLGAP=5"


/*
    parse var color_rgb.1 "(" rr "," gg "," bb ")" .
    gcp_col = "0x"right(d2x(rr), 2, "0")""right(d2x(gg), 2, "0")""right(d2x(bb), 2, "0")
    GismoColorPalettePram.9 = "COLORS="gcp_col

    /* Make color table */
    do i = 2 to color_rgb.0
        parse var color_rgb.i "(" rr "," gg "," bb ")" .
        gcp_col = "0x"right(d2x(rr), 2, "0")""right(d2x(gg), 2, "0")""right(d2x(bb), 2, "0")
        GismoColorPalettePram.9 = GismoColorPalettePram.9","gcp_col
    end

    if basis_color_list = "216ColorPalette" then do
        GismoColorPalettePram.9 = GismoColorPalettePram.9",0x000000,0x000000,0x000000,0x000000"
    end
*/

    do i = 1 to color_rgb.0
        parse var color_rgb.i "(" rr "," gg "," bb ")" .
        gcp_col.i = "0x"right(d2x(rr), 2, "0")""right(d2x(gg), 2, "0")""right(d2x(bb), 2, "0")
    end
    gcp_col.0 = color_rgb.0

    if basis_color_list = "ColorName" then do
        row_max = 14
    end
    else if basis_color_list = "216ColorPalette" then do
        row_max = 22
    end

    do i = 1 to row_max
        gcp_col_10.i = ""

        do j = 1 to 10
            r_num = (i - 1) * 10 + j
            if r_num < 217 then do
                gcp_col_10.i = gcp_col_10.i","gcp_col.r_num
            end
            else do
                gcp_col_10.i = gcp_col_10.i",0x0000"
            end
        end
        
        if left(gcp_col_10.i, 1) = "," then do
            parse var gcp_col_10.i . "," gcp_col_10.i
        end
    end
    gcp_col_10.0 = row_max

    dummy = ""
    do i = row_max to 1 by -1
        dummy = dummy","gcp_col_10.i
    end

    if left(dummy, 1 ) = "," then do
        parse var dummy . "," dummy 
    end

    GismoColorPalettePram.9 = "COLORS="dummy

    GismoColorPalettePram.0 = 9

    place = '<WP_DESKTOP>';

    modus = 'Replace';

    setup = GismoColorPalettePram.1";"GismoColorPalettePram.2";"GismoColorPalettePram.3";"GismoColorPalettePram.4";"GismoColorPalettePram.5";"GismoColorPalettePram.6";"GismoColorPalettePram.7";"GismoColorPalettePram.8";"GismoColorPalettePram.9

    rc = SysCreateObject("WPColorPalette", GismoColorPaletteName, place, setup, modus);

return

/*:VRX         PB_Delete_Click
*/
PB_Delete_Click: 
if debug_mode = 1 then say "PB_Delete_Click"

    selected = VRGet( "DDCB_TagTemplateList", "Selected" )
    
    new_tag_number = 0
    do i = 1 to TagTemplate.0
        if i <> selected then do
            new_tag_number = new_tag_number + 1
            TagTemplate.new_tag_number = TagTemplate.i
        end
    end
    call WriteInitialFile

    TagTemplate.0 = new_tag_number
    TagTemplateNumber = selected
    if selected > TagTemplate.0 then TagTemplateNumber = TagTemplate.0
    call SetTagTemplateList

return

/*:VRX         PB_Exit_Click
*/
PB_Exit_Click: 
if debug_mode = 1 then say "PB_Exit_Click"

    call SetPosition

    if tag_template_window = "Enabled" then do
        call GetTagTemplateWindowPosition
    end

    if color_grid_table = "Enabled" then do
            call GetColorGridTablePosition
    end

    call WriteInitialFile

    call quit

return

/*:VRX         PB_ExitAbout_Click
*/
PB_ExitAbout_Click: 
if debug_mode = 1 then say "PB_ExitAbout_Click"

    ok = VRSet( "Window1", "Visible", 1)

    if tag_template_window = "Enabled" then do
        ok = VRSet( "SW_TagTemplateWindow", "Visible", 1)
    end

    ok = VRDestroy(SW_About)

return

/*:VRX         PB_Gradation_Click
*/
PB_Gradation_Click: 
if debug_mode = 1 then say "PB_Gradation_Click"

    call SetAllGridToBlack

    if sort_type <> "Custom" then do
        call ChangeColorValue
    end
    else do
        call LB_ColorList_Click
    end

return

/*:VRX         PB_HexDec_Click
*/
PB_HexDec_Click: 

    flug_red   = "ON"
    flug_green = "ON"
    flug_blue  = "ON"
    flug_colnum = "ON"
/*
    flug_spin_red   = "ON"
    flug_spin_green = "ON"
    flug_spin_blue  = "ON"
*/
    if color_number_indicate_type = "Decimal" then do
        color_number_indicate_type = "Hexadecimal"

        /* Change indicate */
        value = VRGet( "EF_ColorNumber", "Value" )
        value = right(d2x(substr(value, 1, 3)), 2, 0)""right(d2x(substr(value, 4, 3)), 2, 0)""right(d2x(substr(value, 7, 3)), 2, 0)

        ok = VRSet( "EF_ColorNumber", "TextLimit", 6 )

        ok = VRSet( "EF_ColorNumber", "Value", value )
        ok = VRSet( "PB_HexDec", "Caption", "Hex" )
    end
    else if color_number_indicate_type = "Hexadecimal" then do
        color_number_indicate_type = "Decimal"

        /* Change indicate */
        value = VRGet( "EF_ColorNumber", "Value" )
        value = right(x2d(substr(value, 1, 2)), 3, 0)""right(x2d(substr(value, 3, 2)), 3, 0)""right(x2d(substr(value, 5, 2)), 3, 0)
    
        ok = VRSet( "EF_ColorNumber", "TextLimit", 9 )

        ok = VRSet( "EF_ColorNumber", "Value", value )
        ok = VRSet( "PB_HexDec", "Caption", "Dec" )
    end


return

/*:VRX         PB_New_Click
*/
PB_New_Click: 
if debug_mode = 1 then say "PB_New_Click"

    tag_template = ""

    ok = VRSet( "DDCB_TagTemplateList", "Value", tag_template )
    ok = VRMethod( "DDCB_TagTemplateList", "SetFocus" )
    
    call SetTagText

return

/*:VRX         PB_NotYet_Click
*/
PB_NotYet_Click: 

    ok = VRDestroy( "SW_Registry" )

return

/*:VRX         PB_OpenRegistry_Click
*/
PB_OpenRegistry_Click: 
if debug_mode = 1 then say "PB_OpenRegistry_Click"

    registry_window_position = "OnPreference"

    registry_pos_x = VRGet( "SW_Preference", "Left" ) + ( VRGet( "SW_Preference", "Width"  ) - 3770 ) / 2
    registry_pos_y = VRGet( "SW_Preference", "Top"  ) + ( VRGet( "SW_Preference", "Height" ) - 2216 ) / 2

    ok = VRLoadSecondary( "SW_Registry", "w" )

return

/*:VRX         PB_Registory_Click
*/
PB_Registory_Click: 

    value = VRGet( "EF_RegistoryNumber", "Value" )

    if left(register_number, 4) = "DEMO" then do
        regnum = RegisterNumber.0 - 1
    end
    else do
        regnum = RegisterNumber.0
    end

/*  do i = 1 to RegisterNumber.0 */
    do i = 1 to regnum
        if value = RegisterNumber.i then Registry = "Registered"
    end

    if Registry = "Registered" then do
        register_number = Value

        ok = VRDestroy( "SW_Registry" )
    end
    else do
        ok = VRSet( "EF_RegistoryNumber", "Value", "" )
        ok = VRSet( "PB_Registory", "Enabled", 0 )
        ok = VRMethod( "EF_RegistoryNumber", "SetFocus" )
    end

return

/*:VRX         PB_WindowFont_Click
*/
PB_WindowFont_Click: 
if debug_mode = 1 then say "PB_WindowFont_Click"

    ok = VRSet( "PB_WindowFont", "Enabled", 0 )

    /*
    call VRLoadSecondary "SW_Preference", "w" 
    */
    call VRLoadSecondary "SW_Preference" 

return

/*:VRX         Pict_AboutSwitch_Click
*/
Pict_AboutSwitch_Click: 
if debug_mode = 1 then say "Pict_AboutSwitch_Click"
/*
    ok = VRSet( "Window1", "Visible", 0)
    if tag_template_window = "Enabled" then do
        ok = VRSet( "SW_TagTemplateWindow", "Visible", 0)
    end

    call VRLoadSecondary "SW_About"    
*/

    ok = VRLoadSecondary( "SW_Registry",  )

return

/*:VRX         Quit
*/
Quit:
    window = VRWindow()
    call VRSet window, "Shutdown", 1
    drop window
return

/*:VRX         RB_Background_Click
*/
RB_Background_Click: 
if debug_mode = 1 then say "RB_Background_Click"

    if color_position = "Foreground" then do
        color_position = "Background"

        fore_color_name   = selected_color_name
        fore_color_number = selected_color_number
        fore_selected     = selected

        selected_color_name   = back_color_name
        selected_color_number = back_color_number
        selected              = back_selected

        if selected <> 0 then do
            ok = VRSet( "LB_ColorList", "Selected", selected )
        end
        else do
            call SetColorBars
        end    

        call CopyToClipboard
    
        ok = VRMethod( "LB_ColorList", "SetFocus" )
    end

return

/*:VRX         RB_Decimal_Click
*/
RB_Decimal_Click: 
if debug_mode = 1 then say "RB_Decimal_Click"

    if color_number_indicate_type = "Hexadecimal" then do
        color_number_indicate_type = "Decimal"

        /* Change indicate */
        value = VRGet( "EF_ColorNumber", "Value" )
        value = right(x2d(substr(value, 1, 2)), 3, 0)""right(x2d(substr(value, 3, 2)), 3, 0)""right(x2d(substr(value, 5, 2)), 3, 0)
    
        ok = VRSet( "EF_ColorNumber", "TextLimit", 9 )

        flug_colnum = "OFF"

        ok = VRSet( "EF_ColorNumber", "Value", value )
        ok = VRSet( "PB_HexDec", "Caption", "Dec" )
    end
    
return

/*:VRX         RB_DynamicRibbonColor_Click
*/
RB_DynamicRibbonColor_Click: 
if debug_mode = 1 then say "RB_DynamicRibbonColor_Click"

    ribbon_color = "DynamicColor" 

    percentile = VRGet( "SL_Red", "Percentile" )
    red_dec = 255 * percentile % 100
    ok = VRSet( "SL_Red", "RibbonColor", "("red_dec",0,0)" )

    percentile = VRGet( "SL_Green", "Percentile" )
    green_dec = 255 * percentile % 100
    ok = VRSet( "SL_Green", "RibbonColor", "(0,"green_dec",0)" )

    percentile = VRGet( "SL_Blue", "Percentile" )
    blue_dec = 255 * percentile % 100
    ok = VRSet( "SL_Blue", "RibbonColor", "(0,0,"blue_dec")" )

return

/*:VRX         RB_FixedRibbonColor_Click
*/
RB_FixedRibbonColor_Click: 
if debug_mode = 1 then say "RB_FixedRibbonColor_Click"

    ribbon_color = "FixedColor" 

    ok = VRSet( "SL_Red",   "RibbonColor", "Red"   )
    ok = VRSet( "SL_Green", "RibbonColor", "Green" )
    ok = VRSet( "SL_Blue",  "RibbonColor", "Blue"  )

return

/*:VRX         RB_Foreground_Click
*/
RB_Foreground_Click: 
if debug_mode = 1 then say "RB_Foreground_Click"

    if color_position = "Background" then do
        color_position = "Foreground"

        back_color_name   = selected_color_name
        back_color_number = selected_color_number
        back_selected     = selected

        selected_color_name   = fore_color_name
        selected_color_number = fore_color_number
        selected              = fore_selected

        if selected <> 0 then do
            ok = VRSet( "LB_ColorList", "Selected", selected )
        end
        else do
            call SetColorBars
        end

        call CopyToClipboard

        ok = VRMethod( "LB_ColorList", "SetFocus" )
    end

return

/*:VRX         RB_Hexadecimal_Click
*/
RB_Hexadecimal_Click: 
if debug_mode = 1 then say "RB_Hexadecimal_Click"

    if color_number_indicate_type = "Decimal" then do
        color_number_indicate_type = "Hexadecimal"

        /* Change indicate */
        value = VRGet( "EF_ColorNumber", "Value" )
        value = right(d2x(substr(value, 1, 3)), 2, 0)""right(d2x(substr(value, 4, 3)), 2, 0)""right(d2x(substr(value, 7, 3)), 2, 0)

        ok = VRSet( "EF_ColorNumber", "TextLimit", 6 )

        flug_colnum = "OFF"

        ok = VRSet( "EF_ColorNumber", "Value", value )
        ok = VRSet( "PB_HexDec", "Caption", "Hex" )
    end
    
return

/*:VRX         RB_RealName_Click
*/
RB_RealName_Click: 
if debug_mode = 1 then say "RB_RealName_Click"

    if color_mode = "Number" then do
        color_mode = "Name"
        ok = VRSet( "RB_RGB",      "Set", 0 )
        ok = VRSet( "RB_RealName", "Set", 1 )
    end        
    
    if tag_template_window = "Enabled" then call SetTagText
    if always_copy = "Yes" then call CopyToClipboard

    /*
    call WriteInitialFile
    */

return

/*:VRX         RB_RGB_Click
*/
RB_RGB_Click: 
if debug_mode = 1 then say "RB_RGB_Click"

    if color_mode = "Name" then do
        color_mode = "Number"
        ok = VRSet( "RB_RGB",      "Set", 1 )
        ok = VRSet( "RB_RealName", "Set", 0 )
    end        

    if tag_template_window = "Enabled" then call SetTagText
    if always_copy = "Yes" then call CopyToClipboard

    /*
    call WriteInitialFile
    */

return

/*:VRX         ReadColorList
*/
ReadColorList: 
if debug_mode = 1 then say "ReadColorList"

    if color_list.0 = 1 then do
        color_list = "color.lst"    
        color_list_fullpath = gismo_directory"\"color_list

        i = 0
        do until lines(color_list_fullpath) = 0
            line_text = strip(linein(color_list_fullpath))
            parse var line_text color_name dummy
            parse var dummy "#" color_number

            if substr(color_name,1,1) <> ";" then do
                i = i + 1

                color_rowdata.i  = color_name
                number_rowdata.i = color_number
                
                red_row   = x2d(substr(color_number, 1, 2)) 
                green_row = x2d(substr(color_number, 3, 2)) 
                blue_row  = x2d(substr(color_number, 5, 2))

                hue_max = red_row /* hue_max = brightness */
                if hue_max < green_row then hue_max = green_row
                if hue_max < blue_row  then hue_max = blue_row
                brightness = hue_max
                value_rowdata.i = brightness

                hue_min = red_row
                if hue_min > green_row then hue_min = green_row
                if hue_min > blue_row  then hue_min = blue_row

                hue_diff = brightness - hue_min

                if hue_max > 0 then do
                    saturation = (255 * hue_diff) % brightness
                end
                else do
                    saturation = 0
                end
                saturation_rowdata.i = saturation 

                if saturation > 0 then do
                    red_dummy   = (60 * (brightness - red_row  )) % hue_diff
                    green_dummy = (60 * (brightness - green_row)) % hue_diff
                    blue_dummy  = (60 * (brightness - blue_row )) % hue_diff                        

                    select
                        when brightness = red_row then do
                            if hue_min = green_row then do
                                hue_rowdata.i = (300 + blue_dummy) // 360                
                            end
                            else do
                                hue_rowdata.i = 60 - green_dummy
                            end
                        end
                        when brightness = green_row then do
                            if hue_min = blue_row then do
                                hue_rowdata.i = 60 + red_dummy
                            end
                            else do
                                hue_rowdata.i = 180 - blue_dummy
                            end
                        end
                        when brightness = blue_row then do
                            if hue_min = red_row then do
                                hue_rowdata.i = 180 + green_dummy
                            end                        
                            else do 
                                hue_rowdata.i = 300 - red_dummy
                            end
                        end
                    end
                end
                else do
                    hue_rowdata.i = 0
                end
                /*
                say color_rowdata.i","number_rowdata.i","hue_rowdata.i","d2x(saturation_rowdata.i)","d2x(value_rowdata.i)
                */
            end
        end
        color_rowdata.0 = i 
        number_rowdata.0 = i
        hue_rowdata.0 = i
        saturation_rowdata.0 = i
        value_rowdata.0 = i

        call lineout color_list_fullpath

        call Sort sort_type        

        ok = VRMethod( "LB_ColorList", "AddStringList", "color." )

        ok = VRSet( "LB_ColorList", "Selected", 1 )
    end

return

/*:VRX         ReadInitialFile
*/
ReadInitialFile: 
if debug_mode = 1 then say "ReadInitialFile"

    TagTemplateNumber = 0
    TagTemplate.0 = 0

    do until lines(ini_file) = 0
        line_text=strip(linein(ini_file),,'=')
        parse var line_text keyword '=' detail options

        if left(keyword, 7) = "; Gismo" then do
           parse var keyword "(" old_version ")"
        end

        if detail <> "" then do
            if keyword = "ColorMode" then do
                color_mode = detail

                if color_mode = "Number" then do
                    ok = VRSet( "RB_RGB",      "Set", 1 )
                    ok = VRSet( "RB_RealName", "Set", 0 ) 
                end
                else do
                    color_mode = "Name"
                    ok = VRSet( "RB_RGB",      "Set", 0 ) 
                    ok = VRSet( "RB_RealName", "Set", 1 )
                end
            end

            if keyword = "AlwaysCopy" then do
                always_copy = detail
                if always_copy = "Yes" then do
                    ok = VRSet( "CB_AlwaysCopy", "Set", 1 )
                    ok = VRSet( "PB_Copy", "Enabled", 0 )
                end
                else do 
                    always_copy = "No"
                    ok = VRSet( "CB_AlwaysCopy", "Set", 0 )
                    ok = VRSet( "PB_Copy", "Enabled", 1 )
                end
            end
        
            if keyword = "Words" then gismo_words = detail

            if keyword = "Font" then do 
                font = detail
                if options <> "" then font = font options
                ok = VRSet( "DT_Colors", "Font", font )
            end                

            if keyword = "WindowFont" then do
                window_font = detail
                if options <> "" then window_font = window_font options
            end

            if keyword = "ColorNumberFont" then do
                color_number_font = detail
                if options <> "" then color_number_font = color_number_font options
            end

            if keyword = "ColorPosition" then do
                color_position = detail 

                if color_position = "Foreground" then do
                    ok = VRSet( "RB_Foreground", "Set", 1 )
                end
                if color_position = "Background" then do
                    ok = VRSet( "RB_Background", "Set", 1 )
                end
            end

            if keyword = "Foreground" then fore_color_selected = detail
            if keyword = "Background" then back_color_selected = detail
    
            if keyword = "PositionX" then position_x = detail
            if keyword = "PositionY" then position_y = detail

            if keyword = "PreferenceX" then preference_x = detail
            if keyword = "PreferenceY" then preference_y = detail

            if keyword = "Mode" then do
                Mode = detail
                if Mode = "debug" then debug_mode = 1
                else do
                    Mode = "Normal"
                    debug_mode = 0
                end
            end

            if keyword = "TagTemplateWindow" then do
                tag_template_window = detail
                if tag_template_window = "Enabled" then do
                    ok = VRSet( "CB_TagTemplate", "Set", 1 )                    
                end
                else if tag_template_window = "Disabled" then do
                    ok = VRSet( "CB_TagTemplate", "Set", 0 )                    
                end
            end

            if keyword = "TagTemplateSelected" then do
                tag_template_selected = detail
            end

            if keyword = "TagTemplate" then do
                TagTemplateNumber = TagTemplateNumber + 1                
        
                TagTemplate.TagTemplateNumber = strip(detail options, "t")
                TagTemplate.0 = TagTemplateNumber
            end

            if keyword = "SortType" then do
                sort_type = detail
            end

            if keyword = "RibbonColor" then do
                ribbon_color = detail
            end

            /* Color Grid Table */
            if keyword = "ColorGridTable" then do
                color_grid_table = detail
                /*
                select 
                    when color_grid_table = "Enabled" then do
                        ok = VRSet( "CB_ColorGridTable", "Set", 1 )
                        ok = VRLoadSecondary( "SW_ColorGridTable", )
                        ok = VRSet( "PB_Gradation", "Visible", 1 )
                    end
                    otherwise
                end
                */
            end
            if keyword = "ColorGridTablePositionX" then do
                color_grid_table_pos_x = detail
            end
            if keyword = "ColorGridTablePositionY" then do
                color_grid_table_pos_y = detail
            end

            if keyword = "RegisterNumber" then do
                register_number = detail
            end

            if keyword = "ColorNumberIndicateType" then do
                color_number_indicate_type = detail
                select                 
                    when color_number_indicate_type = "Hexadecimal" then do
                        ok = VRSet( "EF_ColorNumber", "TextLimit", 6 )
                        ok = VRSet( "PB_HexDec", "Caption", "Hex" )
                    end
                    when color_number_indicate_type = "Decimal"     then do
                        ok = VRSet( "EF_ColorNumber", "TextLimit", 9 )
                        ok = VRSet( "PB_HexDec", "Caption", "Dec" )
                    end
                    otherwise
                        nop
                end
            end

            if keyword = "HexDecChangeoverButton" then do
                hex_dec_changeover_button = detail
                select 
                    when hex_dec_changeover_button = "Enabled" then do
                        ok = VRSet( "PB_HexDec", "Visible", 1 )
                        ok = VRSet( "EF_ColorNumber", "Width", color_number_window_width_short )
                    end
                    when hex_dec_changeover_button = "Disabled" then do
                        ok = VRSet( "PB_HexDec", "Visible", 0 )
                        ok = VRSet( "EF_ColorNumber", "Width", color_number_window_width_long )
                    end
                    otherwise 
                        nop
                end
            end

            if keyword = "MovableTagTemplateWindow" then do
                movable_tag_template_window = detail
            end
            if keyword = "TagTemplatePositionX" then do
                extension_x = detail
            end
            if keyword = "TagTemplatePositionY" then do
                extension_y = detail
            end

            if keyword = "BasisColorList" then do
                basis_color_list = detail
            end
        end
    end
    call lineout ini_file

    ok = VRSet( "DT_Colors", "Caption", gismo_words )

return

/*:VRX         Set216ColorList
*/
Set216ColorList: 
if debug_mode = 1 then say "Set216ColorList"

    /* 216 Color List */
    i = 0 
    do r = 0 to 255 by 51
        do g = 0 to 255 by 51
            do b = 0 to 255 by 51
                i = i + 1
                Color216.i = right(d2x(r), 2, "0")""right(d2x(g), 2, "0")""right(d2x(b), 2, "0")
            end
        end
    end 
    Color216.0 = i

    /* Set 216 Color List */
    do i = 1 to Color216.0
        color_name   = "#"Color216.i
        color_number = Color216.i
            
        color_rowdata.i  = color_name
        number_rowdata.i = color_number
              
        red_row   = x2d(substr(color_number, 1, 2)) 
        green_row = x2d(substr(color_number, 3, 2)) 
        blue_row  = x2d(substr(color_number, 5, 2))

        hue_max = red_row /* hue_max = brightness */
        if hue_max < green_row then hue_max = green_row
        if hue_max < blue_row  then hue_max = blue_row
        brightness = hue_max
        value_rowdata.i = brightness

        hue_min = red_row
        if hue_min > green_row then hue_min = green_row
        if hue_min > blue_row  then hue_min = blue_row

        hue_diff = brightness - hue_min

        if hue_max > 0 then do
            saturation = (255 * hue_diff) % brightness
        end
        else do
            saturation = 0
        end
        saturation_rowdata.i = saturation 

        if saturation > 0 then do
            red_dummy   = (60 * (brightness - red_row  )) % hue_diff
            green_dummy = (60 * (brightness - green_row)) % hue_diff
            blue_dummy  = (60 * (brightness - blue_row )) % hue_diff                        

            select
                when brightness = red_row then do
                    if hue_min = green_row then do
                        hue_rowdata.i = (300 + blue_dummy) // 360                
                    end
                    else do
                        hue_rowdata.i = 60 - green_dummy
                    end
                end
                when brightness = green_row then do
                    if hue_min = blue_row then do
                        hue_rowdata.i = 60 + red_dummy
                    end
                    else do
                        hue_rowdata.i = 180 - blue_dummy
                    end
                end
                when brightness = blue_row then do
                    if hue_min = red_row then do
                        hue_rowdata.i = 180 + green_dummy
                    end                        
                    else do 
                        hue_rowdata.i = 300 - red_dummy
                    end
                end
            end
        end
        else do
            hue_rowdata.i = 0
        end
    end

    color_rowdata.0      = Color216.0 
    number_rowdata.0     = Color216.0
    hue_rowdata.0        = Color216.0
    saturation_rowdata.0 = Color216.0
    value_rowdata.0      = Color216.0

    call Sort sort_type        

    ok = VRMethod( "LB_ColorList", "AddStringList", "color." )
    ok = VRSet( "LB_ColorList", "Selected", 1 )

return

/*:VRX         SetAllGridToBlack
*/
SetAllGridToBlack: 
if debug_mode = 1 then say "SetAllGridToBlack"

    /* 黒で初期化(ColorGridTable) */
    if color_grid_table = "Enabled" then do
        do i = 1 to 220
            dummy_rgb.i = "(000,000,000)"
        end
        dummy_rgb.0 = 220
        ok = VRMethod( "VS_ColorGrid", "SetAttributes", "Values", "dummy_rgb." )
    end

return

/*:VRX         SetColorBars
*/
SetColorBars: 
if debug_mode = 1 then say "SetColorBars"

    call Color_X2D
    
    if (red_dec*100)//255 <> 0 then fix = 1
    else                            fix = 0
    RedPercentile = (red_dec * 100) % 255 + fix 
    ok = VRSet( "SL_Red", "Percentile",  RedPercentile )

    if (green_dec*100)//255 <> 0 then fix = 1
    else                              fix = 0
    GreenPercentile = (green_dec * 100) % 255 + fix 
    ok = VRSet( "SL_Green", "Percentile",  GreenPercentile )
 
    if (blue_dec*100)//255 <> 0 then fix = 1
    else                             fix = 0
    BluePercentile = (blue_dec * 100) % 255 + fix
    ok = VRSet( "SL_Blue", "Percentile",  BluePercentile )

    if ribbon_color = "DynamicColor" then do
        ok = VRSet( "SL_Red", "RibbonColor", "("red_dec",0,0)" )
        ok = VRSet( "SL_Green", "RibbonColor", "(0,"green_dec",0)" )
        ok = VRSet( "SL_Blue", "RibbonColor", "(0,0,"blue_dec")" )
    end

    call SetColors

return

/*:VRX         SetColorGridTableColor
*/
SetColorGridTableColor: 
if debug_mode = 1 then say "SetColorGridTableColor"

    do i = 1 to color.0
        rr = x2d(left(right(number.i, 6), 2))
        gg = x2d(left(right(number.i, 4), 2))
        bb = x2d(right(number.i, 2))
        color_rgb.i = "("rr","gg","bb")"
    end
    color_rgb.0 = color.0

    ok = VRSet("SW_ColorGridTable", "Caption", "Gismo - Color Grid Table ("sort_type")" )   

    ok = VRMethod( "VS_ColorGrid", "SetAttributes", "Values", "color_rgb." )
    ok = VRSet( "VS_ColorGrid", "Selected", selected )

    ok = VRSet( "DT_ColorName", "Caption", color.selected" "number.selected )
    
return

/*:VRX         SetColors
*/
SetColors: 
if debug_mode = 1 then say "SetColors"

    ok = VRSet( "Pict_Colors",      "BackColor",   "("red_dec","green_dec","blue_dec")" )
    ok = VRSet( "Pict_AboutSwitch", "BorderColor", "("red_dec","green_dec","blue_dec")" )
    ok = VRSet( "Pict_Colors",      "BorderColor", "("red_dec","green_dec","blue_dec")" )

    if color_position = "Background" then do
        ok = VRSet( "DT_Colors", "BackColor", "("red_dec","green_dec","blue_dec")" )
    end
    if color_position = "Foreground" then do
        ok = VRSet( "DT_Colors", "ForeColor", "("red_dec","green_dec","blue_dec")" )
    end

return

/*:VRX         SetPosition
*/
SetPosition: 
if debug_mode = 1 then say "SetPosition"

    position_x = VRGet( "Window1", "Left")
    position_y = VRGet( "Window1", "Top")

    call WriteInitialFile

return

/*:VRX         SetPreferenceWindowFont
*/
SetPreferenceWindowFont: 
if debug_mode = 1 then say "SetFontWindowFont"

    ok = VRSet( "GB_Font",       "Font", window_font )
    ok = VRSet( "DT_WindowFont", "Font", window_font )
    ok = VRSet( "EF_Font",       "Font", window_font )
    ok = VRSet( "PB_ChangeFont", "Font", window_font )

    ok = VRSet( "DT_ForeColorTextFont",       "Font", window_font )
/*  ok = VRSet( "EF_ForeColorTextFont",       "Font", font ) */
    ok = VRSet( "EF_ForeColorTextFont",       "Font", window_font ) 
    ok = VRSet( "PB_ChangeForeColorTextFont", "Font", window_font )

    ok = VRSet( "DT_ColorNumberFont",       "Font", window_font )
/*  ok = VRSet( "EF_ColorNumberFont",       "Font", color_number_font ) */
    ok = VRSet( "EF_ColorNumberFont",       "Font", window_font )
    ok = VRSet( "PB_ChangeColorNumberFont", "Font", window_font )

    ok = VRSet( "GB_RGBSliderColor",     "Font", window_font )
    ok = VRSet( "RB_FixedRibbonColor",   "Font", window_font )
    ok = VRSet( "RB_DynamicRibbonColor", "Font", window_font )

    ok = VRSet( "PB_CloseChangeFontWindow", "Font", window_font )

    ok = VRSet( "PB_OpenRegistry", "Font", window_font )

    ok = VRSet( "GB_HexDec",                 "Font", window_font )
    ok = VRSet( "RB_Hexadecimal",            "Font", window_font )
    ok = VRSet( "RB_Decimal",                "Font", window_font )
    ok = VRSet( "CB_HexDecChangeoverButton", "Font", window_font )

    ok = VRSet( "GB_TagTemplateWindow", "Font", window_font )
    ok = VRSet( "CB_MovableTagTemplateWindow", "Font", window_font )

return

/*:VRX         SetSelectedColor
*/
SetSelectedColor: 
if debug_mode = 1 then say "SetSelectedColor"

    if color_position = "Foreground" then do
        fore_selected = fore_color_selected
        back_selected = back_color_selected
        selected_color_number = number.back_color_selected
        call Color_X2D            
        ok = VRSet( "DT_Colors", "BackColor", "("red_dec","green_dec","blue_dec")" )
        selected = fore_color_selected        
        ok = VRSet( "LB_ColorList", "Selected", selected )
    end
    if color_position = "Background" then do
        fore_selected = fore_color_selected
        back_selected = back_color_selected
        selected_color_number = number.fore_color_selected
        call Color_X2D            
        ok = VRSet( "DT_Colors", "ForeColor", "("red_dec","green_dec","blue_dec")" )
        selected = back_color_selected
        ok = VRSet( "LB_ColorList", "Selected", selected )
    end

return

/*:VRX         SetTagTemplateList
*/
SetTagTemplateList: 
if debug_mode = 1 then say "SetTemplateList"

    ok = VRMethod( "DDCB_TagTemplateList", "Clear" )

    if TagTemplate.0 > 0 then do
        ok = VRMethod( "DDCB_TagTemplateList", "AddStringList", "TagTemplate.",  )
        ok = VRSet( "DDCB_TagTemplateList", "Selected", TagTemplateNumber )

        ok = VRSet( "DDCB_TagTemplateList", "Selected", tag_template_selected )
    end
    else if TagTemplate.0 = 0 then do
        ok = VRSet( "DDCB_TagTemplateList", "Value", "" )
    end

return

/*:VRX         SetTagTemplateWindowFont
*/
SetTagTemplateWindowFont: 
if debug_mode = 1 then say "TagTemplateWindowFont"

    ok = VRSet( "DDCB_TagTemplateList", "Font", window_font )
    ok = VRSet( "EF_TagText",           "Font", window_font )
 
    ok = VRSet( "PB_New",    "Font", window_font )
    ok = VRSet( "PB_Add",    "Font", window_font )
    ok = VRSet( "PB_Delete", "Font", window_font )

return

/*:VRX         SetTagTemplateWindowTitleBar
*/
SetTagTemplateWindowTitleBar: 
if debug_mode = 1 then say "SetTagTemplateWindowTitleBar"

    select 
        when movable_tag_template_window = "Enabled" then do
            ok = VRSet( "SW_TagTemplateWindow", "TitleBar", 1 )
            ok = VRSet( "SW_TagTemplateWindow", "Caption", "Gismo - Tag Template" )
            ok = VRSet( "SW_TagTemplateWindow", "Height", tag_template_window_height_long )
        end
        when movable_tag_template_window = "Disabled" then do
            ok = VRSet( "SW_TagTemplateWindow", "TitleBar", 0 )
            ok = VRSet( "SW_TagTemplateWindow", "Height", tag_template_window_height_short )
        end
    end


return

/*:VRX         SetTagText
*/
SetTagText: 
if debug_mode = 1 then say "SetTagText"

    tag_template = VRGet( "DDCB_TagTemplateList", "Value" )
    tag_template_length = length(tag_template)

    if pos("%c", tag_template) <> 0 then do
        parse var tag_template front "%c" back

        if color_mode = "Number" then do
            if left(selected_color_number, 1) = "#" then do
                tag_text = front""selected_color_number""back 
            end
            else do
                tag_text = front"#"selected_color_number""back 
            end
        end

        if color_mode = "Name" then do    
            tag_text = front""selected_color_name""back
        end
    end
    else do
        tag_text = tag_template
    end
    tag_template = tag_text

    forename = color.fore_color_selected
    forenum  = number.fore_color_selected
    backname = color.back_color_selected
    backnum  = number.back_color_selected
    select
        when color_position = "Foreground" then do
            forename = selected_color_name
            forenum  = selected_color_number
        end
        when color_position = "Background" then do
            backname = selected_color_name
            backnum  = selected_color_number
        end
    end

    if pos("%f", tag_template) <> 0 then do
        parse var tag_template front "%f" back

        if color_mode = "Number" then do
            if left(forenum, 1) = "#" then do
                tag_text = front""forenum""back
            end
            else do
                tag_text = front"#"forenum""back
            end
        end

        if color_mode = "Name" then do    
            tag_text = front""forename""back
        end
    end
    else do
        tag_text = tag_template
    end
    tag_template = tag_text

    if pos("%b", tag_template) <> 0 then do
        parse var tag_template front "%b" back

        if color_mode = "Number" then do
            if left(backnum, 1) = "#" then do
                tag_text = front""backnum""back
            end
            else do
                tag_text = front"#"backnum""back
            end
        end

        if color_mode = "Name" then do    
            tag_text = front""backname""back
        end
    end
    else do
        tag_text = tag_template
    end
    
    tag_text = strip(tag_text, "t")
    ok = VRSet( "EF_TagText", "Value", tag_text )
    if always_copy = "Yes" then call CopyToClipboard
    
return

/*:VRX         SetWindowFont
*/
SetWindowFont: 
if debug_mode = 1 then say "SetWindowFont"

    /* main window */
    ok = VRSet( "RB_Foreground",       "Font", window_font )
    ok = VRSet( "RB_Background",       "Font", window_font )
    ok = VRSet( "LB_ColorList",        "Font", window_font )

    ok = VRSet( "DDCB_SortType",       "Font", window_font )

    ok = VRSet( "RB_RGB",              "Font", window_font )
    ok = VRSet( "RB_RealName",         "Font", window_font )

    ok = VRSet( "PB_Copy",             "Font", window_font )
    ok = VRSet( "PB_WindowFont",       "Font", window_font )
    ok = VRSet( "PB_Exit",             "Font", window_font )

    ok = VRSet( "CB_TagTemplate",      "Font", window_font )
    ok = VRSet( "CB_AlwaysCopy",       "Font", window_font )
    ok = VRSet( "CB_ColorGridTable",   "Font", window_font )

    ok = VRSet( "PB_Gradation",        "Font", window_font )

    ok = VRSet( "PB_HexDec",           "Font", window_font )

    ok = VRSet( "DDCB_BasisColorList", "Font", window_font )

    ok = VRSet( "EF_ColorNumber", "Font", color_number_font )

    /* tag template window */
    if tag_template_window = "Enabled" then do
        call SetTagTemplateWindowFont
    end

    if color_grid_table = "Enabled" then do
        ok = VRSet( "DT_ColorName", "Font", window_font )

        ok = VRSet( "PB_CreateColorPalette", "Font", window_font )
    end
    

return

/*:VRX         SL_Blue_Change
*/
SL_Blue_Change: 
if debug_mode = 1 then say "SL_Blue_Change"

    if flug_blue = "OFF" then do 
        percentile = VRGet( "SL_Blue", "Percentile" )

        blue_dec = 255 * percentile % 100
        blue     = d2x(blue_dec, 2)

        if ribbon_color = "DynamicColor" then do
            ok = VRSet( "SL_Blue", "RibbonColor", "(0,0,"blue_dec")" )
        end
        
        call ChangeColorValue    
    end
    flug_blue = "OFF"

return

/*:VRX         SL_Green_Change
*/
SL_Green_Change: 
if debug_mode = 1 then say "SL_Green_Change"

    if flug_green = "OFF" then do    
        percentile = VRGet( "SL_Green", "Percentile" )

        green_dec = 255 * percentile % 100
        green     = d2x(green_dec, 2)
    
        if ribbon_color = "DynamicColor" then do
            ok = VRSet( "SL_Green", "RibbonColor", "(0,"green_dec",0)" )
        end

        call ChangeColorValue    
    end
    flug_green = "OFF"

return

/*:VRX         SL_Red_Change
*/
SL_Red_Change: 
if debug_mode = 1 then say "SL_Red_Change"

    if flug_red = "OFF" then do
        percentile = VRGet( "SL_Red", "Percentile" )

        red_dec = 255 * percentile % 100
        red     = d2x(red_dec, 2)

        if ribbon_color = "DynamicColor" then do
            ok = VRSet( "SL_Red", "RibbonColor", "("red_dec",0,0)" )
        end
        
        call ChangeColorValue    
    end
    flug_red = "OFF" 

return

/*:VRX         Sort
*/
Sort: 
if debug_mode = 1 then say "Sort"

    new_sort_type = arg(1)

    distance = color_rowdata.0
    do forever
        ready = 1
        if ready = 1 then do
            if distance = 1 then leave
        end    

        distance = trunc((distance / 1.34) + 0.5)

        do i = 1 to color_rowdata.0 - distance
            j = i + distance
            /*
            call Comparison arg(1)
            */
            call Comparison new_sort_type

            /* if less = 1 then do */ /* descending */
            if less <> 1 then do  /* ascending */

                help_var = hue_rowdata.i
                hue_rowdata.i = hue_rowdata.j
                hue_rowdata.j = help_var

                help_var = saturation_rowdata.i
                saturation_rowdata.i = saturation_rowdata.j
                saturation_rowdata.j = help_var

                help_var = value_rowdata.i
                value_rowdata.i = value_rowdata.j
                value_rowdata.j = help_var

                help_var = color_rowdata.i
                color_rowdata.i = color_rowdata.j
                color_rowdata.j = help_var

                help_var = number_rowdata.i
                number_rowdata.i = number_rowdata.j
                number_rowdata.j = help_var

                ready = 0
            end
        end
    end

    do i = 1 to color_rowdata.0 
        color.i = color_rowdata.i
        number.i = number_rowdata.i
        hue.i = hue_rowdata.i
    end

    color.0 = color_rowdata.0
    number.0 = number_rowdata.0        
    hue.0 = hue_rowdata.0

return

/*:VRX         SPIN_BlueValue_Change
*/
SPIN_BlueValue_Change: 

    if flug_spin_blue = "OFF" then do
        flug_red    = "ON"
        flug_green  = "ON"
        flug_blue   = "ON"
        flug_colnum = "ON"

        blue_dec = VRGet( "SPIN_BlueValue", "Value" )
        blue     = d2x(blue_dec, 2)

        ok = VRSet( "SL_Blue", "Percentile", (blue_dec * 100) % 255 )

        call ChangeColorValue
    end 
    flug_spin_blue = "OFF"

return

/*:VRX         SPIN_GreenValue_Change
*/
SPIN_GreenValue_Change: 

    if flug_spin_green = "OFF" then do
        flug_red    = "ON"
        flug_green  = "ON"
        flug_blue   = "ON"
        flug_colnum = "ON"

        green_dec = VRGet( "SPIN_GreenValue", "Value" )
        green     = d2x(green_dec, 2)

        ok = VRSet( "SL_Green", "Percentile", (green_dec * 100) % 255 )

        call ChangeColorValue
    end 
    flug_spin_green = "OFF"

return

/*:VRX         SPIN_RedValue_Change
*/
SPIN_RedValue_Change: 

    if flug_spin_red = "OFF" then do
        flug_red    = "ON"
        flug_green  = "ON"
        flug_blue   = "ON"
        flug_colnum = "ON"

        red_dec = VRGet( "SPIN_RedValue", "Value" )
        red     = d2x(red_dec, 2)

        ok = VRSet( "SL_Red", "Percentile", (red_dec * 100) % 255 )

        call ChangeColorValue
    end 
    flug_spin_red = "OFF"

return

/*:VRX         SW_About_Close
*/
SW_About_Close: 
    call SW_About_Fini
return

/*:VRX         SW_About_Create
*/
SW_About_Create: 
    call SW_About_Init
return

/*:VRX         SW_About_Fini
*/
SW_About_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_About_Init
*/
SW_About_Init: 

    gismo_text = "Gismo : HTML color support application by Ken Kinoshita (kinop@sakura.email.ne.jp)."

    gismo_file = gismo_directory"\Gismo.txt"

    rc = SysFileTree(gismo_file, file)

    CR = "0d"x
    if file.0 <> 0 then do
        gismo_text = ""
        i = 1
        do until lines(gismo_file) = 0
            line_text=strip(linein(gismo_file))

            if i = 1 then gismo_text = line_text
            else          gismo_text = gismo_text""CR""line_text  

            i = i + 1
        end    
        call lineout gismo_file
    end

    ok = VRSet( "MLE_1", "Value", gismo_text )
    ok = VRSet( "Pict_AboutRatt1", "BorderColor", "("red_dec","green_dec","blue_dec")" )

    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"

        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_ColorGridTable_Close
*/
SW_ColorGridTable_Close: 
    call SW_ColorGridTable_Fini
return

/*:VRX         SW_ColorGridTable_Create
*/
SW_ColorGridTable_Create: 
    call SW_ColorGridTable_Init
return

/*:VRX         SW_ColorGridTable_Fini
*/
SW_ColorGridTable_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_ColorGridTable_Init
*/
SW_ColorGridTable_Init: 

    call SetColorGridTableColor

    ok = VRSet( "DT_ColorName", "Font", window_font )

    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        
        ok = VRSet("SW_ColorGridTable", "Left", color_grid_table_pos_x)
        ok = VRSet("SW_ColorGridTable", "Top",  color_grid_table_pos_y)

        if basis_color_list = "ColorName" then do
            ok = VRSet( "SW_ColorGridTable", "Height", color_grid_table_height_short )
        end
        else if basis_color_list = "216ColorPalette" then do
            ok = VRSet( "SW_ColorGridTable", "Height", color_grid_table_height_long )
        end

        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_Preference_Close
*/
SW_Preference_Close: 
    call SW_Preference_Fini
return

/*:VRX         SW_Preference_Create
*/
SW_Preference_Create: 
    call SW_Preference_Init
return

/*:VRX         SW_Preference_Fini
*/
SW_Preference_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_Preference_Init
*/
SW_Preference_Init: 

    ok = VRSet( "SW_Preference", "Caption", "Gismo - Preference" )

    ok = VRSet( "EF_Font", "Value", window_font )
    ok = VRSet( "EF_ForeColorTextFont", "Value", font )
    ok = VRSet( "EF_ColorNumberFont", "Value", color_number_font )

    if ribbon_color = "DynamicColor" then do
        ok = VRSet( "RB_DynamicRibbonColor", "Set", 1 )
    end
    else if ribbon_color = "FixedColor" then do
        ok = VRSet( "RB_FixedRibbonColor", "Set", 1 )
    end

    if color_number_indicate_type = "Hexadecimal" then do
        ok = VRSet( "RB_Hexadecimal", "Set", 1 )
    end
    else if color_number_indicate_type = "Decimal" then do
        ok = VRSet( "RB_Decimal", "Set", 1 )
    end

    if hex_dec_changeover_button = "Enabled" then do
        ok = VRSet( "CB_HexDecChangeoverButton", "Set", 1 )
    end
    else if hex_dec_changeover_button = "Disabled" then do
        ok = VRSet( "CB_HexDecChangeoverButton", "Set", 0 )
    end

    if movable_tag_template_window = "Enabled" then do
        ok = VRSet( "CB_MovableTagTemplateWindow", "Set", 1 )
    end
    else if movable_tag_template_window = "Disabled" then do
        ok = VRSet( "CB_MovableTagTemplateWindow", "Set", 0 )
    end

    if Registry = "Registered" then do
        ok = VRSet( "PB_OpenRegistry", "Caption", "About" )
    end

    call SetPreferenceWindowFont
    
    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"

        ok = VRSet( "SW_Preference", "Left",   preference_x )
        ok = VRSet( "SW_Preference", "Top", preference_y )

        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_Registry_Close
*/
SW_Registry_Close: 
    call SW_Registry_Fini
return

/*:VRX         SW_Registry_Create
*/
SW_Registry_Create: 
    call SW_Registry_Init
return

/*:VRX         SW_Registry_Fini
*/
SW_Registry_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_Registry_Init
*/
SW_Registry_Init: 

    ok = VRSet( "SW_Registry", "Caption", "Gismo for OS/2 "Gismo_version )

    if registry_mode = "Startup" then do
        ok = VRSet( "TM_RegistrySleepTimer", "Enabled", 1 )
        ok = VRSet( "PB_NotYet", "Enabled", 0 )
    end
    else do
        ok = VRSet( "TM_RegistrySleepTimer", "Visible", 0 )
        if Registry = "Registered" then do
            /*
            ok = VRSet( "EF_RegistoryNumber", "Value", register_number )
            ok = VRSet( "EF_RegistoryNumber", "ReadOnly", 1 )
            ok = VRSet( "EF_RegistoryNumber", "BackColor", "PaleGray" )
            ok = VRSet( "DT_9", "Caption", "Your Register Number" )
            */
            /* 登録された時は見えないように隠す */
            ok = VRSet( "EF_RegistoryNumber", "Visible", 0 )
            ok = VRSet( "DT_9", "Visible", 0 )

            /* ボタンも上に移動する */            

            ok = VRSet( "PB_Registory", "Visible", 0 )
            ok = VRSet( "PB_NotYet", "Caption", "Return" )

            ok = VRSet( "PB_NotYet", "Top", 1927 )
            ok = VRSet( "SW_Registry", "Height", 2638 )

            ok = VRSet( "DT_RegistryType", "BackColor", "(32,178,170)" )
            ok = VRSet( "DT_RegistryType", "ForeColor", "White" )
            ok = VRSet( "DT_RegistryType", "Caption", " Registered " )
            /* DEMO用 */
            if left(register_number, 4) = "DEMO" then do
                ok = VRSet( "DT_RegistryType", "Caption", " DEMO " )
            end
        end
    end

    reg_cnt = 0

    /* Set Font */
    ok = VRSet( "TM_RegistrySleepTimer", "Font", window_font )
    ok = VRSet( "DT_RegistryType", "Font", window_font )
    ok = VRSet( "DT_8", "Font", window_font )
    ok = VRSet( "GB_1", "Font", window_font )
    ok = VRSet( "DT_2", "Font", window_font )
    ok = VRSet( "EF_1", "Font", window_font )
    ok = VRSet( "DT_3", "Font", window_font )
    ok = VRSet( "EF_2", "Font", window_font )
    ok = VRSet( "DT_9", "Font", window_font )
    ok = VRSet( "EF_RegistoryNumber", "Font", window_font )
    ok = VRSet( "PB_Registory", "Font", window_font )
    ok = VRSet( "PB_NotYet", "Font", window_font )

    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"

        if registry_mode <> "Startup" then do
            ok = VRSet( "SW_Registry", "Left", registry_pos_x )
            ok = VRSet( "SW_Registry", "Top",  registry_pos_y )
        end        

        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_TagTemplateWindow_Close
*/
SW_TagTemplateWindow_Close: 
    call SW_TagTemplateWindow_Fini
return

/*:VRX         SW_TagTemplateWindow_Create
*/
SW_TagTemplateWindow_Create: 
    call SW_TagTemplateWindow_Init
return

/*:VRX         SW_TagTemplateWindow_Fini
*/
SW_TagTemplateWindow_Fini: 
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_TagTemplateWindow_Init
*/
SW_TagTemplateWindow_Init: 

    TagSelectedNumber = TagTemplate.0
    call SetTagTemplateList

    call SetTagTemplateWindowFont

    call SetTagTemplateWindowTitleBar

    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"

        ok = VRSet( "SW_TagTemplateWindow", "Left", extension_x)
        ok = VRSet( "SW_TagTemplateWindow", "Top",  extension_y)

        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         TM_RegistryAnimationTimer_Trigger
*/
TM_RegistryAnimationTimer_Trigger: 

    reg_cnt = reg_cnt + 1

    select 
        when reg_cnt = 2 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "gIsmo" )
        end
        when reg_cnt = 4 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "giSmo" )
            ok = VRSet( "Pict_1", "PicturePath", "#122" )
        end
        when reg_cnt = 6 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "gisMo" )
        end
        when reg_cnt = 8 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "gismO" )
            ok = VRSet( "Pict_1", "PicturePath", "#120" )
        end
        when reg_cnt = 10 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "gisMo" )
        end
        when reg_cnt = 12 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "giSmo" )
            ok = VRSet( "Pict_1", "PicturePath", "#122" )
        end
        when reg_cnt = 14 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "gIsmo" )
        end
        when reg_cnt = 16 then do
            ok = VRSet( "DT_GismoTitle", "Caption", "Gismo" )
            ok = VRSet( "Pict_1", "PicturePath", "#120" )
            reg_cnt = 0
        end
        otherwise
    end

return

/*:VRX         TM_RegistrySleepTimer_Trigger
*/
TM_RegistrySleepTimer_Trigger: 

    registry_sleep = registry_sleep - 1

    select 
        when registry_sleep = 0 then do
            ok = VRSet( "TM_RegistrySleepTimer", "Visible", 0 )
            ok = VRSet( "PB_NotYet", "Enabled", 1 )
        end
        otherwise do
            ok = VRSet( "TM_RegistrySleepTimer", "Caption", "Pausing for "registry_sleep" sec." )
        end
    end

return

/*:VRX         VS_ColorGrid_Click
*/
VS_ColorGrid_Click: 
if debug_mode = 1 then say "VS_ColorGrid_Click"

    selected = VRGet( "VS_ColorGrid", "Selected" )

/*
    if selected > color.0 then do
        selected = color.0
        ok = VRSet( "VS_ColorGrid", "Selected", selected )
    end
*/
    if sort_type <> "Custom" then do

        if selected > color.0 then do
            selected = color.0
            ok = VRSet( "VS_ColorGrid", "Selected", selected )
        end

        if cgt_flug1 = "ON" then do
            ok = VRSet( "LB_ColorList", "Selected", selected )
            cgt_flug2 = "OFF"
        end
        else do
            cgt_flug1 = "ON"
        end

        ok = VRSet( "DT_ColorName", "Caption", color.selected" RGB:"number.selected )
    end
    else if sort_type = "Custom" then do
        ok = VRSet( "DT_ColorName", "Caption", "Custom RGB:"custom_color.selected )

        selected_color_number = "#"custom_color.selected
        selected_color_name   = "#"custom_color.selected

        if tag_template_window = "Enabled" then call SetTagText
        if always_copy = "Yes" then call CopyToClipboard

        red_dec   = x2d(left(right(custom_color.selected, 6), 2))
        green_dec = x2d(left(right(custom_color.selected, 4), 2))
        blue_dec  = x2d(right(custom_color.selected, 2))
        call SetColors
    end

return

/*:VRX         Window1_Close
*/
Window1_Close:
    call Quit
return

/*:VRX         WriteInitialFile
*/
WriteInitialFile: 
if debug_mode = 1 then say "WriteInitialFile"

    outfile = ini_file
    rc = SysFileDelete(outfile)    

    call lineout outfile, ";",1
    call lineout outfile, "; Gismo, Colors 4 HTML ("Gismo_version")"
    call lineout outfile, "; "

    call lineout outfile, "ColorMode="color_mode

    call lineout outfile, "SortType="sort_type
    call lineout outfile, "BasisColorList="basis_color_list
    
    call lineout outfile, "AlwaysCopy="always_copy

    call lineout outfile, "Words="gismo_words
    call lineout outfile, "Font="font

    call lineout outfile, "WindowFont="window_font
    call lineout outfile, "ColorNumberFont="color_number_font

    call lineout outfile, "RibbonColor="ribbon_color

    call lineout outfile, "ColorNumberIndicateType="color_number_indicate_type
    call lineout outfile, "HexDecChangeoverButton="hex_dec_changeover_button

    call lineout outfile, "ColorPosition="color_position
    call lineout outfile, "Foreground="fore_color_selected
    call lineout outfile, "Background="back_color_selected
    
    call lineout outfile, "PositionX="position_x
    call lineout outfile, "PositionY="position_y

    call lineout outfile, "PreferenceX="preference_x
    call lineout outfile, "PreferenceY="preference_y
   
    call lineout outfile, "MovableTagTemplateWindow="movable_tag_template_window
    call lineout outfile, "TagTemplatePositionX="extension_x
    call lineout outfile, "TagTemplatePositionY="extension_y

    call lineout outfile, "ColorGridTable="color_grid_table
    call lineout outfile, "ColorGridTablePositionX="color_grid_table_pos_x
    call lineout outfile, "ColorGridTablePositionY="color_grid_table_pos_y

    call lineout outfile, "TagTemplateWindow="tag_template_window

    if TagTemplate.0 > 0 then do
        call lineout outfile, "TagTemplateSelected="tag_template_selected
        do i = 1 to TagTemplate.0
            call lineout outfile, "TagTemplate="TagTemplate.i
        end
    end

    call lineout outfile, "RegisterNumber="register_number

    call lineout outfile, "Mode="Mode

    call lineout outfile

    ok = VRMethod( "LB_ColorList", "SetFocus" )

return

