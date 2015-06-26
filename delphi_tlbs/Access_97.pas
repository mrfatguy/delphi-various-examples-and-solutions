unit Access_97;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2010-09-01 14:25:44 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Microsoft Office\Office\MSACC8.OLB (1)
// LIBID: {4AFFC9A0-5F99-101B-AF4E-00AA003F0F07}
// LCID: 0
// Helpfile: C:\Program Files\Microsoft Office\Office\acvba80.hlp
// HelpString: Microsoft Access 8.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v4.0 DAO, (C:\Program Files\Common Files\Microsoft Shared\DAO\DAO350.DLL)
//   (3) v2.0 Office, (C:\Program Files\Microsoft Office\Office\MSO97.DLL)
// Errors:
//   Hint: Symbol 'Hyperlink' renamed to 'AccessHyperlink'
//   Hint: Symbol 'Page' renamed to 'AccessPage'
//   Hint: Symbol 'Control' renamed to 'AccessControl'
//   Hint: Symbol 'Label' renamed to 'AccessLabel'
//   Hint: Symbol 'Rectangle' renamed to 'AccessRectangle'
//   Hint: Symbol 'Line' renamed to 'AccessLine'
//   Hint: Symbol 'Image' renamed to 'AccessImage'
//   Hint: Symbol 'CommandButton' renamed to 'AccessCommandButton'
//   Hint: Symbol 'OptionButton' renamed to 'AccessOptionButton'
//   Hint: Symbol 'CheckBox' renamed to 'AccessCheckBox'
//   Hint: Symbol 'OptionGroup' renamed to 'AccessOptionGroup'
//   Hint: Symbol 'BoundObjectFrame' renamed to 'AccessBoundObjectFrame'
//   Hint: Symbol 'TextBox' renamed to 'AccessTextBox'
//   Hint: Symbol 'ListBox' renamed to 'AccessListBox'
//   Hint: Symbol 'ComboBox' renamed to 'AccessComboBox'
//   Hint: Symbol 'ObjectFrame' renamed to 'AccessObjectFrame'
//   Hint: Symbol 'PageBreak' renamed to 'AccessPageBreak'
//   Hint: Symbol 'ToggleButton' renamed to 'AccessToggleButton'
//   Hint: Symbol 'PaletteButton' renamed to 'AccessPaletteButton'
//   Hint: Symbol 'SubForm' renamed to 'AccessSubForm'
//   Hint: Symbol 'SubReport' renamed to 'AccessSubReport'
//   Hint: Symbol 'CustomControl' renamed to 'AccessCustomControl'
//   Hint: Symbol 'TabControl' renamed to 'AccessTabControl'
//   Hint: Symbol 'Section' renamed to 'AccessSection'
//   Hint: Symbol 'GroupLevel' renamed to 'AccessGroupLevel'
//   Hint: Symbol 'Form' renamed to 'AccessForm'
//   Hint: Symbol 'Report' renamed to 'AccessReport'
//   Hint: Symbol 'Application' renamed to 'AccessApplication'
//   Hint: Symbol 'References' renamed to 'AccessReferences'
//   Hint: TypeInfo 'Class' changed to 'Class_'
//   Hint: Parameter 'Record' of IDoCmd.GoToRecord changed to 'Record_'
//   Hint: Parameter 'To' of IDoCmd.SendObject changed to 'To_'
//   Hint: Member 'Object' of '_Control' changed to 'Object_'
//   Hint: Member 'Goto' of '_Control' changed to 'Goto_'
//   Hint: Member 'Goto' of '_Image' changed to 'Goto_'
//   Hint: Member 'Goto' of '_CommandButton' changed to 'Goto_'
//   Hint: Member 'Goto' of '_OptionButton' changed to 'Goto_'
//   Hint: Member 'Goto' of '_Checkbox' changed to 'Goto_'
//   Hint: Member 'Goto' of '_OptionGroup' changed to 'Goto_'
//   Hint: Member 'Object' of '_BoundObjectFrame' changed to 'Object_'
//   Hint: Member 'Goto' of '_BoundObjectFrame' changed to 'Goto_'
//   Hint: Member 'Class' of '_BoundObjectFrame' changed to 'Class_'
//   Hint: Member 'Goto' of '_Textbox' changed to 'Goto_'
//   Hint: Member 'Goto' of '_ListBox' changed to 'Goto_'
//   Hint: Member 'Goto' of '_Combobox' changed to 'Goto_'
//   Hint: Member 'Object' of '_ObjectFrame' changed to 'Object_'
//   Hint: Member 'Goto' of '_ObjectFrame' changed to 'Goto_'
//   Hint: Member 'Class' of '_ObjectFrame' changed to 'Class_'
//   Hint: Member 'Goto' of '_ToggleButton' changed to 'Goto_'
//   Hint: Member 'Goto' of '_PaletteButton' changed to 'Goto_'
//   Hint: Member 'Goto' of '_SubForm' changed to 'Goto_'
//   Hint: Member 'Object' of '_CustomControl' changed to 'Object_'
//   Hint: Member 'Goto' of '_CustomControl' changed to 'Goto_'
//   Hint: Member 'Class' of '_CustomControl' changed to 'Class_'
//   Hint: Member 'Goto' of '_Page' changed to 'Goto_'
//   Hint: Parameter 'String' of Module.AddFromString changed to 'String_'
//   Hint: Parameter 'String' of Module.Lines changed to 'String_'
//   Hint: Parameter 'String' of Module.InsertLines changed to 'String_'
//   Hint: Parameter 'String' of Module.ReplaceLine changed to 'String_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'var' of _Form.Section changed to 'var_'
//   Hint: Parameter 'end' of _Report.Circle changed to 'end_'
//   Hint: Parameter 'Procedure' of _Application.Run changed to 'Procedure_'
//   Hint: Parameter 'String' of _Application.GUIDFromString changed to 'String_'
//   Hint: Parameter 'var' of _References.Item changed to 'var_'
//   Hint: Parameter 'String' of ___IVbaModule.AddFromString changed to 'String_'
//   Hint: Parameter 'String' of ___IVbaModule.Lines changed to 'String_'
//   Hint: Parameter 'String' of ___IVbaModule.InsertLines changed to 'String_'
//   Hint: Parameter 'String' of ___IVbaModule.ReplaceLine changed to 'String_'
//   Hint: Parameter 'var' of ___IVbaEditors.Item changed to 'var_'
//   Hint: Parameter 'var' of IVbaReferences.Item changed to 'var_'
//   Error creating palette bitmap of (TAccessPage) : Registry key CLSID\{3B06E973-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessControl) : Registry key CLSID\{02F92C80-8F8E-101B-AF4E-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessLabel) : Registry key CLSID\{3B06E947-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessRectangle) : Registry key CLSID\{3B06E949-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessLine) : Registry key CLSID\{3B06E94B-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessImage) : Registry key CLSID\{3B06E94D-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessCommandButton) : Registry key CLSID\{3B06E94F-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessOptionButton) : Registry key CLSID\{3B06E951-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessCheckBox) : Registry key CLSID\{3B06E953-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessOptionGroup) : Registry key CLSID\{3B06E955-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessBoundObjectFrame) : Registry key CLSID\{3B06E957-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessTextBox) : Registry key CLSID\{3B06E945-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessListBox) : Registry key CLSID\{3B06E959-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessComboBox) : Registry key CLSID\{3B06E95B-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessObjectFrame) : Registry key CLSID\{3B06E95D-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessPageBreak) : Registry key CLSID\{3B06E95F-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessToggleButton) : Registry key CLSID\{3B06E961-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessSubForm) : Registry key CLSID\{3B06E963-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessSubReport) : Registry key CLSID\{3B06E965-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessCustomControl) : Registry key CLSID\{3B06E967-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessTabControl) : Registry key CLSID\{3B06E970-E47C-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessSection) : Registry key CLSID\{BC9E4355-F037-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TAccessGroupLevel) : Registry key CLSID\{BC9E4356-F037-11CD-8701-00AA003F0F07}\ToolboxBitmap32 not found
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, DAO_TLB, Graphics, Office_TLB, OleCtrls, OleServer, 
StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  AccessMajorVersion = 8;
  AccessMinorVersion = 0;

  LIBID_Access: TGUID = '{4AFFC9A0-5F99-101B-AF4E-00AA003F0F07}';

  IID_IDoCmd: TGUID = '{C547E760-9658-101B-81EE-00AA004750E2}';
  CLASS_DoCmd: TGUID = '{C547E761-9658-101B-81EE-00AA004750E2}';
  IID___AccessProperty: TGUID = '{331FDD01-CF31-11CD-8701-00AA003F0F07}';
  IID__AccessProperty: TGUID = '{331FDD00-CF31-11CD-8701-00AA003F0F07}';
  IID_Properties: TGUID = '{331FDD02-CF31-11CD-8701-00AA003F0F07}';
  IID__ItemsSelected: TGUID = '{31B09710-EADC-11CD-B9F7-00AA004753B5}';
  IID_Children: TGUID = '{3B06E977-E47C-11CD-8701-00AA003F0F07}';
  IID__AccessField: TGUID = '{B1C1EAC1-486F-11CE-A65D-00AA003F0F07}';
  CLASS_AccessField: TGUID = '{044E54C5-B19B-11CE-A689-00AA003F0F07}';
  IID___Help: TGUID = '{9CD4A761-A6A9-11CE-A686-00AA003F0F07}';
  IID__Hyperlink: TGUID = '{50D56611-60AC-11CF-82C9-00AA004B9FE6}';
  CLASS_AccessHyperlink: TGUID = '{50D56610-60AC-11CF-82C9-00AA004B9FE6}';
  IID__Page: TGUID = '{3B06E974-E47C-11CD-8701-00AA003F0F07}';
  IID_Pages: TGUID = '{3B06E978-E47C-11CD-8701-00AA003F0F07}';
  IID__Control: TGUID = '{26B96540-8F8E-101B-AF4E-00AA003F0F07}';
  CLASS_AccessControl: TGUID = '{02F92C80-8F8E-101B-AF4E-00AA003F0F07}';
  IID___ControlInReportEvents: TGUID = '{90B322A5-F1D9-11CD-8701-00AA003F0F07}';
  CLASS__ControlInReportEvents: TGUID = '{90B322A4-F1D9-11CD-8701-00AA003F0F07}';
  IID_Controls: TGUID = '{5970C574-EB8C-11CD-8701-00AA003F0F07}';
  IID__Label: TGUID = '{3B06E948-E47C-11CD-8701-00AA003F0F07}';
  IID__LabelEvents: TGUID = '{BC9E4341-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessLabel: TGUID = '{3B06E947-E47C-11CD-8701-00AA003F0F07}';
  IID__ChildLabelEvents: TGUID = '{BC9E4358-F037-11CD-8701-00AA003F0F07}';
  CLASS__ChildLabel: TGUID = '{BC9E4359-F037-11CD-8701-00AA003F0F07}';
  IID__Rectangle: TGUID = '{3B06E94A-E47C-11CD-8701-00AA003F0F07}';
  IID__RectangleEvents: TGUID = '{BC9E4342-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessRectangle: TGUID = '{3B06E949-E47C-11CD-8701-00AA003F0F07}';
  IID__Line: TGUID = '{3B06E94C-E47C-11CD-8701-00AA003F0F07}';
  IID__LineEvents: TGUID = '{BC9E4343-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessLine: TGUID = '{3B06E94B-E47C-11CD-8701-00AA003F0F07}';
  IID__Image: TGUID = '{3B06E94E-E47C-11CD-8701-00AA003F0F07}';
  IID__ImageEvents: TGUID = '{BC9E4344-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessImage: TGUID = '{3B06E94D-E47C-11CD-8701-00AA003F0F07}';
  IID__CommandButton: TGUID = '{3B06E950-E47C-11CD-8701-00AA003F0F07}';
  IID__CommandButtonEvents: TGUID = '{BC9E4345-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessCommandButton: TGUID = '{3B06E94F-E47C-11CD-8701-00AA003F0F07}';
  IID__OptionButton: TGUID = '{3B06E952-E47C-11CD-8701-00AA003F0F07}';
  IID__OptionButtonEvents: TGUID = '{BC9E4346-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessOptionButton: TGUID = '{3B06E951-E47C-11CD-8701-00AA003F0F07}';
  IID__OptionButtonInOptionEvents: TGUID = '{BC9E435B-F037-11CD-8701-00AA003F0F07}';
  CLASS__OptionButtonInOption: TGUID = '{BC9E435A-F037-11CD-8701-00AA003F0F07}';
  IID__Checkbox: TGUID = '{3B06E954-E47C-11CD-8701-00AA003F0F07}';
  IID__CheckBoxEvents: TGUID = '{BC9E4347-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessCheckBox: TGUID = '{3B06E953-E47C-11CD-8701-00AA003F0F07}';
  IID__CheckBoxInOptionEvents: TGUID = '{BC9E435D-F037-11CD-8701-00AA003F0F07}';
  CLASS__CheckBoxInOption: TGUID = '{BC9E435C-F037-11CD-8701-00AA003F0F07}';
  IID__OptionGroup: TGUID = '{3B06E956-E47C-11CD-8701-00AA003F0F07}';
  IID__OptionGroupEvents: TGUID = '{BC9E4348-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessOptionGroup: TGUID = '{3B06E955-E47C-11CD-8701-00AA003F0F07}';
  IID__BoundObjectFrame: TGUID = '{3B06E958-E47C-11CD-8701-00AA003F0F07}';
  IID__BoundObjectFrameEvents: TGUID = '{BC9E4349-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessBoundObjectFrame: TGUID = '{3B06E957-E47C-11CD-8701-00AA003F0F07}';
  IID__Textbox: TGUID = '{3B06E946-E47C-11CD-8701-00AA003F0F07}';
  IID__TextBoxEvents: TGUID = '{BC9E4340-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessTextBox: TGUID = '{3B06E945-E47C-11CD-8701-00AA003F0F07}';
  IID__ListBox: TGUID = '{3B06E95A-E47C-11CD-8701-00AA003F0F07}';
  IID__ListBoxEvents: TGUID = '{BC9E434B-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessListBox: TGUID = '{3B06E959-E47C-11CD-8701-00AA003F0F07}';
  IID__Combobox: TGUID = '{3B06E95C-E47C-11CD-8701-00AA003F0F07}';
  IID__ComboBoxEvents: TGUID = '{BC9E434C-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessComboBox: TGUID = '{3B06E95B-E47C-11CD-8701-00AA003F0F07}';
  IID__ObjectFrame: TGUID = '{3B06E95E-E47C-11CD-8701-00AA003F0F07}';
  IID__ObjectFrameEvents: TGUID = '{BC9E434D-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessObjectFrame: TGUID = '{3B06E95D-E47C-11CD-8701-00AA003F0F07}';
  IID__PageBreak: TGUID = '{3B06E960-E47C-11CD-8701-00AA003F0F07}';
  IID__PageBreakEvents: TGUID = '{BC9E434E-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessPageBreak: TGUID = '{3B06E95F-E47C-11CD-8701-00AA003F0F07}';
  IID__ToggleButton: TGUID = '{3B06E962-E47C-11CD-8701-00AA003F0F07}';
  IID__ToggleButtonEvents: TGUID = '{BC9E434F-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessToggleButton: TGUID = '{3B06E961-E47C-11CD-8701-00AA003F0F07}';
  IID__ToggleButtonInOptionEvents: TGUID = '{BC9E435F-F037-11CD-8701-00AA003F0F07}';
  CLASS__ToggleButtonInOption: TGUID = '{BC9E435E-F037-11CD-8701-00AA003F0F07}';
  IID__PaletteButton: TGUID = '{9CD4A760-A6A9-11CE-A686-00AA003F0F07}';
  IID__PaletteButtonEvents: TGUID = '{A843CCD0-6E2C-11CF-A219-00A0C90542FF}';
  CLASS_AccessPaletteButton: TGUID = '{9CD4A762-A6A9-11CE-A686-00AA003F0F07}';
  IID__SubForm: TGUID = '{3B06E964-E47C-11CD-8701-00AA003F0F07}';
  IID__SubFormEvents: TGUID = '{BC9E4350-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessSubForm: TGUID = '{3B06E963-E47C-11CD-8701-00AA003F0F07}';
  IID__SubReport: TGUID = '{3B06E966-E47C-11CD-8701-00AA003F0F07}';
  IID__SubReportEvents: TGUID = '{BC9E4351-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessSubReport: TGUID = '{3B06E965-E47C-11CD-8701-00AA003F0F07}';
  IID__CustomControl: TGUID = '{3B06E968-E47C-11CD-8701-00AA003F0F07}';
  IID__CustomControlEvents: TGUID = '{BC9E4352-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessCustomControl: TGUID = '{3B06E967-E47C-11CD-8701-00AA003F0F07}';
  IID__CustomControlInReportEvents: TGUID = '{300471E2-7426-11CE-AB64-00AA0042B7CE}';
  CLASS__CustomControlInReport: TGUID = '{300471E0-7426-11CE-AB63-00AA0042B7CE}';
  IID__TabControl: TGUID = '{3B06E971-E47C-11CD-8701-00AA003F0F07}';
  IID__TabControlEvents: TGUID = '{3B06E972-E47C-11CD-8701-00AA003F0F07}';
  CLASS_AccessTabControl: TGUID = '{3B06E970-E47C-11CD-8701-00AA003F0F07}';
  IID__PageEvents: TGUID = '{3B06E975-E47C-11CD-8701-00AA003F0F07}';
  CLASS_AccessPage: TGUID = '{3B06E973-E47C-11CD-8701-00AA003F0F07}';
  IID__Section: TGUID = '{331FDCFC-CF31-11CD-8701-00AA003F0F07}';
  IID__SectionEvents: TGUID = '{BC9E4353-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessSection: TGUID = '{BC9E4355-F037-11CD-8701-00AA003F0F07}';
  IID__GroupLevel: TGUID = '{331FDD27-CF31-11CD-8701-00AA003F0F07}';
  IID__GroupLevelEvents: TGUID = '{BC9E4354-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessGroupLevel: TGUID = '{BC9E4356-F037-11CD-8701-00AA003F0F07}';
  IID__SectionInReportEvents: TGUID = '{BC9E4361-F037-11CD-8701-00AA003F0F07}';
  CLASS__SectionInReport: TGUID = '{BC9E4360-F037-11CD-8701-00AA003F0F07}';
  IID__PageHdrFtrInReportEvents: TGUID = '{7AD9E905-BAF8-11CE-A68A-00AA003F0F07}';
  CLASS__PageHdrFtrInReport: TGUID = '{7AD9E906-BAF8-11CE-A68A-00AA003F0F07}';
  IID_Module: TGUID = '{331FDCFE-CF31-11CD-8701-00AA003F0F07}';
  IID_Modules: TGUID = '{9DD0AF42-6E28-11CF-9008-00AA0042B7CE}';
  IID__Form: TGUID = '{E5135D80-8F8D-101B-AF4E-00AA003F0F07}';
  IID__FormEvents: TGUID = '{331FDCFB-CF31-11CD-8701-00AA003F0F07}';
  CLASS_AccessForm: TGUID = '{483615A0-74BE-101B-AF4E-00AA003F0F07}';
  IID_Forms: TGUID = '{B1BB0E80-6128-101B-AF4E-00AA003F0F07}';
  IID__Report: TGUID = '{3E8B6B00-91FF-101B-AF4E-00AA003F0F07}';
  IID__ReportEvents: TGUID = '{BC9E4357-F037-11CD-8701-00AA003F0F07}';
  CLASS_AccessReport: TGUID = '{27CE30A0-91FF-101B-AF4E-00AA003F0F07}';
  IID_Reports: TGUID = '{D1523700-6128-101B-AF4E-00AA003F0F07}';
  IID_Screen: TGUID = '{DC6B66C0-6128-101B-AF4E-00AA003F0F07}';
  IID__Application: TGUID = '{68CCE6C0-6129-101B-AF4E-00AA003F0F07}';
  CLASS_AccessApplication: TGUID = '{8CC49940-3146-11CF-97A1-00AA00424A9F}';
  IID_Reference: TGUID = '{EB106212-9C89-11CF-A2B3-00A0C90542FF}';
  IID__References: TGUID = '{EB106213-9C89-11CF-A2B3-00A0C90542FF}';
  DIID__References_Events: TGUID = '{F163F201-ADA2-11CF-89A9-00A0C9054129}';
  CLASS_AccessReferences: TGUID = '{EB106214-9C89-11CF-A2B3-00A0C90542FF}';
  IID__Dummy: TGUID = '{8B06E320-B23C-11CF-89A8-00A0C9054129}';
  IID__DummyEvents: TGUID = '{58BF3100-B580-11CF-89A8-00A0C9054129}';
  CLASS_Class_: TGUID = '{8B06E321-B23C-11CF-89A8-00A0C9054129}';
  IID____IVbaModule: TGUID = '{0002E16E-0000-0000-C000-000000000046}';
  CLASS____CodeModule: TGUID = '{0002E170-0000-0000-C000-000000000046}';
  IID____IVbaEditors: TGUID = '{0002E172-0000-0000-C000-000000000046}';
  CLASS____Editors: TGUID = '{0002E174-0000-0000-C000-000000000046}';
  IID____IVbaEditor: TGUID = '{0002E176-0000-0000-C000-000000000046}';
  CLASS____Editor: TGUID = '{0002E178-0000-0000-C000-000000000046}';
  IID_IVbaReferences: TGUID = '{0002E17A-0000-0000-C000-000000000046}';
  IID____Reference: TGUID = '{0002E17E-0000-0000-C000-000000000046}';
  DIID____IVbaExtReferencesEvents: TGUID = '{CDDE3804-2064-11CF-867F-00AA005FF34A}';
  CLASS____References: TGUID = '{0002E17C-0000-0000-C000-000000000046}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum AcModuleType
type
  AcModuleType = TOleEnum;
const
  acStandardModule = $00000000;
  acClassModule = $00000001;

// Constants for enum AcCloseSave
type
  AcCloseSave = TOleEnum;
const
  acSavePrompt = $00000000;
  acSaveYes = $00000001;
  acSaveNo = $00000002;

// Constants for enum AcQuitOption
type
  AcQuitOption = TOleEnum;
const
  acQuitPrompt = $00000000;
  acQuitSaveAll = $00000001;
  acQuitSaveNone = $00000002;

// Constants for enum AcSection
type
  AcSection = TOleEnum;
const
  acDetail = $00000000;
  acHeader = $00000001;
  acFooter = $00000002;
  acPageHeader = $00000003;
  acPageFooter = $00000004;
  acGroupLevel1Header = $00000005;
  acGroupLevel1Footer = $00000006;
  acGroupLevel2Header = $00000007;
  acGroupLevel2Footer = $00000008;

// Constants for enum AcControlType
type
  AcControlType = TOleEnum;
const
  acLabel = $00000064;
  acRectangle = $00000065;
  acLine = $00000066;
  acImage = $00000067;
  acCommandButton = $00000068;
  acOptionButton = $00000069;
  acCheckBox = $0000006A;
  acOptionGroup = $0000006B;
  acBoundObjectFrame = $0000006C;
  acTextBox = $0000006D;
  acListBox = $0000006E;
  acComboBox = $0000006F;
  acSubform = $00000070;
  acObjectFrame = $00000072;
  acPageBreak = $00000076;
  acCustomControl = $00000077;
  acToggleButton = $0000007A;
  acTabCtl = $0000007B;
  acPage = $0000007C;

// Constants for enum AcDataObjectType
type
  AcDataObjectType = TOleEnum;
const
  acActiveDataObject = $FFFFFFFF;
  acDataTable = $00000000;
  acDataQuery = $00000001;
  acDataForm = $00000002;

// Constants for enum AcDataTransferType
type
  AcDataTransferType = TOleEnum;
const
  acImport = $00000000;
  acExport = $00000001;
  acLink = $00000002;

// Constants for enum AcSendObjectType
type
  AcSendObjectType = TOleEnum;
const
  acSendNoObject = $FFFFFFFF;
  acSendTable = $00000000;
  acSendQuery = $00000001;
  acSendForm = $00000002;
  acSendReport = $00000003;
  acSendModule = $00000005;

// Constants for enum AcObjectType
type
  AcObjectType = TOleEnum;
const
  acDefault = $FFFFFFFF;
  acTable = $00000000;
  acQuery = $00000001;
  acForm = $00000002;
  acReport = $00000003;
  acMacro = $00000004;
  acModule = $00000005;

// Constants for enum AcFindField
type
  AcFindField = TOleEnum;
const
  acCurrent = $FFFFFFFF;
  acAll = $00000000;

// Constants for enum AcFindMatch
type
  AcFindMatch = TOleEnum;
const
  acAnywhere = $00000000;
  acEntire = $00000001;
  acStart = $00000002;

// Constants for enum AcFormView
type
  AcFormView = TOleEnum;
const
  acNormal = $00000000;
  acDesign = $00000001;
  acPreview = $00000002;
  acFormDS = $00000003;

// Constants for enum AcOpenDataMode
type
  AcOpenDataMode = TOleEnum;
const
  acAdd = $00000000;
  acEdit = $00000001;
  acReadOnly = $00000002;

// Constants for enum AcFormOpenDataMode
type
  AcFormOpenDataMode = TOleEnum;
const
  acFormPropertySettings = $FFFFFFFF;
  acFormAdd = $00000000;
  acFormEdit = $00000001;
  acFormReadOnly = $00000002;

// Constants for enum AcOutputObjectType
type
  AcOutputObjectType = TOleEnum;
const
  acOutputTable = $00000000;
  acOutputQuery = $00000001;
  acOutputForm = $00000002;
  acOutputReport = $00000003;
  acOutputModule = $00000005;

// Constants for enum AcPrintQuality
type
  AcPrintQuality = TOleEnum;
const
  acHigh = $00000000;
  acMedium = $00000001;
  acLow = $00000002;
  acDraft = $00000003;

// Constants for enum AcPrintRange
type
  AcPrintRange = TOleEnum;
const
  acPrintAll = $00000000;
  acSelection = $00000001;
  acPages = $00000002;

// Constants for enum AcRecord
type
  AcRecord = TOleEnum;
const
  acPrevious = $00000000;
  acNext = $00000001;
  acFirst = $00000002;
  acLast = $00000003;
  acGoTo = $00000004;
  acNewRec = $00000005;

// Constants for enum AcSearchDirection
type
  AcSearchDirection = TOleEnum;
const
  acUp = $00000000;
  acDown = $00000001;
  acSearchAll = $00000002;

// Constants for enum AcSysCmdAction
type
  AcSysCmdAction = TOleEnum;
const
  acSysCmdInitMeter = $00000001;
  acSysCmdUpdateMeter = $00000002;
  acSysCmdRemoveMeter = $00000003;
  acSysCmdSetStatus = $00000004;
  acSysCmdClearStatus = $00000005;
  acSysCmdRuntime = $00000006;
  acSysCmdAccessVer = $00000007;
  acSysCmdIniFile = $00000008;
  acSysCmdAccessDir = $00000009;
  acSysCmdGetObjectState = $0000000A;
  acSysCmdClearHelpTopic = $0000000B;
  acSysCmdProfile = $0000000C;
  acSysCmdGetWorkgroupFile = $0000000D;

// Constants for enum AcTextTransferType
type
  AcTextTransferType = TOleEnum;
const
  acImportDelim = $00000000;
  acImportFixed = $00000001;
  acExportDelim = $00000002;
  acExportFixed = $00000003;
  acExportMerge = $00000004;
  acLinkDelim = $00000005;
  acLinkFixed = $00000006;
  acImportHTML = $00000007;
  acExportHTML = $00000008;
  acLinkHTML = $00000009;

// Constants for enum AcView
type
  AcView = TOleEnum;
const
  acViewNormal = $00000000;
  acViewDesign = $00000001;
  acViewPreview = $00000002;

// Constants for enum AcWindowMode
type
  AcWindowMode = TOleEnum;
const
  acWindowNormal = $00000000;
  acHidden = $00000001;
  acIcon = $00000002;
  acDialog = $00000003;

// Constants for enum AcSpreadSheetType
type
  AcSpreadSheetType = TOleEnum;
const
  acSpreadsheetTypeExcel3 = $00000000;
  acSpreadsheetTypeLotusWK1 = $00000002;
  acSpreadsheetTypeLotusWK3 = $00000003;
  acSpreadsheetTypeExcel5 = $00000005;
  acSpreadsheetTypeExcel7 = $00000005;
  acSpreadsheetTypeExcel4 = $00000006;
  acSpreadsheetTypeLotusWK4 = $00000007;
  acSpreadsheetTypeExcel97 = $00000008;

// Constants for enum AcHyperlinkPart
type
  AcHyperlinkPart = TOleEnum;
const
  acDisplayedValue = $00000000;
  acDisplayText = $00000001;
  acAddress = $00000002;
  acSubAddress = $00000003;

// Constants for enum AcCommand
type
  AcCommand = TOleEnum;
const
  acCmdWindowUnhide = $00000001;
  acCmdWindowHide = $00000002;
  acCmdExit = $00000003;
  acCmdCompactDatabase = $00000004;
  acCmdEncryptDecryptDatabase = $00000005;
  acCmdRepairDatabase = $00000006;
  acCmdMakeMDEFile = $00000007;
  acCmdMoreWindows = $00000008;
  acCmdAppRestore = $00000009;
  acCmdAppMaximize = $0000000A;
  acCmdAppMinimize = $0000000B;
  acCmdAppMove = $0000000C;
  acCmdAppSize = $0000000D;
  acCmdDocRestore = $0000000E;
  acCmdDocMaximize = $0000000F;
  acCmdDocMove = $00000010;
  acCmdDocSize = $00000011;
  acCmdRefresh = $00000012;
  acCmdFont = $00000013;
  acCmdSave = $00000014;
  acCmdSaveAs = $00000015;
  acCmdWindowCascade = $00000016;
  acCmdTileVertically = $00000017;
  acCmdWindowArrangeIcons = $00000018;
  acCmdOpenDatabase = $00000019;
  acCmdNewDatabase = $0000001A;
  acCmdOLEDDELinks = $0000001B;
  acCmdRecordsGoToNew = $0000001C;
  acCmdReplace = $0000001D;
  acCmdFind = $0000001E;
  acCmdRunMacro = $0000001F;
  acCmdPageSetup = $00000020;
  acCmdInsertObject = $00000021;
  acCmdDuplicate = $00000022;
  acCmdAboutMicrosoftAccess = $00000023;
  acCmdFormHdrFtr = $00000024;
  acCmdReportHdrFtr = $00000025;
  acCmdPasteAppend = $00000026;
  acCmdInsertFile = $00000027;
  acCmdSelectForm = $00000028;
  acCmdTabOrder = $00000029;
  acCmdFieldList = $0000002A;
  acCmdAlignLeft = $0000002B;
  acCmdAlignRight = $0000002C;
  acCmdAlignTop = $0000002D;
  acCmdAlignBottom = $0000002E;
  acCmdAlignToGrid = $0000002F;
  acCmdSizeToGrid = $00000030;
  acCmdOptions = $00000031;
  acCmdSelectRecord = $00000032;
  acCmdSortingAndGrouping = $00000033;
  acCmdBringToFront = $00000034;
  acCmdSendToBack = $00000035;
  acCmdPrintPreview = $00000036;
  acCmdApplyDefault = $00000037;
  acCmdSetControlDefaults = $00000038;
  acCmdOLEObjectDefaultVerb = $00000039;
  acCmdClose = $0000003A;
  acCmdSizeToFit = $0000003B;
  acCmdDocMinimize = $0000003C;
  acCmdViewRuler = $0000003D;
  acCmdSnapToGrid = $0000003E;
  acCmdViewGrid = $0000003F;
  acCmdPasteSpecial = $00000040;
  acCmdRecordsGoToNext = $00000041;
  acCmdRecordsGoToPrevious = $00000042;
  acCmdRecordsGoToFirst = $00000043;
  acCmdRecordsGoToLast = $00000044;
  acCmdSizeToFitForm = $00000045;
  acCmdEditingAllowed = $00000046;
  acCmdClearGrid = $00000047;
  acCmdJoinProperties = $00000048;
  acCmdQueryTotals = $00000049;
  acCmdQueryTypeCrosstab = $0000004A;
  acCmdTableNames = $0000004B;
  acCmdQueryParameters = $0000004C;
  acCmdFormatCells = $0000004D;
  acCmdDataEntry = $0000004E;
  acCmdHideColumns = $0000004F;
  acCmdUnhideColumns = $00000050;
  acCmdDeleteQueryColumn = $00000051;
  acCmdInsertQueryColumn = $00000052;
  acCmdRemoveTable = $00000054;
  acCmdViewToolbox = $00000055;
  acCmdMacroNames = $00000056;
  acCmdMacroConditions = $00000057;
  acCmdSingleStep = $00000058;
  acCmdQueryTypeSelect = $00000059;
  acCmdQueryTypeUpdate = $0000005A;
  acCmdQueryTypeAppend = $0000005B;
  acCmdQueryTypeDelete = $0000005C;
  acCmdApplyFilterSort = $0000005D;
  acCmdQueryTypeMakeTable = $0000005E;
  acCmdLoadFromQuery = $0000005F;
  acCmdSaveAsQuery = $00000060;
  acCmdSaveRecord = $00000061;
  acCmdAdvancedFilterSort = $00000063;
  acCmdMicrosoftAccessHelpTopics = $00000064;
  acCmdLinkTables = $00000066;
  acCmdUserAndGroupPermissions = $00000067;
  acCmdUserAndGroupAccounts = $00000068;
  acCmdFreezeColumn = $00000069;
  acCmdUnfreezeAllColumns = $0000006A;
  acCmdPrimaryKey = $0000006B;
  acCmdSubformDatasheet = $0000006C;
  acCmdSelectAllRecords = $0000006D;
  acCmdViewTables = $0000006E;
  acCmdViewQueries = $0000006F;
  acCmdViewForms = $00000070;
  acCmdViewReports = $00000071;
  acCmdViewMacros = $00000072;
  acCmdViewModules = $00000073;
  acCmdRowHeight = $00000074;
  acCmdColumnWidth = $00000075;
  acCmdInsertFileIntoModule = $00000076;
  acCmdSaveModuleAsText = $00000077;
  acCmdFindPrevious = $00000078;
  acCmdWindowSplit = $00000079;
  acCmdProcedureDefinition = $0000007A;
  acCmdDebugWindow = $0000007B;
  acCmdReset = $0000007C;
  acCmdCompileAllModules = $0000007D;
  acCmdCompileAndSaveAllModules = $0000007E;
  acCmdGoContinue = $0000007F;
  acCmdStepOver = $00000080;
  acCmdSetNextStatement = $00000081;
  acCmdShowNextStatement = $00000082;
  acCmdToggleBreakpoint = $00000083;
  acCmdClearAllBreakpoints = $00000084;
  acCmdRelationships = $00000085;
  acCmdNewObjectTable = $00000086;
  acCmdNewObjectQuery = $00000087;
  acCmdNewObjectForm = $00000088;
  acCmdNewObjectReport = $00000089;
  acCmdNewObjectMacro = $0000008A;
  acCmdNewObjectModule = $0000008B;
  acCmdNewObjectClassModule = $0000008C;
  acCmdLayoutPreview = $0000008D;
  acCmdSaveAsReport = $0000008E;
  acCmdRename = $0000008F;
  acCmdRemoveFilterSort = $00000090;
  acCmdSaveLayout = $00000091;
  acCmdClearAll = $00000092;
  acCmdHideTable = $00000093;
  acCmdShowDirectRelationships = $00000094;
  acCmdShowAllRelationships = $00000095;
  acCmdCreateRelationship = $00000096;
  acCmdEditRelationship = $00000097;
  acCmdIndexes = $00000098;
  acCmdAlignToShortest = $00000099;
  acCmdAlignToTallest = $0000009A;
  acCmdSizeToNarrowest = $0000009B;
  acCmdSizeToWidest = $0000009C;
  acCmdHorizontalSpacingMakeEqual = $0000009D;
  acCmdHorizontalSpacingDecrease = $0000009E;
  acCmdHorizontalSpacingIncrease = $0000009F;
  acCmdVerticalSpacingMakeEqual = $000000A0;
  acCmdVerticalSpacingDecrease = $000000A1;
  acCmdVerticalSpacingIncrease = $000000A2;
  acCmdSortAscending = $000000A3;
  acCmdSortDescending = $000000A4;
  acCmdToolbarsCustomize = $000000A5;
  acCmdOLEObjectConvert = $000000A7;
  acCmdQueryTypeSQLDataDefinition = $000000A8;
  acCmdQueryTypeSQLPassThrough = $000000A9;
  acCmdViewCode = $000000AA;
  acCmdConvertDatabase = $000000AB;
  acCmdCallStack = $000000AC;
  acCmdSend = $000000AD;
  acCmdOutputToExcel = $000000AF;
  acCmdOutputToRTF = $000000B0;
  acCmdOutputToText = $000000B1;
  acCmdInvokeBuilder = $000000B2;
  acCmdZoomBox = $000000B3;
  acCmdQueryTypeSQLUnion = $000000B4;
  acCmdRun = $000000B5;
  acCmdPageHdrFtr = $000000B6;
  acCmdDesignView = $000000B7;
  acCmdSQLView = $000000B8;
  acCmdShowTable = $000000B9;
  acCmdCloseWindow = $000000BA;
  acCmdInsertRows = $000000BB;
  acCmdDeleteRows = $000000BC;
  acCmdCut = $000000BD;
  acCmdCopy = $000000BE;
  acCmdPaste = $000000BF;
  acCmdAutoDial = $000000C0;
  acCmdNewObjectAutoForm = $000000C1;
  acCmdNewObjectAutoReport = $000000C2;
  acCmdWordMailMerge = $000000C3;
  acCmdTestValidationRules = $000000C4;
  acCmdControlWizardsToggle = $000000C5;
  acCmdEnd = $000000C6;
  acCmdRedo = $000000C7;
  acCmdObjectBrowser = $000000C8;
  acCmdAddWatch = $000000C9;
  acCmdEditWatch = $000000CA;
  acCmdQuickWatch = $000000CB;
  acCmdStepToCursor = $000000CC;
  acCmdIndent = $000000CD;
  acCmdOutdent = $000000CE;
  acCmdFilterByForm = $000000CF;
  acCmdFilterBySelection = $000000D0;
  acCmdViewLargeIcons = $000000D1;
  acCmdViewDetails = $000000D2;
  acCmdViewSmallIcons = $000000D3;
  acCmdViewList = $000000D4;
  acCmdLineUpIcons = $000000D5;
  acCmdArrangeIconsByName = $000000D6;
  acCmdArrangeIconsByType = $000000D7;
  acCmdArrangeIconsByCreated = $000000D8;
  acCmdArrangeIconsByModified = $000000D9;
  acCmdArrangeIconsAuto = $000000DA;
  acCmdCreateShortcut = $000000DB;
  acCmdToggleFilter = $000000DC;
  acCmdOpenTable = $000000DD;
  acCmdInsertPicture = $000000DE;
  acCmdDeleteRecord = $000000DF;
  acCmdStartupProperties = $000000E0;
  acCmdPageNumber = $000000E1;
  acCmdDateAndTime = $000000E2;
  acCmdChangeToTextBox = $000000E3;
  acCmdChangeToLabel = $000000E4;
  acCmdChangeToListBox = $000000E5;
  acCmdChangeToComboBox = $000000E6;
  acCmdChangeToCheckBox = $000000E7;
  acCmdChangeToToggleButton = $000000E8;
  acCmdChangeToOptionButton = $000000E9;
  acCmdChangeToImage = $000000EA;
  acCmdAnswerWizard = $000000EB;
  acCmdMicrosoftOnTheWeb = $000000EC;
  acCmdClearItemDefaults = $000000ED;
  acCmdZoom200 = $000000EE;
  acCmdZoom150 = $000000EF;
  acCmdZoom100 = $000000F0;
  acCmdZoom75 = $000000F1;
  acCmdZoom50 = $000000F2;
  acCmdZoom25 = $000000F3;
  acCmdZoom10 = $000000F4;
  acCmdFitToWindow = $000000F5;
  acCmdPreviewOnePage = $000000F6;
  acCmdPreviewTwoPages = $000000F7;
  acCmdPreviewFourPages = $000000F8;
  acCmdPreviewEightPages = $000000F9;
  acCmdPreviewTwelvePages = $000000FA;
  acCmdOpenURL = $000000FB;
  acCmdOpenStartPage = $000000FC;
  acCmdOpenSearchPage = $000000FD;
  acCmdRegisterActiveXControls = $000000FE;
  acCmdDeleteTab = $000000FF;
  acCmdDatabaseProperties = $00000100;
  acCmdImport = $00000101;
  acCmdInsertActiveXControl = $00000102;
  acCmdInsertHyperlink = $00000103;
  acCmdReferences = $00000104;
  acCmdAutoCorrect = $00000105;
  acCmdInsertProcedure = $00000106;
  acCmdCreateReplica = $00000107;
  acCmdSynchronizeNow = $00000108;
  acCmdRecoverDesignMaster = $00000109;
  acCmdResolveConflicts = $0000010A;
  acCmdDeleteWatch = $0000010B;
  acCmdSpelling = $0000010D;
  acCmdAutoFormat = $0000010E;
  acCmdDeleteTableColumn = $0000010F;
  acCmdInsertTableColumn = $00000110;
  acCmdInsertLookupColumn = $00000111;
  acCmdRenameColumn = $00000112;
  acCmdSetDatabasePassword = $00000113;
  acCmdUserLevelSecurityWizard = $00000114;
  acCmdFilterExcludingSelection = $00000115;
  acCmdQuickPrint = $00000116;
  acCmdConvertMacrosToVisualBasic = $00000117;
  acCmdSaveAllModules = $00000118;
  acCmdFormView = $00000119;
  acCmdDatasheetView = $0000011A;
  acCmdAnalyzePerformance = $0000011B;
  acCmdAnalyzeTable = $0000011C;
  acCmdDocumenter = $0000011D;
  acCmdTileHorizontally = $0000011E;
  acCmdProperties = $0000011F;
  acCmdTransparentBackground = $00000120;
  acCmdTransparentBorder = $00000121;
  acCmdCompileLoadedModules = $00000122;
  acCmdInsertLookupField = $00000123;
  acCmdUndo = $00000124;
  acCmdInsertChart = $00000125;
  acCmdGoBack = $00000126;
  acCmdGoForward = $00000127;
  acCmdStopLoadingPage = $00000128;
  acCmdRefreshPage = $00000129;
  acCmdFavoritesOpen = $0000012A;
  acCmdFavoritesAddTo = $0000012B;
  acCmdShowOnlyWebToolbar = $0000012C;
  acCmdToolbarControlProperties = $0000012D;
  acCmdShowMembers = $0000012E;
  acCmdListConstants = $0000012F;
  acCmdQuickInfo = $00000130;
  acCmdParameterInfo = $00000131;
  acCmdCompleteWord = $00000132;
  acCmdBookmarksToggle = $00000133;
  acCmdBookmarksNext = $00000134;
  acCmdBookmarksPrevious = $00000135;
  acCmdBookmarksClearAll = $00000136;
  acCmdStepOut = $00000137;
  acCmdFindPrevWordUnderCursor = $00000138;
  acCmdFindNextWordUnderCursor = $00000139;
  acCmdObjBrwFindWholeWordOnly = $0000013A;
  acCmdObjBrwShowHiddenMembers = $0000013B;
  acCmdObjBrwHelp = $0000013C;
  acCmdObjBrwViewDefinition = $0000013D;
  acCmdObjBrwGroupMembers = $0000013E;
  acCmdSelectReport = $0000013F;
  acCmdPublish = $00000140;
  acCmdSaveAsHTML = $00000141;
  acCmdSaveAsIDC = $00000142;
  acCmdSaveAsASP = $00000143;
  acCmdPublishDefaults = $00000144;
  acCmdEditHyperlink = $00000145;
  acCmdOpenHyperlink = $00000146;
  acCmdOpenNewHyperlink = $00000147;
  acCmdCopyHyperlink = $00000148;
  acCmdHyperlinkDisplayText = $00000149;
  acCmdTabControlPageOrder = $0000014A;
  acCmdInsertPage = $0000014B;
  acCmdDeletePage = $0000014C;
  acCmdSelectAll = $0000014D;
  acCmdCreateMenuFromMacro = $0000014E;
  acCmdCreateToolbarFromMacro = $0000014F;
  acCmdCreateShortcutMenuFromMacro = $00000150;
  acCmdDelete = $00000151;
  acCmdRunOpenMacro = $00000152;
  acCmdLastPosition = $00000153;
  acCmdPrint = $00000154;
  acCmdFindNext = $00000155;
  acCmdStepInto = $00000156;

// Constants for enum RefKind
type
  RefKind = TOleEnum;
const
  TypeLib = $00000000;
  Project = $00000001;

// Constants for enum ProcKind
type
  ProcKind = TOleEnum;
const
  vbext_pk_Proc = $00000000;
  vbext_pk_Let = $00000001;
  vbext_pk_Set = $00000002;
  vbext_pk_Get = $00000003;

// Constants for enum ___ProcKind
type
  ___ProcKind = TOleEnum;
const
  ___vbext_pkProc = $00000000;
  ___vbext_pk_Let = $00000001;
  ___vbext_pk_Set = $00000002;
  ___vbext_pk_Get = $00000003;

// Constants for enum ___vbext_CodePaneview
type
  ___vbext_CodePaneview = TOleEnum;
const
  ___vbext_codeview_ProcedureView = $00000000;
  ___vbext_cocdview_FullModuleView = $00000001;

// Constants for enum ___RefKind
type
  ___RefKind = TOleEnum;
const
  ___TypeLib = $00000000;
  ___Project = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDoCmd = interface;
  IDoCmdDisp = dispinterface;
  __AccessProperty = interface;
  _AccessProperty = interface;
  _AccessPropertyDisp = dispinterface;
  Properties = interface;
  PropertiesDisp = dispinterface;
  _ItemsSelected = interface;
  _ItemsSelectedDisp = dispinterface;
  Children = interface;
  ChildrenDisp = dispinterface;
  _AccessField = interface;
  _AccessFieldDisp = dispinterface;
  __Help = interface;
  _Hyperlink = interface;
  _HyperlinkDisp = dispinterface;
  _Page = interface;
  _PageDisp = dispinterface;
  Pages = interface;
  PagesDisp = dispinterface;
  _Control = interface;
  _ControlDisp = dispinterface;
  __ControlInReportEvents = interface;
  Controls = interface;
  ControlsDisp = dispinterface;
  _Label = interface;
  _LabelDisp = dispinterface;
  _LabelEvents = interface;
  _ChildLabelEvents = interface;
  _Rectangle = interface;
  _RectangleDisp = dispinterface;
  _RectangleEvents = interface;
  _Line = interface;
  _LineDisp = dispinterface;
  _LineEvents = interface;
  _Image = interface;
  _ImageDisp = dispinterface;
  _ImageEvents = interface;
  _CommandButton = interface;
  _CommandButtonDisp = dispinterface;
  _CommandButtonEvents = interface;
  _OptionButton = interface;
  _OptionButtonDisp = dispinterface;
  _OptionButtonEvents = interface;
  _OptionButtonInOptionEvents = interface;
  _Checkbox = interface;
  _CheckboxDisp = dispinterface;
  _CheckBoxEvents = interface;
  _CheckBoxInOptionEvents = interface;
  _OptionGroup = interface;
  _OptionGroupDisp = dispinterface;
  _OptionGroupEvents = interface;
  _BoundObjectFrame = interface;
  _BoundObjectFrameDisp = dispinterface;
  _BoundObjectFrameEvents = interface;
  _Textbox = interface;
  _TextboxDisp = dispinterface;
  _TextBoxEvents = interface;
  _ListBox = interface;
  _ListBoxDisp = dispinterface;
  _ListBoxEvents = interface;
  _Combobox = interface;
  _ComboboxDisp = dispinterface;
  _ComboBoxEvents = interface;
  _ObjectFrame = interface;
  _ObjectFrameDisp = dispinterface;
  _ObjectFrameEvents = interface;
  _PageBreak = interface;
  _PageBreakDisp = dispinterface;
  _PageBreakEvents = interface;
  _ToggleButton = interface;
  _ToggleButtonDisp = dispinterface;
  _ToggleButtonEvents = interface;
  _ToggleButtonInOptionEvents = interface;
  _PaletteButton = interface;
  _PaletteButtonDisp = dispinterface;
  _PaletteButtonEvents = interface;
  _SubForm = interface;
  _SubFormDisp = dispinterface;
  _SubFormEvents = interface;
  _SubReport = interface;
  _SubReportDisp = dispinterface;
  _SubReportEvents = interface;
  _CustomControl = interface;
  _CustomControlDisp = dispinterface;
  _CustomControlEvents = interface;
  _CustomControlInReportEvents = interface;
  _TabControl = interface;
  _TabControlDisp = dispinterface;
  _TabControlEvents = interface;
  _PageEvents = interface;
  _Section = interface;
  _SectionDisp = dispinterface;
  _SectionEvents = interface;
  _GroupLevel = interface;
  _GroupLevelDisp = dispinterface;
  _GroupLevelEvents = interface;
  _SectionInReportEvents = interface;
  _PageHdrFtrInReportEvents = interface;
  Module = interface;
  ModuleDisp = dispinterface;
  Modules = interface;
  ModulesDisp = dispinterface;
  _Form = interface;
  _FormDisp = dispinterface;
  _FormEvents = interface;
  Forms = interface;
  FormsDisp = dispinterface;
  _Report = interface;
  _ReportDisp = dispinterface;
  _ReportEvents = interface;
  Reports = interface;
  ReportsDisp = dispinterface;
  Screen = interface;
  ScreenDisp = dispinterface;
  _Application = interface;
  _ApplicationDisp = dispinterface;
  Reference = interface;
  ReferenceDisp = dispinterface;
  _References = interface;
  _ReferencesDisp = dispinterface;
  _References_Events = dispinterface;
  _Dummy = interface;
  _DummyDisp = dispinterface;
  _DummyEvents = interface;
  ___IVbaModule = interface;
  ___IVbaModuleDisp = dispinterface;
  ___IVbaEditors = interface;
  ___IVbaEditorsDisp = dispinterface;
  ___IVbaEditor = interface;
  ___IVbaEditorDisp = dispinterface;
  IVbaReferences = interface;
  IVbaReferencesDisp = dispinterface;
  ___Reference = interface;
  ___ReferenceDisp = dispinterface;
  ___IVbaExtReferencesEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DoCmd = IDoCmd;
  AccessField = _AccessField;
  AccessHyperlink = _Hyperlink;
  AccessControl = _Control;
  _ControlInReportEvents = _Control;
  AccessLabel = _Label;
  _ChildLabel = _Label;
  AccessRectangle = _Rectangle;
  AccessLine = _Line;
  AccessImage = _Image;
  AccessCommandButton = _CommandButton;
  AccessOptionButton = _OptionButton;
  _OptionButtonInOption = _OptionButton;
  AccessCheckBox = _Checkbox;
  _CheckBoxInOption = _Checkbox;
  AccessOptionGroup = _OptionGroup;
  AccessBoundObjectFrame = _BoundObjectFrame;
  AccessTextBox = _Textbox;
  AccessListBox = _ListBox;
  AccessComboBox = _Combobox;
  AccessObjectFrame = _ObjectFrame;
  AccessPageBreak = _PageBreak;
  AccessToggleButton = _ToggleButton;
  _ToggleButtonInOption = _ToggleButton;
  AccessPaletteButton = _PaletteButton;
  AccessSubForm = _SubForm;
  AccessSubReport = _SubReport;
  AccessCustomControl = _CustomControl;
  _CustomControlInReport = _CustomControl;
  AccessTabControl = _TabControl;
  AccessPage = _Page;
  AccessSection = _Section;
  AccessGroupLevel = _GroupLevel;
  _SectionInReport = _Section;
  _PageHdrFtrInReport = _Section;
  AccessForm = _Form;
  AccessReport = _Report;
  AccessApplication = _Application;
  AccessReferences = _References;
  Class_ = _Dummy;
  ___CodeModule = ___IVbaModule;
  ___Editors = ___IVbaEditors;
  ___Editor = ___IVbaEditor;
  ___References = IVbaReferences;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}
  PPSafeArray1 = ^PSafeArray; {*}


// *********************************************************************//
// Interface: IDoCmd
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C547E760-9658-101B-81EE-00AA004750E2}
// *********************************************************************//
  IDoCmd = interface(IDispatch)
    ['{C547E760-9658-101B-81EE-00AA004750E2}']
    procedure AddMenu(MenuName: OleVariant; MenuMacroName: OleVariant; StatusBarText: OleVariant); safecall;
    procedure ApplyFilter(FilterName: OleVariant; WhereCondition: OleVariant); safecall;
    procedure Beep; safecall;
    procedure CancelEvent; safecall;
    procedure Close(ObjectType: AcObjectType; ObjectName: OleVariant; Save: AcCloseSave); safecall;
    procedure CopyObject(DestinationDatabase: OleVariant; NewName: OleVariant; 
                         SourceObjectType: AcObjectType; SourceObjectName: OleVariant); safecall;
    procedure DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant; 
                         Subcommand: OleVariant; Version: OleVariant); safecall;
    procedure Echo(EchoOn: OleVariant; StatusBarText: OleVariant); safecall;
    procedure FindNext; safecall;
    procedure FindRecord(FindWhat: OleVariant; Match: AcFindMatch; MatchCase: OleVariant; 
                         Search: AcSearchDirection; SearchAsFormatted: OleVariant; 
                         OnlyCurrentField: AcFindField; FindFirst: OleVariant); safecall;
    procedure GoToControl(ControlName: OleVariant); safecall;
    procedure GoToPage(PageNumber: OleVariant; Right: OleVariant; Down: OleVariant); safecall;
    procedure GoToRecord(ObjectType: AcDataObjectType; ObjectName: OleVariant; Record_: AcRecord; 
                         Offset: OleVariant); safecall;
    procedure Hourglass(HourglassOn: OleVariant); safecall;
    procedure Maximize; safecall;
    procedure Minimize; safecall;
    procedure MoveSize(Right: OleVariant; Down: OleVariant; Width: OleVariant; Height: OleVariant); safecall;
    procedure OpenForm(FormName: OleVariant; View: AcFormView; FilterName: OleVariant; 
                       WhereCondition: OleVariant; DataMode: AcFormOpenDataMode; 
                       WindowMode: AcWindowMode; OpenArgs: OleVariant); safecall;
    procedure OpenQuery(QueryName: OleVariant; View: AcView; DataMode: AcOpenDataMode); safecall;
    procedure OpenTable(TableName: OleVariant; View: AcView; DataMode: AcOpenDataMode); safecall;
    procedure PrintOut(PrintRange: AcPrintRange; PageFrom: OleVariant; PageTo: OleVariant; 
                       PrintQuality: AcPrintQuality; Copies: OleVariant; CollateCopies: OleVariant); safecall;
    procedure Quit(Options: AcQuitOption); safecall;
    procedure Requery(ControlName: OleVariant); safecall;
    procedure RepaintObject(ObjectType: AcObjectType; ObjectName: OleVariant); safecall;
    procedure Rename(NewName: OleVariant; ObjectType: AcObjectType; OldName: OleVariant); safecall;
    procedure Restore; safecall;
    procedure RunMacro(MacroName: OleVariant; RepeatCount: OleVariant; RepeatExpression: OleVariant); safecall;
    procedure RunSQL(SQLStatement: OleVariant; UseTransaction: OleVariant); safecall;
    procedure SelectObject(ObjectType: AcObjectType; ObjectName: OleVariant; 
                           InDatabaseWindow: OleVariant); safecall;
    procedure SetWarnings(WarningsOn: OleVariant); safecall;
    procedure ShowAllRecords; safecall;
    procedure OpenReport(ReportName: OleVariant; View: AcView; FilterName: OleVariant; 
                         WhereCondition: OleVariant); safecall;
    procedure TransferDatabase(TransferType: AcDataTransferType; DatabaseType: OleVariant; 
                               DatabaseName: OleVariant; ObjectType: AcObjectType; 
                               Source: OleVariant; Destination: OleVariant; 
                               StructureOnly: OleVariant; StoreLogin: OleVariant); safecall;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                  FileName: OleVariant; HasFieldNames: OleVariant; 
                                  Range: OleVariant; UseOA: OleVariant); safecall;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                           TableName: OleVariant; FileName: OleVariant; HasFieldNames: OleVariant; 
                           HTMLTableName: OleVariant); safecall;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                       OutputFormat: OleVariant; OutputFile: OleVariant; AutoStart: OleVariant; 
                       TemplateFile: OleVariant); safecall;
    procedure DeleteObject(ObjectType: AcObjectType; ObjectName: OleVariant); safecall;
    procedure OpenModule(ModuleName: OleVariant; ProcedureName: OleVariant); safecall;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                         Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant; 
                         EditMessage: OleVariant; TemplateFile: OleVariant); safecall;
    procedure ShowToolbar(ToolbarName: OleVariant; Show: OleVariant); safecall;
    procedure Save(ObjectType: AcObjectType; ObjectName: OleVariant); safecall;
    procedure SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant; 
                          SubcommandIndex: OleVariant; Flag: OleVariant); safecall;
    procedure RunCommand(Command: AcCommand); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDoCmdDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C547E760-9658-101B-81EE-00AA004750E2}
// *********************************************************************//
  IDoCmdDisp = dispinterface
    ['{C547E760-9658-101B-81EE-00AA004750E2}']
    procedure AddMenu(MenuName: OleVariant; MenuMacroName: OleVariant; StatusBarText: OleVariant); dispid 1001;
    procedure ApplyFilter(FilterName: OleVariant; WhereCondition: OleVariant); dispid 1002;
    procedure Beep; dispid 1003;
    procedure CancelEvent; dispid 1004;
    procedure Close(ObjectType: AcObjectType; ObjectName: OleVariant; Save: AcCloseSave); dispid 1005;
    procedure CopyObject(DestinationDatabase: OleVariant; NewName: OleVariant; 
                         SourceObjectType: AcObjectType; SourceObjectName: OleVariant); dispid 1006;
    procedure DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant; 
                         Subcommand: OleVariant; Version: OleVariant); dispid 1007;
    procedure Echo(EchoOn: OleVariant; StatusBarText: OleVariant); dispid 1008;
    procedure FindNext; dispid 1009;
    procedure FindRecord(FindWhat: OleVariant; Match: AcFindMatch; MatchCase: OleVariant; 
                         Search: AcSearchDirection; SearchAsFormatted: OleVariant; 
                         OnlyCurrentField: AcFindField; FindFirst: OleVariant); dispid 1010;
    procedure GoToControl(ControlName: OleVariant); dispid 1011;
    procedure GoToPage(PageNumber: OleVariant; Right: OleVariant; Down: OleVariant); dispid 1012;
    procedure GoToRecord(ObjectType: AcDataObjectType; ObjectName: OleVariant; Record_: AcRecord; 
                         Offset: OleVariant); dispid 1013;
    procedure Hourglass(HourglassOn: OleVariant); dispid 1014;
    procedure Maximize; dispid 1015;
    procedure Minimize; dispid 1016;
    procedure MoveSize(Right: OleVariant; Down: OleVariant; Width: OleVariant; Height: OleVariant); dispid 1017;
    procedure OpenForm(FormName: OleVariant; View: AcFormView; FilterName: OleVariant; 
                       WhereCondition: OleVariant; DataMode: AcFormOpenDataMode; 
                       WindowMode: AcWindowMode; OpenArgs: OleVariant); dispid 1019;
    procedure OpenQuery(QueryName: OleVariant; View: AcView; DataMode: AcOpenDataMode); dispid 1020;
    procedure OpenTable(TableName: OleVariant; View: AcView; DataMode: AcOpenDataMode); dispid 1021;
    procedure PrintOut(PrintRange: AcPrintRange; PageFrom: OleVariant; PageTo: OleVariant; 
                       PrintQuality: AcPrintQuality; Copies: OleVariant; CollateCopies: OleVariant); dispid 1022;
    procedure Quit(Options: AcQuitOption); dispid 1023;
    procedure Requery(ControlName: OleVariant); dispid 1024;
    procedure RepaintObject(ObjectType: AcObjectType; ObjectName: OleVariant); dispid 1025;
    procedure Rename(NewName: OleVariant; ObjectType: AcObjectType; OldName: OleVariant); dispid 1026;
    procedure Restore; dispid 1027;
    procedure RunMacro(MacroName: OleVariant; RepeatCount: OleVariant; RepeatExpression: OleVariant); dispid 1030;
    procedure RunSQL(SQLStatement: OleVariant; UseTransaction: OleVariant); dispid 1031;
    procedure SelectObject(ObjectType: AcObjectType; ObjectName: OleVariant; 
                           InDatabaseWindow: OleVariant); dispid 1032;
    procedure SetWarnings(WarningsOn: OleVariant); dispid 1035;
    procedure ShowAllRecords; dispid 1036;
    procedure OpenReport(ReportName: OleVariant; View: AcView; FilterName: OleVariant; 
                         WhereCondition: OleVariant); dispid 1039;
    procedure TransferDatabase(TransferType: AcDataTransferType; DatabaseType: OleVariant; 
                               DatabaseName: OleVariant; ObjectType: AcObjectType; 
                               Source: OleVariant; Destination: OleVariant; 
                               StructureOnly: OleVariant; StoreLogin: OleVariant); dispid 1040;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                  FileName: OleVariant; HasFieldNames: OleVariant; 
                                  Range: OleVariant; UseOA: OleVariant); dispid 1041;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                           TableName: OleVariant; FileName: OleVariant; HasFieldNames: OleVariant; 
                           HTMLTableName: OleVariant); dispid 1042;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                       OutputFormat: OleVariant; OutputFile: OleVariant; AutoStart: OleVariant; 
                       TemplateFile: OleVariant); dispid 1341;
    procedure DeleteObject(ObjectType: AcObjectType; ObjectName: OleVariant); dispid 1372;
    procedure OpenModule(ModuleName: OleVariant; ProcedureName: OleVariant); dispid 1374;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                         Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant; 
                         EditMessage: OleVariant; TemplateFile: OleVariant); dispid 1377;
    procedure ShowToolbar(ToolbarName: OleVariant; Show: OleVariant); dispid 1394;
    procedure Save(ObjectType: AcObjectType; ObjectName: OleVariant); dispid 1453;
    procedure SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant; 
                          SubcommandIndex: OleVariant; Flag: OleVariant); dispid 1454;
    procedure RunCommand(Command: AcCommand); dispid 1602;
  end;

// *********************************************************************//
// Interface: __AccessProperty
// Flags:     (16) Hidden
// GUID:      {331FDD01-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  __AccessProperty = interface(IUnknown)
    ['{331FDD01-CF31-11CD-8701-00AA003F0F07}']
    function Get_Value(out pRet: OleVariant): HResult; stdcall;
    function Set_Value(pRet: OleVariant): HResult; stdcall;
    function Get_Name(out pRet: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _AccessProperty
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDD00-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _AccessProperty = interface(Property_)
    ['{331FDD00-CF31-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Category: Smallint; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Category: Smallint read Get_Category;
  end;

// *********************************************************************//
// DispIntf:  _AccessPropertyDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDD00-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _AccessPropertyDisp = dispinterface
    ['{331FDD00-CF31-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Category: Smallint readonly dispid 2096;
    property Value: OleVariant dispid 0;
    property Name: WideString dispid 1610809346;
    property type_: Smallint dispid 1610809348;
    property Inherited_: WordBool readonly dispid 1610809350;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Properties
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDD02-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  Properties = interface(IDispatch)
    ['{331FDD02-CF31-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Item(Index: OleVariant): IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Item[Index: OleVariant]: IDispatch read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  PropertiesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDD02-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  PropertiesDisp = dispinterface
    ['{331FDD02-CF31-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Item[Index: OleVariant]: IDispatch readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: _ItemsSelected
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {31B09710-EADC-11CD-B9F7-00AA004753B5}
// *********************************************************************//
  _ItemsSelected = interface(IDispatch)
    ['{31B09710-EADC-11CD-B9F7-00AA004753B5}']
    function Get_Item(Index: OleVariant): Integer; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Item[Index: OleVariant]: Integer read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  _ItemsSelectedDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {31B09710-EADC-11CD-B9F7-00AA004753B5}
// *********************************************************************//
  _ItemsSelectedDisp = dispinterface
    ['{31B09710-EADC-11CD-B9F7-00AA004753B5}']
    property Item[Index: OleVariant]: Integer readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: Children
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E977-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  Children = interface(IDispatch)
    ['{3B06E977-E47C-11CD-8701-00AA003F0F07}']
    function Get_Item(Index: OleVariant): IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Item[Index: OleVariant]: IDispatch read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ChildrenDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E977-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  ChildrenDisp = dispinterface
    ['{3B06E977-E47C-11CD-8701-00AA003F0F07}']
    property Item[Index: OleVariant]: IDispatch readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: _AccessField
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B1C1EAC1-486F-11CE-A65D-00AA003F0F07}
// *********************************************************************//
  _AccessField = interface(IDispatch)
    ['{B1C1EAC1-486F-11CE-A65D-00AA003F0F07}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    property Value: OleVariant read Get_Value write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  _AccessFieldDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B1C1EAC1-486F-11CE-A65D-00AA003F0F07}
// *********************************************************************//
  _AccessFieldDisp = dispinterface
    ['{B1C1EAC1-486F-11CE-A65D-00AA003F0F07}']
    property Value: OleVariant dispid 0;
  end;

// *********************************************************************//
// Interface: __Help
// Flags:     (16) Hidden
// GUID:      {9CD4A761-A6A9-11CE-A686-00AA003F0F07}
// *********************************************************************//
  __Help = interface(IUnknown)
    ['{9CD4A761-A6A9-11CE-A686-00AA003F0F07}']
    function Get_FieldName(out pRet: OleVariant): HResult; stdcall;
    function Set_FieldName(pRet: OleVariant): HResult; stdcall;
    function Get_DataType(out pRet: OleVariant): HResult; stdcall;
    function Set_DataType(pRet: OleVariant): HResult; stdcall;
    function Get_Description(out pRet: OleVariant): HResult; stdcall;
    function Set_Description(pRet: OleVariant): HResult; stdcall;
    function Get_FieldSize(out pRet: OleVariant): HResult; stdcall;
    function Set_FieldSize(pRet: OleVariant): HResult; stdcall;
    function Get_NewValues(out pRet: OleVariant): HResult; stdcall;
    function Set_NewValues(pRet: OleVariant): HResult; stdcall;
    function Get_Required(out pRet: OleVariant): HResult; stdcall;
    function Set_Required(pRet: OleVariant): HResult; stdcall;
    function Get_AllowZeroLength(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowZeroLength(pRet: OleVariant): HResult; stdcall;
    function Get_Indexed(out pRet: OleVariant): HResult; stdcall;
    function Set_Indexed(pRet: OleVariant): HResult; stdcall;
    function Get_DisplayControl(out pRet: OleVariant): HResult; stdcall;
    function Set_DisplayControl(pRet: OleVariant): HResult; stdcall;
    function Get_ReplicationConflictFunction(out pRet: OleVariant): HResult; stdcall;
    function Set_ReplicationConflictFunction(var pRet: OleVariant): HResult; stdcall;
    function Get_ProjectName(out pRet: OleVariant): HResult; stdcall;
    function Set_ProjectName(var pRet: OleVariant): HResult; stdcall;
    function Get_MDE(out pRet: OleVariant): HResult; stdcall;
    function Set_MDE(var pRet: OleVariant): HResult; stdcall;
    function Get_AllowBreakIntoCode(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowBreakIntoCode(pRet: OleVariant): HResult; stdcall;
    function Get_AllowBuiltInToolbars(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowBuiltInToolbars(pRet: OleVariant): HResult; stdcall;
    function Get_AllowBypassKey(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowBypassKey(pRet: OleVariant): HResult; stdcall;
    function Get_AllowFullMenus(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowFullMenus(pRet: OleVariant): HResult; stdcall;
    function Get_AllowSpecialKeys(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowSpecialKeys(pRet: OleVariant): HResult; stdcall;
    function Get_AllowToolbarChanges(out pRet: OleVariant): HResult; stdcall;
    function Set_AllowToolbarChanges(pRet: OleVariant): HResult; stdcall;
    function Get_StartUpForm(out pRet: OleVariant): HResult; stdcall;
    function Set_StartUpForm(pRet: OleVariant): HResult; stdcall;
    function Get_StartUpMenuBar(out pRet: OleVariant): HResult; stdcall;
    function Set_StartUpMenuBar(pRet: OleVariant): HResult; stdcall;
    function Get_StartUpShortcutMenuBar(out pRet: OleVariant): HResult; stdcall;
    function Set_StartUpShortcutMenuBar(pRet: OleVariant): HResult; stdcall;
    function Get_StartUpShowDBWindow(out pRet: OleVariant): HResult; stdcall;
    function Set_StartUpShowDBWindow(pRet: OleVariant): HResult; stdcall;
    function Get_StartUpShowStatusBar(out pRet: OleVariant): HResult; stdcall;
    function Set_StartUpShowStatusBar(pRet: OleVariant): HResult; stdcall;
    function Get_AppIcon(out pRet: OleVariant): HResult; stdcall;
    function Set_AppIcon(pRet: OleVariant): HResult; stdcall;
    function Get_AppTitle(out pRet: OleVariant): HResult; stdcall;
    function Set_AppTitle(pRet: OleVariant): HResult; stdcall;
    function Get_ODBCConnectStr(out pRet: OleVariant): HResult; stdcall;
    function Set_ODBCConnectStr(pRet: OleVariant): HResult; stdcall;
    function Get_LogMessages(out pRet: OleVariant): HResult; stdcall;
    function Set_LogMessages(var pRet: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _Hyperlink
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50D56611-60AC-11CF-82C9-00AA004B9FE6}
// *********************************************************************//
  _Hyperlink = interface(IDispatch)
    ['{50D56611-60AC-11CF-82C9-00AA004B9FE6}']
    function Get_SubAddress: WideString; safecall;
    procedure Set_SubAddress(pbstrResult: OleVariant); safecall;
    function Get_Address: WideString; safecall;
    procedure Set_Address(pbstrResult: OleVariant); safecall;
    procedure AddToFavorites; safecall;
    procedure Follow(NewWindow: WordBool; AddHistory: WordBool; ExtraInfo: OleVariant; 
                     Method: MsoExtraInfoMethod; const HeaderInfo: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  _HyperlinkDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50D56611-60AC-11CF-82C9-00AA004B9FE6}
// *********************************************************************//
  _HyperlinkDisp = dispinterface
    ['{50D56611-60AC-11CF-82C9-00AA004B9FE6}']
    function SubAddress: WideString; dispid 2182;
    function Address: WideString; dispid 2183;
    procedure AddToFavorites; dispid 2184;
    procedure Follow(NewWindow: WordBool; AddHistory: WordBool; ExtraInfo: OleVariant; 
                     Method: MsoExtraInfoMethod; const HeaderInfo: WideString); dispid 2185;
  end;

// *********************************************************************//
// Interface: _Page
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E974-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Page = interface(IDispatch)
    ['{3B06E974-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pRet: WideString); safecall;
    function Get_Picture: WideString; safecall;
    procedure Set_Picture(const pRet: WideString); safecall;
    function Get_PictureType: Byte; safecall;
    procedure Set_PictureType(pRet: Byte); safecall;
    function Get_PageIndex: Smallint; safecall;
    procedure Set_PageIndex(pRet: Smallint); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_PictureData: OleVariant; safecall;
    procedure Set_PictureData(pRet: OleVariant); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PageIndex: Smallint read Get_PageIndex write Set_PageIndex;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
  end;

// *********************************************************************//
// DispIntf:  _PageDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E974-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _PageDisp = dispinterface
    ['{3B06E974-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property Caption: WideString dispid 17;
    property Picture: WideString dispid 7;
    property PictureType: Byte dispid 384;
    property PageIndex: Smallint dispid 395;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property Enabled: WordBool dispid 25;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property PictureData: OleVariant dispid 187;
  end;

// *********************************************************************//
// Interface: Pages
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E978-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  Pages = interface(IDispatch)
    ['{3B06E978-E47C-11CD-8701-00AA003F0F07}']
    function Get_Item(Index: OleVariant): AccessPage; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    function Add(Before: OleVariant): AccessPage; safecall;
    procedure Remove(Item: OleVariant); safecall;
    property Item[Index: OleVariant]: AccessPage read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  PagesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E978-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  PagesDisp = dispinterface
    ['{3B06E978-E47C-11CD-8701-00AA003F0F07}']
    property Item[Index: OleVariant]: AccessPage readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
    function Add(Before: OleVariant): AccessPage; dispid 2191;
    procedure Remove(Item: OleVariant); dispid 2192;
  end;

// *********************************************************************//
// Interface: _Control
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {26B96540-8F8E-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _Control = interface(IDispatch)
    ['{26B96540-8F8E-101B-AF4E-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    procedure Dropdown; safecall;
    function Get_Column(Index: Integer; Row: OleVariant): OleVariant; safecall;
    function Get_Selected(lRow: Integer): Integer; safecall;
    procedure Set_Selected(lRow: Integer; pRet: Integer); safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Form: AccessForm; safecall;
    function Get_Report: AccessReport; safecall;
    function Get_ItemData(Index: Integer): OleVariant; safecall;
    function Get_Object_: IDispatch; safecall;
    function Get_ObjectVerbs(Index: Integer): WideString; safecall;
    function Get_Properties: Properties; safecall;
    procedure Requery; safecall;
    procedure SizeToFit; safecall;
    procedure Goto_; safecall;
    function Get_ItemsSelected: _ItemsSelected; safecall;
    procedure SetFocus; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Pages: Pages; safecall;
    function Get_Controls: Children; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Column[Index: Integer; Row: OleVariant]: OleVariant read Get_Column;
    property Selected[lRow: Integer]: Integer read Get_Selected write Set_Selected;
    property OldValue: OleVariant read Get_OldValue;
    property Form: AccessForm read Get_Form;
    property Report: AccessReport read Get_Report;
    property ItemData[Index: Integer]: OleVariant read Get_ItemData;
    property Object_: IDispatch read Get_Object_;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property ItemsSelected: _ItemsSelected read Get_ItemsSelected;
    property Pages: Pages read Get_Pages;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
  end;

// *********************************************************************//
// DispIntf:  _ControlDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {26B96540-8F8E-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _ControlDisp = dispinterface
    ['{26B96540-8F8E-101B-AF4E-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    procedure Dropdown; dispid 2143;
    property Column[Index: Integer; Row: OleVariant]: OleVariant readonly dispid 2101;
    property Selected[lRow: Integer]: Integer dispid 2113;
    property OldValue: OleVariant readonly dispid 2102;
    property Form: AccessForm readonly dispid 2089;
    property Report: AccessReport readonly dispid 2097;
    property ItemData[Index: Integer]: OleVariant readonly dispid 2103;
    property Object_: IDispatch readonly dispid 2104;
    property ObjectVerbs[Index: Integer]: WideString readonly dispid 2105;
    property Properties: Properties readonly dispid 2091;
    procedure Requery; dispid 2018;
    procedure SizeToFit; dispid 2151;
    procedure Goto_; dispid 2023;
    property ItemsSelected: _ItemsSelected readonly dispid 2137;
    procedure SetFocus; dispid 2022;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Pages: Pages readonly dispid 2180;
    property Controls: Children readonly dispid 2190;
    property Hyperlink: _Hyperlink readonly dispid 2181;
  end;

// *********************************************************************//
// Interface: __ControlInReportEvents
// Flags:     (16) Hidden
// GUID:      {90B322A5-F1D9-11CD-8701-00AA003F0F07}
// *********************************************************************//
  __ControlInReportEvents = interface(IUnknown)
    ['{90B322A5-F1D9-11CD-8701-00AA003F0F07}']
  end;

// *********************************************************************//
// Interface: Controls
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5970C574-EB8C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  Controls = interface(IDispatch)
    ['{5970C574-EB8C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Item(Index: OleVariant): IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Item[Index: OleVariant]: IDispatch read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ControlsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5970C574-EB8C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  ControlsDisp = dispinterface
    ['{5970C574-EB8C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Item[Index: OleVariant]: IDispatch readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: _Label
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E948-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Label = interface(IDispatch)
    ['{3B06E948-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pRet: WideString); safecall;
    function Get_HyperlinkAddress: WideString; safecall;
    procedure Set_HyperlinkAddress(const pRet: WideString); safecall;
    function Get_HyperlinkSubAddress: WideString; safecall;
    procedure Set_HyperlinkSubAddress(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_TextAlign: Byte; safecall;
    procedure Set_TextAlign(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property Caption: WideString read Get_Caption write Set_Caption;
    property HyperlinkAddress: WideString read Get_HyperlinkAddress write Set_HyperlinkAddress;
    property HyperlinkSubAddress: WideString read Get_HyperlinkSubAddress write Set_HyperlinkSubAddress;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property TextAlign: Byte read Get_TextAlign write Set_TextAlign;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property Tag: WideString read Get_Tag write Set_Tag;
  end;

// *********************************************************************//
// DispIntf:  _LabelDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E948-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _LabelDisp = dispinterface
    ['{3B06E948-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Hyperlink: _Hyperlink readonly dispid 2181;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property Caption: WideString dispid 17;
    property HyperlinkAddress: WideString dispid 386;
    property HyperlinkSubAddress: WideString dispid 390;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ForeColor: Integer dispid 203;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property TextAlign: Byte dispid 133;
    property FontBold: Smallint dispid 32;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property ShortcutMenuBar: WideString dispid 336;
    property Tag: WideString dispid 297;
  end;

// *********************************************************************//
// Interface: _LabelEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4341-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _LabelEvents = interface(IUnknown)
    ['{BC9E4341-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _ChildLabelEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4358-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ChildLabelEvents = interface(IUnknown)
    ['{BC9E4358-F037-11CD-8701-00AA003F0F07}']
  end;

// *********************************************************************//
// Interface: _Rectangle
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E94A-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Rectangle = interface(IDispatch)
    ['{3B06E94A-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
  end;

// *********************************************************************//
// DispIntf:  _RectangleDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E94A-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _RectangleDisp = dispinterface
    ['{3B06E94A-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
  end;

// *********************************************************************//
// Interface: _RectangleEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4342-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _RectangleEvents = interface(IUnknown)
    ['{BC9E4342-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _Line
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E94C-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Line = interface(IDispatch)
    ['{3B06E94C-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_LineSlant: WordBool; safecall;
    procedure Set_LineSlant(pRet: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property LineSlant: WordBool read Get_LineSlant write Set_LineSlant;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
  end;

// *********************************************************************//
// DispIntf:  _LineDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E94C-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _LineDisp = dispinterface
    ['{3B06E94C-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property LineSlant: WordBool dispid 55;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
  end;

// *********************************************************************//
// Interface: _LineEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4343-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _LineEvents = interface(IUnknown)
    ['{BC9E4343-F037-11CD-8701-00AA003F0F07}']
  end;

// *********************************************************************//
// Interface: _Image
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E94E-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Image = interface(IDispatch)
    ['{3B06E94E-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_Picture: WideString; safecall;
    procedure Set_Picture(const pRet: WideString); safecall;
    function Get_PictureType: Byte; safecall;
    procedure Set_PictureType(pRet: Byte); safecall;
    function Get_PictureData: OleVariant; safecall;
    procedure Set_PictureData(pRet: OleVariant); safecall;
    function Get_SizeMode: Byte; safecall;
    procedure Set_SizeMode(pRet: Byte); safecall;
    function Get_PictureAlignment: Byte; safecall;
    procedure Set_PictureAlignment(pRet: Byte); safecall;
    function Get_PictureTiling: WordBool; safecall;
    procedure Set_PictureTiling(pRet: WordBool); safecall;
    function Get_HyperlinkAddress: WideString; safecall;
    procedure Set_HyperlinkAddress(const pRet: WideString); safecall;
    function Get_HyperlinkSubAddress: WideString; safecall;
    procedure Set_HyperlinkSubAddress(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_ObjectPalette: OleVariant; safecall;
    procedure Set_ObjectPalette(pRet: OleVariant); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ImageHeight: Integer; safecall;
    procedure Set_ImageHeight(pRet: Integer); safecall;
    function Get_ImageWidth: Integer; safecall;
    procedure Set_ImageWidth(pRet: Integer); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property SizeMode: Byte read Get_SizeMode write Set_SizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property HyperlinkAddress: WideString read Get_HyperlinkAddress write Set_HyperlinkAddress;
    property HyperlinkSubAddress: WideString read Get_HyperlinkSubAddress write Set_HyperlinkSubAddress;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property ObjectPalette: OleVariant read Get_ObjectPalette write Set_ObjectPalette;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ImageHeight: Integer read Get_ImageHeight write Set_ImageHeight;
    property ImageWidth: Integer read Get_ImageWidth write Set_ImageWidth;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property Tag: WideString read Get_Tag write Set_Tag;
  end;

// *********************************************************************//
// DispIntf:  _ImageDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E94E-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ImageDisp = dispinterface
    ['{3B06E94E-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Hyperlink: _Hyperlink readonly dispid 2181;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property Picture: WideString dispid 7;
    property PictureType: Byte dispid 384;
    property PictureData: OleVariant dispid 187;
    property SizeMode: Byte dispid 85;
    property PictureAlignment: Byte dispid 354;
    property PictureTiling: WordBool dispid 358;
    property HyperlinkAddress: WideString dispid 386;
    property HyperlinkSubAddress: WideString dispid 390;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property ObjectPalette: OleVariant dispid 96;
    property IsVisible: WordBool dispid 137;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property ShortcutMenuBar: WideString dispid 336;
    property ImageHeight: Integer dispid 350;
    property ImageWidth: Integer dispid 351;
    property InSelection: WordBool dispid 312;
    property Tag: WideString dispid 297;
  end;

// *********************************************************************//
// Interface: _ImageEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4344-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ImageEvents = interface(IUnknown)
    ['{BC9E4344-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _CommandButton
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E950-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CommandButton = interface(IDispatch)
    ['{3B06E950-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pRet: WideString); safecall;
    function Get_Picture: WideString; safecall;
    procedure Set_Picture(const pRet: WideString); safecall;
    function Get_PictureType: Byte; safecall;
    procedure Set_PictureType(pRet: Byte); safecall;
    function Get_PictureData: OleVariant; safecall;
    procedure Set_PictureData(pRet: OleVariant); safecall;
    function Get_Transparent: WordBool; safecall;
    procedure Set_Transparent(pRet: WordBool); safecall;
    function Get_Default: WordBool; safecall;
    procedure Set_Default(pRet: WordBool); safecall;
    function Get_Cancel: WordBool; safecall;
    procedure Set_Cancel(pRet: WordBool); safecall;
    function Get_AutoRepeat: WordBool; safecall;
    procedure Set_AutoRepeat(pRet: WordBool); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_OnPush: WideString; safecall;
    procedure Set_OnPush(const pRet: WideString); safecall;
    function Get_HyperlinkAddress: WideString; safecall;
    procedure Set_HyperlinkAddress(const pRet: WideString); safecall;
    function Get_HyperlinkSubAddress: WideString; safecall;
    procedure Set_HyperlinkSubAddress(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_ObjectPalette: OleVariant; safecall;
    procedure Set_ObjectPalette(pRet: OleVariant); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property Transparent: WordBool read Get_Transparent write Set_Transparent;
    property Default: WordBool read Get_Default write Set_Default;
    property Cancel: WordBool read Get_Cancel write Set_Cancel;
    property AutoRepeat: WordBool read Get_AutoRepeat write Set_AutoRepeat;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property OnPush: WideString read Get_OnPush write Set_OnPush;
    property HyperlinkAddress: WideString read Get_HyperlinkAddress write Set_HyperlinkAddress;
    property HyperlinkSubAddress: WideString read Get_HyperlinkSubAddress write Set_HyperlinkSubAddress;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property ObjectPalette: OleVariant read Get_ObjectPalette write Set_ObjectPalette;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _CommandButtonDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E950-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CommandButtonDisp = dispinterface
    ['{3B06E950-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Hyperlink: _Hyperlink readonly dispid 2181;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property Caption: WideString dispid 17;
    property Picture: WideString dispid 7;
    property PictureType: Byte dispid 384;
    property PictureData: OleVariant dispid 187;
    property Transparent: WordBool dispid 46;
    property Default: WordBool dispid 219;
    property Cancel: WordBool dispid 220;
    property AutoRepeat: WordBool dispid 5;
    property StatusBarText: WideString dispid 132;
    property OnPush: WideString dispid 152;
    property HyperlinkAddress: WideString dispid 386;
    property HyperlinkSubAddress: WideString dispid 390;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property ForeColor: Integer dispid 203;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property FontBold: Smallint dispid 32;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property ObjectPalette: OleVariant dispid 96;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _CommandButtonEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4345-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CommandButtonEvents = interface(IUnknown)
    ['{BC9E4345-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _OptionButton
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E952-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionButton = interface(IDispatch)
    ['{3B06E952-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_OptionValue: Integer; safecall;
    procedure Set_OptionValue(pRet: Integer); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TripleState: WordBool; safecall;
    procedure Set_TripleState(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property OptionValue: Integer read Get_OptionValue write Set_OptionValue;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TripleState: WordBool read Get_TripleState write Set_TripleState;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _OptionButtonDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E952-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionButtonDisp = dispinterface
    ['{3B06E952-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property OptionValue: Integer dispid 58;
    property ControlSource: WideString dispid 27;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TripleState: WordBool dispid 326;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property BorderColor: Integer dispid 8;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _OptionButtonEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4346-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionButtonEvents = interface(IUnknown)
    ['{BC9E4346-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _OptionButtonInOptionEvents
// Flags:     (16) Hidden
// GUID:      {BC9E435B-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionButtonInOptionEvents = interface(IUnknown)
    ['{BC9E435B-F037-11CD-8701-00AA003F0F07}']
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _Checkbox
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E954-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Checkbox = interface(IDispatch)
    ['{3B06E954-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_OptionValue: Integer; safecall;
    procedure Set_OptionValue(pRet: Integer); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TripleState: WordBool; safecall;
    procedure Set_TripleState(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property OptionValue: Integer read Get_OptionValue write Set_OptionValue;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TripleState: WordBool read Get_TripleState write Set_TripleState;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _CheckboxDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E954-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CheckboxDisp = dispinterface
    ['{3B06E954-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property OptionValue: Integer dispid 58;
    property ControlSource: WideString dispid 27;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TripleState: WordBool dispid 326;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property BorderColor: Integer dispid 8;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _CheckBoxEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4347-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CheckBoxEvents = interface(IUnknown)
    ['{BC9E4347-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _CheckBoxInOptionEvents
// Flags:     (16) Hidden
// GUID:      {BC9E435D-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CheckBoxInOptionEvents = interface(IUnknown)
    ['{BC9E435D-F037-11CD-8701-00AA003F0F07}']
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _OptionGroup
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E956-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionGroup = interface(IDispatch)
    ['{3B06E956-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
  end;

// *********************************************************************//
// DispIntf:  _OptionGroupDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E956-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionGroupDisp = dispinterface
    ['{3B06E956-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
  end;

// *********************************************************************//
// Interface: _OptionGroupEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4348-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _OptionGroupEvents = interface(IUnknown)
    ['{BC9E4348-F037-11CD-8701-00AA003F0F07}']
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _BoundObjectFrame
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E958-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _BoundObjectFrame = interface(IDispatch)
    ['{3B06E958-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Object_: IDispatch; safecall;
    function Get_ObjectVerbs(Index: Integer): WideString; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_SizeMode: Byte; safecall;
    procedure Set_SizeMode(pRet: Byte); safecall;
    function Get_Class_: WideString; safecall;
    procedure Set_Class_(const pRet: WideString); safecall;
    function Get_SourceDoc: WideString; safecall;
    procedure Set_SourceDoc(const pRet: WideString); safecall;
    function Get_SourceItem: WideString; safecall;
    procedure Set_SourceItem(const pRet: WideString); safecall;
    function Get_AutoActivate: Smallint; safecall;
    procedure Set_AutoActivate(pRet: Smallint); safecall;
    function Get_DisplayType: WordBool; safecall;
    procedure Set_DisplayType(pRet: WordBool); safecall;
    function Get_UpdateOptions: Smallint; safecall;
    procedure Set_UpdateOptions(pRet: Smallint); safecall;
    function Get_Verb: Integer; safecall;
    procedure Set_Verb(pRet: Integer); safecall;
    function Get_OLETypeAllowed: Byte; safecall;
    procedure Set_OLETypeAllowed(pRet: Byte); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_ObjectPalette: OleVariant; safecall;
    procedure Set_ObjectPalette(pRet: OleVariant); safecall;
    function Get_LpOleObject: Integer; safecall;
    procedure Set_LpOleObject(pRet: Integer); safecall;
    function Get_ObjectVerbsCount: Integer; safecall;
    procedure Set_ObjectVerbsCount(pRet: Integer); safecall;
    function Get_Action: Smallint; safecall;
    procedure Set_Action(pRet: Smallint); safecall;
    function Get_Scaling: Byte; safecall;
    procedure Set_Scaling(pRet: Byte); safecall;
    function Get_OLEType: Byte; safecall;
    procedure Set_OLEType(pRet: Byte); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnUpdated: WideString; safecall;
    procedure Set_OnUpdated(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Object_: IDispatch read Get_Object_;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property SizeMode: Byte read Get_SizeMode write Set_SizeMode;
    property Class_: WideString read Get_Class_ write Set_Class_;
    property SourceDoc: WideString read Get_SourceDoc write Set_SourceDoc;
    property SourceItem: WideString read Get_SourceItem write Set_SourceItem;
    property AutoActivate: Smallint read Get_AutoActivate write Set_AutoActivate;
    property DisplayType: WordBool read Get_DisplayType write Set_DisplayType;
    property UpdateOptions: Smallint read Get_UpdateOptions write Set_UpdateOptions;
    property Verb: Integer read Get_Verb write Set_Verb;
    property OLETypeAllowed: Byte read Get_OLETypeAllowed write Set_OLETypeAllowed;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property ObjectPalette: OleVariant read Get_ObjectPalette write Set_ObjectPalette;
    property LpOleObject: Integer read Get_LpOleObject write Set_LpOleObject;
    property ObjectVerbsCount: Integer read Get_ObjectVerbsCount write Set_ObjectVerbsCount;
    property Action: Smallint read Get_Action write Set_Action;
    property Scaling: Byte read Get_Scaling write Set_Scaling;
    property OLEType: Byte read Get_OLEType write Set_OLEType;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnUpdated: WideString read Get_OnUpdated write Set_OnUpdated;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _BoundObjectFrameDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E958-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _BoundObjectFrameDisp = dispinterface
    ['{3B06E958-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Object_: IDispatch readonly dispid 2104;
    property ObjectVerbs[Index: Integer]: WideString readonly dispid 2105;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property SizeMode: Byte dispid 85;
    property Class_: WideString dispid 306;
    property SourceDoc: WideString dispid 130;
    property SourceItem: WideString dispid 48;
    property AutoActivate: Smallint dispid 98;
    property DisplayType: WordBool dispid 304;
    property UpdateOptions: Smallint dispid 100;
    property Verb: Integer dispid 99;
    property OLETypeAllowed: Byte dispid 307;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property ObjectPalette: OleVariant dispid 96;
    property LpOleObject: Integer dispid 169;
    property ObjectVerbsCount: Integer dispid 172;
    property Action: Smallint dispid 305;
    property Scaling: Byte dispid 84;
    property OLEType: Byte dispid 308;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnUpdated: WideString dispid 115;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _BoundObjectFrameEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4349-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _BoundObjectFrameEvents = interface(IUnknown)
    ['{BC9E4349-F037-11CD-8701-00AA003F0F07}']
    function Updated(var Code: Smallint): HResult; stdcall;
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _Textbox
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E946-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Textbox = interface(IDispatch)
    ['{3B06E946-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_Format: WideString; safecall;
    procedure Set_Format(const pRet: WideString); safecall;
    function Get_DecimalPlaces: Byte; safecall;
    procedure Set_DecimalPlaces(pRet: Byte); safecall;
    function Get_InputMask: WideString; safecall;
    procedure Set_InputMask(const pRet: WideString); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_EnterKeyBehavior: WordBool; safecall;
    procedure Set_EnterKeyBehavior(pRet: WordBool); safecall;
    function Get_AllowAutoCorrect: WordBool; safecall;
    procedure Set_AllowAutoCorrect(pRet: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_FilterLookup: Byte; safecall;
    procedure Set_FilterLookup(pRet: Byte); safecall;
    function Get_AutoTab: WordBool; safecall;
    procedure Set_AutoTab(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_ScrollBars: Byte; safecall;
    procedure Set_ScrollBars(pRet: Byte); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_CanGrow: WordBool; safecall;
    procedure Set_CanGrow(pRet: WordBool); safecall;
    function Get_CanShrink: WordBool; safecall;
    procedure Set_CanShrink(pRet: WordBool); safecall;
    function Get_RunningSum: Byte; safecall;
    procedure Set_RunningSum(pRet: Byte); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_TextAlign: Byte; safecall;
    procedure Set_TextAlign(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const pRet: WideString); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const pRet: WideString); safecall;
    function Get_SelStart: Smallint; safecall;
    procedure Set_SelStart(pRet: Smallint); safecall;
    function Get_SelLength: Smallint; safecall;
    procedure Set_SelLength(pRet: Smallint); safecall;
    function Get_TextAlignGeneral: Smallint; safecall;
    procedure Set_TextAlignGeneral(pRet: Smallint); safecall;
    function Get_Coltyp: Integer; safecall;
    procedure Set_Coltyp(pRet: Integer); safecall;
    function Get_FormatPictureText: WideString; safecall;
    procedure Set_FormatPictureText(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnChange: WideString; safecall;
    procedure Set_OnChange(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property Format: WideString read Get_Format write Set_Format;
    property DecimalPlaces: Byte read Get_DecimalPlaces write Set_DecimalPlaces;
    property InputMask: WideString read Get_InputMask write Set_InputMask;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property EnterKeyBehavior: WordBool read Get_EnterKeyBehavior write Set_EnterKeyBehavior;
    property AllowAutoCorrect: WordBool read Get_AllowAutoCorrect write Set_AllowAutoCorrect;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property FilterLookup: Byte read Get_FilterLookup write Set_FilterLookup;
    property AutoTab: WordBool read Get_AutoTab write Set_AutoTab;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property ScrollBars: Byte read Get_ScrollBars write Set_ScrollBars;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property CanGrow: WordBool read Get_CanGrow write Set_CanGrow;
    property CanShrink: WordBool read Get_CanShrink write Set_CanShrink;
    property RunningSum: Byte read Get_RunningSum write Set_RunningSum;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property TextAlign: Byte read Get_TextAlign write Set_TextAlign;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property Text: WideString read Get_Text write Set_Text;
    property SelText: WideString read Get_SelText write Set_SelText;
    property SelStart: Smallint read Get_SelStart write Set_SelStart;
    property SelLength: Smallint read Get_SelLength write Set_SelLength;
    property TextAlignGeneral: Smallint read Get_TextAlignGeneral write Set_TextAlignGeneral;
    property Coltyp: Integer read Get_Coltyp write Set_Coltyp;
    property FormatPictureText: WideString read Get_FormatPictureText write Set_FormatPictureText;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnChange: WideString read Get_OnChange write Set_OnChange;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _TextboxDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E946-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _TextboxDisp = dispinterface
    ['{3B06E946-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Hyperlink: _Hyperlink readonly dispid 2181;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property Format: WideString dispid 38;
    property DecimalPlaces: Byte dispid 67;
    property InputMask: WideString dispid 68;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property EnterKeyBehavior: WordBool dispid 70;
    property AllowAutoCorrect: WordBool dispid 383;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property FilterLookup: Byte dispid 337;
    property AutoTab: WordBool dispid 69;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property ScrollBars: Byte dispid 149;
    property HideDuplicates: WordBool dispid 65;
    property CanGrow: WordBool dispid 14;
    property CanShrink: WordBool dispid 16;
    property RunningSum: Byte dispid 127;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ForeColor: Integer dispid 203;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property TextAlign: Byte dispid 133;
    property FontBold: Smallint dispid 32;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property Text: WideString dispid 298;
    property SelText: WideString dispid 302;
    property SelStart: Smallint dispid 301;
    property SelLength: Smallint dispid 300;
    property TextAlignGeneral: Smallint dispid 134;
    property Coltyp: Integer dispid 136;
    property FormatPictureText: WideString dispid 135;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnChange: WideString dispid 111;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _TextBoxEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4340-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _TextBoxEvents = interface(IUnknown)
    ['{BC9E4340-F037-11CD-8701-00AA003F0F07}']
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Change: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _ListBox
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E95A-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ListBox = interface(IDispatch)
    ['{3B06E95A-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    function Get_Column(Index: Integer; Row: OleVariant): OleVariant; safecall;
    function Get_Selected(lRow: Integer): Integer; safecall;
    procedure Set_Selected(lRow: Integer; pRet: Integer); safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_ItemData(Index: Integer): OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function Get_ItemsSelected: _ItemsSelected; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_RowSourceType: WideString; safecall;
    procedure Set_RowSourceType(const pRet: WideString); safecall;
    function Get_RowSource: WideString; safecall;
    procedure Set_RowSource(const pRet: WideString); safecall;
    function Get_ColumnCount: Smallint; safecall;
    procedure Set_ColumnCount(pRet: Smallint); safecall;
    function Get_ColumnHeads: WordBool; safecall;
    procedure Set_ColumnHeads(pRet: WordBool); safecall;
    function Get_ColumnWidths: WideString; safecall;
    procedure Set_ColumnWidths(const pRet: WideString); safecall;
    function Get_BoundColumn: Integer; safecall;
    procedure Set_BoundColumn(pRet: Integer); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_MultiSelect: Byte; safecall;
    procedure Set_MultiSelect(pRet: Byte); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_ListCount: Integer; safecall;
    procedure Set_ListCount(pRet: Integer); safecall;
    function Get_ListIndex: Integer; safecall;
    procedure Set_ListIndex(pRet: Integer); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Column[Index: Integer; Row: OleVariant]: OleVariant read Get_Column;
    property Selected[lRow: Integer]: Integer read Get_Selected write Set_Selected;
    property OldValue: OleVariant read Get_OldValue;
    property ItemData[Index: Integer]: OleVariant read Get_ItemData;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property ItemsSelected: _ItemsSelected read Get_ItemsSelected;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property RowSourceType: WideString read Get_RowSourceType write Set_RowSourceType;
    property RowSource: WideString read Get_RowSource write Set_RowSource;
    property ColumnCount: Smallint read Get_ColumnCount write Set_ColumnCount;
    property ColumnHeads: WordBool read Get_ColumnHeads write Set_ColumnHeads;
    property ColumnWidths: WideString read Get_ColumnWidths write Set_ColumnWidths;
    property BoundColumn: Integer read Get_BoundColumn write Set_BoundColumn;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property MultiSelect: Byte read Get_MultiSelect write Set_MultiSelect;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property ListCount: Integer read Get_ListCount write Set_ListCount;
    property ListIndex: Integer read Get_ListIndex write Set_ListIndex;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _ListBoxDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E95A-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ListBoxDisp = dispinterface
    ['{3B06E95A-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    property Column[Index: Integer; Row: OleVariant]: OleVariant readonly dispid 2101;
    property Selected[lRow: Integer]: Integer dispid 2113;
    property OldValue: OleVariant readonly dispid 2102;
    property ItemData[Index: Integer]: OleVariant readonly dispid 2103;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    property ItemsSelected: _ItemsSelected readonly dispid 2137;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Hyperlink: _Hyperlink readonly dispid 2181;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property RowSourceType: WideString dispid 90;
    property RowSource: WideString dispid 88;
    property ColumnCount: Smallint dispid 66;
    property ColumnHeads: WordBool dispid 128;
    property ColumnWidths: WideString dispid 18;
    property BoundColumn: Integer dispid 13;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property MultiSelect: Byte dispid 325;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property BorderColor: Integer dispid 8;
    property ForeColor: Integer dispid 203;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property FontBold: Smallint dispid 32;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property ListCount: Integer dispid 241;
    property ListIndex: Integer dispid 242;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _ListBoxEvents
// Flags:     (16) Hidden
// GUID:      {BC9E434B-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ListBoxEvents = interface(IUnknown)
    ['{BC9E434B-F037-11CD-8701-00AA003F0F07}']
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _Combobox
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E95C-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Combobox = interface(IDispatch)
    ['{3B06E95C-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    procedure Dropdown; safecall;
    function Get_Column(Index: Integer; Row: OleVariant): OleVariant; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_ItemData(Index: Integer): OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Hyperlink: _Hyperlink; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_Format: WideString; safecall;
    procedure Set_Format(const pRet: WideString); safecall;
    function Get_DecimalPlaces: Byte; safecall;
    procedure Set_DecimalPlaces(pRet: Byte); safecall;
    function Get_InputMask: WideString; safecall;
    procedure Set_InputMask(const pRet: WideString); safecall;
    function Get_RowSourceType: WideString; safecall;
    procedure Set_RowSourceType(const pRet: WideString); safecall;
    function Get_RowSource: WideString; safecall;
    procedure Set_RowSource(const pRet: WideString); safecall;
    function Get_ColumnCount: Smallint; safecall;
    procedure Set_ColumnCount(pRet: Smallint); safecall;
    function Get_ColumnHeads: WordBool; safecall;
    procedure Set_ColumnHeads(pRet: WordBool); safecall;
    function Get_ColumnWidths: WideString; safecall;
    procedure Set_ColumnWidths(const pRet: WideString); safecall;
    function Get_BoundColumn: Integer; safecall;
    procedure Set_BoundColumn(pRet: Integer); safecall;
    function Get_ListRows: Smallint; safecall;
    procedure Set_ListRows(pRet: Smallint); safecall;
    function Get_ListWidth: WideString; safecall;
    procedure Set_ListWidth(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_LimitToList: WordBool; safecall;
    procedure Set_LimitToList(pRet: WordBool); safecall;
    function Get_AutoExpand: WordBool; safecall;
    procedure Set_AutoExpand(pRet: WordBool); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_AllowAutoCorrect: WordBool; safecall;
    procedure Set_AllowAutoCorrect(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_TextAlign: Byte; safecall;
    procedure Set_TextAlign(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const pRet: WideString); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const pRet: WideString); safecall;
    function Get_SelStart: Smallint; safecall;
    procedure Set_SelStart(pRet: Smallint); safecall;
    function Get_SelLength: Smallint; safecall;
    procedure Set_SelLength(pRet: Smallint); safecall;
    function Get_TextAlignGeneral: Smallint; safecall;
    procedure Set_TextAlignGeneral(pRet: Smallint); safecall;
    function Get_FormatPictureText: WideString; safecall;
    procedure Set_FormatPictureText(const pRet: WideString); safecall;
    function Get_Coltyp: Integer; safecall;
    procedure Set_Coltyp(pRet: Integer); safecall;
    function Get_ListCount: Integer; safecall;
    procedure Set_ListCount(pRet: Integer); safecall;
    function Get_ListIndex: Integer; safecall;
    procedure Set_ListIndex(pRet: Integer); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnChange: WideString; safecall;
    procedure Set_OnChange(const pRet: WideString); safecall;
    function Get_OnNotInList: WideString; safecall;
    procedure Set_OnNotInList(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Column[Index: Integer; Row: OleVariant]: OleVariant read Get_Column;
    property OldValue: OleVariant read Get_OldValue;
    property ItemData[Index: Integer]: OleVariant read Get_ItemData;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property Format: WideString read Get_Format write Set_Format;
    property DecimalPlaces: Byte read Get_DecimalPlaces write Set_DecimalPlaces;
    property InputMask: WideString read Get_InputMask write Set_InputMask;
    property RowSourceType: WideString read Get_RowSourceType write Set_RowSourceType;
    property RowSource: WideString read Get_RowSource write Set_RowSource;
    property ColumnCount: Smallint read Get_ColumnCount write Set_ColumnCount;
    property ColumnHeads: WordBool read Get_ColumnHeads write Set_ColumnHeads;
    property ColumnWidths: WideString read Get_ColumnWidths write Set_ColumnWidths;
    property BoundColumn: Integer read Get_BoundColumn write Set_BoundColumn;
    property ListRows: Smallint read Get_ListRows write Set_ListRows;
    property ListWidth: WideString read Get_ListWidth write Set_ListWidth;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property LimitToList: WordBool read Get_LimitToList write Set_LimitToList;
    property AutoExpand: WordBool read Get_AutoExpand write Set_AutoExpand;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property AllowAutoCorrect: WordBool read Get_AllowAutoCorrect write Set_AllowAutoCorrect;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property TextAlign: Byte read Get_TextAlign write Set_TextAlign;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property Text: WideString read Get_Text write Set_Text;
    property SelText: WideString read Get_SelText write Set_SelText;
    property SelStart: Smallint read Get_SelStart write Set_SelStart;
    property SelLength: Smallint read Get_SelLength write Set_SelLength;
    property TextAlignGeneral: Smallint read Get_TextAlignGeneral write Set_TextAlignGeneral;
    property FormatPictureText: WideString read Get_FormatPictureText write Set_FormatPictureText;
    property Coltyp: Integer read Get_Coltyp write Set_Coltyp;
    property ListCount: Integer read Get_ListCount write Set_ListCount;
    property ListIndex: Integer read Get_ListIndex write Set_ListIndex;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnChange: WideString read Get_OnChange write Set_OnChange;
    property OnNotInList: WideString read Get_OnNotInList write Set_OnNotInList;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _ComboboxDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E95C-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ComboboxDisp = dispinterface
    ['{3B06E95C-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    procedure Dropdown; dispid 2143;
    property Column[Index: Integer; Row: OleVariant]: OleVariant readonly dispid 2101;
    property OldValue: OleVariant readonly dispid 2102;
    property ItemData[Index: Integer]: OleVariant readonly dispid 2103;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Hyperlink: _Hyperlink readonly dispid 2181;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property Format: WideString dispid 38;
    property DecimalPlaces: Byte dispid 67;
    property InputMask: WideString dispid 68;
    property RowSourceType: WideString dispid 90;
    property RowSource: WideString dispid 88;
    property ColumnCount: Smallint dispid 66;
    property ColumnHeads: WordBool dispid 128;
    property ColumnWidths: WideString dispid 18;
    property BoundColumn: Integer dispid 13;
    property ListRows: Smallint dispid 150;
    property ListWidth: WideString dispid 151;
    property StatusBarText: WideString dispid 132;
    property LimitToList: WordBool dispid 63;
    property AutoExpand: WordBool dispid 64;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property AllowAutoCorrect: WordBool dispid 383;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ForeColor: Integer dispid 203;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property TextAlign: Byte dispid 133;
    property FontBold: Smallint dispid 32;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property Text: WideString dispid 298;
    property SelText: WideString dispid 302;
    property SelStart: Smallint dispid 301;
    property SelLength: Smallint dispid 300;
    property TextAlignGeneral: Smallint dispid 134;
    property FormatPictureText: WideString dispid 135;
    property Coltyp: Integer dispid 136;
    property ListCount: Integer dispid 241;
    property ListIndex: Integer dispid 242;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnChange: WideString dispid 111;
    property OnNotInList: WideString dispid 117;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _ComboBoxEvents
// Flags:     (16) Hidden
// GUID:      {BC9E434C-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ComboBoxEvents = interface(IUnknown)
    ['{BC9E434C-F037-11CD-8701-00AA003F0F07}']
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Change: HResult; stdcall;
    function NotInList(var NewData: WideString; out Response: Smallint): HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _ObjectFrame
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E95E-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ObjectFrame = interface(IDispatch)
    ['{3B06E95E-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Object_: IDispatch; safecall;
    function Get_ObjectVerbs(Index: Integer): WideString; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_SizeMode: Byte; safecall;
    procedure Set_SizeMode(pRet: Byte); safecall;
    function Get_OLEClass: WideString; safecall;
    procedure Set_OLEClass(const pRet: WideString); safecall;
    function Get_Item: WideString; safecall;
    procedure Set_Item(const pRet: WideString); safecall;
    function Get_RowSourceType: WideString; safecall;
    procedure Set_RowSourceType(const pRet: WideString); safecall;
    function Get_RowSource: WideString; safecall;
    procedure Set_RowSource(const pRet: WideString); safecall;
    function Get_LinkChildFields: WideString; safecall;
    procedure Set_LinkChildFields(const pRet: WideString); safecall;
    function Get_LinkMasterFields: WideString; safecall;
    procedure Set_LinkMasterFields(const pRet: WideString); safecall;
    function Get_AutoActivate: Smallint; safecall;
    procedure Set_AutoActivate(pRet: Smallint); safecall;
    function Get_DisplayType: WordBool; safecall;
    procedure Set_DisplayType(pRet: WordBool); safecall;
    function Get_UpdateOptions: Smallint; safecall;
    procedure Set_UpdateOptions(pRet: Smallint); safecall;
    function Get_Verb: Integer; safecall;
    procedure Set_Verb(pRet: Integer); safecall;
    function Get_OLEType: Byte; safecall;
    procedure Set_OLEType(pRet: Byte); safecall;
    function Get_OLETypeAllowed: Byte; safecall;
    procedure Set_OLETypeAllowed(pRet: Byte); safecall;
    function Get_SourceObject: WideString; safecall;
    procedure Set_SourceObject(const pRet: WideString); safecall;
    function Get_Class_: WideString; safecall;
    procedure Set_Class_(const pRet: WideString); safecall;
    function Get_SourceDoc: WideString; safecall;
    procedure Set_SourceDoc(const pRet: WideString); safecall;
    function Get_SourceItem: WideString; safecall;
    procedure Set_SourceItem(const pRet: WideString); safecall;
    function Get_ColumnCount: Smallint; safecall;
    procedure Set_ColumnCount(pRet: Smallint); safecall;
    function Get_ColumnHeads: WordBool; safecall;
    procedure Set_ColumnHeads(pRet: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_OleData: OleVariant; safecall;
    procedure Set_OleData(pRet: OleVariant); safecall;
    function Get_UpdateMethod: Smallint; safecall;
    procedure Set_UpdateMethod(pRet: Smallint); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Data: Smallint; safecall;
    procedure Set_Data(pRet: Smallint); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_ObjectPalette: OleVariant; safecall;
    procedure Set_ObjectPalette(pRet: OleVariant); safecall;
    function Get_LpOleObject: Integer; safecall;
    procedure Set_LpOleObject(pRet: Integer); safecall;
    function Get_ObjectVerbsCount: Integer; safecall;
    procedure Set_ObjectVerbsCount(pRet: Integer); safecall;
    function Get_Action: Smallint; safecall;
    procedure Set_Action(pRet: Smallint); safecall;
    function Get_Scaling: Byte; safecall;
    procedure Set_Scaling(pRet: Byte); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnUpdated: WideString; safecall;
    procedure Set_OnUpdated(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Object_: IDispatch read Get_Object_;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property SizeMode: Byte read Get_SizeMode write Set_SizeMode;
    property OLEClass: WideString read Get_OLEClass write Set_OLEClass;
    property Item: WideString read Get_Item write Set_Item;
    property RowSourceType: WideString read Get_RowSourceType write Set_RowSourceType;
    property RowSource: WideString read Get_RowSource write Set_RowSource;
    property LinkChildFields: WideString read Get_LinkChildFields write Set_LinkChildFields;
    property LinkMasterFields: WideString read Get_LinkMasterFields write Set_LinkMasterFields;
    property AutoActivate: Smallint read Get_AutoActivate write Set_AutoActivate;
    property DisplayType: WordBool read Get_DisplayType write Set_DisplayType;
    property UpdateOptions: Smallint read Get_UpdateOptions write Set_UpdateOptions;
    property Verb: Integer read Get_Verb write Set_Verb;
    property OLEType: Byte read Get_OLEType write Set_OLEType;
    property OLETypeAllowed: Byte read Get_OLETypeAllowed write Set_OLETypeAllowed;
    property SourceObject: WideString read Get_SourceObject write Set_SourceObject;
    property Class_: WideString read Get_Class_ write Set_Class_;
    property SourceDoc: WideString read Get_SourceDoc write Set_SourceDoc;
    property SourceItem: WideString read Get_SourceItem write Set_SourceItem;
    property ColumnCount: Smallint read Get_ColumnCount write Set_ColumnCount;
    property ColumnHeads: WordBool read Get_ColumnHeads write Set_ColumnHeads;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property OleData: OleVariant read Get_OleData write Set_OleData;
    property UpdateMethod: Smallint read Get_UpdateMethod write Set_UpdateMethod;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Data: Smallint read Get_Data write Set_Data;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property ObjectPalette: OleVariant read Get_ObjectPalette write Set_ObjectPalette;
    property LpOleObject: Integer read Get_LpOleObject write Set_LpOleObject;
    property ObjectVerbsCount: Integer read Get_ObjectVerbsCount write Set_ObjectVerbsCount;
    property Action: Smallint read Get_Action write Set_Action;
    property Scaling: Byte read Get_Scaling write Set_Scaling;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnUpdated: WideString read Get_OnUpdated write Set_OnUpdated;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
  end;

// *********************************************************************//
// DispIntf:  _ObjectFrameDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E95E-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ObjectFrameDisp = dispinterface
    ['{3B06E95E-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Object_: IDispatch readonly dispid 2104;
    property ObjectVerbs[Index: Integer]: WideString readonly dispid 2105;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property SizeMode: Byte dispid 85;
    property OLEClass: WideString dispid 72;
    property Item: WideString dispid 47;
    property RowSourceType: WideString dispid 90;
    property RowSource: WideString dispid 88;
    property LinkChildFields: WideString dispid 49;
    property LinkMasterFields: WideString dispid 50;
    property AutoActivate: Smallint dispid 98;
    property DisplayType: WordBool dispid 304;
    property UpdateOptions: Smallint dispid 100;
    property Verb: Integer dispid 99;
    property OLEType: Byte dispid 308;
    property OLETypeAllowed: Byte dispid 307;
    property SourceObject: WideString dispid 129;
    property Class_: WideString dispid 306;
    property SourceDoc: WideString dispid 130;
    property SourceItem: WideString dispid 48;
    property ColumnCount: Smallint dispid 66;
    property ColumnHeads: WordBool dispid 128;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property OleData: OleVariant dispid 168;
    property UpdateMethod: Smallint dispid 139;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property StatusBarText: WideString dispid 132;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property Data: Smallint dispid 265;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property ObjectPalette: OleVariant dispid 96;
    property LpOleObject: Integer dispid 169;
    property ObjectVerbsCount: Integer dispid 172;
    property Action: Smallint dispid 305;
    property Scaling: Byte dispid 84;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnUpdated: WideString dispid 115;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
  end;

// *********************************************************************//
// Interface: _ObjectFrameEvents
// Flags:     (16) Hidden
// GUID:      {BC9E434D-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ObjectFrameEvents = interface(IUnknown)
    ['{BC9E434D-F037-11CD-8701-00AA003F0F07}']
    function Updated(var Code: Smallint): HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _PageBreak
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E960-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _PageBreak = interface(IDispatch)
    ['{3B06E960-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Tag: WideString read Get_Tag write Set_Tag;
    property Section: Smallint read Get_Section write Set_Section;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
  end;

// *********************************************************************//
// DispIntf:  _PageBreakDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E960-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _PageBreakDisp = dispinterface
    ['{3B06E960-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Tag: WideString dispid 297;
    property Section: Smallint dispid 238;
    property Visible: WordBool dispid 145;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property ControlName: WideString dispid 296;
  end;

// *********************************************************************//
// Interface: _PageBreakEvents
// Flags:     (16) Hidden
// GUID:      {BC9E434E-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _PageBreakEvents = interface(IUnknown)
    ['{BC9E434E-F037-11CD-8701-00AA003F0F07}']
  end;

// *********************************************************************//
// Interface: _ToggleButton
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E962-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ToggleButton = interface(IDispatch)
    ['{3B06E962-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Undo; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pRet: WideString); safecall;
    function Get_Picture: WideString; safecall;
    procedure Set_Picture(const pRet: WideString); safecall;
    function Get_PictureType: Byte; safecall;
    procedure Set_PictureType(pRet: Byte); safecall;
    function Get_PictureData: OleVariant; safecall;
    procedure Set_PictureData(pRet: OleVariant); safecall;
    function Get_OptionValue: Integer; safecall;
    procedure Set_OptionValue(pRet: Integer); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TripleState: WordBool; safecall;
    procedure Set_TripleState(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_ObjectPalette: OleVariant; safecall;
    procedure Set_ObjectPalette(pRet: OleVariant); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property OptionValue: Integer read Get_OptionValue write Set_OptionValue;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TripleState: WordBool read Get_TripleState write Set_TripleState;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property ObjectPalette: OleVariant read Get_ObjectPalette write Set_ObjectPalette;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _ToggleButtonDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E962-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ToggleButtonDisp = dispinterface
    ['{3B06E962-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure Undo; dispid 2144;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property Caption: WideString dispid 17;
    property Picture: WideString dispid 7;
    property PictureType: Byte dispid 384;
    property PictureData: OleVariant dispid 187;
    property OptionValue: Integer dispid 58;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TripleState: WordBool dispid 326;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property ForeColor: Integer dispid 203;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property FontBold: Smallint dispid 32;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property ObjectPalette: OleVariant dispid 96;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _ToggleButtonEvents
// Flags:     (16) Hidden
// GUID:      {BC9E434F-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ToggleButtonEvents = interface(IUnknown)
    ['{BC9E434F-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _ToggleButtonInOptionEvents
// Flags:     (16) Hidden
// GUID:      {BC9E435F-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ToggleButtonInOptionEvents = interface(IUnknown)
    ['{BC9E435F-F037-11CD-8701-00AA003F0F07}']
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _PaletteButton
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9CD4A760-A6A9-11CE-A686-00AA003F0F07}
// *********************************************************************//
  _PaletteButton = interface(IDispatch)
    ['{9CD4A760-A6A9-11CE-A686-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_OptionValue: Integer; safecall;
    procedure Set_OptionValue(pRet: Integer); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const pRet: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pRet: WideString); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TripleState: WordBool; safecall;
    procedure Set_TripleState(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_HideDuplicates: WordBool; safecall;
    procedure Set_HideDuplicates(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_ColumnWidth: Smallint; safecall;
    procedure Set_ColumnWidth(pRet: Smallint); safecall;
    function Get_ColumnOrder: Smallint; safecall;
    procedure Set_ColumnOrder(pRet: Smallint); safecall;
    function Get_ColumnHidden: WordBool; safecall;
    procedure Set_ColumnHidden(pRet: WordBool); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property OptionValue: Integer read Get_OptionValue write Set_OptionValue;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property DefaultValue: WideString read Get_DefaultValue write Set_DefaultValue;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TripleState: WordBool read Get_TripleState write Set_TripleState;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property HideDuplicates: WordBool read Get_HideDuplicates write Set_HideDuplicates;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property ColumnWidth: Smallint read Get_ColumnWidth write Set_ColumnWidth;
    property ColumnOrder: Smallint read Get_ColumnOrder write Set_ColumnOrder;
    property ColumnHidden: WordBool read Get_ColumnHidden write Set_ColumnHidden;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _PaletteButtonDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9CD4A760-A6A9-11CE-A686-00AA003F0F07}
// *********************************************************************//
  _PaletteButtonDisp = dispinterface
    ['{9CD4A760-A6A9-11CE-A686-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property OptionValue: Integer dispid 58;
    property ControlSource: WideString dispid 27;
    property DefaultValue: WideString dispid 23;
    property ValidationRule: WideString dispid 142;
    property ValidationText: WideString dispid 61;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TripleState: WordBool dispid 326;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property HideDuplicates: WordBool dispid 65;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property BackColor: Integer dispid 28;
    property ShortcutMenuBar: WideString dispid 336;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property ColumnWidth: Smallint dispid 163;
    property ColumnOrder: Smallint dispid 162;
    property ColumnHidden: WordBool dispid 164;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
  end;

// *********************************************************************//
// Interface: _PaletteButtonEvents
// Flags:     (16) Hidden
// GUID:      {A843CCD0-6E2C-11CF-A219-00A0C90542FF}
// *********************************************************************//
  _PaletteButtonEvents = interface(IUnknown)
    ['{A843CCD0-6E2C-11CF-A219-00A0C90542FF}']
    function Click: HResult; stdcall;
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _SubForm
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E964-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SubForm = interface(IDispatch)
    ['{3B06E964-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Form: AccessForm; safecall;
    function Get_Report: AccessReport; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    procedure Requery; safecall;
    function Get_Controls: Controls; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_SourceObject: WideString; safecall;
    procedure Set_SourceObject(const pRet: WideString); safecall;
    function Get_LinkChildFields: WideString; safecall;
    procedure Set_LinkChildFields(const pRet: WideString); safecall;
    function Get_LinkMasterFields: WideString; safecall;
    procedure Set_LinkMasterFields(const pRet: WideString); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_CanGrow: WordBool; safecall;
    procedure Set_CanGrow(pRet: WordBool); safecall;
    function Get_CanShrink: WordBool; safecall;
    procedure Set_CanShrink(pRet: WordBool); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_AutoLabel: WordBool; safecall;
    procedure Set_AutoLabel(pRet: WordBool); safecall;
    function Get_AddColon: WordBool; safecall;
    procedure Set_AddColon(pRet: WordBool); safecall;
    function Get_LabelX: Smallint; safecall;
    procedure Set_LabelX(pRet: Smallint); safecall;
    function Get_LabelY: Smallint; safecall;
    procedure Set_LabelY(pRet: Smallint); safecall;
    function Get_LabelAlign: Byte; safecall;
    procedure Set_LabelAlign(pRet: Byte); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Form: AccessForm read Get_Form;
    property Report: AccessReport read Get_Report;
    property Properties: Properties read Get_Properties;
    property Controls: Controls read Get_Controls;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property SourceObject: WideString read Get_SourceObject write Set_SourceObject;
    property LinkChildFields: WideString read Get_LinkChildFields write Set_LinkChildFields;
    property LinkMasterFields: WideString read Get_LinkMasterFields write Set_LinkMasterFields;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property CanGrow: WordBool read Get_CanGrow write Set_CanGrow;
    property CanShrink: WordBool read Get_CanShrink write Set_CanShrink;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property AutoLabel: WordBool read Get_AutoLabel write Set_AutoLabel;
    property AddColon: WordBool read Get_AddColon write Set_AddColon;
    property LabelX: Smallint read Get_LabelX write Set_LabelX;
    property LabelY: Smallint read Get_LabelY write Set_LabelY;
    property LabelAlign: Byte read Get_LabelAlign write Set_LabelAlign;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
  end;

// *********************************************************************//
// DispIntf:  _SubFormDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E964-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SubFormDisp = dispinterface
    ['{3B06E964-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Form: AccessForm readonly dispid 2089;
    property Report: AccessReport readonly dispid 2097;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    procedure Requery; dispid 2018;
    property Controls: Controls readonly dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property SourceObject: WideString dispid 129;
    property LinkChildFields: WideString dispid 49;
    property LinkMasterFields: WideString dispid 50;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property CanGrow: WordBool dispid 14;
    property CanShrink: WordBool dispid 16;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property BorderColor: Integer dispid 8;
    property AutoLabel: WordBool dispid 57;
    property AddColon: WordBool dispid 3;
    property LabelX: Smallint dispid 52;
    property LabelY: Smallint dispid 53;
    property LabelAlign: Byte dispid 51;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
  end;

// *********************************************************************//
// Interface: _SubFormEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4350-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SubFormEvents = interface(IUnknown)
    ['{BC9E4350-F037-11CD-8701-00AA003F0F07}']
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _SubReport
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E966-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SubReport = interface(IDispatch)
    ['{3B06E966-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Form: AccessForm; safecall;
    function Get_Report: AccessReport; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Form: AccessForm read Get_Form;
    property Report: AccessReport read Get_Report;
  end;

// *********************************************************************//
// DispIntf:  _SubReportDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E966-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SubReportDisp = dispinterface
    ['{3B06E966-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Form: AccessForm readonly dispid 2089;
    property Report: AccessReport readonly dispid 2097;
  end;

// *********************************************************************//
// Interface: _SubReportEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4351-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SubReportEvents = interface(IUnknown)
    ['{BC9E4351-F037-11CD-8701-00AA003F0F07}']
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _CustomControl
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E968-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CustomControl = interface(IDispatch)
    ['{3B06E968-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Object_: IDispatch; safecall;
    function Get_ObjectVerbs(Index: Integer): WideString; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    procedure Requery; safecall;
    procedure Goto_; safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Children; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_OLEClass: WideString; safecall;
    procedure Set_OLEClass(const pRet: WideString); safecall;
    function Get_Verb: Integer; safecall;
    procedure Set_Verb(pRet: Integer); safecall;
    function Get_Class_: WideString; safecall;
    procedure Set_Class_(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(pRet: WordBool); safecall;
    function Get_OleData: OleVariant; safecall;
    procedure Set_OleData(pRet: OleVariant); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_OldBorderStyle: Byte; safecall;
    procedure Set_OldBorderStyle(pRet: Byte); safecall;
    function Get_BorderColor: Integer; safecall;
    procedure Set_BorderColor(pRet: Integer); safecall;
    function Get_BorderWidth: Byte; safecall;
    procedure Set_BorderWidth(pRet: Byte); safecall;
    function Get_BorderLineStyle: Byte; safecall;
    procedure Set_BorderLineStyle(pRet: Byte); safecall;
    function Get_ControlTipText: WideString; safecall;
    procedure Set_ControlTipText(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_ObjectPalette: OleVariant; safecall;
    procedure Set_ObjectPalette(pRet: OleVariant); safecall;
    function Get_LpOleObject: Integer; safecall;
    procedure Set_LpOleObject(pRet: Integer); safecall;
    function Get_ObjectVerbsCount: Integer; safecall;
    procedure Set_ObjectVerbsCount(pRet: Integer); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnUpdated: WideString; safecall;
    procedure Set_OnUpdated(const pRet: WideString); safecall;
    function Get_OnEnter: WideString; safecall;
    procedure Set_OnEnter(const pRet: WideString); safecall;
    function Get_OnExit: WideString; safecall;
    procedure Set_OnExit(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_Default: WordBool; safecall;
    procedure Set_Default(pRet: WordBool); safecall;
    function Get_Cancel: WordBool; safecall;
    procedure Set_Cancel(pRet: WordBool); safecall;
    function Get_Custom: WideString; safecall;
    procedure Set_Custom(const pRet: WideString); safecall;
    function Get_About: WideString; safecall;
    procedure Set_About(const pRet: WideString); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Object_: IDispatch read Get_Object_;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property OLEClass: WideString read Get_OLEClass write Set_OLEClass;
    property Verb: Integer read Get_Verb write Set_Verb;
    property Class_: WideString read Get_Class_ write Set_Class_;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property OleData: OleVariant read Get_OleData write Set_OleData;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property OldBorderStyle: Byte read Get_OldBorderStyle write Set_OldBorderStyle;
    property BorderColor: Integer read Get_BorderColor write Set_BorderColor;
    property BorderWidth: Byte read Get_BorderWidth write Set_BorderWidth;
    property BorderLineStyle: Byte read Get_BorderLineStyle write Set_BorderLineStyle;
    property ControlTipText: WideString read Get_ControlTipText write Set_ControlTipText;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property ObjectPalette: OleVariant read Get_ObjectPalette write Set_ObjectPalette;
    property LpOleObject: Integer read Get_LpOleObject write Set_LpOleObject;
    property ObjectVerbsCount: Integer read Get_ObjectVerbsCount write Set_ObjectVerbsCount;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnUpdated: WideString read Get_OnUpdated write Set_OnUpdated;
    property OnEnter: WideString read Get_OnEnter write Set_OnEnter;
    property OnExit: WideString read Get_OnExit write Set_OnExit;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property Default: WordBool read Get_Default write Set_Default;
    property Cancel: WordBool read Get_Cancel write Set_Cancel;
    property Custom: WideString read Get_Custom write Set_Custom;
    property About: WideString read Get_About write Set_About;
  end;

// *********************************************************************//
// DispIntf:  _CustomControlDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3B06E968-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CustomControlDisp = dispinterface
    ['{3B06E968-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Object_: IDispatch readonly dispid 2104;
    property ObjectVerbs[Index: Integer]: WideString readonly dispid 2105;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    procedure Requery; dispid 2018;
    procedure Goto_; dispid 2023;
    procedure SetFocus; dispid 2022;
    property Controls: Children readonly dispid 2190;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property ControlSource: WideString dispid 27;
    property OLEClass: WideString dispid 72;
    property Verb: Integer dispid 99;
    property Class_: WideString dispid 306;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property Locked: WordBool dispid 56;
    property OleData: OleVariant dispid 168;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property SpecialEffect: Byte dispid 4;
    property BorderStyle: Byte dispid 9;
    property OldBorderStyle: Byte dispid 371;
    property BorderColor: Integer dispid 8;
    property BorderWidth: Byte dispid 10;
    property BorderLineStyle: Byte dispid 11;
    property ControlTipText: WideString dispid 362;
    property HelpContextId: Integer dispid 218;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property ObjectPalette: OleVariant dispid 96;
    property LpOleObject: Integer dispid 169;
    property ObjectVerbsCount: Integer dispid 172;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnUpdated: WideString dispid 115;
    property OnEnter: WideString dispid 221;
    property OnExit: WideString dispid 222;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property Default: WordBool dispid 219;
    property Cancel: WordBool dispid 220;
    property Custom: WideString dispid 328;
    property About: WideString dispid 329;
  end;

// *********************************************************************//
// Interface: _CustomControlEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4352-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _CustomControlEvents = interface(IUnknown)
    ['{BC9E4352-F037-11CD-8701-00AA003F0F07}']
    function Updated(var Code: Smallint): HResult; stdcall;
    function Enter: HResult; stdcall;
    function Exit(out Cancel: Smallint): HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _CustomControlInReportEvents
// Flags:     (16) Hidden
// GUID:      {300471E2-7426-11CE-AB64-00AA0042B7CE}
// *********************************************************************//
  _CustomControlInReportEvents = interface(IUnknown)
    ['{300471E2-7426-11CE-AB64-00AA0042B7CE}']
  end;

// *********************************************************************//
// Interface: _TabControl
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E971-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _TabControl = interface(IDispatch)
    ['{3B06E971-E47C-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OldValue: OleVariant; safecall;
    function Get_Properties: Properties; safecall;
    procedure SizeToFit; safecall;
    function Get_Pages: Pages; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pRet: OleVariant); safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ControlType: Byte; safecall;
    procedure Set_ControlType(pRet: Byte); safecall;
    function Get_StatusBarText: WideString; safecall;
    procedure Set_StatusBarText(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(pRet: WordBool); safecall;
    function Get_TabStop: WordBool; safecall;
    procedure Set_TabStop(pRet: WordBool); safecall;
    function Get_TabIndex: Smallint; safecall;
    procedure Set_TabIndex(pRet: Smallint); safecall;
    function Get_Left: Smallint; safecall;
    procedure Set_Left(pRet: Smallint); safecall;
    function Get_Top: Smallint; safecall;
    procedure Set_Top(pRet: Smallint); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackStyle: Byte; safecall;
    procedure Set_BackStyle(pRet: Byte); safecall;
    function Get_MultiRow: WordBool; safecall;
    procedure Set_MultiRow(pRet: WordBool); safecall;
    function Get_Style: Byte; safecall;
    procedure Set_Style(pRet: Byte); safecall;
    function Get_TabFixedHeight: Smallint; safecall;
    procedure Set_TabFixedHeight(pRet: Smallint); safecall;
    function Get_TabFixedWidth: Smallint; safecall;
    procedure Set_TabFixedWidth(pRet: Smallint); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontWeight: Smallint; safecall;
    procedure Set_FontWeight(pRet: Smallint); safecall;
    function Get_FontItalic: WordBool; safecall;
    procedure Set_FontItalic(pRet: WordBool); safecall;
    function Get_FontUnderline: WordBool; safecall;
    procedure Set_FontUnderline(pRet: WordBool); safecall;
    function Get_TextFontCharSet: Byte; safecall;
    procedure Set_TextFontCharSet(pRet: Byte); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Section: Smallint; safecall;
    procedure Set_Section(pRet: Smallint); safecall;
    function Get_ControlName: WideString; safecall;
    procedure Set_ControlName(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_IsVisible: WordBool; safecall;
    procedure Set_IsVisible(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    function Get_OnChange: WideString; safecall;
    procedure Set_OnChange(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    function _NewEnum: IUnknown; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property OldValue: OleVariant read Get_OldValue;
    property Properties: Properties read Get_Properties;
    property Pages: Pages read Get_Pages;
    property Value: OleVariant read Get_Value write Set_Value;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ControlType: Byte read Get_ControlType write Set_ControlType;
    property StatusBarText: WideString read Get_StatusBarText write Set_StatusBarText;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property TabStop: WordBool read Get_TabStop write Set_TabStop;
    property TabIndex: Smallint read Get_TabIndex write Set_TabIndex;
    property Left: Smallint read Get_Left write Set_Left;
    property Top: Smallint read Get_Top write Set_Top;
    property Width: Smallint read Get_Width write Set_Width;
    property Height: Smallint read Get_Height write Set_Height;
    property BackStyle: Byte read Get_BackStyle write Set_BackStyle;
    property MultiRow: WordBool read Get_MultiRow write Set_MultiRow;
    property Style: Byte read Get_Style write Set_Style;
    property TabFixedHeight: Smallint read Get_TabFixedHeight write Set_TabFixedHeight;
    property TabFixedWidth: Smallint read Get_TabFixedWidth write Set_TabFixedWidth;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontWeight: Smallint read Get_FontWeight write Set_FontWeight;
    property FontItalic: WordBool read Get_FontItalic write Set_FontItalic;
    property FontUnderline: WordBool read Get_FontUnderline write Set_FontUnderline;
    property TextFontCharSet: Byte read Get_TextFontCharSet write Set_TextFontCharSet;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Section: Smallint read Get_Section write Set_Section;
    property ControlName: WideString read Get_ControlName write Set_ControlName;
    property Tag: WideString read Get_Tag write Set_Tag;
    property IsVisible: WordBool read Get_IsVisible write Set_IsVisible;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
    property OnChange: WideString read Get_OnChange write Set_OnChange;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
  end;

// *********************************************************************//
// DispIntf:  _TabControlDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3B06E971-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _TabControlDisp = dispinterface
    ['{3B06E971-E47C-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property OldValue: OleVariant readonly dispid 2102;
    property Properties: Properties readonly dispid 2091;
    procedure SizeToFit; dispid 2151;
    property Pages: Pages readonly dispid 2180;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
    property Value: OleVariant dispid 0;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ControlType: Byte dispid 21;
    property StatusBarText: WideString dispid 132;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property Enabled: WordBool dispid 25;
    property TabStop: WordBool dispid 292;
    property TabIndex: Smallint dispid 291;
    property Left: Smallint dispid 54;
    property Top: Smallint dispid 138;
    property Width: Smallint dispid 147;
    property Height: Smallint dispid 44;
    property BackStyle: Byte dispid 29;
    property MultiRow: WordBool dispid 391;
    property Style: Byte dispid 392;
    property TabFixedHeight: Smallint dispid 393;
    property TabFixedWidth: Smallint dispid 394;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontWeight: Smallint dispid 37;
    property FontItalic: WordBool dispid 33;
    property FontUnderline: WordBool dispid 36;
    property TextFontCharSet: Byte dispid 192;
    property FontBold: Smallint dispid 32;
    property ShortcutMenuBar: WideString dispid 336;
    property HelpContextId: Integer dispid 218;
    property Section: Smallint dispid 238;
    property ControlName: WideString dispid 296;
    property Tag: WideString dispid 297;
    property IsVisible: WordBool dispid 137;
    property InSelection: WordBool dispid 312;
    property OnChange: WideString dispid 111;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: _TabControlEvents
// Flags:     (16) Hidden
// GUID:      {3B06E972-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _TabControlEvents = interface(IUnknown)
    ['{3B06E972-E47C-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function Change: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _PageEvents
// Flags:     (16) Hidden
// GUID:      {3B06E975-E47C-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _PageEvents = interface(IUnknown)
    ['{3B06E975-E47C-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _Section
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDCFC-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _Section = interface(IDispatch)
    ['{331FDCFC-CF31-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    function Get_Controls: Children; safecall;
    function Get_EventProcPrefix: WideString; safecall;
    procedure Set_EventProcPrefix(const pRet: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_ForceNewPage: Byte; safecall;
    procedure Set_ForceNewPage(pRet: Byte); safecall;
    function Get_NewRowOrCol: Byte; safecall;
    procedure Set_NewRowOrCol(pRet: Byte); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pRet: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_DisplayWhen: Byte; safecall;
    procedure Set_DisplayWhen(pRet: Byte); safecall;
    function Get_CanGrow: WordBool; safecall;
    procedure Set_CanGrow(pRet: WordBool); safecall;
    function Get_CanShrink: WordBool; safecall;
    procedure Set_CanShrink(pRet: WordBool); safecall;
    function Get_RepeatSection: WordBool; safecall;
    procedure Set_RepeatSection(pRet: WordBool); safecall;
    function Get_Height: Smallint; safecall;
    procedure Set_Height(pRet: Smallint); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(pRet: Integer); safecall;
    function Get_SpecialEffect: Byte; safecall;
    procedure Set_SpecialEffect(pRet: Byte); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_OnFormat: WideString; safecall;
    procedure Set_OnFormat(const pRet: WideString); safecall;
    function Get_OnPrint: WideString; safecall;
    procedure Set_OnPrint(const pRet: WideString); safecall;
    function Get_OnRetreat: WideString; safecall;
    procedure Set_OnRetreat(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_HasContinued: WordBool; safecall;
    procedure Set_HasContinued(pRet: WordBool); safecall;
    function Get_WillContinue: WordBool; safecall;
    procedure Set_WillContinue(pRet: WordBool); safecall;
    function Get_InSelection: WordBool; safecall;
    procedure Set_InSelection(pRet: WordBool); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property EventProcPrefix: WideString read Get_EventProcPrefix write Set_EventProcPrefix;
    property Name: WideString read Get_Name write Set_Name;
    property ForceNewPage: Byte read Get_ForceNewPage write Set_ForceNewPage;
    property NewRowOrCol: Byte read Get_NewRowOrCol write Set_NewRowOrCol;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DisplayWhen: Byte read Get_DisplayWhen write Set_DisplayWhen;
    property CanGrow: WordBool read Get_CanGrow write Set_CanGrow;
    property CanShrink: WordBool read Get_CanShrink write Set_CanShrink;
    property RepeatSection: WordBool read Get_RepeatSection write Set_RepeatSection;
    property Height: Smallint read Get_Height write Set_Height;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property SpecialEffect: Byte read Get_SpecialEffect write Set_SpecialEffect;
    property Tag: WideString read Get_Tag write Set_Tag;
    property OnFormat: WideString read Get_OnFormat write Set_OnFormat;
    property OnPrint: WideString read Get_OnPrint write Set_OnPrint;
    property OnRetreat: WideString read Get_OnRetreat write Set_OnRetreat;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property HasContinued: WordBool read Get_HasContinued write Set_HasContinued;
    property WillContinue: WordBool read Get_WillContinue write Set_WillContinue;
    property InSelection: WordBool read Get_InSelection write Set_InSelection;
  end;

// *********************************************************************//
// DispIntf:  _SectionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDCFC-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SectionDisp = dispinterface
    ['{331FDCFC-CF31-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    property Controls: Children readonly dispid 2190;
    property EventProcPrefix: WideString dispid 22;
    property Name: WideString dispid 20;
    property ForceNewPage: Byte dispid 148;
    property NewRowOrCol: Byte dispid 230;
    property KeepTogether: WordBool dispid 71;
    property Visible: WordBool dispid 145;
    property DisplayWhen: Byte dispid 146;
    property CanGrow: WordBool dispid 14;
    property CanShrink: WordBool dispid 16;
    property RepeatSection: WordBool dispid 15;
    property Height: Smallint dispid 44;
    property BackColor: Integer dispid 28;
    property SpecialEffect: Byte dispid 4;
    property Tag: WideString dispid 297;
    property OnFormat: WideString dispid 76;
    property OnPrint: WideString dispid 78;
    property OnRetreat: WideString dispid 80;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property HasContinued: WordBool dispid 199;
    property WillContinue: WordBool dispid 200;
    property InSelection: WordBool dispid 312;
  end;

// *********************************************************************//
// Interface: _SectionEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4353-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SectionEvents = interface(IUnknown)
    ['{BC9E4353-F037-11CD-8701-00AA003F0F07}']
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _GroupLevel
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDD27-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _GroupLevel = interface(IDispatch)
    ['{331FDD27-CF31-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Properties: Properties; safecall;
    function Get_ControlSource: WideString; safecall;
    procedure Set_ControlSource(const pRet: WideString); safecall;
    function Get_SortOrder: WordBool; safecall;
    procedure Set_SortOrder(pRet: WordBool); safecall;
    function Get_GroupHeader: WordBool; safecall;
    procedure Set_GroupHeader(pRet: WordBool); safecall;
    function Get_GroupFooter: WordBool; safecall;
    procedure Set_GroupFooter(pRet: WordBool); safecall;
    function Get_GroupOn: Smallint; safecall;
    procedure Set_GroupOn(pRet: Smallint); safecall;
    function Get_GroupInterval: Integer; safecall;
    procedure Set_GroupInterval(pRet: Integer); safecall;
    function Get_KeepTogether: Byte; safecall;
    procedure Set_KeepTogether(pRet: Byte); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Properties: Properties read Get_Properties;
    property ControlSource: WideString read Get_ControlSource write Set_ControlSource;
    property SortOrder: WordBool read Get_SortOrder write Set_SortOrder;
    property GroupHeader: WordBool read Get_GroupHeader write Set_GroupHeader;
    property GroupFooter: WordBool read Get_GroupFooter write Set_GroupFooter;
    property GroupOn: Smallint read Get_GroupOn write Set_GroupOn;
    property GroupInterval: Integer read Get_GroupInterval write Set_GroupInterval;
    property KeepTogether: Byte read Get_KeepTogether write Set_KeepTogether;
  end;

// *********************************************************************//
// DispIntf:  _GroupLevelDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDD27-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _GroupLevelDisp = dispinterface
    ['{331FDD27-CF31-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Properties: Properties readonly dispid 2091;
    property ControlSource: WideString dispid 27;
    property SortOrder: WordBool dispid 173;
    property GroupHeader: WordBool dispid 174;
    property GroupFooter: WordBool dispid 175;
    property GroupOn: Smallint dispid 176;
    property GroupInterval: Integer dispid 177;
    property KeepTogether: Byte dispid 71;
  end;

// *********************************************************************//
// Interface: _GroupLevelEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4354-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _GroupLevelEvents = interface(IUnknown)
    ['{BC9E4354-F037-11CD-8701-00AA003F0F07}']
    function Format(out Cancel: Smallint; var FormatCount: Smallint): HResult; stdcall;
    function Print(out Cancel: Smallint; var PrintCount: Smallint): HResult; stdcall;
    function Retreat: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _SectionInReportEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4361-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _SectionInReportEvents = interface(IUnknown)
    ['{BC9E4361-F037-11CD-8701-00AA003F0F07}']
    function Format(out Cancel: Smallint; var FormatCount: Smallint): HResult; stdcall;
    function Print(out Cancel: Smallint; var PrintCount: Smallint): HResult; stdcall;
    function Retreat: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: _PageHdrFtrInReportEvents
// Flags:     (16) Hidden
// GUID:      {7AD9E905-BAF8-11CE-A68A-00AA003F0F07}
// *********************************************************************//
  _PageHdrFtrInReportEvents = interface(IUnknown)
    ['{7AD9E905-BAF8-11CE-A68A-00AA003F0F07}']
    function Format(out Cancel: Smallint; var FormatCount: Smallint): HResult; stdcall;
    function Print(out Cancel: Smallint; var PrintCount: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: Module
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDCFE-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  Module = interface(IDispatch)
    ['{331FDCFE-CF31-11CD-8701-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure InsertText(const Text: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstrName: WideString); safecall;
    procedure AddFromString(const String_: WideString); safecall;
    procedure AddFromFile(const FileName: WideString); safecall;
    function Get_Lines(Line: Integer; NumLines: Integer): WideString; safecall;
    function Get_CountOfLines: Integer; safecall;
    procedure InsertLines(Line: Integer; const String_: WideString); safecall;
    procedure DeleteLines(StartLine: Integer; Count: Integer); safecall;
    procedure ReplaceLine(Line: Integer; const String_: WideString); safecall;
    function Get_ProcStartLine(const ProcName: WideString; ProcKind: ProcKind): Integer; safecall;
    function Get_ProcCountLines(const ProcName: WideString; ProcKind: ProcKind): Integer; safecall;
    function Get_ProcBodyLine(const ProcName: WideString; ProcKind: ProcKind): Integer; safecall;
    function Get_ProcOfLine(Line: Integer; out pprockind: ProcKind): WideString; safecall;
    function Get_CountOfDeclarationLines: Integer; safecall;
    function CreateEventProc(const EventName: WideString; const ObjectName: WideString): Integer; safecall;
    function Find(const Target: WideString; var StartLine: Integer; var StartColumn: Integer; 
                  var EndLine: Integer; var EndColumn: Integer; WholeWord: WordBool; 
                  MatchCase: WordBool; PatternSearch: WordBool): WordBool; safecall;
    function Get_type_: AcModuleType; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name write Set_Name;
    property Lines[Line: Integer; NumLines: Integer]: WideString read Get_Lines;
    property CountOfLines: Integer read Get_CountOfLines;
    property ProcStartLine[const ProcName: WideString; ProcKind: ProcKind]: Integer read Get_ProcStartLine;
    property ProcCountLines[const ProcName: WideString; ProcKind: ProcKind]: Integer read Get_ProcCountLines;
    property ProcBodyLine[const ProcName: WideString; ProcKind: ProcKind]: Integer read Get_ProcBodyLine;
    property ProcOfLine[Line: Integer; out pprockind: ProcKind]: WideString read Get_ProcOfLine;
    property CountOfDeclarationLines: Integer read Get_CountOfDeclarationLines;
    property type_: AcModuleType read Get_type_;
  end;

// *********************************************************************//
// DispIntf:  ModuleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {331FDCFE-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  ModuleDisp = dispinterface
    ['{331FDCFE-CF31-11CD-8701-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    procedure InsertText(const Text: WideString); dispid 2093;
    property Name: WideString dispid 0;
    procedure AddFromString(const String_: WideString); dispid 1610743813;
    procedure AddFromFile(const FileName: WideString); dispid 1610743814;
    property Lines[Line: Integer; NumLines: Integer]: WideString readonly dispid 1610743815;
    property CountOfLines: Integer readonly dispid 1610743816;
    procedure InsertLines(Line: Integer; const String_: WideString); dispid 1610743817;
    procedure DeleteLines(StartLine: Integer; Count: Integer); dispid 1610743818;
    procedure ReplaceLine(Line: Integer; const String_: WideString); dispid 1610743819;
    property ProcStartLine[const ProcName: WideString; ProcKind: ProcKind]: Integer readonly dispid 1610743820;
    property ProcCountLines[const ProcName: WideString; ProcKind: ProcKind]: Integer readonly dispid 1610743821;
    property ProcBodyLine[const ProcName: WideString; ProcKind: ProcKind]: Integer readonly dispid 1610743822;
    property ProcOfLine[Line: Integer; out pprockind: ProcKind]: WideString readonly dispid 1610743823;
    property CountOfDeclarationLines: Integer readonly dispid 1610743824;
    function CreateEventProc(const EventName: WideString; const ObjectName: WideString): Integer; dispid 1610743825;
    function Find(const Target: WideString; var StartLine: Integer; var StartColumn: Integer; 
                  var EndLine: Integer; var EndColumn: Integer; WholeWord: WordBool; 
                  MatchCase: WordBool; PatternSearch: WordBool): WordBool; dispid 1610743826;
    property type_: AcModuleType readonly dispid 1610743827;
  end;

// *********************************************************************//
// Interface: Modules
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9DD0AF42-6E28-11CF-9008-00AA0042B7CE}
// *********************************************************************//
  Modules = interface(IDispatch)
    ['{9DD0AF42-6E28-11CF-9008-00AA0042B7CE}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Item(Index: OleVariant): Module; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Item[Index: OleVariant]: Module read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ModulesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9DD0AF42-6E28-11CF-9008-00AA0042B7CE}
// *********************************************************************//
  ModulesDisp = dispinterface
    ['{9DD0AF42-6E28-11CF-9008-00AA0042B7CE}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Item[Index: OleVariant]: Module readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: _Form
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E5135D80-8F8D-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _Form = interface(IDispatch)
    ['{E5135D80-8F8D-101B-AF4E-00AA003F0F07}']
    function Get_FormName: WideString; safecall;
    procedure Set_FormName(const pRet: WideString); safecall;
    function Get_RecordSource: WideString; safecall;
    procedure Set_RecordSource(const pRet: WideString); safecall;
    function Get_Filter: WideString; safecall;
    procedure Set_Filter(const pRet: WideString); safecall;
    function Get_FilterOn: WordBool; safecall;
    procedure Set_FilterOn(pRet: WordBool); safecall;
    function Get_OrderBy: WideString; safecall;
    procedure Set_OrderBy(const pRet: WideString); safecall;
    function Get_OrderByOn: WordBool; safecall;
    procedure Set_OrderByOn(pRet: WordBool); safecall;
    function Get_AllowFilters: WordBool; safecall;
    procedure Set_AllowFilters(pRet: WordBool); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pRet: WideString); safecall;
    function Get_DefaultView: Byte; safecall;
    procedure Set_DefaultView(pRet: Byte); safecall;
    function Get_ViewsAllowed: Byte; safecall;
    procedure Set_ViewsAllowed(pRet: Byte); safecall;
    function Get_AllowEditing: WordBool; safecall;
    procedure Set_AllowEditing(pRet: WordBool); safecall;
    function Get_DefaultEditing: Smallint; safecall;
    procedure Set_DefaultEditing(pRet: Smallint); safecall;
    function Get_AllowEdits: WordBool; safecall;
    procedure Set_AllowEdits(pRet: WordBool); safecall;
    function Get_AllowDeletions: WordBool; safecall;
    procedure Set_AllowDeletions(pRet: WordBool); safecall;
    function Get_AllowAdditions: WordBool; safecall;
    procedure Set_AllowAdditions(pRet: WordBool); safecall;
    function Get_DataEntry: WordBool; safecall;
    procedure Set_DataEntry(pRet: WordBool); safecall;
    function Get_AllowUpdating: Byte; safecall;
    procedure Set_AllowUpdating(pRet: Byte); safecall;
    function Get_RecordsetType: Byte; safecall;
    procedure Set_RecordsetType(pRet: Byte); safecall;
    function Get_RecordLocks: Byte; safecall;
    procedure Set_RecordLocks(pRet: Byte); safecall;
    function Get_ScrollBars: Byte; safecall;
    procedure Set_ScrollBars(pRet: Byte); safecall;
    function Get_RecordSelectors: WordBool; safecall;
    procedure Set_RecordSelectors(pRet: WordBool); safecall;
    function Get_NavigationButtons: WordBool; safecall;
    procedure Set_NavigationButtons(pRet: WordBool); safecall;
    function Get_DividingLines: WordBool; safecall;
    procedure Set_DividingLines(pRet: WordBool); safecall;
    function Get_AutoResize: WordBool; safecall;
    procedure Set_AutoResize(pRet: WordBool); safecall;
    function Get_AutoCenter: WordBool; safecall;
    procedure Set_AutoCenter(pRet: WordBool); safecall;
    function Get_PopUp: WordBool; safecall;
    procedure Set_PopUp(pRet: WordBool); safecall;
    function Get_Modal: WordBool; safecall;
    procedure Set_Modal(pRet: WordBool); safecall;
    function Get_BorderStyle: Byte; safecall;
    procedure Set_BorderStyle(pRet: Byte); safecall;
    function Get_ControlBox: WordBool; safecall;
    procedure Set_ControlBox(pRet: WordBool); safecall;
    function Get_MinButton: WordBool; safecall;
    procedure Set_MinButton(pRet: WordBool); safecall;
    function Get_MaxButton: WordBool; safecall;
    procedure Set_MaxButton(pRet: WordBool); safecall;
    function Get_MinMaxButtons: Byte; safecall;
    procedure Set_MinMaxButtons(pRet: Byte); safecall;
    function Get_CloseButton: WordBool; safecall;
    procedure Set_CloseButton(pRet: WordBool); safecall;
    function Get_WhatsThisButton: WordBool; safecall;
    procedure Set_WhatsThisButton(pRet: WordBool); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Picture: WideString; safecall;
    procedure Set_Picture(const pRet: WideString); safecall;
    function Get_PictureType: Byte; safecall;
    procedure Set_PictureType(pRet: Byte); safecall;
    function Get_PictureSizeMode: Byte; safecall;
    procedure Set_PictureSizeMode(pRet: Byte); safecall;
    function Get_PictureAlignment: Byte; safecall;
    procedure Set_PictureAlignment(pRet: Byte); safecall;
    function Get_PictureTiling: WordBool; safecall;
    procedure Set_PictureTiling(pRet: WordBool); safecall;
    function Get_Cycle: Byte; safecall;
    procedure Set_Cycle(pRet: Byte); safecall;
    function Get_MenuBar: WideString; safecall;
    procedure Set_MenuBar(const pRet: WideString); safecall;
    function Get_Toolbar: WideString; safecall;
    procedure Set_Toolbar(const pRet: WideString); safecall;
    function Get_ShortcutMenu: WordBool; safecall;
    procedure Set_ShortcutMenu(pRet: WordBool); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_GridX: Smallint; safecall;
    procedure Set_GridX(pRet: Smallint); safecall;
    function Get_GridY: Smallint; safecall;
    procedure Set_GridY(pRet: Smallint); safecall;
    function Get_LayoutForPrint: WordBool; safecall;
    procedure Set_LayoutForPrint(pRet: WordBool); safecall;
    function Get_FastLaserPrinting: WordBool; safecall;
    procedure Set_FastLaserPrinting(pRet: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_RowHeight: Smallint; safecall;
    procedure Set_RowHeight(pRet: Smallint); safecall;
    function Get_DatasheetFontName: WideString; safecall;
    procedure Set_DatasheetFontName(const pRet: WideString); safecall;
    function Get_DatasheetFontHeight: Smallint; safecall;
    procedure Set_DatasheetFontHeight(pRet: Smallint); safecall;
    function Get_DatasheetFontWeight: Smallint; safecall;
    procedure Set_DatasheetFontWeight(pRet: Smallint); safecall;
    function Get_DatasheetFontItalic: WordBool; safecall;
    procedure Set_DatasheetFontItalic(pRet: WordBool); safecall;
    function Get_DatasheetFontUnderline: WordBool; safecall;
    procedure Set_DatasheetFontUnderline(pRet: WordBool); safecall;
    function Get_TabularCharSet: Byte; safecall;
    procedure Set_TabularCharSet(pRet: Byte); safecall;
    function Get_DatasheetGridlinesBehavior: Byte; safecall;
    procedure Set_DatasheetGridlinesBehavior(pRet: Byte); safecall;
    function Get_DatasheetGridlinesColor: Integer; safecall;
    procedure Set_DatasheetGridlinesColor(pRet: Integer); safecall;
    function Get_DatasheetCellsEffect: Byte; safecall;
    procedure Set_DatasheetCellsEffect(pRet: Byte); safecall;
    function Get_DatasheetForeColor: Integer; safecall;
    procedure Set_DatasheetForeColor(pRet: Integer); safecall;
    function Get_ShowGrid: WordBool; safecall;
    procedure Set_ShowGrid(pRet: WordBool); safecall;
    function Get_DatasheetBackColor: Integer; safecall;
    procedure Set_DatasheetBackColor(pRet: Integer); safecall;
    function Get_Hwnd: Integer; safecall;
    procedure Set_Hwnd(pRet: Integer); safecall;
    function Get_Count: Smallint; safecall;
    procedure Set_Count(pRet: Smallint); safecall;
    function Get_Page: Integer; safecall;
    procedure Set_Page(pRet: Integer); safecall;
    function Get_Pages: Smallint; safecall;
    procedure Set_Pages(pRet: Smallint); safecall;
    function Get_LogicalPageWidth: Integer; safecall;
    procedure Set_LogicalPageWidth(pRet: Integer); safecall;
    function Get_LogicalPageHeight: Integer; safecall;
    procedure Set_LogicalPageHeight(pRet: Integer); safecall;
    function Get_ZoomControl: Integer; safecall;
    procedure Set_ZoomControl(pRet: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_Painting: WordBool; safecall;
    procedure Set_Painting(pRet: WordBool); safecall;
    function Get_PrtMip: OleVariant; safecall;
    procedure Set_PrtMip(pRet: OleVariant); safecall;
    function Get_PrtDevMode: OleVariant; safecall;
    procedure Set_PrtDevMode(pRet: OleVariant); safecall;
    function Get_PrtDevNames: OleVariant; safecall;
    procedure Set_PrtDevNames(pRet: OleVariant); safecall;
    function Get_FrozenColumns: Smallint; safecall;
    procedure Set_FrozenColumns(pRet: Smallint); safecall;
    function Get_Bookmark: OleVariant; safecall;
    procedure Set_Bookmark(pRet: OleVariant); safecall;
    function Get_TabularFamily: Byte; safecall;
    procedure Set_TabularFamily(pRet: Byte); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_PaletteSource: WideString; safecall;
    procedure Set_PaletteSource(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_PaintPalette: OleVariant; safecall;
    procedure Set_PaintPalette(pRet: OleVariant); safecall;
    function Get_OnMenu: WideString; safecall;
    procedure Set_OnMenu(const pRet: WideString); safecall;
    function Get_OpenArgs: OleVariant; safecall;
    procedure Set_OpenArgs(pRet: OleVariant); safecall;
    function Get_ConnectSynch: Smallint; safecall;
    procedure Set_ConnectSynch(pRet: Smallint); safecall;
    function Get_OnCurrent: WideString; safecall;
    procedure Set_OnCurrent(const pRet: WideString); safecall;
    function Get_OnInsert: WideString; safecall;
    procedure Set_OnInsert(const pRet: WideString); safecall;
    function Get_BeforeInsert: WideString; safecall;
    procedure Set_BeforeInsert(const pRet: WideString); safecall;
    function Get_AfterInsert: WideString; safecall;
    procedure Set_AfterInsert(const pRet: WideString); safecall;
    function Get_BeforeUpdate: WideString; safecall;
    procedure Set_BeforeUpdate(const pRet: WideString); safecall;
    function Get_AfterUpdate: WideString; safecall;
    procedure Set_AfterUpdate(const pRet: WideString); safecall;
    function Get_OnDelete: WideString; safecall;
    procedure Set_OnDelete(const pRet: WideString); safecall;
    function Get_BeforeDelConfirm: WideString; safecall;
    procedure Set_BeforeDelConfirm(const pRet: WideString); safecall;
    function Get_AfterDelConfirm: WideString; safecall;
    procedure Set_AfterDelConfirm(const pRet: WideString); safecall;
    function Get_OnOpen: WideString; safecall;
    procedure Set_OnOpen(const pRet: WideString); safecall;
    function Get_OnLoad: WideString; safecall;
    procedure Set_OnLoad(const pRet: WideString); safecall;
    function Get_OnResize: WideString; safecall;
    procedure Set_OnResize(const pRet: WideString); safecall;
    function Get_OnUnload: WideString; safecall;
    procedure Set_OnUnload(const pRet: WideString); safecall;
    function Get_OnClose: WideString; safecall;
    procedure Set_OnClose(const pRet: WideString); safecall;
    function Get_OnActivate: WideString; safecall;
    procedure Set_OnActivate(const pRet: WideString); safecall;
    function Get_OnDeactivate: WideString; safecall;
    procedure Set_OnDeactivate(const pRet: WideString); safecall;
    function Get_OnGotFocus: WideString; safecall;
    procedure Set_OnGotFocus(const pRet: WideString); safecall;
    function Get_OnLostFocus: WideString; safecall;
    procedure Set_OnLostFocus(const pRet: WideString); safecall;
    function Get_OnClick: WideString; safecall;
    procedure Set_OnClick(const pRet: WideString); safecall;
    function Get_OnDblClick: WideString; safecall;
    procedure Set_OnDblClick(const pRet: WideString); safecall;
    function Get_OnMouseDown: WideString; safecall;
    procedure Set_OnMouseDown(const pRet: WideString); safecall;
    function Get_OnMouseMove: WideString; safecall;
    procedure Set_OnMouseMove(const pRet: WideString); safecall;
    function Get_OnMouseUp: WideString; safecall;
    procedure Set_OnMouseUp(const pRet: WideString); safecall;
    function Get_OnKeyDown: WideString; safecall;
    procedure Set_OnKeyDown(const pRet: WideString); safecall;
    function Get_OnKeyUp: WideString; safecall;
    procedure Set_OnKeyUp(const pRet: WideString); safecall;
    function Get_OnKeyPress: WideString; safecall;
    procedure Set_OnKeyPress(const pRet: WideString); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(pRet: WordBool); safecall;
    function Get_OnError: WideString; safecall;
    procedure Set_OnError(const pRet: WideString); safecall;
    function Get_OnFilter: WideString; safecall;
    procedure Set_OnFilter(const pRet: WideString); safecall;
    function Get_OnApplyFilter: WideString; safecall;
    procedure Set_OnApplyFilter(const pRet: WideString); safecall;
    function Get_OnTimer: WideString; safecall;
    procedure Set_OnTimer(const pRet: WideString); safecall;
    function Get_TimerInterval: Integer; safecall;
    procedure Set_TimerInterval(pRet: Integer); safecall;
    function Get_Dirty: WordBool; safecall;
    procedure Set_Dirty(pRet: WordBool); safecall;
    function Get_WindowWidth: Smallint; safecall;
    procedure Set_WindowWidth(pRet: Smallint); safecall;
    function Get_WindowHeight: Smallint; safecall;
    procedure Set_WindowHeight(pRet: Smallint); safecall;
    function Get_CurrentView: Smallint; safecall;
    procedure Set_CurrentView(pRet: Smallint); safecall;
    function Get_CurrentSectionTop: Smallint; safecall;
    procedure Set_CurrentSectionTop(pRet: Smallint); safecall;
    function Get_CurrentSectionLeft: Smallint; safecall;
    procedure Set_CurrentSectionLeft(pRet: Smallint); safecall;
    function Get_SelLeft: Integer; safecall;
    procedure Set_SelLeft(pRet: Integer); safecall;
    function Get_SelTop: Integer; safecall;
    procedure Set_SelTop(pRet: Integer); safecall;
    function Get_SelWidth: Integer; safecall;
    procedure Set_SelWidth(pRet: Integer); safecall;
    function Get_SelHeight: Integer; safecall;
    procedure Set_SelHeight(pRet: Integer); safecall;
    function Get_CurrentRecord: Integer; safecall;
    procedure Set_CurrentRecord(pRet: Integer); safecall;
    function Get_PictureData: OleVariant; safecall;
    procedure Set_PictureData(pRet: OleVariant); safecall;
    function Get_InsideHeight: Integer; safecall;
    procedure Set_InsideHeight(pRet: Integer); safecall;
    function Get_InsideWidth: Integer; safecall;
    procedure Set_InsideWidth(pRet: Integer); safecall;
    function Get_PicturePalette: OleVariant; safecall;
    procedure Set_PicturePalette(pRet: OleVariant); safecall;
    function Get_HasModule: WordBool; safecall;
    procedure Set_HasModule(pRet: WordBool); safecall;
    function Get_acHiddenCurrentPage: Integer; safecall;
    procedure Set_acHiddenCurrentPage(pRet: Integer); safecall;
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_NewRecord: Smallint; safecall;
    procedure Undo; safecall;
    function Get_ActiveControl: AccessControl; safecall;
    function Get_DefaultControl(ControlType: Integer): AccessControl; safecall;
    function Get_Dynaset: IDispatch; safecall;
    function Get_RecordsetClone: Recordset; safecall;
    function Get_Section(var_: OleVariant): AccessSection; safecall;
    function Get_Form: AccessForm; safecall;
    function Get_Module: Module; safecall;
    function Get_Properties: Properties; safecall;
    function Get_ConnectControl: AccessControl; safecall;
    procedure Recalc; safecall;
    procedure Requery; safecall;
    procedure Refresh; safecall;
    procedure Repaint; safecall;
    procedure GoToPage(PageNumber: Integer; Right: Integer; Down: Integer); safecall;
    procedure SetFocus; safecall;
    function Get_Controls: Controls; safecall;
    function _NewEnum: IUnknown; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    property FormName: WideString read Get_FormName write Set_FormName;
    property RecordSource: WideString read Get_RecordSource write Set_RecordSource;
    property Filter: WideString read Get_Filter write Set_Filter;
    property FilterOn: WordBool read Get_FilterOn write Set_FilterOn;
    property OrderBy: WideString read Get_OrderBy write Set_OrderBy;
    property OrderByOn: WordBool read Get_OrderByOn write Set_OrderByOn;
    property AllowFilters: WordBool read Get_AllowFilters write Set_AllowFilters;
    property Caption: WideString read Get_Caption write Set_Caption;
    property DefaultView: Byte read Get_DefaultView write Set_DefaultView;
    property ViewsAllowed: Byte read Get_ViewsAllowed write Set_ViewsAllowed;
    property AllowEditing: WordBool read Get_AllowEditing write Set_AllowEditing;
    property DefaultEditing: Smallint read Get_DefaultEditing write Set_DefaultEditing;
    property AllowEdits: WordBool read Get_AllowEdits write Set_AllowEdits;
    property AllowDeletions: WordBool read Get_AllowDeletions write Set_AllowDeletions;
    property AllowAdditions: WordBool read Get_AllowAdditions write Set_AllowAdditions;
    property DataEntry: WordBool read Get_DataEntry write Set_DataEntry;
    property AllowUpdating: Byte read Get_AllowUpdating write Set_AllowUpdating;
    property RecordsetType: Byte read Get_RecordsetType write Set_RecordsetType;
    property RecordLocks: Byte read Get_RecordLocks write Set_RecordLocks;
    property ScrollBars: Byte read Get_ScrollBars write Set_ScrollBars;
    property RecordSelectors: WordBool read Get_RecordSelectors write Set_RecordSelectors;
    property NavigationButtons: WordBool read Get_NavigationButtons write Set_NavigationButtons;
    property DividingLines: WordBool read Get_DividingLines write Set_DividingLines;
    property AutoResize: WordBool read Get_AutoResize write Set_AutoResize;
    property AutoCenter: WordBool read Get_AutoCenter write Set_AutoCenter;
    property PopUp: WordBool read Get_PopUp write Set_PopUp;
    property Modal: WordBool read Get_Modal write Set_Modal;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property ControlBox: WordBool read Get_ControlBox write Set_ControlBox;
    property MinButton: WordBool read Get_MinButton write Set_MinButton;
    property MaxButton: WordBool read Get_MaxButton write Set_MaxButton;
    property MinMaxButtons: Byte read Get_MinMaxButtons write Set_MinMaxButtons;
    property CloseButton: WordBool read Get_CloseButton write Set_CloseButton;
    property WhatsThisButton: WordBool read Get_WhatsThisButton write Set_WhatsThisButton;
    property Width: Smallint read Get_Width write Set_Width;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureSizeMode: Byte read Get_PictureSizeMode write Set_PictureSizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property Cycle: Byte read Get_Cycle write Set_Cycle;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property Toolbar: WideString read Get_Toolbar write Set_Toolbar;
    property ShortcutMenu: WordBool read Get_ShortcutMenu write Set_ShortcutMenu;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property GridX: Smallint read Get_GridX write Set_GridX;
    property GridY: Smallint read Get_GridY write Set_GridY;
    property LayoutForPrint: WordBool read Get_LayoutForPrint write Set_LayoutForPrint;
    property FastLaserPrinting: WordBool read Get_FastLaserPrinting write Set_FastLaserPrinting;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property RowHeight: Smallint read Get_RowHeight write Set_RowHeight;
    property DatasheetFontName: WideString read Get_DatasheetFontName write Set_DatasheetFontName;
    property DatasheetFontHeight: Smallint read Get_DatasheetFontHeight write Set_DatasheetFontHeight;
    property DatasheetFontWeight: Smallint read Get_DatasheetFontWeight write Set_DatasheetFontWeight;
    property DatasheetFontItalic: WordBool read Get_DatasheetFontItalic write Set_DatasheetFontItalic;
    property DatasheetFontUnderline: WordBool read Get_DatasheetFontUnderline write Set_DatasheetFontUnderline;
    property TabularCharSet: Byte read Get_TabularCharSet write Set_TabularCharSet;
    property DatasheetGridlinesBehavior: Byte read Get_DatasheetGridlinesBehavior write Set_DatasheetGridlinesBehavior;
    property DatasheetGridlinesColor: Integer read Get_DatasheetGridlinesColor write Set_DatasheetGridlinesColor;
    property DatasheetCellsEffect: Byte read Get_DatasheetCellsEffect write Set_DatasheetCellsEffect;
    property DatasheetForeColor: Integer read Get_DatasheetForeColor write Set_DatasheetForeColor;
    property ShowGrid: WordBool read Get_ShowGrid write Set_ShowGrid;
    property DatasheetBackColor: Integer read Get_DatasheetBackColor write Set_DatasheetBackColor;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Smallint read Get_Count write Set_Count;
    property Page: Integer read Get_Page write Set_Page;
    property Pages: Smallint read Get_Pages write Set_Pages;
    property LogicalPageWidth: Integer read Get_LogicalPageWidth write Set_LogicalPageWidth;
    property LogicalPageHeight: Integer read Get_LogicalPageHeight write Set_LogicalPageHeight;
    property ZoomControl: Integer read Get_ZoomControl write Set_ZoomControl;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Painting: WordBool read Get_Painting write Set_Painting;
    property PrtMip: OleVariant read Get_PrtMip write Set_PrtMip;
    property PrtDevMode: OleVariant read Get_PrtDevMode write Set_PrtDevMode;
    property PrtDevNames: OleVariant read Get_PrtDevNames write Set_PrtDevNames;
    property FrozenColumns: Smallint read Get_FrozenColumns write Set_FrozenColumns;
    property Bookmark: OleVariant read Get_Bookmark write Set_Bookmark;
    property TabularFamily: Byte read Get_TabularFamily write Set_TabularFamily;
    property Name: WideString read Get_Name write Set_Name;
    property PaletteSource: WideString read Get_PaletteSource write Set_PaletteSource;
    property Tag: WideString read Get_Tag write Set_Tag;
    property PaintPalette: OleVariant read Get_PaintPalette write Set_PaintPalette;
    property OnMenu: WideString read Get_OnMenu write Set_OnMenu;
    property OpenArgs: OleVariant read Get_OpenArgs write Set_OpenArgs;
    property ConnectSynch: Smallint read Get_ConnectSynch write Set_ConnectSynch;
    property OnCurrent: WideString read Get_OnCurrent write Set_OnCurrent;
    property OnInsert: WideString read Get_OnInsert write Set_OnInsert;
    property BeforeInsert: WideString read Get_BeforeInsert write Set_BeforeInsert;
    property AfterInsert: WideString read Get_AfterInsert write Set_AfterInsert;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnDelete: WideString read Get_OnDelete write Set_OnDelete;
    property BeforeDelConfirm: WideString read Get_BeforeDelConfirm write Set_BeforeDelConfirm;
    property AfterDelConfirm: WideString read Get_AfterDelConfirm write Set_AfterDelConfirm;
    property OnOpen: WideString read Get_OnOpen write Set_OnOpen;
    property OnLoad: WideString read Get_OnLoad write Set_OnLoad;
    property OnResize: WideString read Get_OnResize write Set_OnResize;
    property OnUnload: WideString read Get_OnUnload write Set_OnUnload;
    property OnClose: WideString read Get_OnClose write Set_OnClose;
    property OnActivate: WideString read Get_OnActivate write Set_OnActivate;
    property OnDeactivate: WideString read Get_OnDeactivate write Set_OnDeactivate;
    property OnGotFocus: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress: WideString read Get_OnKeyPress write Set_OnKeyPress;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property OnError: WideString read Get_OnError write Set_OnError;
    property OnFilter: WideString read Get_OnFilter write Set_OnFilter;
    property OnApplyFilter: WideString read Get_OnApplyFilter write Set_OnApplyFilter;
    property OnTimer: WideString read Get_OnTimer write Set_OnTimer;
    property TimerInterval: Integer read Get_TimerInterval write Set_TimerInterval;
    property Dirty: WordBool read Get_Dirty write Set_Dirty;
    property WindowWidth: Smallint read Get_WindowWidth write Set_WindowWidth;
    property WindowHeight: Smallint read Get_WindowHeight write Set_WindowHeight;
    property CurrentView: Smallint read Get_CurrentView write Set_CurrentView;
    property CurrentSectionTop: Smallint read Get_CurrentSectionTop write Set_CurrentSectionTop;
    property CurrentSectionLeft: Smallint read Get_CurrentSectionLeft write Set_CurrentSectionLeft;
    property SelLeft: Integer read Get_SelLeft write Set_SelLeft;
    property SelTop: Integer read Get_SelTop write Set_SelTop;
    property SelWidth: Integer read Get_SelWidth write Set_SelWidth;
    property SelHeight: Integer read Get_SelHeight write Set_SelHeight;
    property CurrentRecord: Integer read Get_CurrentRecord write Set_CurrentRecord;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property InsideHeight: Integer read Get_InsideHeight write Set_InsideHeight;
    property InsideWidth: Integer read Get_InsideWidth write Set_InsideWidth;
    property PicturePalette: OleVariant read Get_PicturePalette write Set_PicturePalette;
    property HasModule: WordBool read Get_HasModule write Set_HasModule;
    property acHiddenCurrentPage: Integer read Get_acHiddenCurrentPage write Set_acHiddenCurrentPage;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property NewRecord: Smallint read Get_NewRecord;
    property ActiveControl: AccessControl read Get_ActiveControl;
    property DefaultControl[ControlType: Integer]: AccessControl read Get_DefaultControl;
    property Dynaset: IDispatch read Get_Dynaset;
    property RecordsetClone: Recordset read Get_RecordsetClone;
    property Section[var_: OleVariant]: AccessSection read Get_Section;
    property Form: AccessForm read Get_Form;
    property Module: Module read Get_Module;
    property Properties: Properties read Get_Properties;
    property ConnectControl: AccessControl read Get_ConnectControl;
    property Controls: Controls read Get_Controls;
  end;

// *********************************************************************//
// DispIntf:  _FormDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E5135D80-8F8D-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _FormDisp = dispinterface
    ['{E5135D80-8F8D-101B-AF4E-00AA003F0F07}']
    property FormName: WideString dispid 39;
    property RecordSource: WideString dispid 153;
    property Filter: WideString dispid 271;
    property FilterOn: WordBool dispid 374;
    property OrderBy: WideString dispid 373;
    property OrderByOn: WordBool dispid 379;
    property AllowFilters: WordBool dispid 30;
    property Caption: WideString dispid 17;
    property DefaultView: Byte dispid 144;
    property ViewsAllowed: Byte dispid 143;
    property AllowEditing: WordBool dispid 24;
    property DefaultEditing: Smallint dispid 131;
    property AllowEdits: WordBool dispid 382;
    property AllowDeletions: WordBool dispid 324;
    property AllowAdditions: WordBool dispid 367;
    property DataEntry: WordBool dispid 381;
    property AllowUpdating: Byte dispid 45;
    property RecordsetType: Byte dispid 380;
    property RecordLocks: Byte dispid 26;
    property ScrollBars: Byte dispid 149;
    property RecordSelectors: WordBool dispid 19;
    property NavigationButtons: WordBool dispid 311;
    property DividingLines: WordBool dispid 359;
    property AutoResize: WordBool dispid 6;
    property AutoCenter: WordBool dispid 310;
    property PopUp: WordBool dispid 86;
    property Modal: WordBool dispid 62;
    property BorderStyle: Byte dispid 9;
    property ControlBox: WordBool dispid 94;
    property MinButton: WordBool dispid 92;
    property MaxButton: WordBool dispid 91;
    property MinMaxButtons: Byte dispid 369;
    property CloseButton: WordBool dispid 335;
    property WhatsThisButton: WordBool dispid 93;
    property Width: Smallint dispid 147;
    property Picture: WideString dispid 7;
    property PictureType: Byte dispid 384;
    property PictureSizeMode: Byte dispid 357;
    property PictureAlignment: Byte dispid 354;
    property PictureTiling: WordBool dispid 358;
    property Cycle: Byte dispid 372;
    property MenuBar: WideString dispid 261;
    property Toolbar: WideString dispid 396;
    property ShortcutMenu: WordBool dispid 31;
    property ShortcutMenuBar: WideString dispid 336;
    property GridX: Smallint dispid 41;
    property GridY: Smallint dispid 42;
    property LayoutForPrint: WordBool dispid 140;
    property FastLaserPrinting: WordBool dispid 141;
    property HelpFile: WideString dispid 217;
    property HelpContextId: Integer dispid 218;
    property RowHeight: Smallint dispid 165;
    property DatasheetFontName: WideString dispid 157;
    property DatasheetFontHeight: Smallint dispid 158;
    property DatasheetFontWeight: Smallint dispid 159;
    property DatasheetFontItalic: WordBool dispid 160;
    property DatasheetFontUnderline: WordBool dispid 161;
    property TabularCharSet: Byte dispid 193;
    property DatasheetGridlinesBehavior: Byte dispid 363;
    property DatasheetGridlinesColor: Integer dispid 364;
    property DatasheetCellsEffect: Byte dispid 365;
    property DatasheetForeColor: Integer dispid 349;
    property ShowGrid: WordBool dispid 166;
    property DatasheetBackColor: Integer dispid 366;
    property Hwnd: Integer dispid 191;
    property Count: Smallint dispid 194;
    property Page: Integer dispid 195;
    property Pages: Smallint dispid 196;
    property LogicalPageWidth: Integer dispid 197;
    property LogicalPageHeight: Integer dispid 198;
    property ZoomControl: Integer dispid 216;
    property Visible: WordBool dispid 145;
    property Painting: WordBool dispid 264;
    property PrtMip: OleVariant dispid 188;
    property PrtDevMode: OleVariant dispid 189;
    property PrtDevNames: OleVariant dispid 190;
    property FrozenColumns: Smallint dispid 167;
    property Bookmark: OleVariant dispid 229;
    property TabularFamily: Byte dispid 267;
    property Name: WideString dispid 20;
    property PaletteSource: WideString dispid 95;
    property Tag: WideString dispid 297;
    property PaintPalette: OleVariant dispid 97;
    property OnMenu: WideString dispid 60;
    property OpenArgs: OleVariant dispid 316;
    property ConnectSynch: Smallint dispid 317;
    property OnCurrent: WideString dispid 83;
    property OnInsert: WideString dispid 77;
    property BeforeInsert: WideString dispid 119;
    property AfterInsert: WideString dispid 120;
    property BeforeUpdate: WideString dispid 81;
    property AfterUpdate: WideString dispid 82;
    property OnDelete: WideString dispid 75;
    property BeforeDelConfirm: WideString dispid 121;
    property AfterDelConfirm: WideString dispid 122;
    property OnOpen: WideString dispid 73;
    property OnLoad: WideString dispid 124;
    property OnResize: WideString dispid 114;
    property OnUnload: WideString dispid 125;
    property OnClose: WideString dispid 74;
    property OnActivate: WideString dispid 109;
    property OnDeactivate: WideString dispid 110;
    property OnGotFocus: WideString dispid 112;
    property OnLostFocus: WideString dispid 113;
    property OnClick: WideString dispid 123;
    property OnDblClick: WideString dispid 223;
    property OnMouseDown: WideString dispid 104;
    property OnMouseMove: WideString dispid 106;
    property OnMouseUp: WideString dispid 105;
    property OnKeyDown: WideString dispid 101;
    property OnKeyUp: WideString dispid 102;
    property OnKeyPress: WideString dispid 103;
    property KeyPreview: WordBool dispid 368;
    property OnError: WideString dispid 116;
    property OnFilter: WideString dispid 375;
    property OnApplyFilter: WideString dispid 376;
    property OnTimer: WideString dispid 107;
    property TimerInterval: Integer dispid 108;
    property Dirty: WordBool dispid 318;
    property WindowWidth: Smallint dispid 319;
    property WindowHeight: Smallint dispid 320;
    property CurrentView: Smallint dispid 321;
    property CurrentSectionTop: Smallint dispid 323;
    property CurrentSectionLeft: Smallint dispid 322;
    property SelLeft: Integer dispid 330;
    property SelTop: Integer dispid 331;
    property SelWidth: Integer dispid 332;
    property SelHeight: Integer dispid 333;
    property CurrentRecord: Integer dispid 334;
    property PictureData: OleVariant dispid 187;
    property InsideHeight: Integer dispid 360;
    property InsideWidth: Integer dispid 361;
    property PicturePalette: OleVariant dispid 356;
    property HasModule: WordBool dispid 385;
    property acHiddenCurrentPage: Integer dispid 406;
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property NewRecord: Smallint readonly dispid 2147;
    procedure Undo; dispid 2145;
    property ActiveControl: AccessControl readonly dispid 2006;
    property DefaultControl[ControlType: Integer]: AccessControl readonly dispid 2150;
    property Dynaset: IDispatch readonly dispid 2085;
    property RecordsetClone: Recordset readonly dispid 2086;
    property Section[var_: OleVariant]: AccessSection readonly dispid 2088;
    property Form: AccessForm readonly dispid 2089;
    property Module: Module readonly dispid 2090;
    property Properties: Properties readonly dispid 2091;
    property ConnectControl: AccessControl readonly dispid 2092;
    procedure Recalc; dispid 2017;
    procedure Requery; dispid 2018;
    procedure Refresh; dispid -550;
    procedure Repaint; dispid 2020;
    procedure GoToPage(PageNumber: Integer; Right: Integer; Down: Integer); dispid 2021;
    procedure SetFocus; dispid 2022;
    property Controls: Controls readonly dispid 0;
    function _NewEnum: IUnknown; dispid -4;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
  end;

// *********************************************************************//
// Interface: _FormEvents
// Flags:     (16) Hidden
// GUID:      {331FDCFB-CF31-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _FormEvents = interface(IUnknown)
    ['{331FDCFB-CF31-11CD-8701-00AA003F0F07}']
    function Load: HResult; stdcall;
    function Current: HResult; stdcall;
    function BeforeInsert(out Cancel: Smallint): HResult; stdcall;
    function AfterInsert: HResult; stdcall;
    function BeforeUpdate(out Cancel: Smallint): HResult; stdcall;
    function AfterUpdate: HResult; stdcall;
    function Delete(out Cancel: Smallint): HResult; stdcall;
    function BeforeDelConfirm(out Cancel: Smallint; out Response: Smallint): HResult; stdcall;
    function AfterDelConfirm(var Status: Smallint): HResult; stdcall;
    function Open(out Cancel: Smallint): HResult; stdcall;
    function Resize: HResult; stdcall;
    function Unload(out Cancel: Smallint): HResult; stdcall;
    function Close: HResult; stdcall;
    function Activate: HResult; stdcall;
    function Deactivate: HResult; stdcall;
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
    function Click: HResult; stdcall;
    function DblClick(out Cancel: Smallint): HResult; stdcall;
    function MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single): HResult; stdcall;
    function KeyDown(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function KeyPress(var KeyAscii: Smallint): HResult; stdcall;
    function KeyUp(var KeyCode: Smallint; var Shift: Smallint): HResult; stdcall;
    function Error(var DataErr: Smallint; out Response: Smallint): HResult; stdcall;
    function Timer: HResult; stdcall;
    function Filter(out Cancel: Smallint; var FilterType: Smallint): HResult; stdcall;
    function ApplyFilter(out Cancel: Smallint; var ApplyType: Smallint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: Forms
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1BB0E80-6128-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  Forms = interface(IDispatch)
    ['{B1BB0E80-6128-101B-AF4E-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Item(Index: OleVariant): AccessForm; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Item[Index: OleVariant]: AccessForm read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  FormsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1BB0E80-6128-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  FormsDisp = dispinterface
    ['{B1BB0E80-6128-101B-AF4E-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Item[Index: OleVariant]: AccessForm readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: _Report
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3E8B6B00-91FF-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _Report = interface(IDispatch)
    ['{3E8B6B00-91FF-101B-AF4E-00AA003F0F07}']
    function Get_FormName: WideString; safecall;
    procedure Set_FormName(const pRet: WideString); safecall;
    function Get_RecordSource: WideString; safecall;
    procedure Set_RecordSource(const pRet: WideString); safecall;
    function Get_Filter: WideString; safecall;
    procedure Set_Filter(const pRet: WideString); safecall;
    function Get_FilterOn: WordBool; safecall;
    procedure Set_FilterOn(pRet: WordBool); safecall;
    function Get_OrderBy: WideString; safecall;
    procedure Set_OrderBy(const pRet: WideString); safecall;
    function Get_OrderByOn: WordBool; safecall;
    procedure Set_OrderByOn(pRet: WordBool); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const pRet: WideString); safecall;
    function Get_RecordLocks: Byte; safecall;
    procedure Set_RecordLocks(pRet: Byte); safecall;
    function Get_PageHeader: Byte; safecall;
    procedure Set_PageHeader(pRet: Byte); safecall;
    function Get_PageFooter: Byte; safecall;
    procedure Set_PageFooter(pRet: Byte); safecall;
    function Get_DateGrouping: Byte; safecall;
    procedure Set_DateGrouping(pRet: Byte); safecall;
    function Get_GrpKeepTogether: Byte; safecall;
    procedure Set_GrpKeepTogether(pRet: Byte); safecall;
    function Get_MinButton: WordBool; safecall;
    procedure Set_MinButton(pRet: WordBool); safecall;
    function Get_MaxButton: WordBool; safecall;
    procedure Set_MaxButton(pRet: WordBool); safecall;
    function Get_Width: Smallint; safecall;
    procedure Set_Width(pRet: Smallint); safecall;
    function Get_Picture: WideString; safecall;
    procedure Set_Picture(const pRet: WideString); safecall;
    function Get_PictureType: Byte; safecall;
    procedure Set_PictureType(pRet: Byte); safecall;
    function Get_PictureSizeMode: Byte; safecall;
    procedure Set_PictureSizeMode(pRet: Byte); safecall;
    function Get_PictureAlignment: Byte; safecall;
    procedure Set_PictureAlignment(pRet: Byte); safecall;
    function Get_PictureTiling: WordBool; safecall;
    procedure Set_PictureTiling(pRet: WordBool); safecall;
    function Get_PicturePages: Byte; safecall;
    procedure Set_PicturePages(pRet: Byte); safecall;
    function Get_MenuBar: WideString; safecall;
    procedure Set_MenuBar(const pRet: WideString); safecall;
    function Get_Toolbar: WideString; safecall;
    procedure Set_Toolbar(const pRet: WideString); safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_GridX: Smallint; safecall;
    procedure Set_GridX(pRet: Smallint); safecall;
    function Get_GridY: Smallint; safecall;
    procedure Set_GridY(pRet: Smallint); safecall;
    function Get_LayoutForPrint: WordBool; safecall;
    procedure Set_LayoutForPrint(pRet: WordBool); safecall;
    function Get_FastLaserPrinting: WordBool; safecall;
    procedure Set_FastLaserPrinting(pRet: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const pRet: WideString); safecall;
    function Get_HelpContextId: Integer; safecall;
    procedure Set_HelpContextId(pRet: Integer); safecall;
    function Get_Hwnd: Integer; safecall;
    procedure Set_Hwnd(pRet: Integer); safecall;
    function Get_Count: Smallint; safecall;
    procedure Set_Count(pRet: Smallint); safecall;
    function Get_Page: Integer; safecall;
    procedure Set_Page(pRet: Integer); safecall;
    function Get_Pages: Smallint; safecall;
    procedure Set_Pages(pRet: Smallint); safecall;
    function Get_LogicalPageWidth: Integer; safecall;
    procedure Set_LogicalPageWidth(pRet: Integer); safecall;
    function Get_LogicalPageHeight: Integer; safecall;
    procedure Set_LogicalPageHeight(pRet: Integer); safecall;
    function Get_ZoomControl: Integer; safecall;
    procedure Set_ZoomControl(pRet: Integer); safecall;
    function Get_HasData: Integer; safecall;
    procedure Set_HasData(pRet: Integer); safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pRet: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pRet: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pRet: Integer); safecall;
    function Get_PrintSection: WordBool; safecall;
    procedure Set_PrintSection(pRet: WordBool); safecall;
    function Get_NextRecord: WordBool; safecall;
    procedure Set_NextRecord(pRet: WordBool); safecall;
    function Get_MoveLayout: WordBool; safecall;
    procedure Set_MoveLayout(pRet: WordBool); safecall;
    function Get_FormatCount: Smallint; safecall;
    procedure Set_FormatCount(pRet: Smallint); safecall;
    function Get_PrintCount: Smallint; safecall;
    procedure Set_PrintCount(pRet: Smallint); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pRet: WordBool); safecall;
    function Get_Painting: WordBool; safecall;
    procedure Set_Painting(pRet: WordBool); safecall;
    function Get_PrtMip: OleVariant; safecall;
    procedure Set_PrtMip(pRet: OleVariant); safecall;
    function Get_PrtDevMode: OleVariant; safecall;
    procedure Set_PrtDevMode(pRet: OleVariant); safecall;
    function Get_PrtDevNames: OleVariant; safecall;
    procedure Set_PrtDevNames(pRet: OleVariant); safecall;
    function Get_ForeColor: Integer; safecall;
    procedure Set_ForeColor(pRet: Integer); safecall;
    function Get_CurrentX: Single; safecall;
    procedure Set_CurrentX(pRet: Single); safecall;
    function Get_CurrentY: Single; safecall;
    procedure Set_CurrentY(pRet: Single); safecall;
    function Get_ScaleHeight: Single; safecall;
    procedure Set_ScaleHeight(pRet: Single); safecall;
    function Get_ScaleLeft: Single; safecall;
    procedure Set_ScaleLeft(pRet: Single); safecall;
    function Get_ScaleMode: Smallint; safecall;
    procedure Set_ScaleMode(pRet: Smallint); safecall;
    function Get_ScaleTop: Single; safecall;
    procedure Set_ScaleTop(pRet: Single); safecall;
    function Get_ScaleWidth: Single; safecall;
    procedure Set_ScaleWidth(pRet: Single); safecall;
    function Get_FontBold: Smallint; safecall;
    procedure Set_FontBold(pRet: Smallint); safecall;
    function Get_FontItalic: Smallint; safecall;
    procedure Set_FontItalic(pRet: Smallint); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const pRet: WideString); safecall;
    function Get_FontSize: Smallint; safecall;
    procedure Set_FontSize(pRet: Smallint); safecall;
    function Get_FontUnderline: Smallint; safecall;
    procedure Set_FontUnderline(pRet: Smallint); safecall;
    function Get_DrawMode: Smallint; safecall;
    procedure Set_DrawMode(pRet: Smallint); safecall;
    function Get_DrawStyle: Smallint; safecall;
    procedure Set_DrawStyle(pRet: Smallint); safecall;
    function Get_DrawWidth: Smallint; safecall;
    procedure Set_DrawWidth(pRet: Smallint); safecall;
    function Get_FillColor: Integer; safecall;
    procedure Set_FillColor(pRet: Integer); safecall;
    function Get_FillStyle: Smallint; safecall;
    procedure Set_FillStyle(pRet: Smallint); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRet: WideString); safecall;
    function Get_PaletteSource: WideString; safecall;
    procedure Set_PaletteSource(const pRet: WideString); safecall;
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const pRet: WideString); safecall;
    function Get_PaintPalette: OleVariant; safecall;
    procedure Set_PaintPalette(pRet: OleVariant); safecall;
    function Get_OnMenu: WideString; safecall;
    procedure Set_OnMenu(const pRet: WideString); safecall;
    function Get_OnOpen: WideString; safecall;
    procedure Set_OnOpen(const pRet: WideString); safecall;
    function Get_OnClose: WideString; safecall;
    procedure Set_OnClose(const pRet: WideString); safecall;
    function Get_OnActivate: WideString; safecall;
    procedure Set_OnActivate(const pRet: WideString); safecall;
    function Get_OnDeactivate: WideString; safecall;
    procedure Set_OnDeactivate(const pRet: WideString); safecall;
    function Get_OnNoData: WideString; safecall;
    procedure Set_OnNoData(const pRet: WideString); safecall;
    function Get_OnPage: WideString; safecall;
    procedure Set_OnPage(const pRet: WideString); safecall;
    function Get_OnError: WideString; safecall;
    procedure Set_OnError(const pRet: WideString); safecall;
    function Get_Dirty: WordBool; safecall;
    procedure Set_Dirty(pRet: WordBool); safecall;
    function Get_CurrentRecord: Integer; safecall;
    procedure Set_CurrentRecord(pRet: Integer); safecall;
    function Get_PictureData: OleVariant; safecall;
    procedure Set_PictureData(pRet: OleVariant); safecall;
    function Get_PicturePalette: OleVariant; safecall;
    procedure Set_PicturePalette(pRet: OleVariant); safecall;
    function Get_HasModule: WordBool; safecall;
    procedure Set_HasModule(pRet: WordBool); safecall;
    function Get_acHiddenCurrentPage: Integer; safecall;
    procedure Set_acHiddenCurrentPage(pRet: Integer); safecall;
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ActiveControl: AccessControl; safecall;
    function Get_DefaultControl(ControlType: Integer): AccessControl; safecall;
    procedure Circle(flags: Smallint; X: Single; Y: Single; radius: Single; color: Integer; 
                     start: Single; end_: Single; aspect: Single); safecall;
    procedure Line(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single; color: Integer); safecall;
    procedure PSet(flags: Smallint; X: Single; Y: Single; color: Integer); safecall;
    procedure Scale(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single); safecall;
    function TextWidth(const Expr: WideString): Single; safecall;
    function TextHeight(const Expr: WideString): Single; safecall;
    procedure Print(const Expr: WideString); safecall;
    function Get_Section(Index: OleVariant): AccessSection; safecall;
    function Get_GroupLevel(Index: Integer): AccessGroupLevel; safecall;
    function Get_Report: AccessReport; safecall;
    function Get_Module: Module; safecall;
    function Get_Properties: Properties; safecall;
    function Get_Controls: Controls; safecall;
    function _NewEnum: IUnknown; safecall;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant; safecall;
    property FormName: WideString read Get_FormName write Set_FormName;
    property RecordSource: WideString read Get_RecordSource write Set_RecordSource;
    property Filter: WideString read Get_Filter write Set_Filter;
    property FilterOn: WordBool read Get_FilterOn write Set_FilterOn;
    property OrderBy: WideString read Get_OrderBy write Set_OrderBy;
    property OrderByOn: WordBool read Get_OrderByOn write Set_OrderByOn;
    property Caption: WideString read Get_Caption write Set_Caption;
    property RecordLocks: Byte read Get_RecordLocks write Set_RecordLocks;
    property PageHeader: Byte read Get_PageHeader write Set_PageHeader;
    property PageFooter: Byte read Get_PageFooter write Set_PageFooter;
    property DateGrouping: Byte read Get_DateGrouping write Set_DateGrouping;
    property GrpKeepTogether: Byte read Get_GrpKeepTogether write Set_GrpKeepTogether;
    property MinButton: WordBool read Get_MinButton write Set_MinButton;
    property MaxButton: WordBool read Get_MaxButton write Set_MaxButton;
    property Width: Smallint read Get_Width write Set_Width;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureSizeMode: Byte read Get_PictureSizeMode write Set_PictureSizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property PicturePages: Byte read Get_PicturePages write Set_PicturePages;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property Toolbar: WideString read Get_Toolbar write Set_Toolbar;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property GridX: Smallint read Get_GridX write Set_GridX;
    property GridY: Smallint read Get_GridY write Set_GridY;
    property LayoutForPrint: WordBool read Get_LayoutForPrint write Set_LayoutForPrint;
    property FastLaserPrinting: WordBool read Get_FastLaserPrinting write Set_FastLaserPrinting;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Smallint read Get_Count write Set_Count;
    property Page: Integer read Get_Page write Set_Page;
    property Pages: Smallint read Get_Pages write Set_Pages;
    property LogicalPageWidth: Integer read Get_LogicalPageWidth write Set_LogicalPageWidth;
    property LogicalPageHeight: Integer read Get_LogicalPageHeight write Set_LogicalPageHeight;
    property ZoomControl: Integer read Get_ZoomControl write Set_ZoomControl;
    property HasData: Integer read Get_HasData write Set_HasData;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Height: Integer read Get_Height write Set_Height;
    property PrintSection: WordBool read Get_PrintSection write Set_PrintSection;
    property NextRecord: WordBool read Get_NextRecord write Set_NextRecord;
    property MoveLayout: WordBool read Get_MoveLayout write Set_MoveLayout;
    property FormatCount: Smallint read Get_FormatCount write Set_FormatCount;
    property PrintCount: Smallint read Get_PrintCount write Set_PrintCount;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Painting: WordBool read Get_Painting write Set_Painting;
    property PrtMip: OleVariant read Get_PrtMip write Set_PrtMip;
    property PrtDevMode: OleVariant read Get_PrtDevMode write Set_PrtDevMode;
    property PrtDevNames: OleVariant read Get_PrtDevNames write Set_PrtDevNames;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property CurrentX: Single read Get_CurrentX write Set_CurrentX;
    property CurrentY: Single read Get_CurrentY write Set_CurrentY;
    property ScaleHeight: Single read Get_ScaleHeight write Set_ScaleHeight;
    property ScaleLeft: Single read Get_ScaleLeft write Set_ScaleLeft;
    property ScaleMode: Smallint read Get_ScaleMode write Set_ScaleMode;
    property ScaleTop: Single read Get_ScaleTop write Set_ScaleTop;
    property ScaleWidth: Single read Get_ScaleWidth write Set_ScaleWidth;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property FontItalic: Smallint read Get_FontItalic write Set_FontItalic;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontUnderline: Smallint read Get_FontUnderline write Set_FontUnderline;
    property DrawMode: Smallint read Get_DrawMode write Set_DrawMode;
    property DrawStyle: Smallint read Get_DrawStyle write Set_DrawStyle;
    property DrawWidth: Smallint read Get_DrawWidth write Set_DrawWidth;
    property FillColor: Integer read Get_FillColor write Set_FillColor;
    property FillStyle: Smallint read Get_FillStyle write Set_FillStyle;
    property Name: WideString read Get_Name write Set_Name;
    property PaletteSource: WideString read Get_PaletteSource write Set_PaletteSource;
    property Tag: WideString read Get_Tag write Set_Tag;
    property PaintPalette: OleVariant read Get_PaintPalette write Set_PaintPalette;
    property OnMenu: WideString read Get_OnMenu write Set_OnMenu;
    property OnOpen: WideString read Get_OnOpen write Set_OnOpen;
    property OnClose: WideString read Get_OnClose write Set_OnClose;
    property OnActivate: WideString read Get_OnActivate write Set_OnActivate;
    property OnDeactivate: WideString read Get_OnDeactivate write Set_OnDeactivate;
    property OnNoData: WideString read Get_OnNoData write Set_OnNoData;
    property OnPage: WideString read Get_OnPage write Set_OnPage;
    property OnError: WideString read Get_OnError write Set_OnError;
    property Dirty: WordBool read Get_Dirty write Set_Dirty;
    property CurrentRecord: Integer read Get_CurrentRecord write Set_CurrentRecord;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property PicturePalette: OleVariant read Get_PicturePalette write Set_PicturePalette;
    property HasModule: WordBool read Get_HasModule write Set_HasModule;
    property acHiddenCurrentPage: Integer read Get_acHiddenCurrentPage write Set_acHiddenCurrentPage;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ActiveControl: AccessControl read Get_ActiveControl;
    property DefaultControl[ControlType: Integer]: AccessControl read Get_DefaultControl;
    property Section[Index: OleVariant]: AccessSection read Get_Section;
    property GroupLevel[Index: Integer]: AccessGroupLevel read Get_GroupLevel;
    property Report: AccessReport read Get_Report;
    property Module: Module read Get_Module;
    property Properties: Properties read Get_Properties;
    property Controls: Controls read Get_Controls;
  end;

// *********************************************************************//
// DispIntf:  _ReportDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3E8B6B00-91FF-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _ReportDisp = dispinterface
    ['{3E8B6B00-91FF-101B-AF4E-00AA003F0F07}']
    property FormName: WideString dispid 39;
    property RecordSource: WideString dispid 153;
    property Filter: WideString dispid 271;
    property FilterOn: WordBool dispid 374;
    property OrderBy: WideString dispid 373;
    property OrderByOn: WordBool dispid 379;
    property Caption: WideString dispid 17;
    property RecordLocks: Byte dispid 26;
    property PageHeader: Byte dispid 43;
    property PageFooter: Byte dispid 40;
    property DateGrouping: Byte dispid 314;
    property GrpKeepTogether: Byte dispid 315;
    property MinButton: WordBool dispid 92;
    property MaxButton: WordBool dispid 91;
    property Width: Smallint dispid 147;
    property Picture: WideString dispid 7;
    property PictureType: Byte dispid 384;
    property PictureSizeMode: Byte dispid 357;
    property PictureAlignment: Byte dispid 354;
    property PictureTiling: WordBool dispid 358;
    property PicturePages: Byte dispid 355;
    property MenuBar: WideString dispid 261;
    property Toolbar: WideString dispid 396;
    property ShortcutMenuBar: WideString dispid 336;
    property GridX: Smallint dispid 41;
    property GridY: Smallint dispid 42;
    property LayoutForPrint: WordBool dispid 140;
    property FastLaserPrinting: WordBool dispid 141;
    property HelpFile: WideString dispid 217;
    property HelpContextId: Integer dispid 218;
    property Hwnd: Integer dispid 191;
    property Count: Smallint dispid 194;
    property Page: Integer dispid 195;
    property Pages: Smallint dispid 196;
    property LogicalPageWidth: Integer dispid 197;
    property LogicalPageHeight: Integer dispid 198;
    property ZoomControl: Integer dispid 216;
    property HasData: Integer dispid 201;
    property Left: Integer dispid 54;
    property Top: Integer dispid 138;
    property Height: Integer dispid 44;
    property PrintSection: WordBool dispid 224;
    property NextRecord: WordBool dispid 225;
    property MoveLayout: WordBool dispid 226;
    property FormatCount: Smallint dispid 227;
    property PrintCount: Smallint dispid 228;
    property Visible: WordBool dispid 145;
    property Painting: WordBool dispid 264;
    property PrtMip: OleVariant dispid 188;
    property PrtDevMode: OleVariant dispid 189;
    property PrtDevNames: OleVariant dispid 190;
    property ForeColor: Integer dispid 203;
    property CurrentX: Single dispid 204;
    property CurrentY: Single dispid 205;
    property ScaleHeight: Single dispid 206;
    property ScaleLeft: Single dispid 207;
    property ScaleMode: Smallint dispid 208;
    property ScaleTop: Single dispid 209;
    property ScaleWidth: Single dispid 210;
    property FontBold: Smallint dispid 32;
    property FontItalic: Smallint dispid 33;
    property FontName: WideString dispid 34;
    property FontSize: Smallint dispid 35;
    property FontUnderline: Smallint dispid 36;
    property DrawMode: Smallint dispid 211;
    property DrawStyle: Smallint dispid 212;
    property DrawWidth: Smallint dispid 213;
    property FillColor: Integer dispid 215;
    property FillStyle: Smallint dispid 214;
    property Name: WideString dispid 20;
    property PaletteSource: WideString dispid 95;
    property Tag: WideString dispid 297;
    property PaintPalette: OleVariant dispid 97;
    property OnMenu: WideString dispid 60;
    property OnOpen: WideString dispid 73;
    property OnClose: WideString dispid 74;
    property OnActivate: WideString dispid 109;
    property OnDeactivate: WideString dispid 110;
    property OnNoData: WideString dispid 118;
    property OnPage: WideString dispid 79;
    property OnError: WideString dispid 116;
    property Dirty: WordBool dispid 318;
    property CurrentRecord: Integer dispid 334;
    property PictureData: OleVariant dispid 187;
    property PicturePalette: OleVariant dispid 356;
    property HasModule: WordBool dispid 385;
    property acHiddenCurrentPage: Integer dispid 406;
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property ActiveControl: AccessControl readonly dispid 2006;
    property DefaultControl[ControlType: Integer]: AccessControl readonly dispid 2150;
    procedure Circle(flags: Smallint; X: Single; Y: Single; radius: Single; color: Integer; 
                     start: Single; end_: Single; aspect: Single); dispid 2118;
    procedure Line(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single; color: Integer); dispid 2152;
    procedure PSet(flags: Smallint; X: Single; Y: Single; color: Integer); dispid 2117;
    procedure Scale(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single); dispid 2116;
    function TextWidth(const Expr: WideString): Single; dispid 2114;
    function TextHeight(const Expr: WideString): Single; dispid 2115;
    procedure Print(const Expr: WideString); dispid 2153;
    property Section[Index: OleVariant]: AccessSection readonly dispid 2088;
    property GroupLevel[Index: Integer]: AccessGroupLevel readonly dispid 2098;
    property Report: AccessReport readonly dispid 2097;
    property Module: Module readonly dispid 2090;
    property Properties: Properties readonly dispid 2091;
    property Controls: Controls readonly dispid 0;
    function _NewEnum: IUnknown; dispid -4;
    function _Evaluate(const bstrExpr: WideString; var ppsa: {??PSafeArray}OleVariant): OleVariant; dispid -5;
  end;

// *********************************************************************//
// Interface: _ReportEvents
// Flags:     (16) Hidden
// GUID:      {BC9E4357-F037-11CD-8701-00AA003F0F07}
// *********************************************************************//
  _ReportEvents = interface(IUnknown)
    ['{BC9E4357-F037-11CD-8701-00AA003F0F07}']
    function Open(out Cancel: Smallint): HResult; stdcall;
    function Close: HResult; stdcall;
    function Activate: HResult; stdcall;
    function Deactivate: HResult; stdcall;
    function Error(var DataErr: Smallint; out Response: Smallint): HResult; stdcall;
    function NoData(out Cancel: Smallint): HResult; stdcall;
    function Page: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: Reports
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1523700-6128-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  Reports = interface(IDispatch)
    ['{D1523700-6128-101B-AF4E-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Item(Index: OleVariant): AccessReport; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Item[Index: OleVariant]: AccessReport read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ReportsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1523700-6128-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  ReportsDisp = dispinterface
    ['{D1523700-6128-101B-AF4E-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property Item[Index: OleVariant]: AccessReport readonly dispid 0; default;
    property Count: Integer readonly dispid 2001;
    function _NewEnum: IUnknown; dispid -4;
  end;

// *********************************************************************//
// Interface: Screen
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {DC6B66C0-6128-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  Screen = interface(IDispatch)
    ['{DC6B66C0-6128-101B-AF4E-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ActiveDatasheet: AccessForm; safecall;
    function Get_ActiveControl: AccessControl; safecall;
    function Get_PreviousControl: AccessControl; safecall;
    function Get_ActiveForm: AccessForm; safecall;
    function Get_ActiveReport: AccessReport; safecall;
    function Get_MousePointer: Smallint; safecall;
    procedure Set_MousePointer(pRet: Smallint); safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ActiveDatasheet: AccessForm read Get_ActiveDatasheet;
    property ActiveControl: AccessControl read Get_ActiveControl;
    property PreviousControl: AccessControl read Get_PreviousControl;
    property ActiveForm: AccessForm read Get_ActiveForm;
    property ActiveReport: AccessReport read Get_ActiveReport;
    property MousePointer: Smallint read Get_MousePointer write Set_MousePointer;
  end;

// *********************************************************************//
// DispIntf:  ScreenDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {DC6B66C0-6128-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  ScreenDisp = dispinterface
    ['{DC6B66C0-6128-101B-AF4E-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property ActiveDatasheet: AccessForm readonly dispid 2146;
    property ActiveControl: AccessControl readonly dispid 2006;
    property PreviousControl: AccessControl readonly dispid 2007;
    property ActiveForm: AccessForm readonly dispid 2008;
    property ActiveReport: AccessReport readonly dispid 2009;
    property MousePointer: Smallint dispid 2106;
  end;

// *********************************************************************//
// Interface: _Application
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {68CCE6C0-6129-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _Application = interface(IDispatch)
    ['{68CCE6C0-6129-101B-AF4E-00AA003F0F07}']
    function Get_Application: AccessApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_CodeContextObject: IDispatch; safecall;
    procedure NewCurrentDatabase(const filepath: WideString); safecall;
    procedure OpenCurrentDatabase(const filepath: WideString; Exclusive: WordBool); safecall;
    function Get_MenuBar: WideString; safecall;
    procedure Set_MenuBar(const pRet: WideString); safecall;
    function Get_CurrentObjectType: Integer; safecall;
    function Get_CurrentObjectName: WideString; safecall;
    function GetOption(const OptionName: WideString): OleVariant; safecall;
    procedure SetOption(const OptionName: WideString; Setting: OleVariant); safecall;
    procedure Echo(EchoOn: Smallint; const bstrStatusBarText: WideString); safecall;
    procedure CloseCurrentDatabase; safecall;
    procedure Quit(Option: AcQuitOption); safecall;
    function Get_Forms: Forms; safecall;
    function Get_Reports: Reports; safecall;
    function Get_Screen: Screen; safecall;
    function Get_DoCmd: IDoCmd; safecall;
    function Get_ShortcutMenuBar: WideString; safecall;
    procedure Set_ShortcutMenuBar(const pRet: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pfVisible: WordBool); safecall;
    function Get_UserControl: WordBool; safecall;
    procedure Set_UserControl(pfUserCtrl: WordBool); safecall;
    function SysCmd(Action: AcSysCmdAction; Argument2: OleVariant; Argument3: OleVariant): OleVariant; safecall;
    function CreateForm(Database: OleVariant; FormTemplate: OleVariant): AccessForm; safecall;
    function CreateReport(Database: OleVariant; ReportTemplate: OleVariant): AccessReport; safecall;
    function CreateControl(const FormName: WideString; ControlType: AcControlType; 
                           Section: AcSection; Parent: OleVariant; ColumnName: OleVariant; 
                           Left: OleVariant; Top: OleVariant; Width: OleVariant; Height: OleVariant): AccessControl; safecall;
    function CreateReportControl(const ReportName: WideString; ControlType: AcControlType; 
                                 Section: AcSection; Parent: OleVariant; ColumnName: OleVariant; 
                                 Left: OleVariant; Top: OleVariant; Width: OleVariant; 
                                 Height: OleVariant): AccessControl; safecall;
    function CreateControlEx(const FormName: WideString; ControlType: AcControlType; 
                             Section: AcSection; const Parent: WideString; 
                             const ControlSource: WideString; Left: Integer; Top: Integer; 
                             Width: Integer; Height: Integer): AccessControl; safecall;
    function CreateReportControlEx(const ReportName: WideString; ControlType: AcControlType; 
                                   Section: AcSection; const Parent: WideString; 
                                   const ControlName: WideString; Left: Integer; Top: Integer; 
                                   Width: Integer; Height: Integer): AccessControl; safecall;
    procedure DeleteControl(const FormName: WideString; const ControlName: WideString); safecall;
    procedure DeleteReportControl(const ReportName: WideString; const ControlName: WideString); safecall;
    function CreateGroupLevel(const ReportName: WideString; const Expression: WideString; 
                              Header: Smallint; Footer: Smallint): Integer; safecall;
    function DMin(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DMax(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DSum(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DAvg(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DLookup(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DLast(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DVar(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DVarP(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DStDev(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DStDevP(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DFirst(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function DCount(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; safecall;
    function Eval(const StringExpr: WideString): OleVariant; safecall;
    function CurrentUser: WideString; safecall;
    function DDEInitiate(const Application: WideString; const Topic: WideString): OleVariant; safecall;
    procedure DDEExecute(ChanNum: OleVariant; const Command: WideString); safecall;
    procedure DDEPoke(ChanNum: OleVariant; const Item: WideString; const Data: WideString); safecall;
    function DDERequest(ChanNum: OleVariant; const Item: WideString): WideString; safecall;
    procedure DDETerminate(ChanNum: OleVariant); safecall;
    procedure DDETerminateAll; safecall;
    function Get_DBEngine: DBEngine; safecall;
    function CurrentDb: Database; safecall;
    function CodeDb: Database; safecall;
    procedure BeginUndoable(Hwnd: Integer); safecall;
    procedure SetUndoRecording(yesno: Smallint); safecall;
    function BuildCriteria(const Field: WideString; FieldType: Smallint; 
                           const Expression: WideString): WideString; safecall;
    procedure InsertText(const Text: WideString; const ModuleName: WideString); safecall;
    procedure ReloadAddIns; safecall;
    function DefaultWorkspaceClone: Workspace; safecall;
    procedure RefreshTitleBar; safecall;
    procedure AddAutoCorrect(const ChangeFrom: WideString; const ChangeTo: WideString); safecall;
    procedure DelAutoCorrect(const ChangeFrom: WideString); safecall;
    function hWndAccessApp: SYSINT; safecall;
    function Run(const Procedure_: WideString; var Arg1: OleVariant; var Arg2: OleVariant; 
                 var Arg3: OleVariant; var Arg4: OleVariant; var Arg5: OleVariant; 
                 var Arg6: OleVariant; var Arg7: OleVariant; var Arg8: OleVariant; 
                 var Arg9: OleVariant; var Arg10: OleVariant; var Arg11: OleVariant; 
                 var Arg12: OleVariant; var Arg13: OleVariant; var Arg14: OleVariant; 
                 var Arg15: OleVariant; var Arg16: OleVariant; var Arg17: OleVariant; 
                 var Arg18: OleVariant; var Arg19: OleVariant; var Arg20: OleVariant; 
                 var Arg21: OleVariant; var Arg22: OleVariant; var Arg23: OleVariant; 
                 var Arg24: OleVariant; var Arg25: OleVariant; var Arg26: OleVariant; 
                 var Arg27: OleVariant; var Arg28: OleVariant; var Arg29: OleVariant; 
                 var Arg30: OleVariant): OleVariant; safecall;
    function Nz(Value: OleVariant; ValueIfNull: OleVariant): OleVariant; safecall;
    function LoadPicture(const FileName: WideString): IDispatch; safecall;
    procedure ReplaceModule(objtyp: Integer; const ModuleName: WideString; 
                            const FileName: WideString; token: Integer); safecall;
    function AccessError(ErrorNumber: OleVariant): OleVariant; safecall;
    function BuilderString: OleVariant; safecall;
    function StringFromGUID(Guid: OleVariant): OleVariant; safecall;
    function GUIDFromString(String_: OleVariant): OleVariant; safecall;
    function AppLoadString(id: Integer): OleVariant; safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_Assistant: Assistant; safecall;
    procedure FollowHyperlink(const Address: WideString; const SubAddress: WideString; 
                              NewWindow: WordBool; AddHistory: WordBool; ExtraInfo: OleVariant; 
                              Method: MsoExtraInfoMethod; const HeaderInfo: WideString); safecall;
    procedure SaveAsText(ObjectType: Integer; const ObjectName: WideString; 
                         const FileName: WideString); safecall;
    procedure LoadFromText(ObjectType: Integer; const ObjectName: WideString; 
                           const FileName: WideString); safecall;
    procedure AddToFavorites; safecall;
    procedure RefreshDatabaseWindow; safecall;
    function Get_References: AccessReferences; safecall;
    function Get_Modules: Modules; safecall;
    function Get_FileSearch: FileSearch; safecall;
    function Get_IsCompiled: WordBool; safecall;
    procedure RunCommand(Command: AcCommand); safecall;
    function HyperlinkPart(Hyperlink: OleVariant; Part: AcHyperlinkPart): WideString; safecall;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property CodeContextObject: IDispatch read Get_CodeContextObject;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property CurrentObjectType: Integer read Get_CurrentObjectType;
    property CurrentObjectName: WideString read Get_CurrentObjectName;
    property Forms: Forms read Get_Forms;
    property Reports: Reports read Get_Reports;
    property Screen: Screen read Get_Screen;
    property DoCmd: IDoCmd read Get_DoCmd;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property UserControl: WordBool read Get_UserControl write Set_UserControl;
    property DBEngine: DBEngine read Get_DBEngine;
    property CommandBars: CommandBars read Get_CommandBars;
    property Assistant: Assistant read Get_Assistant;
    property References: AccessReferences read Get_References;
    property Modules: Modules read Get_Modules;
    property FileSearch: FileSearch read Get_FileSearch;
    property IsCompiled: WordBool read Get_IsCompiled;
  end;

// *********************************************************************//
// DispIntf:  _ApplicationDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {68CCE6C0-6129-101B-AF4E-00AA003F0F07}
// *********************************************************************//
  _ApplicationDisp = dispinterface
    ['{68CCE6C0-6129-101B-AF4E-00AA003F0F07}']
    property Application: AccessApplication readonly dispid 2005;
    property Parent: IDispatch readonly dispid 2087;
    property CodeContextObject: IDispatch readonly dispid 2082;
    procedure NewCurrentDatabase(const filepath: WideString); dispid 2142;
    procedure OpenCurrentDatabase(const filepath: WideString; Exclusive: WordBool); dispid 2140;
    property MenuBar: WideString dispid 2010;
    property CurrentObjectType: Integer readonly dispid 2011;
    property CurrentObjectName: WideString readonly dispid 2012;
    function GetOption(const OptionName: WideString): OleVariant; dispid 2013;
    procedure SetOption(const OptionName: WideString; Setting: OleVariant); dispid 2014;
    procedure Echo(EchoOn: Smallint; const bstrStatusBarText: WideString); dispid 2015;
    procedure CloseCurrentDatabase; dispid 2141;
    procedure Quit(Option: AcQuitOption); dispid 2016;
    property Forms: Forms readonly dispid 2002;
    property Reports: Reports readonly dispid 2003;
    property Screen: Screen readonly dispid 2004;
    property DoCmd: IDoCmd readonly dispid 2025;
    property ShortcutMenuBar: WideString dispid 2107;
    property Visible: WordBool dispid 2148;
    property UserControl: WordBool dispid 2149;
    function SysCmd(Action: AcSysCmdAction; Argument2: OleVariant; Argument3: OleVariant): OleVariant; dispid 2028;
    function CreateForm(Database: OleVariant; FormTemplate: OleVariant): AccessForm; dispid 2029;
    function CreateReport(Database: OleVariant; ReportTemplate: OleVariant): AccessReport; dispid 2030;
    function CreateControl(const FormName: WideString; ControlType: AcControlType; 
                           Section: AcSection; Parent: OleVariant; ColumnName: OleVariant; 
                           Left: OleVariant; Top: OleVariant; Width: OleVariant; Height: OleVariant): AccessControl; dispid 2031;
    function CreateReportControl(const ReportName: WideString; ControlType: AcControlType; 
                                 Section: AcSection; Parent: OleVariant; ColumnName: OleVariant; 
                                 Left: OleVariant; Top: OleVariant; Width: OleVariant; 
                                 Height: OleVariant): AccessControl; dispid 2032;
    function CreateControlEx(const FormName: WideString; ControlType: AcControlType; 
                             Section: AcSection; const Parent: WideString; 
                             const ControlSource: WideString; Left: Integer; Top: Integer; 
                             Width: Integer; Height: Integer): AccessControl; dispid 2164;
    function CreateReportControlEx(const ReportName: WideString; ControlType: AcControlType; 
                                   Section: AcSection; const Parent: WideString; 
                                   const ControlName: WideString; Left: Integer; Top: Integer; 
                                   Width: Integer; Height: Integer): AccessControl; dispid 2165;
    procedure DeleteControl(const FormName: WideString; const ControlName: WideString); dispid 2033;
    procedure DeleteReportControl(const ReportName: WideString; const ControlName: WideString); dispid 2034;
    function CreateGroupLevel(const ReportName: WideString; const Expression: WideString; 
                              Header: Smallint; Footer: Smallint): Integer; dispid 2051;
    function DMin(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2035;
    function DMax(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2036;
    function DSum(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2037;
    function DAvg(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2038;
    function DLookup(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2039;
    function DLast(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2040;
    function DVar(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2041;
    function DVarP(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2042;
    function DStDev(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2043;
    function DStDevP(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2044;
    function DFirst(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2045;
    function DCount(const Expr: WideString; const Domain: WideString; Criteria: OleVariant): OleVariant; dispid 2046;
    function Eval(const StringExpr: WideString): OleVariant; dispid 2047;
    function CurrentUser: WideString; dispid 2048;
    function DDEInitiate(const Application: WideString; const Topic: WideString): OleVariant; dispid 2052;
    procedure DDEExecute(ChanNum: OleVariant; const Command: WideString); dispid 2053;
    procedure DDEPoke(ChanNum: OleVariant; const Item: WideString; const Data: WideString); dispid 2054;
    function DDERequest(ChanNum: OleVariant; const Item: WideString): WideString; dispid 2055;
    procedure DDETerminate(ChanNum: OleVariant); dispid 2056;
    procedure DDETerminateAll; dispid 2057;
    property DBEngine: DBEngine readonly dispid 2110;
    function CurrentDb: Database; dispid 2049;
    function CodeDb: Database; dispid 2050;
    procedure BeginUndoable(Hwnd: Integer); dispid 2099;
    procedure SetUndoRecording(yesno: Smallint); dispid 2100;
    function BuildCriteria(const Field: WideString; FieldType: Smallint; 
                           const Expression: WideString): WideString; dispid 2138;
    procedure InsertText(const Text: WideString; const ModuleName: WideString); dispid 2093;
    procedure ReloadAddIns; dispid 2154;
    function DefaultWorkspaceClone: Workspace; dispid 2157;
    procedure RefreshTitleBar; dispid 2158;
    procedure AddAutoCorrect(const ChangeFrom: WideString; const ChangeTo: WideString); dispid 2159;
    procedure DelAutoCorrect(const ChangeFrom: WideString); dispid 2160;
    function hWndAccessApp: SYSINT; dispid 2163;
    function Run(const Procedure_: WideString; var Arg1: OleVariant; var Arg2: OleVariant; 
                 var Arg3: OleVariant; var Arg4: OleVariant; var Arg5: OleVariant; 
                 var Arg6: OleVariant; var Arg7: OleVariant; var Arg8: OleVariant; 
                 var Arg9: OleVariant; var Arg10: OleVariant; var Arg11: OleVariant; 
                 var Arg12: OleVariant; var Arg13: OleVariant; var Arg14: OleVariant; 
                 var Arg15: OleVariant; var Arg16: OleVariant; var Arg17: OleVariant; 
                 var Arg18: OleVariant; var Arg19: OleVariant; var Arg20: OleVariant; 
                 var Arg21: OleVariant; var Arg22: OleVariant; var Arg23: OleVariant; 
                 var Arg24: OleVariant; var Arg25: OleVariant; var Arg26: OleVariant; 
                 var Arg27: OleVariant; var Arg28: OleVariant; var Arg29: OleVariant; 
                 var Arg30: OleVariant): OleVariant; dispid 2134;
    function Nz(Value: OleVariant; ValueIfNull: OleVariant): OleVariant; dispid 2135;
    function LoadPicture(const FileName: WideString): IDispatch; dispid 2166;
    procedure ReplaceModule(objtyp: Integer; const ModuleName: WideString; 
                            const FileName: WideString; token: Integer); dispid 2168;
    function AccessError(ErrorNumber: OleVariant): OleVariant; dispid 2169;
    function BuilderString: OleVariant; dispid 2170;
    function StringFromGUID(Guid: OleVariant): OleVariant; dispid 2171;
    function GUIDFromString(String_: OleVariant): OleVariant; dispid 2172;
    function AppLoadString(id: Integer): OleVariant; dispid 2173;
    property CommandBars: CommandBars readonly dispid 2174;
    property Assistant: Assistant readonly dispid 2175;
    procedure FollowHyperlink(const Address: WideString; const SubAddress: WideString; 
                              NewWindow: WordBool; AddHistory: WordBool; ExtraInfo: OleVariant; 
                              Method: MsoExtraInfoMethod; const HeaderInfo: WideString); dispid 2176;
    procedure SaveAsText(ObjectType: Integer; const ObjectName: WideString; 
                         const FileName: WideString); dispid 2178;
    procedure LoadFromText(ObjectType: Integer; const ObjectName: WideString; 
                           const FileName: WideString); dispid 2179;
    procedure AddToFavorites; dispid 2184;
    procedure RefreshDatabaseWindow; dispid 2186;
    property References: AccessReferences readonly dispid 2187;
    property Modules: Modules readonly dispid 2188;
    property FileSearch: FileSearch readonly dispid 2189;
    property IsCompiled: WordBool readonly dispid 2193;
    procedure RunCommand(Command: AcCommand); dispid 2194;
    function HyperlinkPart(Hyperlink: OleVariant; Part: AcHyperlinkPart): WideString; dispid 2195;
  end;

// *********************************************************************//
// Interface: Reference
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {EB106212-9C89-11CF-A2B3-00A0C90542FF}
// *********************************************************************//
  Reference = interface(IDispatch)
    ['{EB106212-9C89-11CF-A2B3-00A0C90542FF}']
    function Get_Collection: AccessReferences; safecall;
    function Get_Name: WideString; safecall;
    function Get_Guid: WideString; safecall;
    function Get_Major: Integer; safecall;
    function Get_Minor: Integer; safecall;
    function Get_FullPath: WideString; safecall;
    function Get_BuiltIn: WordBool; safecall;
    function Get_IsBroken: WordBool; safecall;
    function Get_Kind: RefKind; safecall;
    property Collection: AccessReferences read Get_Collection;
    property Name: WideString read Get_Name;
    property Guid: WideString read Get_Guid;
    property Major: Integer read Get_Major;
    property Minor: Integer read Get_Minor;
    property FullPath: WideString read Get_FullPath;
    property BuiltIn: WordBool read Get_BuiltIn;
    property IsBroken: WordBool read Get_IsBroken;
    property Kind: RefKind read Get_Kind;
  end;

// *********************************************************************//
// DispIntf:  ReferenceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {EB106212-9C89-11CF-A2B3-00A0C90542FF}
// *********************************************************************//
  ReferenceDisp = dispinterface
    ['{EB106212-9C89-11CF-A2B3-00A0C90542FF}']
    property Collection: AccessReferences readonly dispid 1610743808;
    property Name: WideString readonly dispid 1610743809;
    property Guid: WideString readonly dispid 1610743810;
    property Major: Integer readonly dispid 1610743811;
    property Minor: Integer readonly dispid 1610743812;
    property FullPath: WideString readonly dispid 1610743813;
    property BuiltIn: WordBool readonly dispid 1610743814;
    property IsBroken: WordBool readonly dispid 1610743815;
    property Kind: RefKind readonly dispid 1610743816;
  end;

// *********************************************************************//
// Interface: _References
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {EB106213-9C89-11CF-A2B3-00A0C90542FF}
// *********************************************************************//
  _References = interface(IDispatch)
    ['{EB106213-9C89-11CF-A2B3-00A0C90542FF}']
    function Get_Parent: IDispatch; safecall;
    function Item(var_: OleVariant): Reference; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    function AddFromGuid(const Guid: WideString; Major: Integer; Minor: Integer): Reference; safecall;
    function AddFromFile(const FileName: WideString): Reference; safecall;
    procedure Remove(const Reference: Reference); safecall;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  _ReferencesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {EB106213-9C89-11CF-A2B3-00A0C90542FF}
// *********************************************************************//
  _ReferencesDisp = dispinterface
    ['{EB106213-9C89-11CF-A2B3-00A0C90542FF}']
    property Parent: IDispatch readonly dispid 1610743808;
    function Item(var_: OleVariant): Reference; dispid 0;
    property Count: Integer readonly dispid 1610743810;
    function _NewEnum: IUnknown; dispid -4;
    function AddFromGuid(const Guid: WideString; Major: Integer; Minor: Integer): Reference; dispid 1610743812;
    function AddFromFile(const FileName: WideString): Reference; dispid 1610743813;
    procedure Remove(const Reference: Reference); dispid 1610743814;
  end;

// *********************************************************************//
// DispIntf:  _References_Events
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {F163F201-ADA2-11CF-89A9-00A0C9054129}
// *********************************************************************//
  _References_Events = dispinterface
    ['{F163F201-ADA2-11CF-89A9-00A0C9054129}']
    procedure ItemAdded(const Reference: Reference); dispid 0;
    procedure ItemRemoved(const Reference: Reference); dispid 1;
  end;

// *********************************************************************//
// Interface: _Dummy
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8B06E320-B23C-11CF-89A8-00A0C9054129}
// *********************************************************************//
  _Dummy = interface(IDispatch)
    ['{8B06E320-B23C-11CF-89A8-00A0C9054129}']
  end;

// *********************************************************************//
// DispIntf:  _DummyDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8B06E320-B23C-11CF-89A8-00A0C9054129}
// *********************************************************************//
  _DummyDisp = dispinterface
    ['{8B06E320-B23C-11CF-89A8-00A0C9054129}']
  end;

// *********************************************************************//
// Interface: _DummyEvents
// Flags:     (16) Hidden
// GUID:      {58BF3100-B580-11CF-89A8-00A0C9054129}
// *********************************************************************//
  _DummyEvents = interface(IUnknown)
    ['{58BF3100-B580-11CF-89A8-00A0C9054129}']
    function Initialize: HResult; stdcall;
    function Terminate: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ___IVbaModule
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E16E-0000-0000-C000-000000000046}
// *********************************************************************//
  ___IVbaModule = interface(IDispatch)
    ['{0002E16E-0000-0000-C000-000000000046}']
    function Get_Parent: IUnknown; safecall;
    function Get_VBA: IUnknown; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstrName: WideString); safecall;
    procedure AddFromString(const String_: WideString); safecall;
    procedure AddFromFile(const FileName: WideString); safecall;
    function Get_Lines(Line: Integer; cLine: Integer): WideString; safecall;
    function Get_CountOfLines: Integer; safecall;
    procedure InsertLines(Line: Integer; const String_: WideString); safecall;
    procedure DeleteLines(StartLine: Integer; Count: Integer); safecall;
    procedure ReplaceLine(Line: Integer; const String_: WideString); safecall;
    function Get_ProcStartLine(const ProcName: WideString; ProcKind: ___ProcKind): Integer; safecall;
    function Get_ProcCountLines(const ProcName: WideString; ProcKind: ___ProcKind): Integer; safecall;
    function Get_ProcBodyLine(const ProcName: WideString; ProcKind: ___ProcKind): Integer; safecall;
    function Get_ProcOfLine(Line: Integer; out pprockind: ___ProcKind): WideString; safecall;
    function Get_DeclCountOfLines: Integer; safecall;
    function CreateEventProc(const EventName: WideString; const ObjectName: WideString): Integer; safecall;
    function Find(const Target: WideString; var StartLine: Integer; var StartColumn: Integer; 
                  var EndLine: Integer; var EndColumn: Integer; WholeWord: WordBool; 
                  MatchCase: WordBool; PatternSearch: WordBool): WordBool; safecall;
    function Get_GetEditor: ___Editor; safecall;
    property Parent: IUnknown read Get_Parent;
    property VBA: IUnknown read Get_VBA;
    property Name: WideString read Get_Name write Set_Name;
    property Lines[Line: Integer; cLine: Integer]: WideString read Get_Lines;
    property CountOfLines: Integer read Get_CountOfLines;
    property ProcStartLine[const ProcName: WideString; ProcKind: ___ProcKind]: Integer read Get_ProcStartLine;
    property ProcCountLines[const ProcName: WideString; ProcKind: ___ProcKind]: Integer read Get_ProcCountLines;
    property ProcBodyLine[const ProcName: WideString; ProcKind: ___ProcKind]: Integer read Get_ProcBodyLine;
    property ProcOfLine[Line: Integer; out pprockind: ___ProcKind]: WideString read Get_ProcOfLine;
    property DeclCountOfLines: Integer read Get_DeclCountOfLines;
    property GetEditor: ___Editor read Get_GetEditor;
  end;

// *********************************************************************//
// DispIntf:  ___IVbaModuleDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E16E-0000-0000-C000-000000000046}
// *********************************************************************//
  ___IVbaModuleDisp = dispinterface
    ['{0002E16E-0000-0000-C000-000000000046}']
    property Parent: IUnknown readonly dispid 1610743808;
    property VBA: IUnknown readonly dispid 1610743809;
    property Name: WideString dispid 0;
    procedure AddFromString(const String_: WideString); dispid 1610743812;
    procedure AddFromFile(const FileName: WideString); dispid 1610743813;
    property Lines[Line: Integer; cLine: Integer]: WideString readonly dispid 1610743814;
    property CountOfLines: Integer readonly dispid 1610743815;
    procedure InsertLines(Line: Integer; const String_: WideString); dispid 1610743816;
    procedure DeleteLines(StartLine: Integer; Count: Integer); dispid 1610743817;
    procedure ReplaceLine(Line: Integer; const String_: WideString); dispid 1610743818;
    property ProcStartLine[const ProcName: WideString; ProcKind: ___ProcKind]: Integer readonly dispid 1610743819;
    property ProcCountLines[const ProcName: WideString; ProcKind: ___ProcKind]: Integer readonly dispid 1610743820;
    property ProcBodyLine[const ProcName: WideString; ProcKind: ___ProcKind]: Integer readonly dispid 1610743821;
    property ProcOfLine[Line: Integer; out pprockind: ___ProcKind]: WideString readonly dispid 1610743822;
    property DeclCountOfLines: Integer readonly dispid 1610743823;
    function CreateEventProc(const EventName: WideString; const ObjectName: WideString): Integer; dispid 1610743824;
    function Find(const Target: WideString; var StartLine: Integer; var StartColumn: Integer; 
                  var EndLine: Integer; var EndColumn: Integer; WholeWord: WordBool; 
                  MatchCase: WordBool; PatternSearch: WordBool): WordBool; dispid 1610743825;
    property GetEditor: ___Editor readonly dispid 1610743826;
  end;

// *********************************************************************//
// Interface: ___IVbaEditors
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E172-0000-0000-C000-000000000046}
// *********************************************************************//
  ___IVbaEditors = interface(IDispatch)
    ['{0002E172-0000-0000-C000-000000000046}']
    function Get_Parent: IUnknown; safecall;
    function Get_VBA: IUnknown; safecall;
    function Item(var_: OleVariant): ___Editor; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    function Get_Current: ___Editor; safecall;
    procedure Set_Current(const ___Editor: ___Editor); safecall;
    property Parent: IUnknown read Get_Parent;
    property VBA: IUnknown read Get_VBA;
    property Count: Integer read Get_Count;
    property Current: ___Editor read Get_Current write Set_Current;
  end;

// *********************************************************************//
// DispIntf:  ___IVbaEditorsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E172-0000-0000-C000-000000000046}
// *********************************************************************//
  ___IVbaEditorsDisp = dispinterface
    ['{0002E172-0000-0000-C000-000000000046}']
    property Parent: IUnknown readonly dispid 1610743808;
    property VBA: IUnknown readonly dispid 1610743809;
    function Item(var_: OleVariant): ___Editor; dispid 0;
    property Count: Integer readonly dispid 1610743811;
    function _NewEnum: IUnknown; dispid -4;
    property Current: ___Editor dispid 1610743813;
  end;

// *********************************************************************//
// Interface: ___IVbaEditor
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E176-0000-0000-C000-000000000046}
// *********************************************************************//
  ___IVbaEditor = interface(IDispatch)
    ['{0002E176-0000-0000-C000-000000000046}']
    function Get_Parent: IUnknown; safecall;
    function Get_VBA: IUnknown; safecall;
    function Get_Window: IDispatch; safecall;
    procedure GetSelection(out StartLine: Integer; out StartColumn: Integer; out EndLine: Integer; 
                           out EndColumn: Integer); safecall;
    procedure SetSelection(StartLine: Integer; StartColumn: Integer; EndLine: Integer; 
                           EndColumn: Integer); safecall;
    function Get_TopLine: Integer; safecall;
    procedure Set_TopLine(TopLine: Integer); safecall;
    function Get_CountOfVisibleLines: Integer; safecall;
    function Get____CodeModule: ___CodeModule; safecall;
    procedure Show; safecall;
    function Get_CodePaneView: ___vbext_CodePaneview; safecall;
    property Parent: IUnknown read Get_Parent;
    property VBA: IUnknown read Get_VBA;
    property Window: IDispatch read Get_Window;
    property TopLine: Integer read Get_TopLine write Set_TopLine;
    property CountOfVisibleLines: Integer read Get_CountOfVisibleLines;
    property ___CodeModule: ___CodeModule read Get____CodeModule;
    property CodePaneView: ___vbext_CodePaneview read Get_CodePaneView;
  end;

// *********************************************************************//
// DispIntf:  ___IVbaEditorDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E176-0000-0000-C000-000000000046}
// *********************************************************************//
  ___IVbaEditorDisp = dispinterface
    ['{0002E176-0000-0000-C000-000000000046}']
    property Parent: IUnknown readonly dispid 1610743808;
    property VBA: IUnknown readonly dispid 1610743809;
    property Window: IDispatch readonly dispid 1610743810;
    procedure GetSelection(out StartLine: Integer; out StartColumn: Integer; out EndLine: Integer; 
                           out EndColumn: Integer); dispid 1610743811;
    procedure SetSelection(StartLine: Integer; StartColumn: Integer; EndLine: Integer; 
                           EndColumn: Integer); dispid 1610743812;
    property TopLine: Integer dispid 1610743813;
    property CountOfVisibleLines: Integer readonly dispid 1610743815;
    property ___CodeModule: ___CodeModule readonly dispid 1610743816;
    procedure Show; dispid 1610743817;
    property CodePaneView: ___vbext_CodePaneview readonly dispid 1610743818;
  end;

// *********************************************************************//
// Interface: IVbaReferences
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E17A-0000-0000-C000-000000000046}
// *********************************************************************//
  IVbaReferences = interface(IDispatch)
    ['{0002E17A-0000-0000-C000-000000000046}']
    function Get_Parent: IUnknown; safecall;
    function Get_VBA: IUnknown; safecall;
    function Item(var_: OleVariant): ___Reference; safecall;
    function Get_Count: Integer; safecall;
    function _NewEnum: IUnknown; safecall;
    function CreateFromGuid(const bstrGuid: WideString; Major: Integer; Minor: Integer): ___Reference; safecall;
    function CreateFromFile(const bstrFileName: WideString): ___Reference; safecall;
    procedure Remove(const ___Reference: ___Reference); safecall;
    property Parent: IUnknown read Get_Parent;
    property VBA: IUnknown read Get_VBA;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IVbaReferencesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E17A-0000-0000-C000-000000000046}
// *********************************************************************//
  IVbaReferencesDisp = dispinterface
    ['{0002E17A-0000-0000-C000-000000000046}']
    property Parent: IUnknown readonly dispid 1610743808;
    property VBA: IUnknown readonly dispid 1610743809;
    function Item(var_: OleVariant): ___Reference; dispid 0;
    property Count: Integer readonly dispid 1610743811;
    function _NewEnum: IUnknown; dispid -4;
    function CreateFromGuid(const bstrGuid: WideString; Major: Integer; Minor: Integer): ___Reference; dispid 1610743813;
    function CreateFromFile(const bstrFileName: WideString): ___Reference; dispid 1610743814;
    procedure Remove(const ___Reference: ___Reference); dispid 1610743815;
  end;

// *********************************************************************//
// Interface: ___Reference
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E17E-0000-0000-C000-000000000046}
// *********************************************************************//
  ___Reference = interface(IDispatch)
    ['{0002E17E-0000-0000-C000-000000000046}']
    function Get_Collection: IVbaReferences; safecall;
    function Get_VBA: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Guid: WideString; safecall;
    function Get_Major: Integer; safecall;
    function Get_Minor: Integer; safecall;
    function Get_Location: WideString; safecall;
    function Get_IsDefault: WordBool; safecall;
    function Get_IsBroken: WordBool; safecall;
    function Get_Kind: ___RefKind; safecall;
    function Get_Description: WideString; safecall;
    property Collection: IVbaReferences read Get_Collection;
    property VBA: IDispatch read Get_VBA;
    property Name: WideString read Get_Name;
    property Guid: WideString read Get_Guid;
    property Major: Integer read Get_Major;
    property Minor: Integer read Get_Minor;
    property Location: WideString read Get_Location;
    property IsDefault: WordBool read Get_IsDefault;
    property IsBroken: WordBool read Get_IsBroken;
    property Kind: ___RefKind read Get_Kind;
    property Description: WideString read Get_Description;
  end;

// *********************************************************************//
// DispIntf:  ___ReferenceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0002E17E-0000-0000-C000-000000000046}
// *********************************************************************//
  ___ReferenceDisp = dispinterface
    ['{0002E17E-0000-0000-C000-000000000046}']
    property Collection: IVbaReferences readonly dispid 1610743808;
    property VBA: IDispatch readonly dispid 1610743809;
    property Name: WideString readonly dispid 1610743810;
    property Guid: WideString readonly dispid 1610743811;
    property Major: Integer readonly dispid 1610743812;
    property Minor: Integer readonly dispid 1610743813;
    property Location: WideString readonly dispid 1610743814;
    property IsDefault: WordBool readonly dispid 1610743815;
    property IsBroken: WordBool readonly dispid 1610743816;
    property Kind: ___RefKind readonly dispid 1610743817;
    property Description: WideString readonly dispid 1610743818;
  end;

// *********************************************************************//
// DispIntf:  ___IVbaExtReferencesEvents
// Flags:     (4224) NonExtensible Dispatchable
// GUID:      {CDDE3804-2064-11CF-867F-00AA005FF34A}
// *********************************************************************//
  ___IVbaExtReferencesEvents = dispinterface
    ['{CDDE3804-2064-11CF-867F-00AA005FF34A}']
    procedure ItemAdded(const ___Reference: ___Reference); dispid 0;
    procedure ItemRemoved(const ___Reference: ___Reference); dispid 1;
  end;

// *********************************************************************//
// The Class CoDoCmd provides a Create and CreateRemote method to          
// create instances of the default interface IDoCmd exposed by              
// the CoClass DoCmd. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDoCmd = class
    class function Create: IDoCmd;
    class function CreateRemote(const MachineName: string): IDoCmd;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDoCmd
// Help String      : 
// Default Interface: IDoCmd
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDoCmdProperties= class;
{$ENDIF}
  TDoCmd = class(TOleServer)
  private
    FIntf:        IDoCmd;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDoCmdProperties;
    function      GetServerProperties: TDoCmdProperties;
{$ENDIF}
    function      GetDefaultInterface: IDoCmd;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDoCmd);
    procedure Disconnect; override;
    procedure AddMenu(MenuName: OleVariant; MenuMacroName: OleVariant; StatusBarText: OleVariant);
    procedure ApplyFilter; overload;
    procedure ApplyFilter(FilterName: OleVariant); overload;
    procedure ApplyFilter(FilterName: OleVariant; WhereCondition: OleVariant); overload;
    procedure Beep;
    procedure CancelEvent;
    procedure Close(ObjectType: AcObjectType; ObjectName: OleVariant; Save: AcCloseSave);
    procedure CopyObject(DestinationDatabase: OleVariant; NewName: OleVariant; 
                         SourceObjectType: AcObjectType; SourceObjectName: OleVariant);
    procedure DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant); overload;
    procedure DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant; 
                         Subcommand: OleVariant); overload;
    procedure DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant; 
                         Subcommand: OleVariant; Version: OleVariant); overload;
    procedure Echo(EchoOn: OleVariant); overload;
    procedure Echo(EchoOn: OleVariant; StatusBarText: OleVariant); overload;
    procedure FindNext;
    procedure FindRecord(FindWhat: OleVariant; Match: AcFindMatch; MatchCase: OleVariant; 
                         Search: AcSearchDirection; SearchAsFormatted: OleVariant; 
                         OnlyCurrentField: AcFindField; FindFirst: OleVariant);
    procedure GoToControl(ControlName: OleVariant);
    procedure GoToPage(PageNumber: OleVariant); overload;
    procedure GoToPage(PageNumber: OleVariant; Right: OleVariant); overload;
    procedure GoToPage(PageNumber: OleVariant; Right: OleVariant; Down: OleVariant); overload;
    procedure GoToRecord(ObjectType: AcDataObjectType; ObjectName: OleVariant; Record_: AcRecord; 
                         Offset: OleVariant);
    procedure Hourglass(HourglassOn: OleVariant);
    procedure Maximize;
    procedure Minimize;
    procedure MoveSize; overload;
    procedure MoveSize(Right: OleVariant); overload;
    procedure MoveSize(Right: OleVariant; Down: OleVariant); overload;
    procedure MoveSize(Right: OleVariant; Down: OleVariant; Width: OleVariant); overload;
    procedure MoveSize(Right: OleVariant; Down: OleVariant; Width: OleVariant; Height: OleVariant); overload;
    procedure OpenForm(FormName: OleVariant; View: AcFormView; FilterName: OleVariant; 
                       WhereCondition: OleVariant; DataMode: AcFormOpenDataMode; 
                       WindowMode: AcWindowMode; OpenArgs: OleVariant);
    procedure OpenQuery(QueryName: OleVariant; View: AcView; DataMode: AcOpenDataMode);
    procedure OpenTable(TableName: OleVariant; View: AcView; DataMode: AcOpenDataMode);
    procedure PrintOut(PrintRange: AcPrintRange; PageFrom: OleVariant; PageTo: OleVariant; 
                       PrintQuality: AcPrintQuality; Copies: OleVariant; CollateCopies: OleVariant);
    procedure Quit(Options: AcQuitOption);
    procedure Requery; overload;
    procedure Requery(ControlName: OleVariant); overload;
    procedure RepaintObject(ObjectType: AcObjectType); overload;
    procedure RepaintObject(ObjectType: AcObjectType; ObjectName: OleVariant); overload;
    procedure Rename(NewName: OleVariant; ObjectType: AcObjectType); overload;
    procedure Rename(NewName: OleVariant; ObjectType: AcObjectType; OldName: OleVariant); overload;
    procedure Restore;
    procedure RunMacro(MacroName: OleVariant); overload;
    procedure RunMacro(MacroName: OleVariant; RepeatCount: OleVariant); overload;
    procedure RunMacro(MacroName: OleVariant; RepeatCount: OleVariant; RepeatExpression: OleVariant); overload;
    procedure RunSQL(SQLStatement: OleVariant); overload;
    procedure RunSQL(SQLStatement: OleVariant; UseTransaction: OleVariant); overload;
    procedure SelectObject(ObjectType: AcObjectType); overload;
    procedure SelectObject(ObjectType: AcObjectType; ObjectName: OleVariant); overload;
    procedure SelectObject(ObjectType: AcObjectType; ObjectName: OleVariant; 
                           InDatabaseWindow: OleVariant); overload;
    procedure SetWarnings(WarningsOn: OleVariant);
    procedure ShowAllRecords;
    procedure OpenReport(ReportName: OleVariant; View: AcView); overload;
    procedure OpenReport(ReportName: OleVariant; View: AcView; FilterName: OleVariant); overload;
    procedure OpenReport(ReportName: OleVariant; View: AcView; FilterName: OleVariant; 
                         WhereCondition: OleVariant); overload;
    procedure TransferDatabase(TransferType: AcDataTransferType; DatabaseType: OleVariant; 
                               DatabaseName: OleVariant; ObjectType: AcObjectType; 
                               Source: OleVariant; Destination: OleVariant; 
                               StructureOnly: OleVariant; StoreLogin: OleVariant);
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType); overload;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant); overload;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                  FileName: OleVariant); overload;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                  FileName: OleVariant; HasFieldNames: OleVariant); overload;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                  FileName: OleVariant; HasFieldNames: OleVariant; Range: OleVariant); overload;
    procedure TransferSpreadsheet(TransferType: AcDataTransferType; 
                                  SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                  FileName: OleVariant; HasFieldNames: OleVariant; 
                                  Range: OleVariant; UseOA: OleVariant); overload;
    procedure TransferText(TransferType: AcTextTransferType); overload;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant); overload;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                           TableName: OleVariant); overload;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                           TableName: OleVariant; FileName: OleVariant); overload;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                           TableName: OleVariant; FileName: OleVariant; HasFieldNames: OleVariant); overload;
    procedure TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                           TableName: OleVariant; FileName: OleVariant; HasFieldNames: OleVariant; 
                           HTMLTableName: OleVariant); overload;
    procedure OutputTo(ObjectType: AcOutputObjectType); overload;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant); overload;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                       OutputFormat: OleVariant); overload;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                       OutputFormat: OleVariant; OutputFile: OleVariant); overload;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                       OutputFormat: OleVariant; OutputFile: OleVariant; AutoStart: OleVariant); overload;
    procedure OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                       OutputFormat: OleVariant; OutputFile: OleVariant; AutoStart: OleVariant; 
                       TemplateFile: OleVariant); overload;
    procedure DeleteObject(ObjectType: AcObjectType); overload;
    procedure DeleteObject(ObjectType: AcObjectType; ObjectName: OleVariant); overload;
    procedure OpenModule; overload;
    procedure OpenModule(ModuleName: OleVariant); overload;
    procedure OpenModule(ModuleName: OleVariant; ProcedureName: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; Bcc: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                         Bcc: OleVariant; Subject: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                         Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                         Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant; 
                         EditMessage: OleVariant); overload;
    procedure SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                         OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                         Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant; 
                         EditMessage: OleVariant; TemplateFile: OleVariant); overload;
    procedure ShowToolbar(ToolbarName: OleVariant); overload;
    procedure ShowToolbar(ToolbarName: OleVariant; Show: OleVariant); overload;
    procedure Save(ObjectType: AcObjectType); overload;
    procedure Save(ObjectType: AcObjectType; ObjectName: OleVariant); overload;
    procedure SetMenuItem(MenuIndex: OleVariant); overload;
    procedure SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant); overload;
    procedure SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant; 
                          SubcommandIndex: OleVariant); overload;
    procedure SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant; 
                          SubcommandIndex: OleVariant; Flag: OleVariant); overload;
    procedure RunCommand(Command: AcCommand);
    property DefaultInterface: IDoCmd read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDoCmdProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDoCmd
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDoCmdProperties = class(TPersistent)
  private
    FServer:    TDoCmd;
    function    GetDefaultInterface: IDoCmd;
    constructor Create(AServer: TDoCmd);
  protected
  public
    property DefaultInterface: IDoCmd read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAccessHyperlink provides a Create and CreateRemote method to          
// create instances of the default interface _Hyperlink exposed by              
// the CoClass AccessHyperlink. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccessHyperlink = class
    class function Create: _Hyperlink;
    class function CreateRemote(const MachineName: string): _Hyperlink;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAccessHyperlink
// Help String      : 
// Default Interface: _Hyperlink
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAccessHyperlinkProperties= class;
{$ENDIF}
  TAccessHyperlink = class(TOleServer)
  private
    FIntf:        _Hyperlink;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAccessHyperlinkProperties;
    function      GetServerProperties: TAccessHyperlinkProperties;
{$ENDIF}
    function      GetDefaultInterface: _Hyperlink;
  protected
    procedure InitServerData; override;
    function Get_SubAddress: WideString;
    procedure Set_SubAddress(pbstrResult: OleVariant);
    function Get_Address: WideString;
    procedure Set_Address(pbstrResult: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Hyperlink);
    procedure Disconnect; override;
    procedure AddToFavorites;
    procedure Follow(NewWindow: WordBool; AddHistory: WordBool; ExtraInfo: OleVariant; 
                     Method: MsoExtraInfoMethod; const HeaderInfo: WideString);
    property DefaultInterface: _Hyperlink read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAccessHyperlinkProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAccessHyperlink
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAccessHyperlinkProperties = class(TPersistent)
  private
    FServer:    TAccessHyperlink;
    function    GetDefaultInterface: _Hyperlink;
    constructor Create(AServer: TAccessHyperlink);
  protected
    function Get_SubAddress: WideString;
    procedure Set_SubAddress(pbstrResult: OleVariant);
    function Get_Address: WideString;
    procedure Set_Address(pbstrResult: OleVariant);
  public
    property DefaultInterface: _Hyperlink read GetDefaultInterface;
  published
  end;
{$ENDIF}



// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessControl
// Help String      : 
// Default Interface: _Control
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessControl = class(TOleControl)
  private
    FIntf: _Control;
    function  GetControlInterface: _Control;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Column(Index: Integer; Row: OleVariant): OleVariant;
    function Get_Selected(lRow: Integer): Integer;
    procedure Set_Selected(lRow: Integer; pRet: Integer);
    function Get_OldValue: OleVariant;
    function Get_Form: AccessForm;
    function Get_Report: AccessReport;
    function Get_ItemData(Index: Integer): OleVariant;
    function Get_Object_: IDispatch;
    function Get_ObjectVerbs(Index: Integer): WideString;
    function Get_Properties: Properties;
    function Get_ItemsSelected: _ItemsSelected;
    function Get_Pages: Pages;
    function Get_Controls: Children;
    function Get_Hyperlink: _Hyperlink;
  public
    procedure Undo;
    procedure Dropdown;
    procedure Requery;
    procedure SizeToFit;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Control read GetControlInterface;
    property  DefaultInterface: _Control read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Column[Index: Integer; Row: OleVariant]: OleVariant read Get_Column;
    property Selected[lRow: Integer]: Integer read Get_Selected write Set_Selected;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Form: AccessForm read Get_Form;
    property Report: AccessReport read Get_Report;
    property ItemData[Index: Integer]: OleVariant read Get_ItemData;
    property Object_: IDispatch index 2104 read GetIDispatchProp;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property ItemsSelected: _ItemsSelected read Get_ItemsSelected;
    property Pages: Pages read Get_Pages;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessLabel
// Help String      : 
// Default Interface: _Label
// Def. Intf. DISP? : No
// Event   Interface: _LabelEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessLabel = class(TOleControl)
  private
    FIntf: _Label;
    function  GetControlInterface: _Label;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
    function Get_Hyperlink: _Hyperlink;
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Label read GetControlInterface;
    property  DefaultInterface: _Label read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property Caption: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property HyperlinkAddress: WideString index 386 read GetWideStringProp write SetWideStringProp stored False;
    property HyperlinkSubAddress: WideString index 390 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ForeColor: Integer index 203 read GetIntegerProp write SetIntegerProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property TextAlign: Byte index 133 read GetByteProp write SetByteProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessRectangle
// Help String      : 
// Default Interface: _Rectangle
// Def. Intf. DISP? : No
// Event   Interface: _RectangleEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessRectangle = class(TOleControl)
  private
    FIntf: _Rectangle;
    function  GetControlInterface: _Rectangle;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Rectangle read GetControlInterface;
    property  DefaultInterface: _Rectangle read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessLine
// Help String      : 
// Default Interface: _Line
// Def. Intf. DISP? : No
// Event   Interface: _LineEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessLine = class(TOleControl)
  private
    FIntf: _Line;
    function  GetControlInterface: _Line;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Line read GetControlInterface;
    property  DefaultInterface: _Line read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property LineSlant: WordBool index 55 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessImage
// Help String      : 
// Default Interface: _Image
// Def. Intf. DISP? : No
// Event   Interface: _ImageEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessImage = class(TOleControl)
  private
    FIntf: _Image;
    function  GetControlInterface: _Image;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Hyperlink: _Hyperlink;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_ObjectPalette: OleVariant;
    procedure Set_ObjectPalette(pRet: OleVariant);
  public
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Image read GetControlInterface;
    property  DefaultInterface: _Image read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property PictureData: OleVariant index 187 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property ObjectPalette: OleVariant index 96 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property Picture: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property PictureType: Byte index 384 read GetByteProp write SetByteProp stored False;
    property SizeMode: Byte index 85 read GetByteProp write SetByteProp stored False;
    property PictureAlignment: Byte index 354 read GetByteProp write SetByteProp stored False;
    property PictureTiling: WordBool index 358 read GetWordBoolProp write SetWordBoolProp stored False;
    property HyperlinkAddress: WideString index 386 read GetWideStringProp write SetWideStringProp stored False;
    property HyperlinkSubAddress: WideString index 390 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ImageHeight: Integer index 350 read GetIntegerProp write SetIntegerProp stored False;
    property ImageWidth: Integer index 351 read GetIntegerProp write SetIntegerProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessCommandButton
// Help String      : 
// Default Interface: _CommandButton
// Def. Intf. DISP? : No
// Event   Interface: _CommandButtonEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessCommandButtonExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessCommandButton = class(TOleControl)
  private
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessCommandButtonExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _CommandButton;
    function  GetControlInterface: _CommandButton;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Hyperlink: _Hyperlink;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_ObjectPalette: OleVariant;
    procedure Set_ObjectPalette(pRet: OleVariant);
  public
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _CommandButton read GetControlInterface;
    property  DefaultInterface: _CommandButton read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property PictureData: OleVariant index 187 read GetOleVariantProp write SetOleVariantProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
    property ObjectPalette: OleVariant index 96 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property Caption: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property Picture: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property PictureType: Byte index 384 read GetByteProp write SetByteProp stored False;
    property Transparent: WordBool index 46 read GetWordBoolProp write SetWordBoolProp stored False;
    property Default: WordBool index 219 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cancel: WordBool index 220 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoRepeat: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property OnPush: WideString index 152 read GetWideStringProp write SetWideStringProp stored False;
    property HyperlinkAddress: WideString index 386 read GetWideStringProp write SetWideStringProp stored False;
    property HyperlinkSubAddress: WideString index 390 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property ForeColor: Integer index 203 read GetIntegerProp write SetIntegerProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessCommandButtonExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessOptionButton
// Help String      : 
// Default Interface: _OptionButton
// Def. Intf. DISP? : No
// Event   Interface: _OptionButtonEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessOptionButtonBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessOptionButtonExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessOptionButton = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessOptionButtonBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessOptionButtonExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _OptionButton;
    function  GetControlInterface: _OptionButton;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _OptionButton read GetControlInterface;
    property  DefaultInterface: _OptionButton read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property OptionValue: Integer index 58 read GetIntegerProp write SetIntegerProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TripleState: WordBool index 326 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessOptionButtonBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessOptionButtonExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessCheckBox
// Help String      : 
// Default Interface: _Checkbox
// Def. Intf. DISP? : No
// Event   Interface: _CheckBoxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessCheckBoxBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessCheckBoxExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessCheckBox = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessCheckBoxBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessCheckBoxExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _Checkbox;
    function  GetControlInterface: _Checkbox;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure Undo;
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Checkbox read GetControlInterface;
    property  DefaultInterface: _Checkbox read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property OptionValue: Integer index 58 read GetIntegerProp write SetIntegerProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TripleState: WordBool index 326 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessCheckBoxBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessCheckBoxExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessOptionGroup
// Help String      : 
// Default Interface: _OptionGroup
// Def. Intf. DISP? : No
// Event   Interface: _OptionGroupEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessOptionGroupBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessOptionGroupExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessOptionGroup = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessOptionGroupBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessOptionGroupExit;
    FIntf: _OptionGroup;
    function  GetControlInterface: _OptionGroup;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure Undo;
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _OptionGroup read GetControlInterface;
    property  DefaultInterface: _OptionGroup read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessOptionGroupBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessOptionGroupExit read FOnExit write FOnExit;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessBoundObjectFrame
// Help String      : 
// Default Interface: _BoundObjectFrame
// Def. Intf. DISP? : No
// Event   Interface: _BoundObjectFrameEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessBoundObjectFrameUpdated = procedure(ASender: TObject; var Code: Smallint) of object;
  TAccessBoundObjectFrameBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessBoundObjectFrameExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessBoundObjectFrame = class(TOleControl)
  private
    FOnUpdated: TAccessBoundObjectFrameUpdated;
    FOnBeforeUpdate: TAccessBoundObjectFrameBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessBoundObjectFrameExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _BoundObjectFrame;
    function  GetControlInterface: _BoundObjectFrame;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Object_: IDispatch;
    function Get_ObjectVerbs(Index: Integer): WideString;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
    function Get_ObjectPalette: OleVariant;
    procedure Set_ObjectPalette(pRet: OleVariant);
  public
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _BoundObjectFrame read GetControlInterface;
    property  DefaultInterface: _BoundObjectFrame read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Object_: IDispatch index 2104 read GetIDispatchProp;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property ObjectPalette: OleVariant index 96 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property SizeMode: Byte index 85 read GetByteProp write SetByteProp stored False;
    property Class_: WideString index 306 read GetWideStringProp write SetWideStringProp stored False;
    property SourceDoc: WideString index 130 read GetWideStringProp write SetWideStringProp stored False;
    property SourceItem: WideString index 48 read GetWideStringProp write SetWideStringProp stored False;
    property AutoActivate: Smallint index 98 read GetSmallintProp write SetSmallintProp stored False;
    property DisplayType: WordBool index 304 read GetWordBoolProp write SetWordBoolProp stored False;
    property UpdateOptions: Smallint index 100 read GetSmallintProp write SetSmallintProp stored False;
    property Verb: Integer index 99 read GetIntegerProp write SetIntegerProp stored False;
    property OLETypeAllowed: Byte index 307 read GetByteProp write SetByteProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property LpOleObject: Integer index 169 read GetIntegerProp write SetIntegerProp stored False;
    property ObjectVerbsCount: Integer index 172 read GetIntegerProp write SetIntegerProp stored False;
    property Action: Smallint index 305 read GetSmallintProp write SetSmallintProp stored False;
    property Scaling: Byte index 84 read GetByteProp write SetByteProp stored False;
    property OLEType: Byte index 308 read GetByteProp write SetByteProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnUpdated1: WideString index 115 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnUpdated: TAccessBoundObjectFrameUpdated read FOnUpdated write FOnUpdated;
    property OnBeforeUpdate: TAccessBoundObjectFrameBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessBoundObjectFrameExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessTextBox
// Help String      : 
// Default Interface: _Textbox
// Def. Intf. DISP? : No
// Event   Interface: _TextBoxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessTextBoxBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessTextBoxExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessTextBox = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessTextBoxBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessTextBoxExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _Textbox;
    function  GetControlInterface: _Textbox;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Hyperlink: _Hyperlink;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure Undo;
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Textbox read GetControlInterface;
    property  DefaultInterface: _Textbox read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
    property TextAlignGeneral: Smallint index 134 read GetSmallintProp write SetSmallintProp;
    property Coltyp: Integer index 136 read GetIntegerProp write SetIntegerProp;
    property FormatPictureText: WideString index 135 read GetWideStringProp write SetWideStringProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property Format: WideString index 38 read GetWideStringProp write SetWideStringProp stored False;
    property DecimalPlaces: Byte index 67 read GetByteProp write SetByteProp stored False;
    property InputMask: WideString index 68 read GetWideStringProp write SetWideStringProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property EnterKeyBehavior: WordBool index 70 read GetWordBoolProp write SetWordBoolProp stored False;
    property AllowAutoCorrect: WordBool index 383 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property FilterLookup: Byte index 337 read GetByteProp write SetByteProp stored False;
    property AutoTab: WordBool index 69 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property ScrollBars: Byte index 149 read GetByteProp write SetByteProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property CanGrow: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property CanShrink: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property RunningSum: Byte index 127 read GetByteProp write SetByteProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ForeColor: Integer index 203 read GetIntegerProp write SetIntegerProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property TextAlign: Byte index 133 read GetByteProp write SetByteProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property Text: WideString index 298 read GetWideStringProp write SetWideStringProp stored False;
    property SelText: WideString index 302 read GetWideStringProp write SetWideStringProp stored False;
    property SelStart: Smallint index 301 read GetSmallintProp write SetSmallintProp stored False;
    property SelLength: Smallint index 300 read GetSmallintProp write SetSmallintProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnChange1: WideString index 111 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessTextBoxBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessTextBoxExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessListBox
// Help String      : 
// Default Interface: _ListBox
// Def. Intf. DISP? : No
// Event   Interface: _ListBoxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessListBoxBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessListBoxExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessListBox = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessListBoxBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessListBoxExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _ListBox;
    function  GetControlInterface: _ListBox;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Column(Index: Integer; Row: OleVariant): OleVariant;
    function Get_Selected(lRow: Integer): Integer;
    procedure Set_Selected(lRow: Integer; pRet: Integer);
    function Get_OldValue: OleVariant;
    function Get_ItemData(Index: Integer): OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_ItemsSelected: _ItemsSelected;
    function Get_Hyperlink: _Hyperlink;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure Undo;
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _ListBox read GetControlInterface;
    property  DefaultInterface: _ListBox read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Column[Index: Integer; Row: OleVariant]: OleVariant read Get_Column;
    property Selected[lRow: Integer]: Integer read Get_Selected write Set_Selected;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property ItemData[Index: Integer]: OleVariant read Get_ItemData;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property ItemsSelected: _ItemsSelected read Get_ItemsSelected;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property RowSourceType: WideString index 90 read GetWideStringProp write SetWideStringProp stored False;
    property RowSource: WideString index 88 read GetWideStringProp write SetWideStringProp stored False;
    property ColumnCount: Smallint index 66 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHeads: WordBool index 128 read GetWordBoolProp write SetWordBoolProp stored False;
    property ColumnWidths: WideString index 18 read GetWideStringProp write SetWideStringProp stored False;
    property BoundColumn: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property MultiSelect: Byte index 325 read GetByteProp write SetByteProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property ForeColor: Integer index 203 read GetIntegerProp write SetIntegerProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property ListCount: Integer index 241 read GetIntegerProp write SetIntegerProp stored False;
    property ListIndex: Integer index 242 read GetIntegerProp write SetIntegerProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessListBoxBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessListBoxExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessComboBox
// Help String      : 
// Default Interface: _Combobox
// Def. Intf. DISP? : No
// Event   Interface: _ComboBoxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessComboBoxBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessComboBoxNotInList = procedure(ASender: TObject; var NewData: WideString; 
                                                         out Response: Smallint) of object;
  TAccessComboBoxExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessComboBox = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessComboBoxBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnNotInList: TAccessComboBoxNotInList;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessComboBoxExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _Combobox;
    function  GetControlInterface: _Combobox;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Column(Index: Integer; Row: OleVariant): OleVariant;
    function Get_OldValue: OleVariant;
    function Get_ItemData(Index: Integer): OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Hyperlink: _Hyperlink;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure Undo;
    procedure Dropdown;
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _Combobox read GetControlInterface;
    property  DefaultInterface: _Combobox read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Column[Index: Integer; Row: OleVariant]: OleVariant read Get_Column;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property ItemData[Index: Integer]: OleVariant read Get_ItemData;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Hyperlink: _Hyperlink read Get_Hyperlink;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
    property TextAlignGeneral: Smallint index 134 read GetSmallintProp write SetSmallintProp;
    property FormatPictureText: WideString index 135 read GetWideStringProp write SetWideStringProp;
    property Coltyp: Integer index 136 read GetIntegerProp write SetIntegerProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property Format: WideString index 38 read GetWideStringProp write SetWideStringProp stored False;
    property DecimalPlaces: Byte index 67 read GetByteProp write SetByteProp stored False;
    property InputMask: WideString index 68 read GetWideStringProp write SetWideStringProp stored False;
    property RowSourceType: WideString index 90 read GetWideStringProp write SetWideStringProp stored False;
    property RowSource: WideString index 88 read GetWideStringProp write SetWideStringProp stored False;
    property ColumnCount: Smallint index 66 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHeads: WordBool index 128 read GetWordBoolProp write SetWordBoolProp stored False;
    property ColumnWidths: WideString index 18 read GetWideStringProp write SetWideStringProp stored False;
    property BoundColumn: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property ListRows: Smallint index 150 read GetSmallintProp write SetSmallintProp stored False;
    property ListWidth: WideString index 151 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property LimitToList: WordBool index 63 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoExpand: WordBool index 64 read GetWordBoolProp write SetWordBoolProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property AllowAutoCorrect: WordBool index 383 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ForeColor: Integer index 203 read GetIntegerProp write SetIntegerProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property TextAlign: Byte index 133 read GetByteProp write SetByteProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property Text: WideString index 298 read GetWideStringProp write SetWideStringProp stored False;
    property SelText: WideString index 302 read GetWideStringProp write SetWideStringProp stored False;
    property SelStart: Smallint index 301 read GetSmallintProp write SetSmallintProp stored False;
    property SelLength: Smallint index 300 read GetSmallintProp write SetSmallintProp stored False;
    property ListCount: Integer index 241 read GetIntegerProp write SetIntegerProp stored False;
    property ListIndex: Integer index 242 read GetIntegerProp write SetIntegerProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnChange1: WideString index 111 read GetWideStringProp write SetWideStringProp stored False;
    property OnNotInList1: WideString index 117 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessComboBoxBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnNotInList: TAccessComboBoxNotInList read FOnNotInList write FOnNotInList;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessComboBoxExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessObjectFrame
// Help String      : 
// Default Interface: _ObjectFrame
// Def. Intf. DISP? : No
// Event   Interface: _ObjectFrameEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessObjectFrameUpdated = procedure(ASender: TObject; var Code: Smallint) of object;
  TAccessObjectFrameExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessObjectFrame = class(TOleControl)
  private
    FOnUpdated: TAccessObjectFrameUpdated;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessObjectFrameExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _ObjectFrame;
    function  GetControlInterface: _ObjectFrame;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Object_: IDispatch;
    function Get_ObjectVerbs(Index: Integer): WideString;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
    function Get_OleData: OleVariant;
    procedure Set_OleData(pRet: OleVariant);
    function Get_ObjectPalette: OleVariant;
    procedure Set_ObjectPalette(pRet: OleVariant);
  public
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _ObjectFrame read GetControlInterface;
    property  DefaultInterface: _ObjectFrame read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Object_: IDispatch index 2104 read GetIDispatchProp;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property OleData: OleVariant index 168 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property Data: Smallint index 265 read GetSmallintProp write SetSmallintProp;
    property ObjectPalette: OleVariant index 96 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property SizeMode: Byte index 85 read GetByteProp write SetByteProp stored False;
    property OLEClass: WideString index 72 read GetWideStringProp write SetWideStringProp stored False;
    property Item: WideString index 47 read GetWideStringProp write SetWideStringProp stored False;
    property RowSourceType: WideString index 90 read GetWideStringProp write SetWideStringProp stored False;
    property RowSource: WideString index 88 read GetWideStringProp write SetWideStringProp stored False;
    property LinkChildFields: WideString index 49 read GetWideStringProp write SetWideStringProp stored False;
    property LinkMasterFields: WideString index 50 read GetWideStringProp write SetWideStringProp stored False;
    property AutoActivate: Smallint index 98 read GetSmallintProp write SetSmallintProp stored False;
    property DisplayType: WordBool index 304 read GetWordBoolProp write SetWordBoolProp stored False;
    property UpdateOptions: Smallint index 100 read GetSmallintProp write SetSmallintProp stored False;
    property Verb: Integer index 99 read GetIntegerProp write SetIntegerProp stored False;
    property OLEType: Byte index 308 read GetByteProp write SetByteProp stored False;
    property OLETypeAllowed: Byte index 307 read GetByteProp write SetByteProp stored False;
    property SourceObject: WideString index 129 read GetWideStringProp write SetWideStringProp stored False;
    property Class_: WideString index 306 read GetWideStringProp write SetWideStringProp stored False;
    property SourceDoc: WideString index 130 read GetWideStringProp write SetWideStringProp stored False;
    property SourceItem: WideString index 48 read GetWideStringProp write SetWideStringProp stored False;
    property ColumnCount: Smallint index 66 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHeads: WordBool index 128 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property UpdateMethod: Smallint index 139 read GetSmallintProp write SetSmallintProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property LpOleObject: Integer index 169 read GetIntegerProp write SetIntegerProp stored False;
    property ObjectVerbsCount: Integer index 172 read GetIntegerProp write SetIntegerProp stored False;
    property Action: Smallint index 305 read GetSmallintProp write SetSmallintProp stored False;
    property Scaling: Byte index 84 read GetByteProp write SetByteProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnUpdated1: WideString index 115 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnUpdated: TAccessObjectFrameUpdated read FOnUpdated write FOnUpdated;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessObjectFrameExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessPageBreak
// Help String      : 
// Default Interface: _PageBreak
// Def. Intf. DISP? : No
// Event   Interface: _PageBreakEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessPageBreak = class(TOleControl)
  private
    FIntf: _PageBreak;
    function  GetControlInterface: _PageBreak;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _PageBreak read GetControlInterface;
    property  DefaultInterface: _PageBreak read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessToggleButton
// Help String      : 
// Default Interface: _ToggleButton
// Def. Intf. DISP? : No
// Event   Interface: _ToggleButtonEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessToggleButtonBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessToggleButtonExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessToggleButton = class(TOleControl)
  private
    FOnBeforeUpdate: TAccessToggleButtonBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessToggleButtonExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _ToggleButton;
    function  GetControlInterface: _ToggleButton;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_ObjectPalette: OleVariant;
    procedure Set_ObjectPalette(pRet: OleVariant);
  public
    procedure Undo;
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _ToggleButton read GetControlInterface;
    property  DefaultInterface: _ToggleButton read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property PictureData: OleVariant index 187 read GetOleVariantProp write SetOleVariantProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
    property ObjectPalette: OleVariant index 96 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property Caption: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property Picture: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property PictureType: Byte index 384 read GetByteProp write SetByteProp stored False;
    property OptionValue: Integer index 58 read GetIntegerProp write SetIntegerProp stored False;
    property DefaultValue: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationRule: WideString index 142 read GetWideStringProp write SetWideStringProp stored False;
    property ValidationText: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TripleState: WordBool index 326 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property HideDuplicates: WordBool index 65 read GetWordBoolProp write SetWordBoolProp stored False;
    property ForeColor: Integer index 203 read GetIntegerProp write SetIntegerProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property ColumnWidth: Smallint index 163 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnOrder: Smallint index 162 read GetSmallintProp write SetSmallintProp stored False;
    property ColumnHidden: WordBool index 164 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property BeforeUpdate: WideString index 81 read GetWideStringProp write SetWideStringProp stored False;
    property AfterUpdate: WideString index 82 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnBeforeUpdate: TAccessToggleButtonBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessToggleButtonExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessSubForm
// Help String      : 
// Default Interface: _SubForm
// Def. Intf. DISP? : No
// Event   Interface: _SubFormEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessSubFormExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessSubForm = class(TOleControl)
  private
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessSubFormExit;
    FIntf: _SubForm;
    function  GetControlInterface: _SubForm;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Form: AccessForm;
    function Get_Report: AccessReport;
    function Get_Properties: Properties;
    function Get_Controls: Controls;
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    procedure Goto_;
    procedure SetFocus;
    procedure Requery;
    property  ControlInterface: _SubForm read GetControlInterface;
    property  DefaultInterface: _SubForm read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Form: AccessForm read Get_Form;
    property Report: AccessReport read Get_Report;
    property Properties: Properties read Get_Properties;
    property Controls: Controls read Get_Controls;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property SourceObject: WideString index 129 read GetWideStringProp write SetWideStringProp stored False;
    property LinkChildFields: WideString index 49 read GetWideStringProp write SetWideStringProp stored False;
    property LinkMasterFields: WideString index 50 read GetWideStringProp write SetWideStringProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property CanGrow: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property CanShrink: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property AutoLabel: WordBool index 57 read GetWordBoolProp write SetWordBoolProp stored False;
    property AddColon: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelX: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property LabelY: Smallint index 53 read GetSmallintProp write SetSmallintProp stored False;
    property LabelAlign: Byte index 51 read GetByteProp write SetByteProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessSubFormExit read FOnExit write FOnExit;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessSubReport
// Help String      : 
// Default Interface: _SubReport
// Def. Intf. DISP? : No
// Event   Interface: _SubReportEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessSubReportExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessSubReport = class(TOleControl)
  private
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessSubReportExit;
    FIntf: _SubReport;
    function  GetControlInterface: _SubReport;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Form: AccessForm;
    function Get_Report: AccessReport;
  public
    property  ControlInterface: _SubReport read GetControlInterface;
    property  DefaultInterface: _SubReport read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Form: AccessForm read Get_Form;
    property Report: AccessReport read Get_Report;
  published
    property Anchors;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessSubReportExit read FOnExit write FOnExit;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessCustomControl
// Help String      : 
// Default Interface: _CustomControl
// Def. Intf. DISP? : No
// Event   Interface: _CustomControlEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessCustomControlUpdated = procedure(ASender: TObject; var Code: Smallint) of object;
  TAccessCustomControlExit = procedure(ASender: TObject; out Cancel: Smallint) of object;

  TAccessCustomControl = class(TOleControl)
  private
    FOnUpdated: TAccessCustomControlUpdated;
    FOnEnter: TNotifyEvent;
    FOnExit: TAccessCustomControlExit;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FIntf: _CustomControl;
    function  GetControlInterface: _CustomControl;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Object_: IDispatch;
    function Get_ObjectVerbs(Index: Integer): WideString;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
    function Get_OleData: OleVariant;
    procedure Set_OleData(pRet: OleVariant);
    function Get_ObjectPalette: OleVariant;
    procedure Set_ObjectPalette(pRet: OleVariant);
  public
    procedure SizeToFit;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _CustomControl read GetControlInterface;
    property  DefaultInterface: _CustomControl read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Object_: IDispatch index 2104 read GetIDispatchProp;
    property ObjectVerbs[Index: Integer]: WideString read Get_ObjectVerbs;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property OleData: OleVariant index 168 read GetOleVariantProp write SetOleVariantProp;
    property BorderLineStyle: Byte index 11 read GetByteProp write SetByteProp;
    property ObjectPalette: OleVariant index 96 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property OLEClass: WideString index 72 read GetWideStringProp write SetWideStringProp stored False;
    property Verb: Integer index 99 read GetIntegerProp write SetIntegerProp stored False;
    property Class_: WideString index 306 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property Locked: WordBool index 56 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property BorderStyle: Byte index 9 read GetByteProp write SetByteProp stored False;
    property OldBorderStyle: Byte index 371 read GetByteProp write SetByteProp stored False;
    property BorderColor: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property BorderWidth: Byte index 10 read GetByteProp write SetByteProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property LpOleObject: Integer index 169 read GetIntegerProp write SetIntegerProp stored False;
    property ObjectVerbsCount: Integer index 172 read GetIntegerProp write SetIntegerProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnUpdated1: WideString index 115 read GetWideStringProp write SetWideStringProp stored False;
    property OnEnter1: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property OnExit1: WideString index 222 read GetWideStringProp write SetWideStringProp stored False;
    property OnGotFocus1: WideString index 112 read GetWideStringProp write SetWideStringProp stored False;
    property OnLostFocus1: WideString index 113 read GetWideStringProp write SetWideStringProp stored False;
    property Default: WordBool index 219 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cancel: WordBool index 220 read GetWordBoolProp write SetWordBoolProp stored False;
    property Custom: WideString index 328 read GetWideStringProp write SetWideStringProp stored False;
    property About: WideString index 329 read GetWideStringProp write SetWideStringProp stored False;
    property OnUpdated: TAccessCustomControlUpdated read FOnUpdated write FOnUpdated;
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TAccessCustomControlExit read FOnExit write FOnExit;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessTabControl
// Help String      : 
// Default Interface: _TabControl
// Def. Intf. DISP? : No
// Event   Interface: _TabControlEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessTabControl = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FIntf: _TabControl;
    function  GetControlInterface: _TabControl;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_OldValue: OleVariant;
    function Get_Properties: Properties;
    function Get_Pages: Pages;
    function Get_Value: OleVariant;
    procedure Set_Value(pRet: OleVariant);
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property  ControlInterface: _TabControl read GetControlInterface;
    property  DefaultInterface: _TabControl read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property OldValue: OleVariant index 2102 read GetOleVariantProp;
    property Properties: Properties read Get_Properties;
    property Pages: Pages read Get_Pages;
    property Value: OleVariant index 0 read GetOleVariantProp write SetOleVariantProp;
    property TextFontCharSet: Byte index 192 read GetByteProp write SetByteProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabStop: WordBool index 292 read GetWordBoolProp write SetWordBoolProp stored False;
    property TabIndex: Smallint index 291 read GetSmallintProp write SetSmallintProp stored False;
    property BackStyle: Byte index 29 read GetByteProp write SetByteProp stored False;
    property MultiRow: WordBool index 391 read GetWordBoolProp write SetWordBoolProp stored False;
    property Style: Byte index 392 read GetByteProp write SetByteProp stored False;
    property TabFixedHeight: Smallint index 393 read GetSmallintProp write SetSmallintProp stored False;
    property TabFixedWidth: Smallint index 394 read GetSmallintProp write SetSmallintProp stored False;
    property FontName: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FontSize: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property FontWeight: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property FontItalic: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontUnderline: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property FontBold: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnChange1: WideString index 111 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyDown: WideString index 101 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyUp: WideString index 102 read GetWideStringProp write SetWideStringProp stored False;
    property OnKeyPress: WideString index 103 read GetWideStringProp write SetWideStringProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessPage
// Help String      : 
// Default Interface: _Page
// Def. Intf. DISP? : No
// Event   Interface: _PageEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessPage = class(TOleControl)
  private
    FIntf: _Page;
    function  GetControlInterface: _Page;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
    function Get_Controls: Children;
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
  public
    procedure SizeToFit;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    procedure Requery;
    procedure Goto_;
    procedure SetFocus;
    property  ControlInterface: _Page read GetControlInterface;
    property  DefaultInterface: _Page read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
    property PictureData: OleVariant index 187 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ControlType: Byte index 21 read GetByteProp write SetByteProp stored False;
    property Caption: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property Picture: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property PictureType: Byte index 384 read GetByteProp write SetByteProp stored False;
    property PageIndex: Smallint index 395 read GetSmallintProp write SetSmallintProp stored False;
    property StatusBarText: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property ShortcutMenuBar: WideString index 336 read GetWideStringProp write SetWideStringProp stored False;
    property ControlTipText: WideString index 362 read GetWideStringProp write SetWideStringProp stored False;
    property HelpContextId: Integer index 218 read GetIntegerProp write SetIntegerProp stored False;
    property Section: Smallint index 238 read GetSmallintProp write SetSmallintProp stored False;
    property ControlName: WideString index 296 read GetWideStringProp write SetWideStringProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property IsVisible: WordBool index 137 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessSection
// Help String      : 
// Default Interface: _Section
// Def. Intf. DISP? : No
// Event   Interface: _SectionEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessSection = class(TOleControl)
  private
    FIntf: _Section;
    function  GetControlInterface: _Section;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
    function Get_Controls: Children;
  public
    property  ControlInterface: _Section read GetControlInterface;
    property  DefaultInterface: _Section read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
    property Controls: Children read Get_Controls;
  published
    property Anchors;
    property EventProcPrefix: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property Name: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property ForceNewPage: Byte index 148 read GetByteProp write SetByteProp stored False;
    property NewRowOrCol: Byte index 230 read GetByteProp write SetByteProp stored False;
    property KeepTogether: WordBool index 71 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 145 read GetWordBoolProp write SetWordBoolProp stored False;
    property DisplayWhen: Byte index 146 read GetByteProp write SetByteProp stored False;
    property CanGrow: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property CanShrink: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property RepeatSection: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property BackColor: Integer index 28 read GetIntegerProp write SetIntegerProp stored False;
    property SpecialEffect: Byte index 4 read GetByteProp write SetByteProp stored False;
    property Tag: WideString index 297 read GetWideStringProp write SetWideStringProp stored False;
    property OnFormat: WideString index 76 read GetWideStringProp write SetWideStringProp stored False;
    property OnPrint: WideString index 78 read GetWideStringProp write SetWideStringProp stored False;
    property OnRetreat: WideString index 80 read GetWideStringProp write SetWideStringProp stored False;
    property OnClick: WideString index 123 read GetWideStringProp write SetWideStringProp stored False;
    property OnDblClick: WideString index 223 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseDown: WideString index 104 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseMove: WideString index 106 read GetWideStringProp write SetWideStringProp stored False;
    property OnMouseUp: WideString index 105 read GetWideStringProp write SetWideStringProp stored False;
    property HasContinued: WordBool index 199 read GetWordBoolProp write SetWordBoolProp stored False;
    property WillContinue: WordBool index 200 read GetWordBoolProp write SetWordBoolProp stored False;
    property InSelection: WordBool index 312 read GetWordBoolProp write SetWordBoolProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAccessGroupLevel
// Help String      : 
// Default Interface: _GroupLevel
// Def. Intf. DISP? : No
// Event   Interface: _GroupLevelEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TAccessGroupLevelFormat = procedure(ASender: TObject; out Cancel: Smallint; 
                                                        var FormatCount: Smallint) of object;
  TAccessGroupLevelPrint = procedure(ASender: TObject; out Cancel: Smallint; 
                                                       var PrintCount: Smallint) of object;

  TAccessGroupLevel = class(TOleControl)
  private
    FOnFormat: TAccessGroupLevelFormat;
    FOnPrint: TAccessGroupLevelPrint;
    FOnRetreat: TNotifyEvent;
    FIntf: _GroupLevel;
    function  GetControlInterface: _GroupLevel;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_Properties: Properties;
  public
    property  ControlInterface: _GroupLevel read GetControlInterface;
    property  DefaultInterface: _GroupLevel read GetControlInterface;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch index 2087 read GetIDispatchProp;
    property Properties: Properties read Get_Properties;
  published
    property Anchors;
    property ControlSource: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property SortOrder: WordBool index 173 read GetWordBoolProp write SetWordBoolProp stored False;
    property GroupHeader: WordBool index 174 read GetWordBoolProp write SetWordBoolProp stored False;
    property GroupFooter: WordBool index 175 read GetWordBoolProp write SetWordBoolProp stored False;
    property GroupOn: Smallint index 176 read GetSmallintProp write SetSmallintProp stored False;
    property GroupInterval: Integer index 177 read GetIntegerProp write SetIntegerProp stored False;
    property KeepTogether: Byte index 71 read GetByteProp write SetByteProp stored False;
    property OnFormat: TAccessGroupLevelFormat read FOnFormat write FOnFormat;
    property OnPrint: TAccessGroupLevelPrint read FOnPrint write FOnPrint;
    property OnRetreat: TNotifyEvent read FOnRetreat write FOnRetreat;
  end;

// *********************************************************************//
// The Class CoAccessForm provides a Create and CreateRemote method to          
// create instances of the default interface _Form exposed by              
// the CoClass AccessForm. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccessForm = class
    class function Create: _Form;
    class function CreateRemote(const MachineName: string): _Form;
  end;

  TAccessFormBeforeInsert = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessFormBeforeUpdate = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessFormDelete = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessFormBeforeDelConfirm = procedure(ASender: TObject; out Cancel: Smallint; 
                                                            out Response: Smallint) of object;
  TAccessFormAfterDelConfirm = procedure(ASender: TObject; var Status: Smallint) of object;
  TAccessFormOpen = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessFormUnload = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessFormDblClick = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessFormMouseDown = procedure(ASender: TObject; var Button: Smallint; var Shift: Smallint; 
                                                     var X: Single; var Y: Single) of object;
  TAccessFormMouseMove = procedure(ASender: TObject; var Button: Smallint; var Shift: Smallint; 
                                                     var X: Single; var Y: Single) of object;
  TAccessFormMouseUp = procedure(ASender: TObject; var Button: Smallint; var Shift: Smallint; 
                                                   var X: Single; var Y: Single) of object;
  TAccessFormKeyDown = procedure(ASender: TObject; var KeyCode: Smallint; var Shift: Smallint) of object;
  TAccessFormKeyPress = procedure(ASender: TObject; var KeyAscii: Smallint) of object;
  TAccessFormKeyUp = procedure(ASender: TObject; var KeyCode: Smallint; var Shift: Smallint) of object;
  TAccessFormError = procedure(ASender: TObject; var DataErr: Smallint; out Response: Smallint) of object;
  TAccessFormFilter = procedure(ASender: TObject; out Cancel: Smallint; var FilterType: Smallint) of object;
  TAccessFormApplyFilter = procedure(ASender: TObject; out Cancel: Smallint; var ApplyType: Smallint) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAccessForm
// Help String      : 
// Default Interface: _Form
// Def. Intf. DISP? : No
// Event   Interface: _FormEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAccessFormProperties= class;
{$ENDIF}
  TAccessForm = class(TOleServer)
  private
    FOnLoad: TNotifyEvent;
    FOnCurrent: TNotifyEvent;
    FOnBeforeInsert: TAccessFormBeforeInsert;
    FOnAfterInsert: TNotifyEvent;
    FOnBeforeUpdate: TAccessFormBeforeUpdate;
    FOnAfterUpdate: TNotifyEvent;
    FOnDelete: TAccessFormDelete;
    FOnBeforeDelConfirm: TAccessFormBeforeDelConfirm;
    FOnAfterDelConfirm: TAccessFormAfterDelConfirm;
    FOnOpen: TAccessFormOpen;
    FOnResize: TNotifyEvent;
    FOnUnload: TAccessFormUnload;
    FOnClose: TNotifyEvent;
    FOnActivate: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnGotFocus: TNotifyEvent;
    FOnLostFocus: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TAccessFormDblClick;
    FOnMouseDown: TAccessFormMouseDown;
    FOnMouseMove: TAccessFormMouseMove;
    FOnMouseUp: TAccessFormMouseUp;
    FOnKeyDown: TAccessFormKeyDown;
    FOnKeyPress: TAccessFormKeyPress;
    FOnKeyUp: TAccessFormKeyUp;
    FOnError: TAccessFormError;
    FOnTimer: TNotifyEvent;
    FOnFilter: TAccessFormFilter;
    FOnApplyFilter: TAccessFormApplyFilter;
    FIntf:        _Form;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAccessFormProperties;
    function      GetServerProperties: TAccessFormProperties;
{$ENDIF}
    function      GetDefaultInterface: _Form;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_FormName: WideString;
    procedure Set_FormName(const pRet: WideString);
    function Get_RecordSource: WideString;
    procedure Set_RecordSource(const pRet: WideString);
    function Get_Filter: WideString;
    procedure Set_Filter(const pRet: WideString);
    function Get_FilterOn: WordBool;
    procedure Set_FilterOn(pRet: WordBool);
    function Get_OrderBy: WideString;
    procedure Set_OrderBy(const pRet: WideString);
    function Get_OrderByOn: WordBool;
    procedure Set_OrderByOn(pRet: WordBool);
    function Get_AllowFilters: WordBool;
    procedure Set_AllowFilters(pRet: WordBool);
    function Get_Caption: WideString;
    procedure Set_Caption(const pRet: WideString);
    function Get_DefaultView: Byte;
    procedure Set_DefaultView(pRet: Byte);
    function Get_ViewsAllowed: Byte;
    procedure Set_ViewsAllowed(pRet: Byte);
    function Get_AllowEditing: WordBool;
    procedure Set_AllowEditing(pRet: WordBool);
    function Get_DefaultEditing: Smallint;
    procedure Set_DefaultEditing(pRet: Smallint);
    function Get_AllowEdits: WordBool;
    procedure Set_AllowEdits(pRet: WordBool);
    function Get_AllowDeletions: WordBool;
    procedure Set_AllowDeletions(pRet: WordBool);
    function Get_AllowAdditions: WordBool;
    procedure Set_AllowAdditions(pRet: WordBool);
    function Get_DataEntry: WordBool;
    procedure Set_DataEntry(pRet: WordBool);
    function Get_AllowUpdating: Byte;
    procedure Set_AllowUpdating(pRet: Byte);
    function Get_RecordsetType: Byte;
    procedure Set_RecordsetType(pRet: Byte);
    function Get_RecordLocks: Byte;
    procedure Set_RecordLocks(pRet: Byte);
    function Get_ScrollBars: Byte;
    procedure Set_ScrollBars(pRet: Byte);
    function Get_RecordSelectors: WordBool;
    procedure Set_RecordSelectors(pRet: WordBool);
    function Get_NavigationButtons: WordBool;
    procedure Set_NavigationButtons(pRet: WordBool);
    function Get_DividingLines: WordBool;
    procedure Set_DividingLines(pRet: WordBool);
    function Get_AutoResize: WordBool;
    procedure Set_AutoResize(pRet: WordBool);
    function Get_AutoCenter: WordBool;
    procedure Set_AutoCenter(pRet: WordBool);
    function Get_PopUp: WordBool;
    procedure Set_PopUp(pRet: WordBool);
    function Get_Modal: WordBool;
    procedure Set_Modal(pRet: WordBool);
    function Get_BorderStyle: Byte;
    procedure Set_BorderStyle(pRet: Byte);
    function Get_ControlBox: WordBool;
    procedure Set_ControlBox(pRet: WordBool);
    function Get_MinButton: WordBool;
    procedure Set_MinButton(pRet: WordBool);
    function Get_MaxButton: WordBool;
    procedure Set_MaxButton(pRet: WordBool);
    function Get_MinMaxButtons: Byte;
    procedure Set_MinMaxButtons(pRet: Byte);
    function Get_CloseButton: WordBool;
    procedure Set_CloseButton(pRet: WordBool);
    function Get_WhatsThisButton: WordBool;
    procedure Set_WhatsThisButton(pRet: WordBool);
    function Get_Width: Smallint;
    procedure Set_Width(pRet: Smallint);
    function Get_Picture: WideString;
    procedure Set_Picture(const pRet: WideString);
    function Get_PictureType: Byte;
    procedure Set_PictureType(pRet: Byte);
    function Get_PictureSizeMode: Byte;
    procedure Set_PictureSizeMode(pRet: Byte);
    function Get_PictureAlignment: Byte;
    procedure Set_PictureAlignment(pRet: Byte);
    function Get_PictureTiling: WordBool;
    procedure Set_PictureTiling(pRet: WordBool);
    function Get_Cycle: Byte;
    procedure Set_Cycle(pRet: Byte);
    function Get_MenuBar: WideString;
    procedure Set_MenuBar(const pRet: WideString);
    function Get_Toolbar: WideString;
    procedure Set_Toolbar(const pRet: WideString);
    function Get_ShortcutMenu: WordBool;
    procedure Set_ShortcutMenu(pRet: WordBool);
    function Get_ShortcutMenuBar: WideString;
    procedure Set_ShortcutMenuBar(const pRet: WideString);
    function Get_GridX: Smallint;
    procedure Set_GridX(pRet: Smallint);
    function Get_GridY: Smallint;
    procedure Set_GridY(pRet: Smallint);
    function Get_LayoutForPrint: WordBool;
    procedure Set_LayoutForPrint(pRet: WordBool);
    function Get_FastLaserPrinting: WordBool;
    procedure Set_FastLaserPrinting(pRet: WordBool);
    function Get_HelpFile: WideString;
    procedure Set_HelpFile(const pRet: WideString);
    function Get_HelpContextId: Integer;
    procedure Set_HelpContextId(pRet: Integer);
    function Get_RowHeight: Smallint;
    procedure Set_RowHeight(pRet: Smallint);
    function Get_DatasheetFontName: WideString;
    procedure Set_DatasheetFontName(const pRet: WideString);
    function Get_DatasheetFontHeight: Smallint;
    procedure Set_DatasheetFontHeight(pRet: Smallint);
    function Get_DatasheetFontWeight: Smallint;
    procedure Set_DatasheetFontWeight(pRet: Smallint);
    function Get_DatasheetFontItalic: WordBool;
    procedure Set_DatasheetFontItalic(pRet: WordBool);
    function Get_DatasheetFontUnderline: WordBool;
    procedure Set_DatasheetFontUnderline(pRet: WordBool);
    function Get_TabularCharSet: Byte;
    procedure Set_TabularCharSet(pRet: Byte);
    function Get_DatasheetGridlinesBehavior: Byte;
    procedure Set_DatasheetGridlinesBehavior(pRet: Byte);
    function Get_DatasheetGridlinesColor: Integer;
    procedure Set_DatasheetGridlinesColor(pRet: Integer);
    function Get_DatasheetCellsEffect: Byte;
    procedure Set_DatasheetCellsEffect(pRet: Byte);
    function Get_DatasheetForeColor: Integer;
    procedure Set_DatasheetForeColor(pRet: Integer);
    function Get_ShowGrid: WordBool;
    procedure Set_ShowGrid(pRet: WordBool);
    function Get_DatasheetBackColor: Integer;
    procedure Set_DatasheetBackColor(pRet: Integer);
    function Get_Hwnd: Integer;
    procedure Set_Hwnd(pRet: Integer);
    function Get_Count: Smallint;
    procedure Set_Count(pRet: Smallint);
    function Get_Page: Integer;
    procedure Set_Page(pRet: Integer);
    function Get_Pages: Smallint;
    procedure Set_Pages(pRet: Smallint);
    function Get_LogicalPageWidth: Integer;
    procedure Set_LogicalPageWidth(pRet: Integer);
    function Get_LogicalPageHeight: Integer;
    procedure Set_LogicalPageHeight(pRet: Integer);
    function Get_ZoomControl: Integer;
    procedure Set_ZoomControl(pRet: Integer);
    function Get_Visible: WordBool;
    procedure Set_Visible(pRet: WordBool);
    function Get_Painting: WordBool;
    procedure Set_Painting(pRet: WordBool);
    function Get_PrtMip: OleVariant;
    procedure Set_PrtMip(pRet: OleVariant);
    function Get_PrtDevMode: OleVariant;
    procedure Set_PrtDevMode(pRet: OleVariant);
    function Get_PrtDevNames: OleVariant;
    procedure Set_PrtDevNames(pRet: OleVariant);
    function Get_FrozenColumns: Smallint;
    procedure Set_FrozenColumns(pRet: Smallint);
    function Get_Bookmark: OleVariant;
    procedure Set_Bookmark(pRet: OleVariant);
    function Get_TabularFamily: Byte;
    procedure Set_TabularFamily(pRet: Byte);
    function Get_Name: WideString;
    procedure Set_Name(const pRet: WideString);
    function Get_PaletteSource: WideString;
    procedure Set_PaletteSource(const pRet: WideString);
    function Get_Tag: WideString;
    procedure Set_Tag(const pRet: WideString);
    function Get_PaintPalette: OleVariant;
    procedure Set_PaintPalette(pRet: OleVariant);
    function Get_OnMenu: WideString;
    procedure Set_OnMenu(const pRet: WideString);
    function Get_OpenArgs: OleVariant;
    procedure Set_OpenArgs(pRet: OleVariant);
    function Get_ConnectSynch: Smallint;
    procedure Set_ConnectSynch(pRet: Smallint);
    function Get_OnCurrent: WideString;
    procedure Set_OnCurrent(const pRet: WideString);
    function Get_OnInsert: WideString;
    procedure Set_OnInsert(const pRet: WideString);
    function Get_BeforeInsert: WideString;
    procedure Set_BeforeInsert(const pRet: WideString);
    function Get_AfterInsert: WideString;
    procedure Set_AfterInsert(const pRet: WideString);
    function Get_BeforeUpdate: WideString;
    procedure Set_BeforeUpdate(const pRet: WideString);
    function Get_AfterUpdate: WideString;
    procedure Set_AfterUpdate(const pRet: WideString);
    function Get_OnDelete: WideString;
    procedure Set_OnDelete(const pRet: WideString);
    function Get_BeforeDelConfirm: WideString;
    procedure Set_BeforeDelConfirm(const pRet: WideString);
    function Get_AfterDelConfirm: WideString;
    procedure Set_AfterDelConfirm(const pRet: WideString);
    function Get_OnOpen: WideString;
    procedure Set_OnOpen(const pRet: WideString);
    function Get_OnLoad: WideString;
    procedure Set_OnLoad(const pRet: WideString);
    function Get_OnResize: WideString;
    procedure Set_OnResize(const pRet: WideString);
    function Get_OnUnload: WideString;
    procedure Set_OnUnload(const pRet: WideString);
    function Get_OnClose: WideString;
    procedure Set_OnClose(const pRet: WideString);
    function Get_OnActivate: WideString;
    procedure Set_OnActivate(const pRet: WideString);
    function Get_OnDeactivate: WideString;
    procedure Set_OnDeactivate(const pRet: WideString);
    function Get_OnGotFocus: WideString;
    procedure Set_OnGotFocus(const pRet: WideString);
    function Get_OnLostFocus: WideString;
    procedure Set_OnLostFocus(const pRet: WideString);
    function Get_OnClick: WideString;
    procedure Set_OnClick(const pRet: WideString);
    function Get_OnDblClick: WideString;
    procedure Set_OnDblClick(const pRet: WideString);
    function Get_OnMouseDown: WideString;
    procedure Set_OnMouseDown(const pRet: WideString);
    function Get_OnMouseMove: WideString;
    procedure Set_OnMouseMove(const pRet: WideString);
    function Get_OnMouseUp: WideString;
    procedure Set_OnMouseUp(const pRet: WideString);
    function Get_OnKeyDown: WideString;
    procedure Set_OnKeyDown(const pRet: WideString);
    function Get_OnKeyUp: WideString;
    procedure Set_OnKeyUp(const pRet: WideString);
    function Get_OnKeyPress: WideString;
    procedure Set_OnKeyPress(const pRet: WideString);
    function Get_KeyPreview: WordBool;
    procedure Set_KeyPreview(pRet: WordBool);
    function Get_OnError: WideString;
    procedure Set_OnError(const pRet: WideString);
    function Get_OnFilter: WideString;
    procedure Set_OnFilter(const pRet: WideString);
    function Get_OnApplyFilter: WideString;
    procedure Set_OnApplyFilter(const pRet: WideString);
    function Get_OnTimer: WideString;
    procedure Set_OnTimer(const pRet: WideString);
    function Get_TimerInterval: Integer;
    procedure Set_TimerInterval(pRet: Integer);
    function Get_Dirty: WordBool;
    procedure Set_Dirty(pRet: WordBool);
    function Get_WindowWidth: Smallint;
    procedure Set_WindowWidth(pRet: Smallint);
    function Get_WindowHeight: Smallint;
    procedure Set_WindowHeight(pRet: Smallint);
    function Get_CurrentView: Smallint;
    procedure Set_CurrentView(pRet: Smallint);
    function Get_CurrentSectionTop: Smallint;
    procedure Set_CurrentSectionTop(pRet: Smallint);
    function Get_CurrentSectionLeft: Smallint;
    procedure Set_CurrentSectionLeft(pRet: Smallint);
    function Get_SelLeft: Integer;
    procedure Set_SelLeft(pRet: Integer);
    function Get_SelTop: Integer;
    procedure Set_SelTop(pRet: Integer);
    function Get_SelWidth: Integer;
    procedure Set_SelWidth(pRet: Integer);
    function Get_SelHeight: Integer;
    procedure Set_SelHeight(pRet: Integer);
    function Get_CurrentRecord: Integer;
    procedure Set_CurrentRecord(pRet: Integer);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_InsideHeight: Integer;
    procedure Set_InsideHeight(pRet: Integer);
    function Get_InsideWidth: Integer;
    procedure Set_InsideWidth(pRet: Integer);
    function Get_PicturePalette: OleVariant;
    procedure Set_PicturePalette(pRet: OleVariant);
    function Get_HasModule: WordBool;
    procedure Set_HasModule(pRet: WordBool);
    function Get_acHiddenCurrentPage: Integer;
    procedure Set_acHiddenCurrentPage(pRet: Integer);
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_NewRecord: Smallint;
    function Get_ActiveControl: AccessControl;
    function Get_DefaultControl(ControlType: Integer): AccessControl;
    function Get_Dynaset: IDispatch;
    function Get_RecordsetClone: Recordset;
    function Get_Section(var_: OleVariant): AccessSection;
    function Get_Form: AccessForm;
    function Get_Module: Module;
    function Get_Properties: Properties;
    function Get_ConnectControl: AccessControl;
    function Get_Controls: Controls;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Form);
    procedure Disconnect; override;
    procedure Undo;
    procedure Recalc;
    procedure Requery;
    procedure Refresh;
    procedure Repaint;
    procedure GoToPage(PageNumber: Integer; Right: Integer; Down: Integer);
    procedure SetFocus;
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property DefaultInterface: _Form read GetDefaultInterface;
    property AllowEditing: WordBool read Get_AllowEditing write Set_AllowEditing;
    property DefaultEditing: Smallint read Get_DefaultEditing write Set_DefaultEditing;
    property AllowUpdating: Byte read Get_AllowUpdating write Set_AllowUpdating;
    property MinButton: WordBool read Get_MinButton write Set_MinButton;
    property MaxButton: WordBool read Get_MaxButton write Set_MaxButton;
    property TabularCharSet: Byte read Get_TabularCharSet write Set_TabularCharSet;
    property ShowGrid: WordBool read Get_ShowGrid write Set_ShowGrid;
    property LogicalPageWidth: Integer read Get_LogicalPageWidth write Set_LogicalPageWidth;
    property LogicalPageHeight: Integer read Get_LogicalPageHeight write Set_LogicalPageHeight;
    property ZoomControl: Integer read Get_ZoomControl write Set_ZoomControl;
    property PrtMip: OleVariant read Get_PrtMip write Set_PrtMip;
    property PrtDevMode: OleVariant read Get_PrtDevMode write Set_PrtDevMode;
    property PrtDevNames: OleVariant read Get_PrtDevNames write Set_PrtDevNames;
    property Bookmark: OleVariant read Get_Bookmark write Set_Bookmark;
    property TabularFamily: Byte read Get_TabularFamily write Set_TabularFamily;
    property PaintPalette: OleVariant read Get_PaintPalette write Set_PaintPalette;
    property OpenArgs: OleVariant read Get_OpenArgs write Set_OpenArgs;
    property ConnectSynch: Smallint read Get_ConnectSynch write Set_ConnectSynch;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property PicturePalette: OleVariant read Get_PicturePalette write Set_PicturePalette;
    property acHiddenCurrentPage: Integer read Get_acHiddenCurrentPage write Set_acHiddenCurrentPage;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property NewRecord: Smallint read Get_NewRecord;
    property ActiveControl: AccessControl read Get_ActiveControl;
    property DefaultControl[ControlType: Integer]: AccessControl read Get_DefaultControl;
    property Dynaset: IDispatch read Get_Dynaset;
    property RecordsetClone: Recordset read Get_RecordsetClone;
    property Section[var_: OleVariant]: AccessSection read Get_Section;
    property Form: AccessForm read Get_Form;
    property Module: Module read Get_Module;
    property Properties: Properties read Get_Properties;
    property ConnectControl: AccessControl read Get_ConnectControl;
    property Controls: Controls read Get_Controls;
    property FormName: WideString read Get_FormName write Set_FormName;
    property RecordSource: WideString read Get_RecordSource write Set_RecordSource;
    property Filter: WideString read Get_Filter write Set_Filter;
    property FilterOn: WordBool read Get_FilterOn write Set_FilterOn;
    property OrderBy: WideString read Get_OrderBy write Set_OrderBy;
    property OrderByOn: WordBool read Get_OrderByOn write Set_OrderByOn;
    property AllowFilters: WordBool read Get_AllowFilters write Set_AllowFilters;
    property Caption: WideString read Get_Caption write Set_Caption;
    property DefaultView: Byte read Get_DefaultView write Set_DefaultView;
    property ViewsAllowed: Byte read Get_ViewsAllowed write Set_ViewsAllowed;
    property AllowEdits: WordBool read Get_AllowEdits write Set_AllowEdits;
    property AllowDeletions: WordBool read Get_AllowDeletions write Set_AllowDeletions;
    property AllowAdditions: WordBool read Get_AllowAdditions write Set_AllowAdditions;
    property DataEntry: WordBool read Get_DataEntry write Set_DataEntry;
    property RecordsetType: Byte read Get_RecordsetType write Set_RecordsetType;
    property RecordLocks: Byte read Get_RecordLocks write Set_RecordLocks;
    property ScrollBars: Byte read Get_ScrollBars write Set_ScrollBars;
    property RecordSelectors: WordBool read Get_RecordSelectors write Set_RecordSelectors;
    property NavigationButtons: WordBool read Get_NavigationButtons write Set_NavigationButtons;
    property DividingLines: WordBool read Get_DividingLines write Set_DividingLines;
    property AutoResize: WordBool read Get_AutoResize write Set_AutoResize;
    property AutoCenter: WordBool read Get_AutoCenter write Set_AutoCenter;
    property PopUp: WordBool read Get_PopUp write Set_PopUp;
    property Modal: WordBool read Get_Modal write Set_Modal;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property ControlBox: WordBool read Get_ControlBox write Set_ControlBox;
    property MinMaxButtons: Byte read Get_MinMaxButtons write Set_MinMaxButtons;
    property CloseButton: WordBool read Get_CloseButton write Set_CloseButton;
    property WhatsThisButton: WordBool read Get_WhatsThisButton write Set_WhatsThisButton;
    property Width: Smallint read Get_Width write Set_Width;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureSizeMode: Byte read Get_PictureSizeMode write Set_PictureSizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property Cycle: Byte read Get_Cycle write Set_Cycle;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property Toolbar: WideString read Get_Toolbar write Set_Toolbar;
    property ShortcutMenu: WordBool read Get_ShortcutMenu write Set_ShortcutMenu;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property GridX: Smallint read Get_GridX write Set_GridX;
    property GridY: Smallint read Get_GridY write Set_GridY;
    property LayoutForPrint: WordBool read Get_LayoutForPrint write Set_LayoutForPrint;
    property FastLaserPrinting: WordBool read Get_FastLaserPrinting write Set_FastLaserPrinting;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property RowHeight: Smallint read Get_RowHeight write Set_RowHeight;
    property DatasheetFontName: WideString read Get_DatasheetFontName write Set_DatasheetFontName;
    property DatasheetFontHeight: Smallint read Get_DatasheetFontHeight write Set_DatasheetFontHeight;
    property DatasheetFontWeight: Smallint read Get_DatasheetFontWeight write Set_DatasheetFontWeight;
    property DatasheetFontItalic: WordBool read Get_DatasheetFontItalic write Set_DatasheetFontItalic;
    property DatasheetFontUnderline: WordBool read Get_DatasheetFontUnderline write Set_DatasheetFontUnderline;
    property DatasheetGridlinesBehavior: Byte read Get_DatasheetGridlinesBehavior write Set_DatasheetGridlinesBehavior;
    property DatasheetGridlinesColor: Integer read Get_DatasheetGridlinesColor write Set_DatasheetGridlinesColor;
    property DatasheetCellsEffect: Byte read Get_DatasheetCellsEffect write Set_DatasheetCellsEffect;
    property DatasheetForeColor: Integer read Get_DatasheetForeColor write Set_DatasheetForeColor;
    property DatasheetBackColor: Integer read Get_DatasheetBackColor write Set_DatasheetBackColor;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Smallint read Get_Count write Set_Count;
    property Page: Integer read Get_Page write Set_Page;
    property Pages: Smallint read Get_Pages write Set_Pages;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Painting: WordBool read Get_Painting write Set_Painting;
    property FrozenColumns: Smallint read Get_FrozenColumns write Set_FrozenColumns;
    property Name: WideString read Get_Name write Set_Name;
    property PaletteSource: WideString read Get_PaletteSource write Set_PaletteSource;
    property Tag: WideString read Get_Tag write Set_Tag;
    property OnMenu: WideString read Get_OnMenu write Set_OnMenu;
    property OnCurrent1: WideString read Get_OnCurrent write Set_OnCurrent;
    property OnInsert: WideString read Get_OnInsert write Set_OnInsert;
    property BeforeInsert: WideString read Get_BeforeInsert write Set_BeforeInsert;
    property AfterInsert: WideString read Get_AfterInsert write Set_AfterInsert;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnDelete1: WideString read Get_OnDelete write Set_OnDelete;
    property BeforeDelConfirm: WideString read Get_BeforeDelConfirm write Set_BeforeDelConfirm;
    property AfterDelConfirm: WideString read Get_AfterDelConfirm write Set_AfterDelConfirm;
    property OnOpen1: WideString read Get_OnOpen write Set_OnOpen;
    property OnLoad1: WideString read Get_OnLoad write Set_OnLoad;
    property OnResize1: WideString read Get_OnResize write Set_OnResize;
    property OnUnload1: WideString read Get_OnUnload write Set_OnUnload;
    property OnClose1: WideString read Get_OnClose write Set_OnClose;
    property OnActivate1: WideString read Get_OnActivate write Set_OnActivate;
    property OnDeactivate1: WideString read Get_OnDeactivate write Set_OnDeactivate;
    property OnGotFocus1: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus1: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick1: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick1: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown1: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove1: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp1: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown1: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp1: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress1: WideString read Get_OnKeyPress write Set_OnKeyPress;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property OnError1: WideString read Get_OnError write Set_OnError;
    property OnFilter1: WideString read Get_OnFilter write Set_OnFilter;
    property OnApplyFilter1: WideString read Get_OnApplyFilter write Set_OnApplyFilter;
    property OnTimer1: WideString read Get_OnTimer write Set_OnTimer;
    property TimerInterval: Integer read Get_TimerInterval write Set_TimerInterval;
    property Dirty: WordBool read Get_Dirty write Set_Dirty;
    property WindowWidth: Smallint read Get_WindowWidth write Set_WindowWidth;
    property WindowHeight: Smallint read Get_WindowHeight write Set_WindowHeight;
    property CurrentView: Smallint read Get_CurrentView write Set_CurrentView;
    property CurrentSectionTop: Smallint read Get_CurrentSectionTop write Set_CurrentSectionTop;
    property CurrentSectionLeft: Smallint read Get_CurrentSectionLeft write Set_CurrentSectionLeft;
    property SelLeft: Integer read Get_SelLeft write Set_SelLeft;
    property SelTop: Integer read Get_SelTop write Set_SelTop;
    property SelWidth: Integer read Get_SelWidth write Set_SelWidth;
    property SelHeight: Integer read Get_SelHeight write Set_SelHeight;
    property CurrentRecord: Integer read Get_CurrentRecord write Set_CurrentRecord;
    property InsideHeight: Integer read Get_InsideHeight write Set_InsideHeight;
    property InsideWidth: Integer read Get_InsideWidth write Set_InsideWidth;
    property HasModule: WordBool read Get_HasModule write Set_HasModule;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAccessFormProperties read GetServerProperties;
{$ENDIF}
    property OnLoad: TNotifyEvent read FOnLoad write FOnLoad;
    property OnCurrent: TNotifyEvent read FOnCurrent write FOnCurrent;
    property OnBeforeInsert: TAccessFormBeforeInsert read FOnBeforeInsert write FOnBeforeInsert;
    property OnAfterInsert: TNotifyEvent read FOnAfterInsert write FOnAfterInsert;
    property OnBeforeUpdate: TAccessFormBeforeUpdate read FOnBeforeUpdate write FOnBeforeUpdate;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnDelete: TAccessFormDelete read FOnDelete write FOnDelete;
    property OnBeforeDelConfirm: TAccessFormBeforeDelConfirm read FOnBeforeDelConfirm write FOnBeforeDelConfirm;
    property OnAfterDelConfirm: TAccessFormAfterDelConfirm read FOnAfterDelConfirm write FOnAfterDelConfirm;
    property OnOpen: TAccessFormOpen read FOnOpen write FOnOpen;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    property OnUnload: TAccessFormUnload read FOnUnload write FOnUnload;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnGotFocus: TNotifyEvent read FOnGotFocus write FOnGotFocus;
    property OnLostFocus: TNotifyEvent read FOnLostFocus write FOnLostFocus;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TAccessFormDblClick read FOnDblClick write FOnDblClick;
    property OnMouseDown: TAccessFormMouseDown read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TAccessFormMouseMove read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TAccessFormMouseUp read FOnMouseUp write FOnMouseUp;
    property OnKeyDown: TAccessFormKeyDown read FOnKeyDown write FOnKeyDown;
    property OnKeyPress: TAccessFormKeyPress read FOnKeyPress write FOnKeyPress;
    property OnKeyUp: TAccessFormKeyUp read FOnKeyUp write FOnKeyUp;
    property OnError: TAccessFormError read FOnError write FOnError;
    property OnTimer: TNotifyEvent read FOnTimer write FOnTimer;
    property OnFilter: TAccessFormFilter read FOnFilter write FOnFilter;
    property OnApplyFilter: TAccessFormApplyFilter read FOnApplyFilter write FOnApplyFilter;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAccessForm
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAccessFormProperties = class(TPersistent)
  private
    FServer:    TAccessForm;
    function    GetDefaultInterface: _Form;
    constructor Create(AServer: TAccessForm);
  protected
    function Get_FormName: WideString;
    procedure Set_FormName(const pRet: WideString);
    function Get_RecordSource: WideString;
    procedure Set_RecordSource(const pRet: WideString);
    function Get_Filter: WideString;
    procedure Set_Filter(const pRet: WideString);
    function Get_FilterOn: WordBool;
    procedure Set_FilterOn(pRet: WordBool);
    function Get_OrderBy: WideString;
    procedure Set_OrderBy(const pRet: WideString);
    function Get_OrderByOn: WordBool;
    procedure Set_OrderByOn(pRet: WordBool);
    function Get_AllowFilters: WordBool;
    procedure Set_AllowFilters(pRet: WordBool);
    function Get_Caption: WideString;
    procedure Set_Caption(const pRet: WideString);
    function Get_DefaultView: Byte;
    procedure Set_DefaultView(pRet: Byte);
    function Get_ViewsAllowed: Byte;
    procedure Set_ViewsAllowed(pRet: Byte);
    function Get_AllowEditing: WordBool;
    procedure Set_AllowEditing(pRet: WordBool);
    function Get_DefaultEditing: Smallint;
    procedure Set_DefaultEditing(pRet: Smallint);
    function Get_AllowEdits: WordBool;
    procedure Set_AllowEdits(pRet: WordBool);
    function Get_AllowDeletions: WordBool;
    procedure Set_AllowDeletions(pRet: WordBool);
    function Get_AllowAdditions: WordBool;
    procedure Set_AllowAdditions(pRet: WordBool);
    function Get_DataEntry: WordBool;
    procedure Set_DataEntry(pRet: WordBool);
    function Get_AllowUpdating: Byte;
    procedure Set_AllowUpdating(pRet: Byte);
    function Get_RecordsetType: Byte;
    procedure Set_RecordsetType(pRet: Byte);
    function Get_RecordLocks: Byte;
    procedure Set_RecordLocks(pRet: Byte);
    function Get_ScrollBars: Byte;
    procedure Set_ScrollBars(pRet: Byte);
    function Get_RecordSelectors: WordBool;
    procedure Set_RecordSelectors(pRet: WordBool);
    function Get_NavigationButtons: WordBool;
    procedure Set_NavigationButtons(pRet: WordBool);
    function Get_DividingLines: WordBool;
    procedure Set_DividingLines(pRet: WordBool);
    function Get_AutoResize: WordBool;
    procedure Set_AutoResize(pRet: WordBool);
    function Get_AutoCenter: WordBool;
    procedure Set_AutoCenter(pRet: WordBool);
    function Get_PopUp: WordBool;
    procedure Set_PopUp(pRet: WordBool);
    function Get_Modal: WordBool;
    procedure Set_Modal(pRet: WordBool);
    function Get_BorderStyle: Byte;
    procedure Set_BorderStyle(pRet: Byte);
    function Get_ControlBox: WordBool;
    procedure Set_ControlBox(pRet: WordBool);
    function Get_MinButton: WordBool;
    procedure Set_MinButton(pRet: WordBool);
    function Get_MaxButton: WordBool;
    procedure Set_MaxButton(pRet: WordBool);
    function Get_MinMaxButtons: Byte;
    procedure Set_MinMaxButtons(pRet: Byte);
    function Get_CloseButton: WordBool;
    procedure Set_CloseButton(pRet: WordBool);
    function Get_WhatsThisButton: WordBool;
    procedure Set_WhatsThisButton(pRet: WordBool);
    function Get_Width: Smallint;
    procedure Set_Width(pRet: Smallint);
    function Get_Picture: WideString;
    procedure Set_Picture(const pRet: WideString);
    function Get_PictureType: Byte;
    procedure Set_PictureType(pRet: Byte);
    function Get_PictureSizeMode: Byte;
    procedure Set_PictureSizeMode(pRet: Byte);
    function Get_PictureAlignment: Byte;
    procedure Set_PictureAlignment(pRet: Byte);
    function Get_PictureTiling: WordBool;
    procedure Set_PictureTiling(pRet: WordBool);
    function Get_Cycle: Byte;
    procedure Set_Cycle(pRet: Byte);
    function Get_MenuBar: WideString;
    procedure Set_MenuBar(const pRet: WideString);
    function Get_Toolbar: WideString;
    procedure Set_Toolbar(const pRet: WideString);
    function Get_ShortcutMenu: WordBool;
    procedure Set_ShortcutMenu(pRet: WordBool);
    function Get_ShortcutMenuBar: WideString;
    procedure Set_ShortcutMenuBar(const pRet: WideString);
    function Get_GridX: Smallint;
    procedure Set_GridX(pRet: Smallint);
    function Get_GridY: Smallint;
    procedure Set_GridY(pRet: Smallint);
    function Get_LayoutForPrint: WordBool;
    procedure Set_LayoutForPrint(pRet: WordBool);
    function Get_FastLaserPrinting: WordBool;
    procedure Set_FastLaserPrinting(pRet: WordBool);
    function Get_HelpFile: WideString;
    procedure Set_HelpFile(const pRet: WideString);
    function Get_HelpContextId: Integer;
    procedure Set_HelpContextId(pRet: Integer);
    function Get_RowHeight: Smallint;
    procedure Set_RowHeight(pRet: Smallint);
    function Get_DatasheetFontName: WideString;
    procedure Set_DatasheetFontName(const pRet: WideString);
    function Get_DatasheetFontHeight: Smallint;
    procedure Set_DatasheetFontHeight(pRet: Smallint);
    function Get_DatasheetFontWeight: Smallint;
    procedure Set_DatasheetFontWeight(pRet: Smallint);
    function Get_DatasheetFontItalic: WordBool;
    procedure Set_DatasheetFontItalic(pRet: WordBool);
    function Get_DatasheetFontUnderline: WordBool;
    procedure Set_DatasheetFontUnderline(pRet: WordBool);
    function Get_TabularCharSet: Byte;
    procedure Set_TabularCharSet(pRet: Byte);
    function Get_DatasheetGridlinesBehavior: Byte;
    procedure Set_DatasheetGridlinesBehavior(pRet: Byte);
    function Get_DatasheetGridlinesColor: Integer;
    procedure Set_DatasheetGridlinesColor(pRet: Integer);
    function Get_DatasheetCellsEffect: Byte;
    procedure Set_DatasheetCellsEffect(pRet: Byte);
    function Get_DatasheetForeColor: Integer;
    procedure Set_DatasheetForeColor(pRet: Integer);
    function Get_ShowGrid: WordBool;
    procedure Set_ShowGrid(pRet: WordBool);
    function Get_DatasheetBackColor: Integer;
    procedure Set_DatasheetBackColor(pRet: Integer);
    function Get_Hwnd: Integer;
    procedure Set_Hwnd(pRet: Integer);
    function Get_Count: Smallint;
    procedure Set_Count(pRet: Smallint);
    function Get_Page: Integer;
    procedure Set_Page(pRet: Integer);
    function Get_Pages: Smallint;
    procedure Set_Pages(pRet: Smallint);
    function Get_LogicalPageWidth: Integer;
    procedure Set_LogicalPageWidth(pRet: Integer);
    function Get_LogicalPageHeight: Integer;
    procedure Set_LogicalPageHeight(pRet: Integer);
    function Get_ZoomControl: Integer;
    procedure Set_ZoomControl(pRet: Integer);
    function Get_Visible: WordBool;
    procedure Set_Visible(pRet: WordBool);
    function Get_Painting: WordBool;
    procedure Set_Painting(pRet: WordBool);
    function Get_PrtMip: OleVariant;
    procedure Set_PrtMip(pRet: OleVariant);
    function Get_PrtDevMode: OleVariant;
    procedure Set_PrtDevMode(pRet: OleVariant);
    function Get_PrtDevNames: OleVariant;
    procedure Set_PrtDevNames(pRet: OleVariant);
    function Get_FrozenColumns: Smallint;
    procedure Set_FrozenColumns(pRet: Smallint);
    function Get_Bookmark: OleVariant;
    procedure Set_Bookmark(pRet: OleVariant);
    function Get_TabularFamily: Byte;
    procedure Set_TabularFamily(pRet: Byte);
    function Get_Name: WideString;
    procedure Set_Name(const pRet: WideString);
    function Get_PaletteSource: WideString;
    procedure Set_PaletteSource(const pRet: WideString);
    function Get_Tag: WideString;
    procedure Set_Tag(const pRet: WideString);
    function Get_PaintPalette: OleVariant;
    procedure Set_PaintPalette(pRet: OleVariant);
    function Get_OnMenu: WideString;
    procedure Set_OnMenu(const pRet: WideString);
    function Get_OpenArgs: OleVariant;
    procedure Set_OpenArgs(pRet: OleVariant);
    function Get_ConnectSynch: Smallint;
    procedure Set_ConnectSynch(pRet: Smallint);
    function Get_OnCurrent: WideString;
    procedure Set_OnCurrent(const pRet: WideString);
    function Get_OnInsert: WideString;
    procedure Set_OnInsert(const pRet: WideString);
    function Get_BeforeInsert: WideString;
    procedure Set_BeforeInsert(const pRet: WideString);
    function Get_AfterInsert: WideString;
    procedure Set_AfterInsert(const pRet: WideString);
    function Get_BeforeUpdate: WideString;
    procedure Set_BeforeUpdate(const pRet: WideString);
    function Get_AfterUpdate: WideString;
    procedure Set_AfterUpdate(const pRet: WideString);
    function Get_OnDelete: WideString;
    procedure Set_OnDelete(const pRet: WideString);
    function Get_BeforeDelConfirm: WideString;
    procedure Set_BeforeDelConfirm(const pRet: WideString);
    function Get_AfterDelConfirm: WideString;
    procedure Set_AfterDelConfirm(const pRet: WideString);
    function Get_OnOpen: WideString;
    procedure Set_OnOpen(const pRet: WideString);
    function Get_OnLoad: WideString;
    procedure Set_OnLoad(const pRet: WideString);
    function Get_OnResize: WideString;
    procedure Set_OnResize(const pRet: WideString);
    function Get_OnUnload: WideString;
    procedure Set_OnUnload(const pRet: WideString);
    function Get_OnClose: WideString;
    procedure Set_OnClose(const pRet: WideString);
    function Get_OnActivate: WideString;
    procedure Set_OnActivate(const pRet: WideString);
    function Get_OnDeactivate: WideString;
    procedure Set_OnDeactivate(const pRet: WideString);
    function Get_OnGotFocus: WideString;
    procedure Set_OnGotFocus(const pRet: WideString);
    function Get_OnLostFocus: WideString;
    procedure Set_OnLostFocus(const pRet: WideString);
    function Get_OnClick: WideString;
    procedure Set_OnClick(const pRet: WideString);
    function Get_OnDblClick: WideString;
    procedure Set_OnDblClick(const pRet: WideString);
    function Get_OnMouseDown: WideString;
    procedure Set_OnMouseDown(const pRet: WideString);
    function Get_OnMouseMove: WideString;
    procedure Set_OnMouseMove(const pRet: WideString);
    function Get_OnMouseUp: WideString;
    procedure Set_OnMouseUp(const pRet: WideString);
    function Get_OnKeyDown: WideString;
    procedure Set_OnKeyDown(const pRet: WideString);
    function Get_OnKeyUp: WideString;
    procedure Set_OnKeyUp(const pRet: WideString);
    function Get_OnKeyPress: WideString;
    procedure Set_OnKeyPress(const pRet: WideString);
    function Get_KeyPreview: WordBool;
    procedure Set_KeyPreview(pRet: WordBool);
    function Get_OnError: WideString;
    procedure Set_OnError(const pRet: WideString);
    function Get_OnFilter: WideString;
    procedure Set_OnFilter(const pRet: WideString);
    function Get_OnApplyFilter: WideString;
    procedure Set_OnApplyFilter(const pRet: WideString);
    function Get_OnTimer: WideString;
    procedure Set_OnTimer(const pRet: WideString);
    function Get_TimerInterval: Integer;
    procedure Set_TimerInterval(pRet: Integer);
    function Get_Dirty: WordBool;
    procedure Set_Dirty(pRet: WordBool);
    function Get_WindowWidth: Smallint;
    procedure Set_WindowWidth(pRet: Smallint);
    function Get_WindowHeight: Smallint;
    procedure Set_WindowHeight(pRet: Smallint);
    function Get_CurrentView: Smallint;
    procedure Set_CurrentView(pRet: Smallint);
    function Get_CurrentSectionTop: Smallint;
    procedure Set_CurrentSectionTop(pRet: Smallint);
    function Get_CurrentSectionLeft: Smallint;
    procedure Set_CurrentSectionLeft(pRet: Smallint);
    function Get_SelLeft: Integer;
    procedure Set_SelLeft(pRet: Integer);
    function Get_SelTop: Integer;
    procedure Set_SelTop(pRet: Integer);
    function Get_SelWidth: Integer;
    procedure Set_SelWidth(pRet: Integer);
    function Get_SelHeight: Integer;
    procedure Set_SelHeight(pRet: Integer);
    function Get_CurrentRecord: Integer;
    procedure Set_CurrentRecord(pRet: Integer);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_InsideHeight: Integer;
    procedure Set_InsideHeight(pRet: Integer);
    function Get_InsideWidth: Integer;
    procedure Set_InsideWidth(pRet: Integer);
    function Get_PicturePalette: OleVariant;
    procedure Set_PicturePalette(pRet: OleVariant);
    function Get_HasModule: WordBool;
    procedure Set_HasModule(pRet: WordBool);
    function Get_acHiddenCurrentPage: Integer;
    procedure Set_acHiddenCurrentPage(pRet: Integer);
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_NewRecord: Smallint;
    function Get_ActiveControl: AccessControl;
    function Get_DefaultControl(ControlType: Integer): AccessControl;
    function Get_Dynaset: IDispatch;
    function Get_RecordsetClone: Recordset;
    function Get_Section(var_: OleVariant): AccessSection;
    function Get_Form: AccessForm;
    function Get_Module: Module;
    function Get_Properties: Properties;
    function Get_ConnectControl: AccessControl;
    function Get_Controls: Controls;
  public
    property DefaultInterface: _Form read GetDefaultInterface;
  published
    property FormName: WideString read Get_FormName write Set_FormName;
    property RecordSource: WideString read Get_RecordSource write Set_RecordSource;
    property Filter: WideString read Get_Filter write Set_Filter;
    property FilterOn: WordBool read Get_FilterOn write Set_FilterOn;
    property OrderBy: WideString read Get_OrderBy write Set_OrderBy;
    property OrderByOn: WordBool read Get_OrderByOn write Set_OrderByOn;
    property AllowFilters: WordBool read Get_AllowFilters write Set_AllowFilters;
    property Caption: WideString read Get_Caption write Set_Caption;
    property DefaultView: Byte read Get_DefaultView write Set_DefaultView;
    property ViewsAllowed: Byte read Get_ViewsAllowed write Set_ViewsAllowed;
    property AllowEdits: WordBool read Get_AllowEdits write Set_AllowEdits;
    property AllowDeletions: WordBool read Get_AllowDeletions write Set_AllowDeletions;
    property AllowAdditions: WordBool read Get_AllowAdditions write Set_AllowAdditions;
    property DataEntry: WordBool read Get_DataEntry write Set_DataEntry;
    property RecordsetType: Byte read Get_RecordsetType write Set_RecordsetType;
    property RecordLocks: Byte read Get_RecordLocks write Set_RecordLocks;
    property ScrollBars: Byte read Get_ScrollBars write Set_ScrollBars;
    property RecordSelectors: WordBool read Get_RecordSelectors write Set_RecordSelectors;
    property NavigationButtons: WordBool read Get_NavigationButtons write Set_NavigationButtons;
    property DividingLines: WordBool read Get_DividingLines write Set_DividingLines;
    property AutoResize: WordBool read Get_AutoResize write Set_AutoResize;
    property AutoCenter: WordBool read Get_AutoCenter write Set_AutoCenter;
    property PopUp: WordBool read Get_PopUp write Set_PopUp;
    property Modal: WordBool read Get_Modal write Set_Modal;
    property BorderStyle: Byte read Get_BorderStyle write Set_BorderStyle;
    property ControlBox: WordBool read Get_ControlBox write Set_ControlBox;
    property MinMaxButtons: Byte read Get_MinMaxButtons write Set_MinMaxButtons;
    property CloseButton: WordBool read Get_CloseButton write Set_CloseButton;
    property WhatsThisButton: WordBool read Get_WhatsThisButton write Set_WhatsThisButton;
    property Width: Smallint read Get_Width write Set_Width;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureSizeMode: Byte read Get_PictureSizeMode write Set_PictureSizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property Cycle: Byte read Get_Cycle write Set_Cycle;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property Toolbar: WideString read Get_Toolbar write Set_Toolbar;
    property ShortcutMenu: WordBool read Get_ShortcutMenu write Set_ShortcutMenu;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property GridX: Smallint read Get_GridX write Set_GridX;
    property GridY: Smallint read Get_GridY write Set_GridY;
    property LayoutForPrint: WordBool read Get_LayoutForPrint write Set_LayoutForPrint;
    property FastLaserPrinting: WordBool read Get_FastLaserPrinting write Set_FastLaserPrinting;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property RowHeight: Smallint read Get_RowHeight write Set_RowHeight;
    property DatasheetFontName: WideString read Get_DatasheetFontName write Set_DatasheetFontName;
    property DatasheetFontHeight: Smallint read Get_DatasheetFontHeight write Set_DatasheetFontHeight;
    property DatasheetFontWeight: Smallint read Get_DatasheetFontWeight write Set_DatasheetFontWeight;
    property DatasheetFontItalic: WordBool read Get_DatasheetFontItalic write Set_DatasheetFontItalic;
    property DatasheetFontUnderline: WordBool read Get_DatasheetFontUnderline write Set_DatasheetFontUnderline;
    property DatasheetGridlinesBehavior: Byte read Get_DatasheetGridlinesBehavior write Set_DatasheetGridlinesBehavior;
    property DatasheetGridlinesColor: Integer read Get_DatasheetGridlinesColor write Set_DatasheetGridlinesColor;
    property DatasheetCellsEffect: Byte read Get_DatasheetCellsEffect write Set_DatasheetCellsEffect;
    property DatasheetForeColor: Integer read Get_DatasheetForeColor write Set_DatasheetForeColor;
    property DatasheetBackColor: Integer read Get_DatasheetBackColor write Set_DatasheetBackColor;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Smallint read Get_Count write Set_Count;
    property Page: Integer read Get_Page write Set_Page;
    property Pages: Smallint read Get_Pages write Set_Pages;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Painting: WordBool read Get_Painting write Set_Painting;
    property FrozenColumns: Smallint read Get_FrozenColumns write Set_FrozenColumns;
    property Name: WideString read Get_Name write Set_Name;
    property PaletteSource: WideString read Get_PaletteSource write Set_PaletteSource;
    property Tag: WideString read Get_Tag write Set_Tag;
    property OnMenu: WideString read Get_OnMenu write Set_OnMenu;
    property OnCurrent1: WideString read Get_OnCurrent write Set_OnCurrent;
    property OnInsert: WideString read Get_OnInsert write Set_OnInsert;
    property BeforeInsert: WideString read Get_BeforeInsert write Set_BeforeInsert;
    property AfterInsert: WideString read Get_AfterInsert write Set_AfterInsert;
    property BeforeUpdate: WideString read Get_BeforeUpdate write Set_BeforeUpdate;
    property AfterUpdate: WideString read Get_AfterUpdate write Set_AfterUpdate;
    property OnDelete1: WideString read Get_OnDelete write Set_OnDelete;
    property BeforeDelConfirm: WideString read Get_BeforeDelConfirm write Set_BeforeDelConfirm;
    property AfterDelConfirm: WideString read Get_AfterDelConfirm write Set_AfterDelConfirm;
    property OnOpen1: WideString read Get_OnOpen write Set_OnOpen;
    property OnLoad1: WideString read Get_OnLoad write Set_OnLoad;
    property OnResize1: WideString read Get_OnResize write Set_OnResize;
    property OnUnload1: WideString read Get_OnUnload write Set_OnUnload;
    property OnClose1: WideString read Get_OnClose write Set_OnClose;
    property OnActivate1: WideString read Get_OnActivate write Set_OnActivate;
    property OnDeactivate1: WideString read Get_OnDeactivate write Set_OnDeactivate;
    property OnGotFocus1: WideString read Get_OnGotFocus write Set_OnGotFocus;
    property OnLostFocus1: WideString read Get_OnLostFocus write Set_OnLostFocus;
    property OnClick1: WideString read Get_OnClick write Set_OnClick;
    property OnDblClick1: WideString read Get_OnDblClick write Set_OnDblClick;
    property OnMouseDown1: WideString read Get_OnMouseDown write Set_OnMouseDown;
    property OnMouseMove1: WideString read Get_OnMouseMove write Set_OnMouseMove;
    property OnMouseUp1: WideString read Get_OnMouseUp write Set_OnMouseUp;
    property OnKeyDown1: WideString read Get_OnKeyDown write Set_OnKeyDown;
    property OnKeyUp1: WideString read Get_OnKeyUp write Set_OnKeyUp;
    property OnKeyPress1: WideString read Get_OnKeyPress write Set_OnKeyPress;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property OnError1: WideString read Get_OnError write Set_OnError;
    property OnFilter1: WideString read Get_OnFilter write Set_OnFilter;
    property OnApplyFilter1: WideString read Get_OnApplyFilter write Set_OnApplyFilter;
    property OnTimer1: WideString read Get_OnTimer write Set_OnTimer;
    property TimerInterval: Integer read Get_TimerInterval write Set_TimerInterval;
    property Dirty: WordBool read Get_Dirty write Set_Dirty;
    property WindowWidth: Smallint read Get_WindowWidth write Set_WindowWidth;
    property WindowHeight: Smallint read Get_WindowHeight write Set_WindowHeight;
    property CurrentView: Smallint read Get_CurrentView write Set_CurrentView;
    property CurrentSectionTop: Smallint read Get_CurrentSectionTop write Set_CurrentSectionTop;
    property CurrentSectionLeft: Smallint read Get_CurrentSectionLeft write Set_CurrentSectionLeft;
    property SelLeft: Integer read Get_SelLeft write Set_SelLeft;
    property SelTop: Integer read Get_SelTop write Set_SelTop;
    property SelWidth: Integer read Get_SelWidth write Set_SelWidth;
    property SelHeight: Integer read Get_SelHeight write Set_SelHeight;
    property CurrentRecord: Integer read Get_CurrentRecord write Set_CurrentRecord;
    property InsideHeight: Integer read Get_InsideHeight write Set_InsideHeight;
    property InsideWidth: Integer read Get_InsideWidth write Set_InsideWidth;
    property HasModule: WordBool read Get_HasModule write Set_HasModule;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAccessReport provides a Create and CreateRemote method to          
// create instances of the default interface _Report exposed by              
// the CoClass AccessReport. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccessReport = class
    class function Create: _Report;
    class function CreateRemote(const MachineName: string): _Report;
  end;

  TAccessReportOpen = procedure(ASender: TObject; out Cancel: Smallint) of object;
  TAccessReportError = procedure(ASender: TObject; var DataErr: Smallint; out Response: Smallint) of object;
  TAccessReportNoData = procedure(ASender: TObject; out Cancel: Smallint) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAccessReport
// Help String      : 
// Default Interface: _Report
// Def. Intf. DISP? : No
// Event   Interface: _ReportEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAccessReportProperties= class;
{$ENDIF}
  TAccessReport = class(TOleServer)
  private
    FOnOpen: TAccessReportOpen;
    FOnClose: TNotifyEvent;
    FOnActivate: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnError: TAccessReportError;
    FOnNoData: TAccessReportNoData;
    FOnPage: TNotifyEvent;
    FIntf:        _Report;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAccessReportProperties;
    function      GetServerProperties: TAccessReportProperties;
{$ENDIF}
    function      GetDefaultInterface: _Report;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_FormName: WideString;
    procedure Set_FormName(const pRet: WideString);
    function Get_RecordSource: WideString;
    procedure Set_RecordSource(const pRet: WideString);
    function Get_Filter: WideString;
    procedure Set_Filter(const pRet: WideString);
    function Get_FilterOn: WordBool;
    procedure Set_FilterOn(pRet: WordBool);
    function Get_OrderBy: WideString;
    procedure Set_OrderBy(const pRet: WideString);
    function Get_OrderByOn: WordBool;
    procedure Set_OrderByOn(pRet: WordBool);
    function Get_Caption: WideString;
    procedure Set_Caption(const pRet: WideString);
    function Get_RecordLocks: Byte;
    procedure Set_RecordLocks(pRet: Byte);
    function Get_PageHeader: Byte;
    procedure Set_PageHeader(pRet: Byte);
    function Get_PageFooter: Byte;
    procedure Set_PageFooter(pRet: Byte);
    function Get_DateGrouping: Byte;
    procedure Set_DateGrouping(pRet: Byte);
    function Get_GrpKeepTogether: Byte;
    procedure Set_GrpKeepTogether(pRet: Byte);
    function Get_MinButton: WordBool;
    procedure Set_MinButton(pRet: WordBool);
    function Get_MaxButton: WordBool;
    procedure Set_MaxButton(pRet: WordBool);
    function Get_Width: Smallint;
    procedure Set_Width(pRet: Smallint);
    function Get_Picture: WideString;
    procedure Set_Picture(const pRet: WideString);
    function Get_PictureType: Byte;
    procedure Set_PictureType(pRet: Byte);
    function Get_PictureSizeMode: Byte;
    procedure Set_PictureSizeMode(pRet: Byte);
    function Get_PictureAlignment: Byte;
    procedure Set_PictureAlignment(pRet: Byte);
    function Get_PictureTiling: WordBool;
    procedure Set_PictureTiling(pRet: WordBool);
    function Get_PicturePages: Byte;
    procedure Set_PicturePages(pRet: Byte);
    function Get_MenuBar: WideString;
    procedure Set_MenuBar(const pRet: WideString);
    function Get_Toolbar: WideString;
    procedure Set_Toolbar(const pRet: WideString);
    function Get_ShortcutMenuBar: WideString;
    procedure Set_ShortcutMenuBar(const pRet: WideString);
    function Get_GridX: Smallint;
    procedure Set_GridX(pRet: Smallint);
    function Get_GridY: Smallint;
    procedure Set_GridY(pRet: Smallint);
    function Get_LayoutForPrint: WordBool;
    procedure Set_LayoutForPrint(pRet: WordBool);
    function Get_FastLaserPrinting: WordBool;
    procedure Set_FastLaserPrinting(pRet: WordBool);
    function Get_HelpFile: WideString;
    procedure Set_HelpFile(const pRet: WideString);
    function Get_HelpContextId: Integer;
    procedure Set_HelpContextId(pRet: Integer);
    function Get_Hwnd: Integer;
    procedure Set_Hwnd(pRet: Integer);
    function Get_Count: Smallint;
    procedure Set_Count(pRet: Smallint);
    function Get_Page: Integer;
    procedure Set_Page(pRet: Integer);
    function Get_Pages: Smallint;
    procedure Set_Pages(pRet: Smallint);
    function Get_LogicalPageWidth: Integer;
    procedure Set_LogicalPageWidth(pRet: Integer);
    function Get_LogicalPageHeight: Integer;
    procedure Set_LogicalPageHeight(pRet: Integer);
    function Get_ZoomControl: Integer;
    procedure Set_ZoomControl(pRet: Integer);
    function Get_HasData: Integer;
    procedure Set_HasData(pRet: Integer);
    function Get_Left: Integer;
    procedure Set_Left(pRet: Integer);
    function Get_Top: Integer;
    procedure Set_Top(pRet: Integer);
    function Get_Height: Integer;
    procedure Set_Height(pRet: Integer);
    function Get_PrintSection: WordBool;
    procedure Set_PrintSection(pRet: WordBool);
    function Get_NextRecord: WordBool;
    procedure Set_NextRecord(pRet: WordBool);
    function Get_MoveLayout: WordBool;
    procedure Set_MoveLayout(pRet: WordBool);
    function Get_FormatCount: Smallint;
    procedure Set_FormatCount(pRet: Smallint);
    function Get_PrintCount: Smallint;
    procedure Set_PrintCount(pRet: Smallint);
    function Get_Visible: WordBool;
    procedure Set_Visible(pRet: WordBool);
    function Get_Painting: WordBool;
    procedure Set_Painting(pRet: WordBool);
    function Get_PrtMip: OleVariant;
    procedure Set_PrtMip(pRet: OleVariant);
    function Get_PrtDevMode: OleVariant;
    procedure Set_PrtDevMode(pRet: OleVariant);
    function Get_PrtDevNames: OleVariant;
    procedure Set_PrtDevNames(pRet: OleVariant);
    function Get_ForeColor: Integer;
    procedure Set_ForeColor(pRet: Integer);
    function Get_CurrentX: Single;
    procedure Set_CurrentX(pRet: Single);
    function Get_CurrentY: Single;
    procedure Set_CurrentY(pRet: Single);
    function Get_ScaleHeight: Single;
    procedure Set_ScaleHeight(pRet: Single);
    function Get_ScaleLeft: Single;
    procedure Set_ScaleLeft(pRet: Single);
    function Get_ScaleMode: Smallint;
    procedure Set_ScaleMode(pRet: Smallint);
    function Get_ScaleTop: Single;
    procedure Set_ScaleTop(pRet: Single);
    function Get_ScaleWidth: Single;
    procedure Set_ScaleWidth(pRet: Single);
    function Get_FontBold: Smallint;
    procedure Set_FontBold(pRet: Smallint);
    function Get_FontItalic: Smallint;
    procedure Set_FontItalic(pRet: Smallint);
    function Get_FontName: WideString;
    procedure Set_FontName(const pRet: WideString);
    function Get_FontSize: Smallint;
    procedure Set_FontSize(pRet: Smallint);
    function Get_FontUnderline: Smallint;
    procedure Set_FontUnderline(pRet: Smallint);
    function Get_DrawMode: Smallint;
    procedure Set_DrawMode(pRet: Smallint);
    function Get_DrawStyle: Smallint;
    procedure Set_DrawStyle(pRet: Smallint);
    function Get_DrawWidth: Smallint;
    procedure Set_DrawWidth(pRet: Smallint);
    function Get_FillColor: Integer;
    procedure Set_FillColor(pRet: Integer);
    function Get_FillStyle: Smallint;
    procedure Set_FillStyle(pRet: Smallint);
    function Get_Name: WideString;
    procedure Set_Name(const pRet: WideString);
    function Get_PaletteSource: WideString;
    procedure Set_PaletteSource(const pRet: WideString);
    function Get_Tag: WideString;
    procedure Set_Tag(const pRet: WideString);
    function Get_PaintPalette: OleVariant;
    procedure Set_PaintPalette(pRet: OleVariant);
    function Get_OnMenu: WideString;
    procedure Set_OnMenu(const pRet: WideString);
    function Get_OnOpen: WideString;
    procedure Set_OnOpen(const pRet: WideString);
    function Get_OnClose: WideString;
    procedure Set_OnClose(const pRet: WideString);
    function Get_OnActivate: WideString;
    procedure Set_OnActivate(const pRet: WideString);
    function Get_OnDeactivate: WideString;
    procedure Set_OnDeactivate(const pRet: WideString);
    function Get_OnNoData: WideString;
    procedure Set_OnNoData(const pRet: WideString);
    function Get_OnPage: WideString;
    procedure Set_OnPage(const pRet: WideString);
    function Get_OnError: WideString;
    procedure Set_OnError(const pRet: WideString);
    function Get_Dirty: WordBool;
    procedure Set_Dirty(pRet: WordBool);
    function Get_CurrentRecord: Integer;
    procedure Set_CurrentRecord(pRet: Integer);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_PicturePalette: OleVariant;
    procedure Set_PicturePalette(pRet: OleVariant);
    function Get_HasModule: WordBool;
    procedure Set_HasModule(pRet: WordBool);
    function Get_acHiddenCurrentPage: Integer;
    procedure Set_acHiddenCurrentPage(pRet: Integer);
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_ActiveControl: AccessControl;
    function Get_DefaultControl(ControlType: Integer): AccessControl;
    function Get_Section(Index: OleVariant): AccessSection;
    function Get_GroupLevel(Index: Integer): AccessGroupLevel;
    function Get_Report: AccessReport;
    function Get_Module: Module;
    function Get_Properties: Properties;
    function Get_Controls: Controls;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Report);
    procedure Disconnect; override;
    procedure Circle(flags: Smallint; X: Single; Y: Single; radius: Single; color: Integer; 
                     start: Single; end_: Single; aspect: Single);
    procedure Line(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single; color: Integer);
    procedure PSet(flags: Smallint; X: Single; Y: Single; color: Integer);
    procedure Scale(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single);
    function TextWidth(const Expr: WideString): Single;
    function TextHeight(const Expr: WideString): Single;
    procedure Print(const Expr: WideString);
    function _Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
    property DefaultInterface: _Report read GetDefaultInterface;
    property MinButton: WordBool read Get_MinButton write Set_MinButton;
    property MaxButton: WordBool read Get_MaxButton write Set_MaxButton;
    property LogicalPageWidth: Integer read Get_LogicalPageWidth write Set_LogicalPageWidth;
    property LogicalPageHeight: Integer read Get_LogicalPageHeight write Set_LogicalPageHeight;
    property ZoomControl: Integer read Get_ZoomControl write Set_ZoomControl;
    property PrtMip: OleVariant read Get_PrtMip write Set_PrtMip;
    property PrtDevMode: OleVariant read Get_PrtDevMode write Set_PrtDevMode;
    property PrtDevNames: OleVariant read Get_PrtDevNames write Set_PrtDevNames;
    property PaintPalette: OleVariant read Get_PaintPalette write Set_PaintPalette;
    property PictureData: OleVariant read Get_PictureData write Set_PictureData;
    property PicturePalette: OleVariant read Get_PicturePalette write Set_PicturePalette;
    property acHiddenCurrentPage: Integer read Get_acHiddenCurrentPage write Set_acHiddenCurrentPage;
    property Application: AccessApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ActiveControl: AccessControl read Get_ActiveControl;
    property DefaultControl[ControlType: Integer]: AccessControl read Get_DefaultControl;
    property Section[Index: OleVariant]: AccessSection read Get_Section;
    property GroupLevel[Index: Integer]: AccessGroupLevel read Get_GroupLevel;
    property Report: AccessReport read Get_Report;
    property Module: Module read Get_Module;
    property Properties: Properties read Get_Properties;
    property Controls: Controls read Get_Controls;
    property FormName: WideString read Get_FormName write Set_FormName;
    property RecordSource: WideString read Get_RecordSource write Set_RecordSource;
    property Filter: WideString read Get_Filter write Set_Filter;
    property FilterOn: WordBool read Get_FilterOn write Set_FilterOn;
    property OrderBy: WideString read Get_OrderBy write Set_OrderBy;
    property OrderByOn: WordBool read Get_OrderByOn write Set_OrderByOn;
    property Caption: WideString read Get_Caption write Set_Caption;
    property RecordLocks: Byte read Get_RecordLocks write Set_RecordLocks;
    property PageHeader: Byte read Get_PageHeader write Set_PageHeader;
    property PageFooter: Byte read Get_PageFooter write Set_PageFooter;
    property DateGrouping: Byte read Get_DateGrouping write Set_DateGrouping;
    property GrpKeepTogether: Byte read Get_GrpKeepTogether write Set_GrpKeepTogether;
    property Width: Smallint read Get_Width write Set_Width;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureSizeMode: Byte read Get_PictureSizeMode write Set_PictureSizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property PicturePages: Byte read Get_PicturePages write Set_PicturePages;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property Toolbar: WideString read Get_Toolbar write Set_Toolbar;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property GridX: Smallint read Get_GridX write Set_GridX;
    property GridY: Smallint read Get_GridY write Set_GridY;
    property LayoutForPrint: WordBool read Get_LayoutForPrint write Set_LayoutForPrint;
    property FastLaserPrinting: WordBool read Get_FastLaserPrinting write Set_FastLaserPrinting;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Smallint read Get_Count write Set_Count;
    property Page: Integer read Get_Page write Set_Page;
    property Pages: Smallint read Get_Pages write Set_Pages;
    property HasData: Integer read Get_HasData write Set_HasData;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Height: Integer read Get_Height write Set_Height;
    property PrintSection: WordBool read Get_PrintSection write Set_PrintSection;
    property NextRecord: WordBool read Get_NextRecord write Set_NextRecord;
    property MoveLayout: WordBool read Get_MoveLayout write Set_MoveLayout;
    property FormatCount: Smallint read Get_FormatCount write Set_FormatCount;
    property PrintCount: Smallint read Get_PrintCount write Set_PrintCount;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Painting: WordBool read Get_Painting write Set_Painting;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property CurrentX: Single read Get_CurrentX write Set_CurrentX;
    property CurrentY: Single read Get_CurrentY write Set_CurrentY;
    property ScaleHeight: Single read Get_ScaleHeight write Set_ScaleHeight;
    property ScaleLeft: Single read Get_ScaleLeft write Set_ScaleLeft;
    property ScaleMode: Smallint read Get_ScaleMode write Set_ScaleMode;
    property ScaleTop: Single read Get_ScaleTop write Set_ScaleTop;
    property ScaleWidth: Single read Get_ScaleWidth write Set_ScaleWidth;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property FontItalic: Smallint read Get_FontItalic write Set_FontItalic;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontUnderline: Smallint read Get_FontUnderline write Set_FontUnderline;
    property DrawMode: Smallint read Get_DrawMode write Set_DrawMode;
    property DrawStyle: Smallint read Get_DrawStyle write Set_DrawStyle;
    property DrawWidth: Smallint read Get_DrawWidth write Set_DrawWidth;
    property FillColor: Integer read Get_FillColor write Set_FillColor;
    property FillStyle: Smallint read Get_FillStyle write Set_FillStyle;
    property Name: WideString read Get_Name write Set_Name;
    property PaletteSource: WideString read Get_PaletteSource write Set_PaletteSource;
    property Tag: WideString read Get_Tag write Set_Tag;
    property OnMenu: WideString read Get_OnMenu write Set_OnMenu;
    property OnOpen1: WideString read Get_OnOpen write Set_OnOpen;
    property OnClose1: WideString read Get_OnClose write Set_OnClose;
    property OnActivate1: WideString read Get_OnActivate write Set_OnActivate;
    property OnDeactivate1: WideString read Get_OnDeactivate write Set_OnDeactivate;
    property OnNoData1: WideString read Get_OnNoData write Set_OnNoData;
    property OnPage1: WideString read Get_OnPage write Set_OnPage;
    property OnError1: WideString read Get_OnError write Set_OnError;
    property Dirty: WordBool read Get_Dirty write Set_Dirty;
    property CurrentRecord: Integer read Get_CurrentRecord write Set_CurrentRecord;
    property HasModule: WordBool read Get_HasModule write Set_HasModule;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAccessReportProperties read GetServerProperties;
{$ENDIF}
    property OnOpen: TAccessReportOpen read FOnOpen write FOnOpen;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnError: TAccessReportError read FOnError write FOnError;
    property OnNoData: TAccessReportNoData read FOnNoData write FOnNoData;
    property OnPage: TNotifyEvent read FOnPage write FOnPage;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAccessReport
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAccessReportProperties = class(TPersistent)
  private
    FServer:    TAccessReport;
    function    GetDefaultInterface: _Report;
    constructor Create(AServer: TAccessReport);
  protected
    function Get_FormName: WideString;
    procedure Set_FormName(const pRet: WideString);
    function Get_RecordSource: WideString;
    procedure Set_RecordSource(const pRet: WideString);
    function Get_Filter: WideString;
    procedure Set_Filter(const pRet: WideString);
    function Get_FilterOn: WordBool;
    procedure Set_FilterOn(pRet: WordBool);
    function Get_OrderBy: WideString;
    procedure Set_OrderBy(const pRet: WideString);
    function Get_OrderByOn: WordBool;
    procedure Set_OrderByOn(pRet: WordBool);
    function Get_Caption: WideString;
    procedure Set_Caption(const pRet: WideString);
    function Get_RecordLocks: Byte;
    procedure Set_RecordLocks(pRet: Byte);
    function Get_PageHeader: Byte;
    procedure Set_PageHeader(pRet: Byte);
    function Get_PageFooter: Byte;
    procedure Set_PageFooter(pRet: Byte);
    function Get_DateGrouping: Byte;
    procedure Set_DateGrouping(pRet: Byte);
    function Get_GrpKeepTogether: Byte;
    procedure Set_GrpKeepTogether(pRet: Byte);
    function Get_MinButton: WordBool;
    procedure Set_MinButton(pRet: WordBool);
    function Get_MaxButton: WordBool;
    procedure Set_MaxButton(pRet: WordBool);
    function Get_Width: Smallint;
    procedure Set_Width(pRet: Smallint);
    function Get_Picture: WideString;
    procedure Set_Picture(const pRet: WideString);
    function Get_PictureType: Byte;
    procedure Set_PictureType(pRet: Byte);
    function Get_PictureSizeMode: Byte;
    procedure Set_PictureSizeMode(pRet: Byte);
    function Get_PictureAlignment: Byte;
    procedure Set_PictureAlignment(pRet: Byte);
    function Get_PictureTiling: WordBool;
    procedure Set_PictureTiling(pRet: WordBool);
    function Get_PicturePages: Byte;
    procedure Set_PicturePages(pRet: Byte);
    function Get_MenuBar: WideString;
    procedure Set_MenuBar(const pRet: WideString);
    function Get_Toolbar: WideString;
    procedure Set_Toolbar(const pRet: WideString);
    function Get_ShortcutMenuBar: WideString;
    procedure Set_ShortcutMenuBar(const pRet: WideString);
    function Get_GridX: Smallint;
    procedure Set_GridX(pRet: Smallint);
    function Get_GridY: Smallint;
    procedure Set_GridY(pRet: Smallint);
    function Get_LayoutForPrint: WordBool;
    procedure Set_LayoutForPrint(pRet: WordBool);
    function Get_FastLaserPrinting: WordBool;
    procedure Set_FastLaserPrinting(pRet: WordBool);
    function Get_HelpFile: WideString;
    procedure Set_HelpFile(const pRet: WideString);
    function Get_HelpContextId: Integer;
    procedure Set_HelpContextId(pRet: Integer);
    function Get_Hwnd: Integer;
    procedure Set_Hwnd(pRet: Integer);
    function Get_Count: Smallint;
    procedure Set_Count(pRet: Smallint);
    function Get_Page: Integer;
    procedure Set_Page(pRet: Integer);
    function Get_Pages: Smallint;
    procedure Set_Pages(pRet: Smallint);
    function Get_LogicalPageWidth: Integer;
    procedure Set_LogicalPageWidth(pRet: Integer);
    function Get_LogicalPageHeight: Integer;
    procedure Set_LogicalPageHeight(pRet: Integer);
    function Get_ZoomControl: Integer;
    procedure Set_ZoomControl(pRet: Integer);
    function Get_HasData: Integer;
    procedure Set_HasData(pRet: Integer);
    function Get_Left: Integer;
    procedure Set_Left(pRet: Integer);
    function Get_Top: Integer;
    procedure Set_Top(pRet: Integer);
    function Get_Height: Integer;
    procedure Set_Height(pRet: Integer);
    function Get_PrintSection: WordBool;
    procedure Set_PrintSection(pRet: WordBool);
    function Get_NextRecord: WordBool;
    procedure Set_NextRecord(pRet: WordBool);
    function Get_MoveLayout: WordBool;
    procedure Set_MoveLayout(pRet: WordBool);
    function Get_FormatCount: Smallint;
    procedure Set_FormatCount(pRet: Smallint);
    function Get_PrintCount: Smallint;
    procedure Set_PrintCount(pRet: Smallint);
    function Get_Visible: WordBool;
    procedure Set_Visible(pRet: WordBool);
    function Get_Painting: WordBool;
    procedure Set_Painting(pRet: WordBool);
    function Get_PrtMip: OleVariant;
    procedure Set_PrtMip(pRet: OleVariant);
    function Get_PrtDevMode: OleVariant;
    procedure Set_PrtDevMode(pRet: OleVariant);
    function Get_PrtDevNames: OleVariant;
    procedure Set_PrtDevNames(pRet: OleVariant);
    function Get_ForeColor: Integer;
    procedure Set_ForeColor(pRet: Integer);
    function Get_CurrentX: Single;
    procedure Set_CurrentX(pRet: Single);
    function Get_CurrentY: Single;
    procedure Set_CurrentY(pRet: Single);
    function Get_ScaleHeight: Single;
    procedure Set_ScaleHeight(pRet: Single);
    function Get_ScaleLeft: Single;
    procedure Set_ScaleLeft(pRet: Single);
    function Get_ScaleMode: Smallint;
    procedure Set_ScaleMode(pRet: Smallint);
    function Get_ScaleTop: Single;
    procedure Set_ScaleTop(pRet: Single);
    function Get_ScaleWidth: Single;
    procedure Set_ScaleWidth(pRet: Single);
    function Get_FontBold: Smallint;
    procedure Set_FontBold(pRet: Smallint);
    function Get_FontItalic: Smallint;
    procedure Set_FontItalic(pRet: Smallint);
    function Get_FontName: WideString;
    procedure Set_FontName(const pRet: WideString);
    function Get_FontSize: Smallint;
    procedure Set_FontSize(pRet: Smallint);
    function Get_FontUnderline: Smallint;
    procedure Set_FontUnderline(pRet: Smallint);
    function Get_DrawMode: Smallint;
    procedure Set_DrawMode(pRet: Smallint);
    function Get_DrawStyle: Smallint;
    procedure Set_DrawStyle(pRet: Smallint);
    function Get_DrawWidth: Smallint;
    procedure Set_DrawWidth(pRet: Smallint);
    function Get_FillColor: Integer;
    procedure Set_FillColor(pRet: Integer);
    function Get_FillStyle: Smallint;
    procedure Set_FillStyle(pRet: Smallint);
    function Get_Name: WideString;
    procedure Set_Name(const pRet: WideString);
    function Get_PaletteSource: WideString;
    procedure Set_PaletteSource(const pRet: WideString);
    function Get_Tag: WideString;
    procedure Set_Tag(const pRet: WideString);
    function Get_PaintPalette: OleVariant;
    procedure Set_PaintPalette(pRet: OleVariant);
    function Get_OnMenu: WideString;
    procedure Set_OnMenu(const pRet: WideString);
    function Get_OnOpen: WideString;
    procedure Set_OnOpen(const pRet: WideString);
    function Get_OnClose: WideString;
    procedure Set_OnClose(const pRet: WideString);
    function Get_OnActivate: WideString;
    procedure Set_OnActivate(const pRet: WideString);
    function Get_OnDeactivate: WideString;
    procedure Set_OnDeactivate(const pRet: WideString);
    function Get_OnNoData: WideString;
    procedure Set_OnNoData(const pRet: WideString);
    function Get_OnPage: WideString;
    procedure Set_OnPage(const pRet: WideString);
    function Get_OnError: WideString;
    procedure Set_OnError(const pRet: WideString);
    function Get_Dirty: WordBool;
    procedure Set_Dirty(pRet: WordBool);
    function Get_CurrentRecord: Integer;
    procedure Set_CurrentRecord(pRet: Integer);
    function Get_PictureData: OleVariant;
    procedure Set_PictureData(pRet: OleVariant);
    function Get_PicturePalette: OleVariant;
    procedure Set_PicturePalette(pRet: OleVariant);
    function Get_HasModule: WordBool;
    procedure Set_HasModule(pRet: WordBool);
    function Get_acHiddenCurrentPage: Integer;
    procedure Set_acHiddenCurrentPage(pRet: Integer);
    function Get_Application: AccessApplication;
    function Get_Parent: IDispatch;
    function Get_ActiveControl: AccessControl;
    function Get_DefaultControl(ControlType: Integer): AccessControl;
    function Get_Section(Index: OleVariant): AccessSection;
    function Get_GroupLevel(Index: Integer): AccessGroupLevel;
    function Get_Report: AccessReport;
    function Get_Module: Module;
    function Get_Properties: Properties;
    function Get_Controls: Controls;
  public
    property DefaultInterface: _Report read GetDefaultInterface;
  published
    property FormName: WideString read Get_FormName write Set_FormName;
    property RecordSource: WideString read Get_RecordSource write Set_RecordSource;
    property Filter: WideString read Get_Filter write Set_Filter;
    property FilterOn: WordBool read Get_FilterOn write Set_FilterOn;
    property OrderBy: WideString read Get_OrderBy write Set_OrderBy;
    property OrderByOn: WordBool read Get_OrderByOn write Set_OrderByOn;
    property Caption: WideString read Get_Caption write Set_Caption;
    property RecordLocks: Byte read Get_RecordLocks write Set_RecordLocks;
    property PageHeader: Byte read Get_PageHeader write Set_PageHeader;
    property PageFooter: Byte read Get_PageFooter write Set_PageFooter;
    property DateGrouping: Byte read Get_DateGrouping write Set_DateGrouping;
    property GrpKeepTogether: Byte read Get_GrpKeepTogether write Set_GrpKeepTogether;
    property Width: Smallint read Get_Width write Set_Width;
    property Picture: WideString read Get_Picture write Set_Picture;
    property PictureType: Byte read Get_PictureType write Set_PictureType;
    property PictureSizeMode: Byte read Get_PictureSizeMode write Set_PictureSizeMode;
    property PictureAlignment: Byte read Get_PictureAlignment write Set_PictureAlignment;
    property PictureTiling: WordBool read Get_PictureTiling write Set_PictureTiling;
    property PicturePages: Byte read Get_PicturePages write Set_PicturePages;
    property MenuBar: WideString read Get_MenuBar write Set_MenuBar;
    property Toolbar: WideString read Get_Toolbar write Set_Toolbar;
    property ShortcutMenuBar: WideString read Get_ShortcutMenuBar write Set_ShortcutMenuBar;
    property GridX: Smallint read Get_GridX write Set_GridX;
    property GridY: Smallint read Get_GridY write Set_GridY;
    property LayoutForPrint: WordBool read Get_LayoutForPrint write Set_LayoutForPrint;
    property FastLaserPrinting: WordBool read Get_FastLaserPrinting write Set_FastLaserPrinting;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property HelpContextId: Integer read Get_HelpContextId write Set_HelpContextId;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Smallint read Get_Count write Set_Count;
    property Page: Integer read Get_Page write Set_Page;
    property Pages: Smallint read Get_Pages write Set_Pages;
    property HasData: Integer read Get_HasData write Set_HasData;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Height: Integer read Get_Height write Set_Height;
    property PrintSection: WordBool read Get_PrintSection write Set_PrintSection;
    property NextRecord: WordBool read Get_NextRecord write Set_NextRecord;
    property MoveLayout: WordBool read Get_MoveLayout write Set_MoveLayout;
    property FormatCount: Smallint read Get_FormatCount write Set_FormatCount;
    property PrintCount: Smallint read Get_PrintCount write Set_PrintCount;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Painting: WordBool read Get_Painting write Set_Painting;
    property ForeColor: Integer read Get_ForeColor write Set_ForeColor;
    property CurrentX: Single read Get_CurrentX write Set_CurrentX;
    property CurrentY: Single read Get_CurrentY write Set_CurrentY;
    property ScaleHeight: Single read Get_ScaleHeight write Set_ScaleHeight;
    property ScaleLeft: Single read Get_ScaleLeft write Set_ScaleLeft;
    property ScaleMode: Smallint read Get_ScaleMode write Set_ScaleMode;
    property ScaleTop: Single read Get_ScaleTop write Set_ScaleTop;
    property ScaleWidth: Single read Get_ScaleWidth write Set_ScaleWidth;
    property FontBold: Smallint read Get_FontBold write Set_FontBold;
    property FontItalic: Smallint read Get_FontItalic write Set_FontItalic;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Smallint read Get_FontSize write Set_FontSize;
    property FontUnderline: Smallint read Get_FontUnderline write Set_FontUnderline;
    property DrawMode: Smallint read Get_DrawMode write Set_DrawMode;
    property DrawStyle: Smallint read Get_DrawStyle write Set_DrawStyle;
    property DrawWidth: Smallint read Get_DrawWidth write Set_DrawWidth;
    property FillColor: Integer read Get_FillColor write Set_FillColor;
    property FillStyle: Smallint read Get_FillStyle write Set_FillStyle;
    property Name: WideString read Get_Name write Set_Name;
    property PaletteSource: WideString read Get_PaletteSource write Set_PaletteSource;
    property Tag: WideString read Get_Tag write Set_Tag;
    property OnMenu: WideString read Get_OnMenu write Set_OnMenu;
    property OnOpen1: WideString read Get_OnOpen write Set_OnOpen;
    property OnClose1: WideString read Get_OnClose write Set_OnClose;
    property OnActivate1: WideString read Get_OnActivate write Set_OnActivate;
    property OnDeactivate1: WideString read Get_OnDeactivate write Set_OnDeactivate;
    property OnNoData1: WideString read Get_OnNoData write Set_OnNoData;
    property OnPage1: WideString read Get_OnPage write Set_OnPage;
    property OnError1: WideString read Get_OnError write Set_OnError;
    property Dirty: WordBool read Get_Dirty write Set_Dirty;
    property CurrentRecord: Integer read Get_CurrentRecord write Set_CurrentRecord;
    property HasModule: WordBool read Get_HasModule write Set_HasModule;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAccessApplication provides a Create and CreateRemote method to          
// create instances of the default interface _Application exposed by              
// the CoClass AccessApplication. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccessApplication = class
    class function Create: _Application;
    class function CreateRemote(const MachineName: string): _Application;
  end;

// *********************************************************************//
// The Class CoAccessReferences provides a Create and CreateRemote method to          
// create instances of the default interface _References exposed by              
// the CoClass AccessReferences. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccessReferences = class
    class function Create: _References;
    class function CreateRemote(const MachineName: string): _References;
  end;

  TAccessReferencesItemAdded = procedure(ASender: TObject; const Reference: Reference) of object;
  TAccessReferencesItemRemoved = procedure(ASender: TObject; const Reference: Reference) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAccessReferences
// Help String      : 
// Default Interface: _References
// Def. Intf. DISP? : No
// Event   Interface: _References_Events
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAccessReferencesProperties= class;
{$ENDIF}
  TAccessReferences = class(TOleServer)
  private
    FOnItemAdded: TAccessReferencesItemAdded;
    FOnItemRemoved: TAccessReferencesItemRemoved;
    FIntf:        _References;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAccessReferencesProperties;
    function      GetServerProperties: TAccessReferencesProperties;
{$ENDIF}
    function      GetDefaultInterface: _References;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Parent: IDispatch;
    function Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _References);
    procedure Disconnect; override;
    function Item(var_: OleVariant): Reference;
    function _NewEnum: IUnknown;
    function AddFromGuid(const Guid: WideString; Major: Integer; Minor: Integer): Reference;
    function AddFromFile(const FileName: WideString): Reference;
    procedure Remove(const Reference: Reference);
    property DefaultInterface: _References read GetDefaultInterface;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAccessReferencesProperties read GetServerProperties;
{$ENDIF}
    property OnItemAdded: TAccessReferencesItemAdded read FOnItemAdded write FOnItemAdded;
    property OnItemRemoved: TAccessReferencesItemRemoved read FOnItemRemoved write FOnItemRemoved;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAccessReferences
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAccessReferencesProperties = class(TPersistent)
  private
    FServer:    TAccessReferences;
    function    GetDefaultInterface: _References;
    constructor Create(AServer: TAccessReferences);
  protected
    function Get_Parent: IDispatch;
    function Get_Count: Integer;
  public
    property DefaultInterface: _References read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoClass_ provides a Create and CreateRemote method to          
// create instances of the default interface _Dummy exposed by              
// the CoClass Class_. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoClass_ = class
    class function Create: _Dummy;
    class function CreateRemote(const MachineName: string): _Dummy;
  end;

// *********************************************************************//
// The Class Co___CodeModule provides a Create and CreateRemote method to          
// create instances of the default interface ___IVbaModule exposed by              
// the CoClass ___CodeModule. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co___CodeModule = class
    class function Create: ___IVbaModule;
    class function CreateRemote(const MachineName: string): ___IVbaModule;
  end;

// *********************************************************************//
// The Class Co___Editors provides a Create and CreateRemote method to          
// create instances of the default interface ___IVbaEditors exposed by              
// the CoClass ___Editors. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co___Editors = class
    class function Create: ___IVbaEditors;
    class function CreateRemote(const MachineName: string): ___IVbaEditors;
  end;

// *********************************************************************//
// The Class Co___Editor provides a Create and CreateRemote method to          
// create instances of the default interface ___IVbaEditor exposed by              
// the CoClass ___Editor. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co___Editor = class
    class function Create: ___IVbaEditor;
    class function CreateRemote(const MachineName: string): ___IVbaEditor;
  end;

// *********************************************************************//
// The Class Co___References provides a Create and CreateRemote method to          
// create instances of the default interface IVbaReferences exposed by              
// the CoClass ___References. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co___References = class
    class function Create: IVbaReferences;
    class function CreateRemote(const MachineName: string): IVbaReferences;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDoCmd.Create: IDoCmd;
begin
  Result := CreateComObject(CLASS_DoCmd) as IDoCmd;
end;

class function CoDoCmd.CreateRemote(const MachineName: string): IDoCmd;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DoCmd) as IDoCmd;
end;

procedure TDoCmd.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C547E761-9658-101B-81EE-00AA004750E2}';
    IntfIID:   '{C547E760-9658-101B-81EE-00AA004750E2}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDoCmd.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDoCmd;
  end;
end;

procedure TDoCmd.ConnectTo(svrIntf: IDoCmd);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDoCmd.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDoCmd.GetDefaultInterface: IDoCmd;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDoCmd.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDoCmdProperties.Create(Self);
{$ENDIF}
end;

destructor TDoCmd.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDoCmd.GetServerProperties: TDoCmdProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TDoCmd.AddMenu(MenuName: OleVariant; MenuMacroName: OleVariant; StatusBarText: OleVariant);
begin
  DefaultInterface.AddMenu(MenuName, MenuMacroName, StatusBarText);
end;

procedure TDoCmd.ApplyFilter;
begin
  DefaultInterface.ApplyFilter(EmptyParam, EmptyParam);
end;

procedure TDoCmd.ApplyFilter(FilterName: OleVariant);
begin
  DefaultInterface.ApplyFilter(FilterName, EmptyParam);
end;

procedure TDoCmd.ApplyFilter(FilterName: OleVariant; WhereCondition: OleVariant);
begin
  DefaultInterface.ApplyFilter(FilterName, WhereCondition);
end;

procedure TDoCmd.Beep;
begin
  DefaultInterface.Beep;
end;

procedure TDoCmd.CancelEvent;
begin
  DefaultInterface.CancelEvent;
end;

procedure TDoCmd.Close(ObjectType: AcObjectType; ObjectName: OleVariant; Save: AcCloseSave);
begin
  DefaultInterface.Close(ObjectType, ObjectName, Save);
end;

procedure TDoCmd.CopyObject(DestinationDatabase: OleVariant; NewName: OleVariant; 
                            SourceObjectType: AcObjectType; SourceObjectName: OleVariant);
begin
  DefaultInterface.CopyObject(DestinationDatabase, NewName, SourceObjectType, SourceObjectName);
end;

procedure TDoCmd.DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant);
begin
  DefaultInterface.DoMenuItem(MenuBar, MenuName, Command, EmptyParam, EmptyParam);
end;

procedure TDoCmd.DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant; 
                            Subcommand: OleVariant);
begin
  DefaultInterface.DoMenuItem(MenuBar, MenuName, Command, Subcommand, EmptyParam);
end;

procedure TDoCmd.DoMenuItem(MenuBar: OleVariant; MenuName: OleVariant; Command: OleVariant; 
                            Subcommand: OleVariant; Version: OleVariant);
begin
  DefaultInterface.DoMenuItem(MenuBar, MenuName, Command, Subcommand, Version);
end;

procedure TDoCmd.Echo(EchoOn: OleVariant);
begin
  DefaultInterface.Echo(EchoOn, EmptyParam);
end;

procedure TDoCmd.Echo(EchoOn: OleVariant; StatusBarText: OleVariant);
begin
  DefaultInterface.Echo(EchoOn, StatusBarText);
end;

procedure TDoCmd.FindNext;
begin
  DefaultInterface.FindNext;
end;

procedure TDoCmd.FindRecord(FindWhat: OleVariant; Match: AcFindMatch; MatchCase: OleVariant; 
                            Search: AcSearchDirection; SearchAsFormatted: OleVariant; 
                            OnlyCurrentField: AcFindField; FindFirst: OleVariant);
begin
  DefaultInterface.FindRecord(FindWhat, Match, MatchCase, Search, SearchAsFormatted, 
                              OnlyCurrentField, FindFirst);
end;

procedure TDoCmd.GoToControl(ControlName: OleVariant);
begin
  DefaultInterface.GoToControl(ControlName);
end;

procedure TDoCmd.GoToPage(PageNumber: OleVariant);
begin
  DefaultInterface.GoToPage(PageNumber, EmptyParam, EmptyParam);
end;

procedure TDoCmd.GoToPage(PageNumber: OleVariant; Right: OleVariant);
begin
  DefaultInterface.GoToPage(PageNumber, Right, EmptyParam);
end;

procedure TDoCmd.GoToPage(PageNumber: OleVariant; Right: OleVariant; Down: OleVariant);
begin
  DefaultInterface.GoToPage(PageNumber, Right, Down);
end;

procedure TDoCmd.GoToRecord(ObjectType: AcDataObjectType; ObjectName: OleVariant; 
                            Record_: AcRecord; Offset: OleVariant);
begin
  DefaultInterface.GoToRecord(ObjectType, ObjectName, Record_, Offset);
end;

procedure TDoCmd.Hourglass(HourglassOn: OleVariant);
begin
  DefaultInterface.Hourglass(HourglassOn);
end;

procedure TDoCmd.Maximize;
begin
  DefaultInterface.Maximize;
end;

procedure TDoCmd.Minimize;
begin
  DefaultInterface.Minimize;
end;

procedure TDoCmd.MoveSize;
begin
  DefaultInterface.MoveSize(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.MoveSize(Right: OleVariant);
begin
  DefaultInterface.MoveSize(Right, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.MoveSize(Right: OleVariant; Down: OleVariant);
begin
  DefaultInterface.MoveSize(Right, Down, EmptyParam, EmptyParam);
end;

procedure TDoCmd.MoveSize(Right: OleVariant; Down: OleVariant; Width: OleVariant);
begin
  DefaultInterface.MoveSize(Right, Down, Width, EmptyParam);
end;

procedure TDoCmd.MoveSize(Right: OleVariant; Down: OleVariant; Width: OleVariant; Height: OleVariant);
begin
  DefaultInterface.MoveSize(Right, Down, Width, Height);
end;

procedure TDoCmd.OpenForm(FormName: OleVariant; View: AcFormView; FilterName: OleVariant; 
                          WhereCondition: OleVariant; DataMode: AcFormOpenDataMode; 
                          WindowMode: AcWindowMode; OpenArgs: OleVariant);
begin
  DefaultInterface.OpenForm(FormName, View, FilterName, WhereCondition, DataMode, WindowMode, 
                            OpenArgs);
end;

procedure TDoCmd.OpenQuery(QueryName: OleVariant; View: AcView; DataMode: AcOpenDataMode);
begin
  DefaultInterface.OpenQuery(QueryName, View, DataMode);
end;

procedure TDoCmd.OpenTable(TableName: OleVariant; View: AcView; DataMode: AcOpenDataMode);
begin
  DefaultInterface.OpenTable(TableName, View, DataMode);
end;

procedure TDoCmd.PrintOut(PrintRange: AcPrintRange; PageFrom: OleVariant; PageTo: OleVariant; 
                          PrintQuality: AcPrintQuality; Copies: OleVariant; 
                          CollateCopies: OleVariant);
begin
  DefaultInterface.PrintOut(PrintRange, PageFrom, PageTo, PrintQuality, Copies, CollateCopies);
end;

procedure TDoCmd.Quit(Options: AcQuitOption);
begin
  DefaultInterface.Quit(Options);
end;

procedure TDoCmd.Requery;
begin
  DefaultInterface.Requery(EmptyParam);
end;

procedure TDoCmd.Requery(ControlName: OleVariant);
begin
  DefaultInterface.Requery(ControlName);
end;

procedure TDoCmd.RepaintObject(ObjectType: AcObjectType);
begin
  DefaultInterface.RepaintObject(ObjectType, EmptyParam);
end;

procedure TDoCmd.RepaintObject(ObjectType: AcObjectType; ObjectName: OleVariant);
begin
  DefaultInterface.RepaintObject(ObjectType, ObjectName);
end;

procedure TDoCmd.Rename(NewName: OleVariant; ObjectType: AcObjectType);
begin
  DefaultInterface.Rename(NewName, ObjectType, EmptyParam);
end;

procedure TDoCmd.Rename(NewName: OleVariant; ObjectType: AcObjectType; OldName: OleVariant);
begin
  DefaultInterface.Rename(NewName, ObjectType, OldName);
end;

procedure TDoCmd.Restore;
begin
  DefaultInterface.Restore;
end;

procedure TDoCmd.RunMacro(MacroName: OleVariant);
begin
  DefaultInterface.RunMacro(MacroName, EmptyParam, EmptyParam);
end;

procedure TDoCmd.RunMacro(MacroName: OleVariant; RepeatCount: OleVariant);
begin
  DefaultInterface.RunMacro(MacroName, RepeatCount, EmptyParam);
end;

procedure TDoCmd.RunMacro(MacroName: OleVariant; RepeatCount: OleVariant; 
                          RepeatExpression: OleVariant);
begin
  DefaultInterface.RunMacro(MacroName, RepeatCount, RepeatExpression);
end;

procedure TDoCmd.RunSQL(SQLStatement: OleVariant);
begin
  DefaultInterface.RunSQL(SQLStatement, EmptyParam);
end;

procedure TDoCmd.RunSQL(SQLStatement: OleVariant; UseTransaction: OleVariant);
begin
  DefaultInterface.RunSQL(SQLStatement, UseTransaction);
end;

procedure TDoCmd.SelectObject(ObjectType: AcObjectType);
begin
  DefaultInterface.SelectObject(ObjectType, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SelectObject(ObjectType: AcObjectType; ObjectName: OleVariant);
begin
  DefaultInterface.SelectObject(ObjectType, ObjectName, EmptyParam);
end;

procedure TDoCmd.SelectObject(ObjectType: AcObjectType; ObjectName: OleVariant; 
                              InDatabaseWindow: OleVariant);
begin
  DefaultInterface.SelectObject(ObjectType, ObjectName, InDatabaseWindow);
end;

procedure TDoCmd.SetWarnings(WarningsOn: OleVariant);
begin
  DefaultInterface.SetWarnings(WarningsOn);
end;

procedure TDoCmd.ShowAllRecords;
begin
  DefaultInterface.ShowAllRecords;
end;

procedure TDoCmd.OpenReport(ReportName: OleVariant; View: AcView);
begin
  DefaultInterface.OpenReport(ReportName, View, EmptyParam, EmptyParam);
end;

procedure TDoCmd.OpenReport(ReportName: OleVariant; View: AcView; FilterName: OleVariant);
begin
  DefaultInterface.OpenReport(ReportName, View, FilterName, EmptyParam);
end;

procedure TDoCmd.OpenReport(ReportName: OleVariant; View: AcView; FilterName: OleVariant; 
                            WhereCondition: OleVariant);
begin
  DefaultInterface.OpenReport(ReportName, View, FilterName, WhereCondition);
end;

procedure TDoCmd.TransferDatabase(TransferType: AcDataTransferType; DatabaseType: OleVariant; 
                                  DatabaseName: OleVariant; ObjectType: AcObjectType; 
                                  Source: OleVariant; Destination: OleVariant; 
                                  StructureOnly: OleVariant; StoreLogin: OleVariant);
begin
  DefaultInterface.TransferDatabase(TransferType, DatabaseType, DatabaseName, ObjectType, Source, 
                                    Destination, StructureOnly, StoreLogin);
end;

procedure TDoCmd.TransferSpreadsheet(TransferType: AcDataTransferType; 
                                     SpreadsheetType: AcSpreadSheetType);
begin
  DefaultInterface.TransferSpreadsheet(TransferType, SpreadsheetType, EmptyParam, EmptyParam, 
                                       EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.TransferSpreadsheet(TransferType: AcDataTransferType; 
                                     SpreadsheetType: AcSpreadSheetType; TableName: OleVariant);
begin
  DefaultInterface.TransferSpreadsheet(TransferType, SpreadsheetType, TableName, EmptyParam, 
                                       EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.TransferSpreadsheet(TransferType: AcDataTransferType; 
                                     SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                     FileName: OleVariant);
begin
  DefaultInterface.TransferSpreadsheet(TransferType, SpreadsheetType, TableName, FileName, 
                                       EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.TransferSpreadsheet(TransferType: AcDataTransferType; 
                                     SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                     FileName: OleVariant; HasFieldNames: OleVariant);
begin
  DefaultInterface.TransferSpreadsheet(TransferType, SpreadsheetType, TableName, FileName, 
                                       HasFieldNames, EmptyParam, EmptyParam);
end;

procedure TDoCmd.TransferSpreadsheet(TransferType: AcDataTransferType; 
                                     SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                     FileName: OleVariant; HasFieldNames: OleVariant; 
                                     Range: OleVariant);
begin
  DefaultInterface.TransferSpreadsheet(TransferType, SpreadsheetType, TableName, FileName, 
                                       HasFieldNames, Range, EmptyParam);
end;

procedure TDoCmd.TransferSpreadsheet(TransferType: AcDataTransferType; 
                                     SpreadsheetType: AcSpreadSheetType; TableName: OleVariant; 
                                     FileName: OleVariant; HasFieldNames: OleVariant; 
                                     Range: OleVariant; UseOA: OleVariant);
begin
  DefaultInterface.TransferSpreadsheet(TransferType, SpreadsheetType, TableName, FileName, 
                                       HasFieldNames, Range, UseOA);
end;

procedure TDoCmd.TransferText(TransferType: AcTextTransferType);
begin
  DefaultInterface.TransferText(TransferType, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                EmptyParam);
end;

procedure TDoCmd.TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant);
begin
  DefaultInterface.TransferText(TransferType, SpecificationName, EmptyParam, EmptyParam, 
                                EmptyParam, EmptyParam);
end;

procedure TDoCmd.TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                              TableName: OleVariant);
begin
  DefaultInterface.TransferText(TransferType, SpecificationName, TableName, EmptyParam, EmptyParam, 
                                EmptyParam);
end;

procedure TDoCmd.TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                              TableName: OleVariant; FileName: OleVariant);
begin
  DefaultInterface.TransferText(TransferType, SpecificationName, TableName, FileName, EmptyParam, 
                                EmptyParam);
end;

procedure TDoCmd.TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                              TableName: OleVariant; FileName: OleVariant; HasFieldNames: OleVariant);
begin
  DefaultInterface.TransferText(TransferType, SpecificationName, TableName, FileName, 
                                HasFieldNames, EmptyParam);
end;

procedure TDoCmd.TransferText(TransferType: AcTextTransferType; SpecificationName: OleVariant; 
                              TableName: OleVariant; FileName: OleVariant; 
                              HasFieldNames: OleVariant; HTMLTableName: OleVariant);
begin
  DefaultInterface.TransferText(TransferType, SpecificationName, TableName, FileName, 
                                HasFieldNames, HTMLTableName);
end;

procedure TDoCmd.OutputTo(ObjectType: AcOutputObjectType);
begin
  DefaultInterface.OutputTo(ObjectType, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant);
begin
  DefaultInterface.OutputTo(ObjectType, ObjectName, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                          OutputFormat: OleVariant);
begin
  DefaultInterface.OutputTo(ObjectType, ObjectName, OutputFormat, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                          OutputFormat: OleVariant; OutputFile: OleVariant);
begin
  DefaultInterface.OutputTo(ObjectType, ObjectName, OutputFormat, OutputFile, EmptyParam, EmptyParam);
end;

procedure TDoCmd.OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                          OutputFormat: OleVariant; OutputFile: OleVariant; AutoStart: OleVariant);
begin
  DefaultInterface.OutputTo(ObjectType, ObjectName, OutputFormat, OutputFile, AutoStart, EmptyParam);
end;

procedure TDoCmd.OutputTo(ObjectType: AcOutputObjectType; ObjectName: OleVariant; 
                          OutputFormat: OleVariant; OutputFile: OleVariant; AutoStart: OleVariant; 
                          TemplateFile: OleVariant);
begin
  DefaultInterface.OutputTo(ObjectType, ObjectName, OutputFormat, OutputFile, AutoStart, 
                            TemplateFile);
end;

procedure TDoCmd.DeleteObject(ObjectType: AcObjectType);
begin
  DefaultInterface.DeleteObject(ObjectType, EmptyParam);
end;

procedure TDoCmd.DeleteObject(ObjectType: AcObjectType; ObjectName: OleVariant);
begin
  DefaultInterface.DeleteObject(ObjectType, ObjectName);
end;

procedure TDoCmd.OpenModule;
begin
  DefaultInterface.OpenModule(EmptyParam, EmptyParam);
end;

procedure TDoCmd.OpenModule(ModuleName: OleVariant);
begin
  DefaultInterface.OpenModule(ModuleName, EmptyParam);
end;

procedure TDoCmd.OpenModule(ModuleName: OleVariant; ProcedureName: OleVariant);
begin
  DefaultInterface.OpenModule(ModuleName, ProcedureName);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType);
begin
  DefaultInterface.SendObject(ObjectType, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                              EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, EmptyParam, EmptyParam, EmptyParam, 
                              EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, EmptyParam, EmptyParam, 
                              EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, EmptyParam, EmptyParam, 
                              EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, Cc, EmptyParam, 
                              EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                            Bcc: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, Cc, Bcc, EmptyParam, 
                              EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                            Bcc: OleVariant; Subject: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, Cc, Bcc, Subject, 
                              EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                            Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, Cc, Bcc, Subject, 
                              MessageText, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                            Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant; 
                            EditMessage: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, Cc, Bcc, Subject, 
                              MessageText, EditMessage, EmptyParam);
end;

procedure TDoCmd.SendObject(ObjectType: AcSendObjectType; ObjectName: OleVariant; 
                            OutputFormat: OleVariant; To_: OleVariant; Cc: OleVariant; 
                            Bcc: OleVariant; Subject: OleVariant; MessageText: OleVariant; 
                            EditMessage: OleVariant; TemplateFile: OleVariant);
begin
  DefaultInterface.SendObject(ObjectType, ObjectName, OutputFormat, To_, Cc, Bcc, Subject, 
                              MessageText, EditMessage, TemplateFile);
end;

procedure TDoCmd.ShowToolbar(ToolbarName: OleVariant);
begin
  DefaultInterface.ShowToolbar(ToolbarName, EmptyParam);
end;

procedure TDoCmd.ShowToolbar(ToolbarName: OleVariant; Show: OleVariant);
begin
  DefaultInterface.ShowToolbar(ToolbarName, Show);
end;

procedure TDoCmd.Save(ObjectType: AcObjectType);
begin
  DefaultInterface.Save(ObjectType, EmptyParam);
end;

procedure TDoCmd.Save(ObjectType: AcObjectType; ObjectName: OleVariant);
begin
  DefaultInterface.Save(ObjectType, ObjectName);
end;

procedure TDoCmd.SetMenuItem(MenuIndex: OleVariant);
begin
  DefaultInterface.SetMenuItem(MenuIndex, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant);
begin
  DefaultInterface.SetMenuItem(MenuIndex, CommandIndex, EmptyParam, EmptyParam);
end;

procedure TDoCmd.SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant; 
                             SubcommandIndex: OleVariant);
begin
  DefaultInterface.SetMenuItem(MenuIndex, CommandIndex, SubcommandIndex, EmptyParam);
end;

procedure TDoCmd.SetMenuItem(MenuIndex: OleVariant; CommandIndex: OleVariant; 
                             SubcommandIndex: OleVariant; Flag: OleVariant);
begin
  DefaultInterface.SetMenuItem(MenuIndex, CommandIndex, SubcommandIndex, Flag);
end;

procedure TDoCmd.RunCommand(Command: AcCommand);
begin
  DefaultInterface.RunCommand(Command);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDoCmdProperties.Create(AServer: TDoCmd);
begin
  inherited Create;
  FServer := AServer;
end;

function TDoCmdProperties.GetDefaultInterface: IDoCmd;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoAccessHyperlink.Create: _Hyperlink;
begin
  Result := CreateComObject(CLASS_AccessHyperlink) as _Hyperlink;
end;

class function CoAccessHyperlink.CreateRemote(const MachineName: string): _Hyperlink;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccessHyperlink) as _Hyperlink;
end;

procedure TAccessHyperlink.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{50D56610-60AC-11CF-82C9-00AA004B9FE6}';
    IntfIID:   '{50D56611-60AC-11CF-82C9-00AA004B9FE6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAccessHyperlink.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Hyperlink;
  end;
end;

procedure TAccessHyperlink.ConnectTo(svrIntf: _Hyperlink);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAccessHyperlink.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAccessHyperlink.GetDefaultInterface: _Hyperlink;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAccessHyperlink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAccessHyperlinkProperties.Create(Self);
{$ENDIF}
end;

destructor TAccessHyperlink.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAccessHyperlink.GetServerProperties: TAccessHyperlinkProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAccessHyperlink.Get_SubAddress: WideString;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.SubAddress;
end;

procedure TAccessHyperlink.Set_SubAddress(pbstrResult: OleVariant);
  { Warning: The property SubAddress has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SubAddress := pbstrResult;
end;

function TAccessHyperlink.Get_Address: WideString;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Address;
end;

procedure TAccessHyperlink.Set_Address(pbstrResult: OleVariant);
  { Warning: The property Address has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Address := pbstrResult;
end;

procedure TAccessHyperlink.AddToFavorites;
begin
  DefaultInterface.AddToFavorites;
end;

procedure TAccessHyperlink.Follow(NewWindow: WordBool; AddHistory: WordBool; ExtraInfo: OleVariant; 
                                  Method: MsoExtraInfoMethod; const HeaderInfo: WideString);
begin
  DefaultInterface.Follow(NewWindow, AddHistory, ExtraInfo, Method, HeaderInfo);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAccessHyperlinkProperties.Create(AServer: TAccessHyperlink);
begin
  inherited Create;
  FServer := AServer;
end;

function TAccessHyperlinkProperties.GetDefaultInterface: _Hyperlink;
begin
  Result := FServer.DefaultInterface;
end;

function TAccessHyperlinkProperties.Get_SubAddress: WideString;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.SubAddress;
end;

procedure TAccessHyperlinkProperties.Set_SubAddress(pbstrResult: OleVariant);
  { Warning: The property SubAddress has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SubAddress := pbstrResult;
end;

function TAccessHyperlinkProperties.Get_Address: WideString;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Address;
end;

procedure TAccessHyperlinkProperties.Set_Address(pbstrResult: OleVariant);
  { Warning: The property Address has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Address := pbstrResult;
end;

{$ENDIF}

procedure TAccessControl.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{02F92C80-8F8E-101B-AF4E-00AA003F0F07}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessControl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Control;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessControl.GetControlInterface: _Control;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessControl.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessControl.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessControl.Get_Column(Index: Integer; Row: OleVariant): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Column[Index, Row];
end;

function TAccessControl.Get_Selected(lRow: Integer): Integer;
begin
    Result := DefaultInterface.Selected[lRow];
end;

procedure TAccessControl.Set_Selected(lRow: Integer; pRet: Integer);
begin
  DefaultInterface.Selected[lRow] := pRet;
end;

function TAccessControl.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessControl.Get_Form: AccessForm;
begin
    Result := DefaultInterface.Form;
end;

function TAccessControl.Get_Report: AccessReport;
begin
    Result := DefaultInterface.Report;
end;

function TAccessControl.Get_ItemData(Index: Integer): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ItemData[Index];
end;

function TAccessControl.Get_Object_: IDispatch;
begin
    Result := DefaultInterface.Object_;
end;

function TAccessControl.Get_ObjectVerbs(Index: Integer): WideString;
begin
    Result := DefaultInterface.ObjectVerbs[Index];
end;

function TAccessControl.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessControl.Get_ItemsSelected: _ItemsSelected;
begin
    Result := DefaultInterface.ItemsSelected;
end;

function TAccessControl.Get_Pages: Pages;
begin
    Result := DefaultInterface.Pages;
end;

function TAccessControl.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessControl.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

procedure TAccessControl.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessControl.Dropdown;
begin
  DefaultInterface.Dropdown;
end;

procedure TAccessControl.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessControl.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessControl.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessControl.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessControl._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessLabel.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3B06E947-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4341-F037-11CD-8701-00AA003F0F07}';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessLabel.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Label;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessLabel.GetControlInterface: _Label;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessLabel.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessLabel.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessLabel.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessLabel.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

procedure TAccessLabel.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessLabel._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessRectangle.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3B06E949-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4342-F037-11CD-8701-00AA003F0F07}';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessRectangle.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Rectangle;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessRectangle.GetControlInterface: _Rectangle;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessRectangle.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessRectangle.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessRectangle.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

procedure TAccessRectangle.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessRectangle._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessLine.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3B06E94B-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessLine.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Line;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessLine.GetControlInterface: _Line;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessLine.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessLine.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessLine.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

procedure TAccessLine.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessLine._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessImage.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3B06E94D-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4344-F037-11CD-8701-00AA003F0F07}';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessImage.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Image;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessImage.GetControlInterface: _Image;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessImage.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessImage.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessImage.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessImage.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessImage.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessImage.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

function TAccessImage.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessImage.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

function TAccessImage.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessImage.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessImage.Get_ObjectPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ObjectPalette;
end;

procedure TAccessImage.Set_ObjectPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_ObjectPalette(pRet);
end;

procedure TAccessImage.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessImage.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessImage.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessImage.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessImage._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessCommandButton.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E94F-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4345-F037-11CD-8701-00AA003F0F07}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnEnter) - Cardinal(Self);
end;

procedure TAccessCommandButton.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _CommandButton;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessCommandButton.GetControlInterface: _CommandButton;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessCommandButton.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessCommandButton.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessCommandButton.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessCommandButton.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessCommandButton.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessCommandButton.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

function TAccessCommandButton.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessCommandButton.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

function TAccessCommandButton.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessCommandButton.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessCommandButton.Get_ObjectPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ObjectPalette;
end;

procedure TAccessCommandButton.Set_ObjectPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_ObjectPalette(pRet);
end;

procedure TAccessCommandButton.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessCommandButton.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessCommandButton.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessCommandButton.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessCommandButton._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessOptionButton.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $0000080D, $0000080E, $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E951-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4346-F037-11CD-8701-00AA003F0F07}';
    EventCount: 6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessOptionButton.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _OptionButton;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessOptionButton.GetControlInterface: _OptionButton;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessOptionButton.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessOptionButton.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessOptionButton.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessOptionButton.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessOptionButton.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessOptionButton.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessOptionButton.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessOptionButton.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessOptionButton.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessOptionButton.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessOptionButton.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessOptionButton._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessCheckBox.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $0000080D, $0000080E, $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E953-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4347-F037-11CD-8701-00AA003F0F07}';
    EventCount: 6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessCheckBox.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Checkbox;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessCheckBox.GetControlInterface: _Checkbox;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessCheckBox.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessCheckBox.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessCheckBox.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessCheckBox.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessCheckBox.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessCheckBox.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessCheckBox.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessCheckBox.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessCheckBox.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessCheckBox.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessCheckBox.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessCheckBox.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessCheckBox._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessOptionGroup.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $0000080D, $0000080E, $000007E3, $0000081B);
  CControlData: TControlData2 = (
    ClassID: '{3B06E955-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4348-F037-11CD-8701-00AA003F0F07}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessOptionGroup.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _OptionGroup;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessOptionGroup.GetControlInterface: _OptionGroup;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessOptionGroup.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessOptionGroup.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessOptionGroup.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessOptionGroup.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessOptionGroup.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessOptionGroup.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessOptionGroup.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessOptionGroup.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessOptionGroup.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessOptionGroup.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessOptionGroup.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessOptionGroup.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessOptionGroup._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessBoundObjectFrame.InitControlData;
const
  CEventDispIDs: array [0..6] of DWORD = (
    $0000081C, $0000080D, $0000080E, $000007E3, $0000081B, $00000819,
    $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E957-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4349-F037-11CD-8701-00AA003F0F07}';
    EventCount: 7;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnUpdated) - Cardinal(Self);
end;

procedure TAccessBoundObjectFrame.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _BoundObjectFrame;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessBoundObjectFrame.GetControlInterface: _BoundObjectFrame;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessBoundObjectFrame.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessBoundObjectFrame.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessBoundObjectFrame.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessBoundObjectFrame.Get_Object_: IDispatch;
begin
    Result := DefaultInterface.Object_;
end;

function TAccessBoundObjectFrame.Get_ObjectVerbs(Index: Integer): WideString;
begin
    Result := DefaultInterface.ObjectVerbs[Index];
end;

function TAccessBoundObjectFrame.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessBoundObjectFrame.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessBoundObjectFrame.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessBoundObjectFrame.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

function TAccessBoundObjectFrame.Get_ObjectPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ObjectPalette;
end;

procedure TAccessBoundObjectFrame.Set_ObjectPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_ObjectPalette(pRet);
end;

procedure TAccessBoundObjectFrame.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessBoundObjectFrame.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessBoundObjectFrame.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessBoundObjectFrame.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessBoundObjectFrame._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessTextBox.InitControlData;
const
  CEventDispIDs: array [0..6] of DWORD = (
    $0000080D, $0000080E, $0000081D, $000007E3, $0000081B, $00000819,
    $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E945-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4340-F037-11CD-8701-00AA003F0F07}';
    EventCount: 7;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessTextBox.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Textbox;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessTextBox.GetControlInterface: _Textbox;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessTextBox.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessTextBox.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessTextBox.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessTextBox.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessTextBox.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessTextBox.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

function TAccessTextBox.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessTextBox.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessTextBox.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessTextBox.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessTextBox.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessTextBox.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessTextBox.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessTextBox._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessListBox.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $0000080D, $0000080E, $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E959-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E434B-F037-11CD-8701-00AA003F0F07}';
    EventCount: 6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessListBox.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _ListBox;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessListBox.GetControlInterface: _ListBox;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessListBox.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessListBox.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessListBox.Get_Column(Index: Integer; Row: OleVariant): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Column[Index, Row];
end;

function TAccessListBox.Get_Selected(lRow: Integer): Integer;
begin
    Result := DefaultInterface.Selected[lRow];
end;

procedure TAccessListBox.Set_Selected(lRow: Integer; pRet: Integer);
begin
  DefaultInterface.Selected[lRow] := pRet;
end;

function TAccessListBox.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessListBox.Get_ItemData(Index: Integer): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ItemData[Index];
end;

function TAccessListBox.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessListBox.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessListBox.Get_ItemsSelected: _ItemsSelected;
begin
    Result := DefaultInterface.ItemsSelected;
end;

function TAccessListBox.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

function TAccessListBox.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessListBox.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessListBox.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessListBox.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessListBox.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessListBox.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessListBox.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessListBox._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessComboBox.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $0000080D, $0000080E, $0000081D, $0000081E, $000007E3, $0000081B,
    $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E95B-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E434C-F037-11CD-8701-00AA003F0F07}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessComboBox.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Combobox;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessComboBox.GetControlInterface: _Combobox;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessComboBox.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessComboBox.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessComboBox.Get_Column(Index: Integer; Row: OleVariant): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Column[Index, Row];
end;

function TAccessComboBox.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessComboBox.Get_ItemData(Index: Integer): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ItemData[Index];
end;

function TAccessComboBox.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessComboBox.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessComboBox.Get_Hyperlink: _Hyperlink;
begin
    Result := DefaultInterface.Hyperlink;
end;

function TAccessComboBox.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessComboBox.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessComboBox.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessComboBox.Dropdown;
begin
  DefaultInterface.Dropdown;
end;

procedure TAccessComboBox.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessComboBox.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessComboBox.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessComboBox.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessComboBox._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessObjectFrame.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $0000081C, $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E95D-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E434D-F037-11CD-8701-00AA003F0F07}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnUpdated) - Cardinal(Self);
end;

procedure TAccessObjectFrame.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _ObjectFrame;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessObjectFrame.GetControlInterface: _ObjectFrame;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessObjectFrame.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessObjectFrame.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessObjectFrame.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessObjectFrame.Get_Object_: IDispatch;
begin
    Result := DefaultInterface.Object_;
end;

function TAccessObjectFrame.Get_ObjectVerbs(Index: Integer): WideString;
begin
    Result := DefaultInterface.ObjectVerbs[Index];
end;

function TAccessObjectFrame.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessObjectFrame.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessObjectFrame.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessObjectFrame.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

function TAccessObjectFrame.Get_OleData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OleData;
end;

procedure TAccessObjectFrame.Set_OleData(pRet: OleVariant);
begin
  DefaultInterface.Set_OleData(pRet);
end;

function TAccessObjectFrame.Get_ObjectPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ObjectPalette;
end;

procedure TAccessObjectFrame.Set_ObjectPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_ObjectPalette(pRet);
end;

procedure TAccessObjectFrame.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessObjectFrame.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessObjectFrame.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessObjectFrame.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessObjectFrame._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessPageBreak.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3B06E95F-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessPageBreak.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _PageBreak;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessPageBreak.GetControlInterface: _PageBreak;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessPageBreak.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessPageBreak.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessPageBreak.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

procedure TAccessPageBreak.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessPageBreak._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessToggleButton.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $0000080D, $0000080E, $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E961-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E434F-F037-11CD-8701-00AA003F0F07}';
    EventCount: 6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnBeforeUpdate) - Cardinal(Self);
end;

procedure TAccessToggleButton.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _ToggleButton;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessToggleButton.GetControlInterface: _ToggleButton;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessToggleButton.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessToggleButton.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessToggleButton.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessToggleButton.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessToggleButton.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessToggleButton.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessToggleButton.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

function TAccessToggleButton.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessToggleButton.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessToggleButton.Get_ObjectPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ObjectPalette;
end;

procedure TAccessToggleButton.Set_ObjectPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_ObjectPalette(pRet);
end;

procedure TAccessToggleButton.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessToggleButton.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessToggleButton.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessToggleButton.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessToggleButton.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessToggleButton._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessSubForm.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $000007E3, $0000081B);
  CControlData: TControlData2 = (
    ClassID: '{3B06E963-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4350-F037-11CD-8701-00AA003F0F07}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnEnter) - Cardinal(Self);
end;

procedure TAccessSubForm.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _SubForm;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessSubForm.GetControlInterface: _SubForm;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessSubForm.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessSubForm.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessSubForm.Get_Form: AccessForm;
begin
    Result := DefaultInterface.Form;
end;

function TAccessSubForm.Get_Report: AccessReport;
begin
    Result := DefaultInterface.Report;
end;

function TAccessSubForm.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessSubForm.Get_Controls: Controls;
begin
    Result := DefaultInterface.Controls;
end;

procedure TAccessSubForm.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessSubForm._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessSubForm.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessSubForm.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

procedure TAccessSubForm.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessSubReport.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $000007E3, $0000081B);
  CControlData: TControlData2 = (
    ClassID: '{3B06E965-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4351-F037-11CD-8701-00AA003F0F07}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnEnter) - Cardinal(Self);
end;

procedure TAccessSubReport.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _SubReport;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessSubReport.GetControlInterface: _SubReport;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessSubReport.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessSubReport.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessSubReport.Get_Form: AccessForm;
begin
    Result := DefaultInterface.Form;
end;

function TAccessSubReport.Get_Report: AccessReport;
begin
    Result := DefaultInterface.Report;
end;

procedure TAccessCustomControl.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $0000081C, $000007E3, $0000081B, $00000819, $0000081A);
  CControlData: TControlData2 = (
    ClassID: '{3B06E967-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4352-F037-11CD-8701-00AA003F0F07}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnUpdated) - Cardinal(Self);
end;

procedure TAccessCustomControl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _CustomControl;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessCustomControl.GetControlInterface: _CustomControl;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessCustomControl.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessCustomControl.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessCustomControl.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessCustomControl.Get_Object_: IDispatch;
begin
    Result := DefaultInterface.Object_;
end;

function TAccessCustomControl.Get_ObjectVerbs(Index: Integer): WideString;
begin
    Result := DefaultInterface.ObjectVerbs[Index];
end;

function TAccessCustomControl.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessCustomControl.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessCustomControl.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessCustomControl.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

function TAccessCustomControl.Get_OleData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OleData;
end;

procedure TAccessCustomControl.Set_OleData(pRet: OleVariant);
begin
  DefaultInterface.Set_OleData(pRet);
end;

function TAccessCustomControl.Get_ObjectPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ObjectPalette;
end;

procedure TAccessCustomControl.Set_ObjectPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_ObjectPalette(pRet);
end;

procedure TAccessCustomControl.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

procedure TAccessCustomControl.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessCustomControl.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessCustomControl.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessCustomControl._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessTabControl.InitControlData;
const
  CEventDispIDs: array [0..0] of DWORD = (
    $0000081D);
  CControlData: TControlData2 = (
    ClassID: '{3B06E970-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{3B06E972-E47C-11CD-8701-00AA003F0F07}';
    EventCount: 1;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnChange) - Cardinal(Self);
end;

procedure TAccessTabControl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _TabControl;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessTabControl.GetControlInterface: _TabControl;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessTabControl.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessTabControl.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessTabControl.Get_OldValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OldValue;
end;

function TAccessTabControl.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessTabControl.Get_Pages: Pages;
begin
    Result := DefaultInterface.Pages;
end;

function TAccessTabControl.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TAccessTabControl.Set_Value(pRet: OleVariant);
begin
  DefaultInterface.Set_Value(pRet);
end;

procedure TAccessTabControl.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessTabControl._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessPage.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3B06E973-E47C-11CD-8701-00AA003F0F07}';
    EventIID: '{3B06E975-E47C-11CD-8701-00AA003F0F07}';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessPage.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Page;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessPage.GetControlInterface: _Page;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessPage.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessPage.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessPage.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessPage.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

function TAccessPage.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessPage.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

procedure TAccessPage.SizeToFit;
begin
  DefaultInterface.SizeToFit;
end;

function TAccessPage._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

procedure TAccessPage.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessPage.Goto_;
begin
  DefaultInterface.Goto_;
end;

procedure TAccessPage.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

procedure TAccessSection.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{BC9E4355-F037-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4353-F037-11CD-8701-00AA003F0F07}';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAccessSection.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Section;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessSection.GetControlInterface: _Section;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessSection.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessSection.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessSection.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessSection.Get_Controls: Children;
begin
    Result := DefaultInterface.Controls;
end;

procedure TAccessGroupLevel.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $0000081F, $00000820, $00000821);
  CControlData: TControlData2 = (
    ClassID: '{BC9E4356-F037-11CD-8701-00AA003F0F07}';
    EventIID: '{BC9E4354-F037-11CD-8701-00AA003F0F07}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnFormat) - Cardinal(Self);
end;

procedure TAccessGroupLevel.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _GroupLevel;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAccessGroupLevel.GetControlInterface: _GroupLevel;
begin
  CreateControl;
  Result := FIntf;
end;

function TAccessGroupLevel.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessGroupLevel.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessGroupLevel.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

class function CoAccessForm.Create: _Form;
begin
  Result := CreateComObject(CLASS_AccessForm) as _Form;
end;

class function CoAccessForm.CreateRemote(const MachineName: string): _Form;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccessForm) as _Form;
end;

procedure TAccessForm.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{483615A0-74BE-101B-AF4E-00AA003F0F07}';
    IntfIID:   '{E5135D80-8F8D-101B-AF4E-00AA003F0F07}';
    EventIID:  '{331FDCFB-CF31-11CD-8701-00AA003F0F07}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAccessForm.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as _Form;
  end;
end;

procedure TAccessForm.ConnectTo(svrIntf: _Form);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TAccessForm.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TAccessForm.GetDefaultInterface: _Form;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAccessForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAccessFormProperties.Create(Self);
{$ENDIF}
end;

destructor TAccessForm.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAccessForm.GetServerProperties: TAccessFormProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TAccessForm.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    2067: if Assigned(FOnLoad) then
         FOnLoad(Self);
    2058: if Assigned(FOnCurrent) then
         FOnCurrent(Self);
    2059: if Assigned(FOnBeforeInsert) then
         FOnBeforeInsert(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2060: if Assigned(FOnAfterInsert) then
         FOnAfterInsert(Self);
    2061: if Assigned(FOnBeforeUpdate) then
         FOnBeforeUpdate(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2062: if Assigned(FOnAfterUpdate) then
         FOnAfterUpdate(Self);
    2063: if Assigned(FOnDelete) then
         FOnDelete(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2064: if Assigned(FOnBeforeDelConfirm) then
         FOnBeforeDelConfirm(Self,
                             Smallint((TVarData(Params[0]).VPointer)^) {out Smallint},
                             Smallint((TVarData(Params[1]).VPointer)^) {out Smallint});
    2065: if Assigned(FOnAfterDelConfirm) then
         FOnAfterDelConfirm(Self, Smallint((TVarData(Params[0]).VPointer)^) {var Smallint});
    2066: if Assigned(FOnOpen) then
         FOnOpen(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2068: if Assigned(FOnResize) then
         FOnResize(Self);
    2069: if Assigned(FOnUnload) then
         FOnUnload(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2070: if Assigned(FOnClose) then
         FOnClose(Self);
    2071: if Assigned(FOnActivate) then
         FOnActivate(Self);
    2072: if Assigned(FOnDeactivate) then
         FOnDeactivate(Self);
    2073: if Assigned(FOnGotFocus) then
         FOnGotFocus(Self);
    2074: if Assigned(FOnLostFocus) then
         FOnLostFocus(Self);
    -600: if Assigned(FOnClick) then
         FOnClick(Self);
    -601: if Assigned(FOnDblClick) then
         FOnDblClick(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    -605: if Assigned(FOnMouseDown) then
         FOnMouseDown(Self,
                      Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                      Smallint((TVarData(Params[1]).VPointer)^) {var Smallint},
                      Single((TVarData(Params[2]).VPointer)^) {var Single},
                      Single((TVarData(Params[3]).VPointer)^) {var Single});
    -606: if Assigned(FOnMouseMove) then
         FOnMouseMove(Self,
                      Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                      Smallint((TVarData(Params[1]).VPointer)^) {var Smallint},
                      Single((TVarData(Params[2]).VPointer)^) {var Single},
                      Single((TVarData(Params[3]).VPointer)^) {var Single});
    -607: if Assigned(FOnMouseUp) then
         FOnMouseUp(Self,
                    Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                    Smallint((TVarData(Params[1]).VPointer)^) {var Smallint},
                    Single((TVarData(Params[2]).VPointer)^) {var Single},
                    Single((TVarData(Params[3]).VPointer)^) {var Single});
    -602: if Assigned(FOnKeyDown) then
         FOnKeyDown(Self,
                    Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                    Smallint((TVarData(Params[1]).VPointer)^) {var Smallint});
    -603: if Assigned(FOnKeyPress) then
         FOnKeyPress(Self, Smallint((TVarData(Params[0]).VPointer)^) {var Smallint});
    -604: if Assigned(FOnKeyUp) then
         FOnKeyUp(Self,
                  Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                  Smallint((TVarData(Params[1]).VPointer)^) {var Smallint});
    2083: if Assigned(FOnError) then
         FOnError(Self,
                  Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                  Smallint((TVarData(Params[1]).VPointer)^) {out Smallint});
    2084: if Assigned(FOnTimer) then
         FOnTimer(Self);
    2155: if Assigned(FOnFilter) then
         FOnFilter(Self,
                   Smallint((TVarData(Params[0]).VPointer)^) {out Smallint},
                   Smallint((TVarData(Params[1]).VPointer)^) {var Smallint});
    2156: if Assigned(FOnApplyFilter) then
         FOnApplyFilter(Self,
                        Smallint((TVarData(Params[0]).VPointer)^) {out Smallint},
                        Smallint((TVarData(Params[1]).VPointer)^) {var Smallint});
  end; {case DispID}
end;

function TAccessForm.Get_FormName: WideString;
begin
    Result := DefaultInterface.FormName;
end;

procedure TAccessForm.Set_FormName(const pRet: WideString);
  { Warning: The property FormName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FormName := pRet;
end;

function TAccessForm.Get_RecordSource: WideString;
begin
    Result := DefaultInterface.RecordSource;
end;

procedure TAccessForm.Set_RecordSource(const pRet: WideString);
  { Warning: The property RecordSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RecordSource := pRet;
end;

function TAccessForm.Get_Filter: WideString;
begin
    Result := DefaultInterface.Filter;
end;

procedure TAccessForm.Set_Filter(const pRet: WideString);
  { Warning: The property Filter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Filter := pRet;
end;

function TAccessForm.Get_FilterOn: WordBool;
begin
    Result := DefaultInterface.FilterOn;
end;

procedure TAccessForm.Set_FilterOn(pRet: WordBool);
begin
  DefaultInterface.Set_FilterOn(pRet);
end;

function TAccessForm.Get_OrderBy: WideString;
begin
    Result := DefaultInterface.OrderBy;
end;

procedure TAccessForm.Set_OrderBy(const pRet: WideString);
  { Warning: The property OrderBy has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OrderBy := pRet;
end;

function TAccessForm.Get_OrderByOn: WordBool;
begin
    Result := DefaultInterface.OrderByOn;
end;

procedure TAccessForm.Set_OrderByOn(pRet: WordBool);
begin
  DefaultInterface.Set_OrderByOn(pRet);
end;

function TAccessForm.Get_AllowFilters: WordBool;
begin
    Result := DefaultInterface.AllowFilters;
end;

procedure TAccessForm.Set_AllowFilters(pRet: WordBool);
begin
  DefaultInterface.Set_AllowFilters(pRet);
end;

function TAccessForm.Get_Caption: WideString;
begin
    Result := DefaultInterface.Caption;
end;

procedure TAccessForm.Set_Caption(const pRet: WideString);
  { Warning: The property Caption has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Caption := pRet;
end;

function TAccessForm.Get_DefaultView: Byte;
begin
    Result := DefaultInterface.DefaultView;
end;

procedure TAccessForm.Set_DefaultView(pRet: Byte);
begin
  DefaultInterface.Set_DefaultView(pRet);
end;

function TAccessForm.Get_ViewsAllowed: Byte;
begin
    Result := DefaultInterface.ViewsAllowed;
end;

procedure TAccessForm.Set_ViewsAllowed(pRet: Byte);
begin
  DefaultInterface.Set_ViewsAllowed(pRet);
end;

function TAccessForm.Get_AllowEditing: WordBool;
begin
    Result := DefaultInterface.AllowEditing;
end;

procedure TAccessForm.Set_AllowEditing(pRet: WordBool);
begin
  DefaultInterface.Set_AllowEditing(pRet);
end;

function TAccessForm.Get_DefaultEditing: Smallint;
begin
    Result := DefaultInterface.DefaultEditing;
end;

procedure TAccessForm.Set_DefaultEditing(pRet: Smallint);
begin
  DefaultInterface.Set_DefaultEditing(pRet);
end;

function TAccessForm.Get_AllowEdits: WordBool;
begin
    Result := DefaultInterface.AllowEdits;
end;

procedure TAccessForm.Set_AllowEdits(pRet: WordBool);
begin
  DefaultInterface.Set_AllowEdits(pRet);
end;

function TAccessForm.Get_AllowDeletions: WordBool;
begin
    Result := DefaultInterface.AllowDeletions;
end;

procedure TAccessForm.Set_AllowDeletions(pRet: WordBool);
begin
  DefaultInterface.Set_AllowDeletions(pRet);
end;

function TAccessForm.Get_AllowAdditions: WordBool;
begin
    Result := DefaultInterface.AllowAdditions;
end;

procedure TAccessForm.Set_AllowAdditions(pRet: WordBool);
begin
  DefaultInterface.Set_AllowAdditions(pRet);
end;

function TAccessForm.Get_DataEntry: WordBool;
begin
    Result := DefaultInterface.DataEntry;
end;

procedure TAccessForm.Set_DataEntry(pRet: WordBool);
begin
  DefaultInterface.Set_DataEntry(pRet);
end;

function TAccessForm.Get_AllowUpdating: Byte;
begin
    Result := DefaultInterface.AllowUpdating;
end;

procedure TAccessForm.Set_AllowUpdating(pRet: Byte);
begin
  DefaultInterface.Set_AllowUpdating(pRet);
end;

function TAccessForm.Get_RecordsetType: Byte;
begin
    Result := DefaultInterface.RecordsetType;
end;

procedure TAccessForm.Set_RecordsetType(pRet: Byte);
begin
  DefaultInterface.Set_RecordsetType(pRet);
end;

function TAccessForm.Get_RecordLocks: Byte;
begin
    Result := DefaultInterface.RecordLocks;
end;

procedure TAccessForm.Set_RecordLocks(pRet: Byte);
begin
  DefaultInterface.Set_RecordLocks(pRet);
end;

function TAccessForm.Get_ScrollBars: Byte;
begin
    Result := DefaultInterface.ScrollBars;
end;

procedure TAccessForm.Set_ScrollBars(pRet: Byte);
begin
  DefaultInterface.Set_ScrollBars(pRet);
end;

function TAccessForm.Get_RecordSelectors: WordBool;
begin
    Result := DefaultInterface.RecordSelectors;
end;

procedure TAccessForm.Set_RecordSelectors(pRet: WordBool);
begin
  DefaultInterface.Set_RecordSelectors(pRet);
end;

function TAccessForm.Get_NavigationButtons: WordBool;
begin
    Result := DefaultInterface.NavigationButtons;
end;

procedure TAccessForm.Set_NavigationButtons(pRet: WordBool);
begin
  DefaultInterface.Set_NavigationButtons(pRet);
end;

function TAccessForm.Get_DividingLines: WordBool;
begin
    Result := DefaultInterface.DividingLines;
end;

procedure TAccessForm.Set_DividingLines(pRet: WordBool);
begin
  DefaultInterface.Set_DividingLines(pRet);
end;

function TAccessForm.Get_AutoResize: WordBool;
begin
    Result := DefaultInterface.AutoResize;
end;

procedure TAccessForm.Set_AutoResize(pRet: WordBool);
begin
  DefaultInterface.Set_AutoResize(pRet);
end;

function TAccessForm.Get_AutoCenter: WordBool;
begin
    Result := DefaultInterface.AutoCenter;
end;

procedure TAccessForm.Set_AutoCenter(pRet: WordBool);
begin
  DefaultInterface.Set_AutoCenter(pRet);
end;

function TAccessForm.Get_PopUp: WordBool;
begin
    Result := DefaultInterface.PopUp;
end;

procedure TAccessForm.Set_PopUp(pRet: WordBool);
begin
  DefaultInterface.Set_PopUp(pRet);
end;

function TAccessForm.Get_Modal: WordBool;
begin
    Result := DefaultInterface.Modal;
end;

procedure TAccessForm.Set_Modal(pRet: WordBool);
begin
  DefaultInterface.Set_Modal(pRet);
end;

function TAccessForm.Get_BorderStyle: Byte;
begin
    Result := DefaultInterface.BorderStyle;
end;

procedure TAccessForm.Set_BorderStyle(pRet: Byte);
begin
  DefaultInterface.Set_BorderStyle(pRet);
end;

function TAccessForm.Get_ControlBox: WordBool;
begin
    Result := DefaultInterface.ControlBox;
end;

procedure TAccessForm.Set_ControlBox(pRet: WordBool);
begin
  DefaultInterface.Set_ControlBox(pRet);
end;

function TAccessForm.Get_MinButton: WordBool;
begin
    Result := DefaultInterface.MinButton;
end;

procedure TAccessForm.Set_MinButton(pRet: WordBool);
begin
  DefaultInterface.Set_MinButton(pRet);
end;

function TAccessForm.Get_MaxButton: WordBool;
begin
    Result := DefaultInterface.MaxButton;
end;

procedure TAccessForm.Set_MaxButton(pRet: WordBool);
begin
  DefaultInterface.Set_MaxButton(pRet);
end;

function TAccessForm.Get_MinMaxButtons: Byte;
begin
    Result := DefaultInterface.MinMaxButtons;
end;

procedure TAccessForm.Set_MinMaxButtons(pRet: Byte);
begin
  DefaultInterface.Set_MinMaxButtons(pRet);
end;

function TAccessForm.Get_CloseButton: WordBool;
begin
    Result := DefaultInterface.CloseButton;
end;

procedure TAccessForm.Set_CloseButton(pRet: WordBool);
begin
  DefaultInterface.Set_CloseButton(pRet);
end;

function TAccessForm.Get_WhatsThisButton: WordBool;
begin
    Result := DefaultInterface.WhatsThisButton;
end;

procedure TAccessForm.Set_WhatsThisButton(pRet: WordBool);
begin
  DefaultInterface.Set_WhatsThisButton(pRet);
end;

function TAccessForm.Get_Width: Smallint;
begin
    Result := DefaultInterface.Width;
end;

procedure TAccessForm.Set_Width(pRet: Smallint);
begin
  DefaultInterface.Set_Width(pRet);
end;

function TAccessForm.Get_Picture: WideString;
begin
    Result := DefaultInterface.Picture;
end;

procedure TAccessForm.Set_Picture(const pRet: WideString);
  { Warning: The property Picture has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Picture := pRet;
end;

function TAccessForm.Get_PictureType: Byte;
begin
    Result := DefaultInterface.PictureType;
end;

procedure TAccessForm.Set_PictureType(pRet: Byte);
begin
  DefaultInterface.Set_PictureType(pRet);
end;

function TAccessForm.Get_PictureSizeMode: Byte;
begin
    Result := DefaultInterface.PictureSizeMode;
end;

procedure TAccessForm.Set_PictureSizeMode(pRet: Byte);
begin
  DefaultInterface.Set_PictureSizeMode(pRet);
end;

function TAccessForm.Get_PictureAlignment: Byte;
begin
    Result := DefaultInterface.PictureAlignment;
end;

procedure TAccessForm.Set_PictureAlignment(pRet: Byte);
begin
  DefaultInterface.Set_PictureAlignment(pRet);
end;

function TAccessForm.Get_PictureTiling: WordBool;
begin
    Result := DefaultInterface.PictureTiling;
end;

procedure TAccessForm.Set_PictureTiling(pRet: WordBool);
begin
  DefaultInterface.Set_PictureTiling(pRet);
end;

function TAccessForm.Get_Cycle: Byte;
begin
    Result := DefaultInterface.Cycle;
end;

procedure TAccessForm.Set_Cycle(pRet: Byte);
begin
  DefaultInterface.Set_Cycle(pRet);
end;

function TAccessForm.Get_MenuBar: WideString;
begin
    Result := DefaultInterface.MenuBar;
end;

procedure TAccessForm.Set_MenuBar(const pRet: WideString);
  { Warning: The property MenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.MenuBar := pRet;
end;

function TAccessForm.Get_Toolbar: WideString;
begin
    Result := DefaultInterface.Toolbar;
end;

procedure TAccessForm.Set_Toolbar(const pRet: WideString);
  { Warning: The property Toolbar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Toolbar := pRet;
end;

function TAccessForm.Get_ShortcutMenu: WordBool;
begin
    Result := DefaultInterface.ShortcutMenu;
end;

procedure TAccessForm.Set_ShortcutMenu(pRet: WordBool);
begin
  DefaultInterface.Set_ShortcutMenu(pRet);
end;

function TAccessForm.Get_ShortcutMenuBar: WideString;
begin
    Result := DefaultInterface.ShortcutMenuBar;
end;

procedure TAccessForm.Set_ShortcutMenuBar(const pRet: WideString);
  { Warning: The property ShortcutMenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ShortcutMenuBar := pRet;
end;

function TAccessForm.Get_GridX: Smallint;
begin
    Result := DefaultInterface.GridX;
end;

procedure TAccessForm.Set_GridX(pRet: Smallint);
begin
  DefaultInterface.Set_GridX(pRet);
end;

function TAccessForm.Get_GridY: Smallint;
begin
    Result := DefaultInterface.GridY;
end;

procedure TAccessForm.Set_GridY(pRet: Smallint);
begin
  DefaultInterface.Set_GridY(pRet);
end;

function TAccessForm.Get_LayoutForPrint: WordBool;
begin
    Result := DefaultInterface.LayoutForPrint;
end;

procedure TAccessForm.Set_LayoutForPrint(pRet: WordBool);
begin
  DefaultInterface.Set_LayoutForPrint(pRet);
end;

function TAccessForm.Get_FastLaserPrinting: WordBool;
begin
    Result := DefaultInterface.FastLaserPrinting;
end;

procedure TAccessForm.Set_FastLaserPrinting(pRet: WordBool);
begin
  DefaultInterface.Set_FastLaserPrinting(pRet);
end;

function TAccessForm.Get_HelpFile: WideString;
begin
    Result := DefaultInterface.HelpFile;
end;

procedure TAccessForm.Set_HelpFile(const pRet: WideString);
  { Warning: The property HelpFile has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HelpFile := pRet;
end;

function TAccessForm.Get_HelpContextId: Integer;
begin
    Result := DefaultInterface.HelpContextId;
end;

procedure TAccessForm.Set_HelpContextId(pRet: Integer);
begin
  DefaultInterface.Set_HelpContextId(pRet);
end;

function TAccessForm.Get_RowHeight: Smallint;
begin
    Result := DefaultInterface.RowHeight;
end;

procedure TAccessForm.Set_RowHeight(pRet: Smallint);
begin
  DefaultInterface.Set_RowHeight(pRet);
end;

function TAccessForm.Get_DatasheetFontName: WideString;
begin
    Result := DefaultInterface.DatasheetFontName;
end;

procedure TAccessForm.Set_DatasheetFontName(const pRet: WideString);
  { Warning: The property DatasheetFontName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.DatasheetFontName := pRet;
end;

function TAccessForm.Get_DatasheetFontHeight: Smallint;
begin
    Result := DefaultInterface.DatasheetFontHeight;
end;

procedure TAccessForm.Set_DatasheetFontHeight(pRet: Smallint);
begin
  DefaultInterface.Set_DatasheetFontHeight(pRet);
end;

function TAccessForm.Get_DatasheetFontWeight: Smallint;
begin
    Result := DefaultInterface.DatasheetFontWeight;
end;

procedure TAccessForm.Set_DatasheetFontWeight(pRet: Smallint);
begin
  DefaultInterface.Set_DatasheetFontWeight(pRet);
end;

function TAccessForm.Get_DatasheetFontItalic: WordBool;
begin
    Result := DefaultInterface.DatasheetFontItalic;
end;

procedure TAccessForm.Set_DatasheetFontItalic(pRet: WordBool);
begin
  DefaultInterface.Set_DatasheetFontItalic(pRet);
end;

function TAccessForm.Get_DatasheetFontUnderline: WordBool;
begin
    Result := DefaultInterface.DatasheetFontUnderline;
end;

procedure TAccessForm.Set_DatasheetFontUnderline(pRet: WordBool);
begin
  DefaultInterface.Set_DatasheetFontUnderline(pRet);
end;

function TAccessForm.Get_TabularCharSet: Byte;
begin
    Result := DefaultInterface.TabularCharSet;
end;

procedure TAccessForm.Set_TabularCharSet(pRet: Byte);
begin
  DefaultInterface.Set_TabularCharSet(pRet);
end;

function TAccessForm.Get_DatasheetGridlinesBehavior: Byte;
begin
    Result := DefaultInterface.DatasheetGridlinesBehavior;
end;

procedure TAccessForm.Set_DatasheetGridlinesBehavior(pRet: Byte);
begin
  DefaultInterface.Set_DatasheetGridlinesBehavior(pRet);
end;

function TAccessForm.Get_DatasheetGridlinesColor: Integer;
begin
    Result := DefaultInterface.DatasheetGridlinesColor;
end;

procedure TAccessForm.Set_DatasheetGridlinesColor(pRet: Integer);
begin
  DefaultInterface.Set_DatasheetGridlinesColor(pRet);
end;

function TAccessForm.Get_DatasheetCellsEffect: Byte;
begin
    Result := DefaultInterface.DatasheetCellsEffect;
end;

procedure TAccessForm.Set_DatasheetCellsEffect(pRet: Byte);
begin
  DefaultInterface.Set_DatasheetCellsEffect(pRet);
end;

function TAccessForm.Get_DatasheetForeColor: Integer;
begin
    Result := DefaultInterface.DatasheetForeColor;
end;

procedure TAccessForm.Set_DatasheetForeColor(pRet: Integer);
begin
  DefaultInterface.Set_DatasheetForeColor(pRet);
end;

function TAccessForm.Get_ShowGrid: WordBool;
begin
    Result := DefaultInterface.ShowGrid;
end;

procedure TAccessForm.Set_ShowGrid(pRet: WordBool);
begin
  DefaultInterface.Set_ShowGrid(pRet);
end;

function TAccessForm.Get_DatasheetBackColor: Integer;
begin
    Result := DefaultInterface.DatasheetBackColor;
end;

procedure TAccessForm.Set_DatasheetBackColor(pRet: Integer);
begin
  DefaultInterface.Set_DatasheetBackColor(pRet);
end;

function TAccessForm.Get_Hwnd: Integer;
begin
    Result := DefaultInterface.Hwnd;
end;

procedure TAccessForm.Set_Hwnd(pRet: Integer);
begin
  DefaultInterface.Set_Hwnd(pRet);
end;

function TAccessForm.Get_Count: Smallint;
begin
    Result := DefaultInterface.Count;
end;

procedure TAccessForm.Set_Count(pRet: Smallint);
begin
  DefaultInterface.Set_Count(pRet);
end;

function TAccessForm.Get_Page: Integer;
begin
    Result := DefaultInterface.Page;
end;

procedure TAccessForm.Set_Page(pRet: Integer);
begin
  DefaultInterface.Set_Page(pRet);
end;

function TAccessForm.Get_Pages: Smallint;
begin
    Result := DefaultInterface.Pages;
end;

procedure TAccessForm.Set_Pages(pRet: Smallint);
begin
  DefaultInterface.Set_Pages(pRet);
end;

function TAccessForm.Get_LogicalPageWidth: Integer;
begin
    Result := DefaultInterface.LogicalPageWidth;
end;

procedure TAccessForm.Set_LogicalPageWidth(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageWidth(pRet);
end;

function TAccessForm.Get_LogicalPageHeight: Integer;
begin
    Result := DefaultInterface.LogicalPageHeight;
end;

procedure TAccessForm.Set_LogicalPageHeight(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageHeight(pRet);
end;

function TAccessForm.Get_ZoomControl: Integer;
begin
    Result := DefaultInterface.ZoomControl;
end;

procedure TAccessForm.Set_ZoomControl(pRet: Integer);
begin
  DefaultInterface.Set_ZoomControl(pRet);
end;

function TAccessForm.Get_Visible: WordBool;
begin
    Result := DefaultInterface.Visible;
end;

procedure TAccessForm.Set_Visible(pRet: WordBool);
begin
  DefaultInterface.Set_Visible(pRet);
end;

function TAccessForm.Get_Painting: WordBool;
begin
    Result := DefaultInterface.Painting;
end;

procedure TAccessForm.Set_Painting(pRet: WordBool);
begin
  DefaultInterface.Set_Painting(pRet);
end;

function TAccessForm.Get_PrtMip: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtMip;
end;

procedure TAccessForm.Set_PrtMip(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtMip(pRet);
end;

function TAccessForm.Get_PrtDevMode: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevMode;
end;

procedure TAccessForm.Set_PrtDevMode(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevMode(pRet);
end;

function TAccessForm.Get_PrtDevNames: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevNames;
end;

procedure TAccessForm.Set_PrtDevNames(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevNames(pRet);
end;

function TAccessForm.Get_FrozenColumns: Smallint;
begin
    Result := DefaultInterface.FrozenColumns;
end;

procedure TAccessForm.Set_FrozenColumns(pRet: Smallint);
begin
  DefaultInterface.Set_FrozenColumns(pRet);
end;

function TAccessForm.Get_Bookmark: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Bookmark;
end;

procedure TAccessForm.Set_Bookmark(pRet: OleVariant);
begin
  DefaultInterface.Set_Bookmark(pRet);
end;

function TAccessForm.Get_TabularFamily: Byte;
begin
    Result := DefaultInterface.TabularFamily;
end;

procedure TAccessForm.Set_TabularFamily(pRet: Byte);
begin
  DefaultInterface.Set_TabularFamily(pRet);
end;

function TAccessForm.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAccessForm.Set_Name(const pRet: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pRet;
end;

function TAccessForm.Get_PaletteSource: WideString;
begin
    Result := DefaultInterface.PaletteSource;
end;

procedure TAccessForm.Set_PaletteSource(const pRet: WideString);
  { Warning: The property PaletteSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PaletteSource := pRet;
end;

function TAccessForm.Get_Tag: WideString;
begin
    Result := DefaultInterface.Tag;
end;

procedure TAccessForm.Set_Tag(const pRet: WideString);
  { Warning: The property Tag has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Tag := pRet;
end;

function TAccessForm.Get_PaintPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PaintPalette;
end;

procedure TAccessForm.Set_PaintPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PaintPalette(pRet);
end;

function TAccessForm.Get_OnMenu: WideString;
begin
    Result := DefaultInterface.OnMenu;
end;

procedure TAccessForm.Set_OnMenu(const pRet: WideString);
  { Warning: The property OnMenu has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMenu := pRet;
end;

function TAccessForm.Get_OpenArgs: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OpenArgs;
end;

procedure TAccessForm.Set_OpenArgs(pRet: OleVariant);
begin
  DefaultInterface.Set_OpenArgs(pRet);
end;

function TAccessForm.Get_ConnectSynch: Smallint;
begin
    Result := DefaultInterface.ConnectSynch;
end;

procedure TAccessForm.Set_ConnectSynch(pRet: Smallint);
begin
  DefaultInterface.Set_ConnectSynch(pRet);
end;

function TAccessForm.Get_OnCurrent: WideString;
begin
    Result := DefaultInterface.OnCurrent;
end;

procedure TAccessForm.Set_OnCurrent(const pRet: WideString);
  { Warning: The property OnCurrent has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnCurrent := pRet;
end;

function TAccessForm.Get_OnInsert: WideString;
begin
    Result := DefaultInterface.OnInsert;
end;

procedure TAccessForm.Set_OnInsert(const pRet: WideString);
  { Warning: The property OnInsert has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnInsert := pRet;
end;

function TAccessForm.Get_BeforeInsert: WideString;
begin
    Result := DefaultInterface.BeforeInsert;
end;

procedure TAccessForm.Set_BeforeInsert(const pRet: WideString);
  { Warning: The property BeforeInsert has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.BeforeInsert := pRet;
end;

function TAccessForm.Get_AfterInsert: WideString;
begin
    Result := DefaultInterface.AfterInsert;
end;

procedure TAccessForm.Set_AfterInsert(const pRet: WideString);
  { Warning: The property AfterInsert has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.AfterInsert := pRet;
end;

function TAccessForm.Get_BeforeUpdate: WideString;
begin
    Result := DefaultInterface.BeforeUpdate;
end;

procedure TAccessForm.Set_BeforeUpdate(const pRet: WideString);
  { Warning: The property BeforeUpdate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.BeforeUpdate := pRet;
end;

function TAccessForm.Get_AfterUpdate: WideString;
begin
    Result := DefaultInterface.AfterUpdate;
end;

procedure TAccessForm.Set_AfterUpdate(const pRet: WideString);
  { Warning: The property AfterUpdate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.AfterUpdate := pRet;
end;

function TAccessForm.Get_OnDelete: WideString;
begin
    Result := DefaultInterface.OnDelete;
end;

procedure TAccessForm.Set_OnDelete(const pRet: WideString);
  { Warning: The property OnDelete has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDelete := pRet;
end;

function TAccessForm.Get_BeforeDelConfirm: WideString;
begin
    Result := DefaultInterface.BeforeDelConfirm;
end;

procedure TAccessForm.Set_BeforeDelConfirm(const pRet: WideString);
  { Warning: The property BeforeDelConfirm has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.BeforeDelConfirm := pRet;
end;

function TAccessForm.Get_AfterDelConfirm: WideString;
begin
    Result := DefaultInterface.AfterDelConfirm;
end;

procedure TAccessForm.Set_AfterDelConfirm(const pRet: WideString);
  { Warning: The property AfterDelConfirm has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.AfterDelConfirm := pRet;
end;

function TAccessForm.Get_OnOpen: WideString;
begin
    Result := DefaultInterface.OnOpen;
end;

procedure TAccessForm.Set_OnOpen(const pRet: WideString);
  { Warning: The property OnOpen has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnOpen := pRet;
end;

function TAccessForm.Get_OnLoad: WideString;
begin
    Result := DefaultInterface.OnLoad;
end;

procedure TAccessForm.Set_OnLoad(const pRet: WideString);
  { Warning: The property OnLoad has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnLoad := pRet;
end;

function TAccessForm.Get_OnResize: WideString;
begin
    Result := DefaultInterface.OnResize;
end;

procedure TAccessForm.Set_OnResize(const pRet: WideString);
  { Warning: The property OnResize has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnResize := pRet;
end;

function TAccessForm.Get_OnUnload: WideString;
begin
    Result := DefaultInterface.OnUnload;
end;

procedure TAccessForm.Set_OnUnload(const pRet: WideString);
  { Warning: The property OnUnload has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnUnload := pRet;
end;

function TAccessForm.Get_OnClose: WideString;
begin
    Result := DefaultInterface.OnClose;
end;

procedure TAccessForm.Set_OnClose(const pRet: WideString);
  { Warning: The property OnClose has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnClose := pRet;
end;

function TAccessForm.Get_OnActivate: WideString;
begin
    Result := DefaultInterface.OnActivate;
end;

procedure TAccessForm.Set_OnActivate(const pRet: WideString);
  { Warning: The property OnActivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnActivate := pRet;
end;

function TAccessForm.Get_OnDeactivate: WideString;
begin
    Result := DefaultInterface.OnDeactivate;
end;

procedure TAccessForm.Set_OnDeactivate(const pRet: WideString);
  { Warning: The property OnDeactivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDeactivate := pRet;
end;

function TAccessForm.Get_OnGotFocus: WideString;
begin
    Result := DefaultInterface.OnGotFocus;
end;

procedure TAccessForm.Set_OnGotFocus(const pRet: WideString);
  { Warning: The property OnGotFocus has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnGotFocus := pRet;
end;

function TAccessForm.Get_OnLostFocus: WideString;
begin
    Result := DefaultInterface.OnLostFocus;
end;

procedure TAccessForm.Set_OnLostFocus(const pRet: WideString);
  { Warning: The property OnLostFocus has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnLostFocus := pRet;
end;

function TAccessForm.Get_OnClick: WideString;
begin
    Result := DefaultInterface.OnClick;
end;

procedure TAccessForm.Set_OnClick(const pRet: WideString);
  { Warning: The property OnClick has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnClick := pRet;
end;

function TAccessForm.Get_OnDblClick: WideString;
begin
    Result := DefaultInterface.OnDblClick;
end;

procedure TAccessForm.Set_OnDblClick(const pRet: WideString);
  { Warning: The property OnDblClick has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDblClick := pRet;
end;

function TAccessForm.Get_OnMouseDown: WideString;
begin
    Result := DefaultInterface.OnMouseDown;
end;

procedure TAccessForm.Set_OnMouseDown(const pRet: WideString);
  { Warning: The property OnMouseDown has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMouseDown := pRet;
end;

function TAccessForm.Get_OnMouseMove: WideString;
begin
    Result := DefaultInterface.OnMouseMove;
end;

procedure TAccessForm.Set_OnMouseMove(const pRet: WideString);
  { Warning: The property OnMouseMove has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMouseMove := pRet;
end;

function TAccessForm.Get_OnMouseUp: WideString;
begin
    Result := DefaultInterface.OnMouseUp;
end;

procedure TAccessForm.Set_OnMouseUp(const pRet: WideString);
  { Warning: The property OnMouseUp has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMouseUp := pRet;
end;

function TAccessForm.Get_OnKeyDown: WideString;
begin
    Result := DefaultInterface.OnKeyDown;
end;

procedure TAccessForm.Set_OnKeyDown(const pRet: WideString);
  { Warning: The property OnKeyDown has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnKeyDown := pRet;
end;

function TAccessForm.Get_OnKeyUp: WideString;
begin
    Result := DefaultInterface.OnKeyUp;
end;

procedure TAccessForm.Set_OnKeyUp(const pRet: WideString);
  { Warning: The property OnKeyUp has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnKeyUp := pRet;
end;

function TAccessForm.Get_OnKeyPress: WideString;
begin
    Result := DefaultInterface.OnKeyPress;
end;

procedure TAccessForm.Set_OnKeyPress(const pRet: WideString);
  { Warning: The property OnKeyPress has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnKeyPress := pRet;
end;

function TAccessForm.Get_KeyPreview: WordBool;
begin
    Result := DefaultInterface.KeyPreview;
end;

procedure TAccessForm.Set_KeyPreview(pRet: WordBool);
begin
  DefaultInterface.Set_KeyPreview(pRet);
end;

function TAccessForm.Get_OnError: WideString;
begin
    Result := DefaultInterface.OnError;
end;

procedure TAccessForm.Set_OnError(const pRet: WideString);
  { Warning: The property OnError has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnError := pRet;
end;

function TAccessForm.Get_OnFilter: WideString;
begin
    Result := DefaultInterface.OnFilter;
end;

procedure TAccessForm.Set_OnFilter(const pRet: WideString);
  { Warning: The property OnFilter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnFilter := pRet;
end;

function TAccessForm.Get_OnApplyFilter: WideString;
begin
    Result := DefaultInterface.OnApplyFilter;
end;

procedure TAccessForm.Set_OnApplyFilter(const pRet: WideString);
  { Warning: The property OnApplyFilter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnApplyFilter := pRet;
end;

function TAccessForm.Get_OnTimer: WideString;
begin
    Result := DefaultInterface.OnTimer;
end;

procedure TAccessForm.Set_OnTimer(const pRet: WideString);
  { Warning: The property OnTimer has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnTimer := pRet;
end;

function TAccessForm.Get_TimerInterval: Integer;
begin
    Result := DefaultInterface.TimerInterval;
end;

procedure TAccessForm.Set_TimerInterval(pRet: Integer);
begin
  DefaultInterface.Set_TimerInterval(pRet);
end;

function TAccessForm.Get_Dirty: WordBool;
begin
    Result := DefaultInterface.Dirty;
end;

procedure TAccessForm.Set_Dirty(pRet: WordBool);
begin
  DefaultInterface.Set_Dirty(pRet);
end;

function TAccessForm.Get_WindowWidth: Smallint;
begin
    Result := DefaultInterface.WindowWidth;
end;

procedure TAccessForm.Set_WindowWidth(pRet: Smallint);
begin
  DefaultInterface.Set_WindowWidth(pRet);
end;

function TAccessForm.Get_WindowHeight: Smallint;
begin
    Result := DefaultInterface.WindowHeight;
end;

procedure TAccessForm.Set_WindowHeight(pRet: Smallint);
begin
  DefaultInterface.Set_WindowHeight(pRet);
end;

function TAccessForm.Get_CurrentView: Smallint;
begin
    Result := DefaultInterface.CurrentView;
end;

procedure TAccessForm.Set_CurrentView(pRet: Smallint);
begin
  DefaultInterface.Set_CurrentView(pRet);
end;

function TAccessForm.Get_CurrentSectionTop: Smallint;
begin
    Result := DefaultInterface.CurrentSectionTop;
end;

procedure TAccessForm.Set_CurrentSectionTop(pRet: Smallint);
begin
  DefaultInterface.Set_CurrentSectionTop(pRet);
end;

function TAccessForm.Get_CurrentSectionLeft: Smallint;
begin
    Result := DefaultInterface.CurrentSectionLeft;
end;

procedure TAccessForm.Set_CurrentSectionLeft(pRet: Smallint);
begin
  DefaultInterface.Set_CurrentSectionLeft(pRet);
end;

function TAccessForm.Get_SelLeft: Integer;
begin
    Result := DefaultInterface.SelLeft;
end;

procedure TAccessForm.Set_SelLeft(pRet: Integer);
begin
  DefaultInterface.Set_SelLeft(pRet);
end;

function TAccessForm.Get_SelTop: Integer;
begin
    Result := DefaultInterface.SelTop;
end;

procedure TAccessForm.Set_SelTop(pRet: Integer);
begin
  DefaultInterface.Set_SelTop(pRet);
end;

function TAccessForm.Get_SelWidth: Integer;
begin
    Result := DefaultInterface.SelWidth;
end;

procedure TAccessForm.Set_SelWidth(pRet: Integer);
begin
  DefaultInterface.Set_SelWidth(pRet);
end;

function TAccessForm.Get_SelHeight: Integer;
begin
    Result := DefaultInterface.SelHeight;
end;

procedure TAccessForm.Set_SelHeight(pRet: Integer);
begin
  DefaultInterface.Set_SelHeight(pRet);
end;

function TAccessForm.Get_CurrentRecord: Integer;
begin
    Result := DefaultInterface.CurrentRecord;
end;

procedure TAccessForm.Set_CurrentRecord(pRet: Integer);
begin
  DefaultInterface.Set_CurrentRecord(pRet);
end;

function TAccessForm.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessForm.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessForm.Get_InsideHeight: Integer;
begin
    Result := DefaultInterface.InsideHeight;
end;

procedure TAccessForm.Set_InsideHeight(pRet: Integer);
begin
  DefaultInterface.Set_InsideHeight(pRet);
end;

function TAccessForm.Get_InsideWidth: Integer;
begin
    Result := DefaultInterface.InsideWidth;
end;

procedure TAccessForm.Set_InsideWidth(pRet: Integer);
begin
  DefaultInterface.Set_InsideWidth(pRet);
end;

function TAccessForm.Get_PicturePalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PicturePalette;
end;

procedure TAccessForm.Set_PicturePalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PicturePalette(pRet);
end;

function TAccessForm.Get_HasModule: WordBool;
begin
    Result := DefaultInterface.HasModule;
end;

procedure TAccessForm.Set_HasModule(pRet: WordBool);
begin
  DefaultInterface.Set_HasModule(pRet);
end;

function TAccessForm.Get_acHiddenCurrentPage: Integer;
begin
    Result := DefaultInterface.acHiddenCurrentPage;
end;

procedure TAccessForm.Set_acHiddenCurrentPage(pRet: Integer);
begin
  DefaultInterface.Set_acHiddenCurrentPage(pRet);
end;

function TAccessForm.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessForm.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessForm.Get_NewRecord: Smallint;
begin
    Result := DefaultInterface.NewRecord;
end;

function TAccessForm.Get_ActiveControl: AccessControl;
begin
    Result := DefaultInterface.ActiveControl;
end;

function TAccessForm.Get_DefaultControl(ControlType: Integer): AccessControl;
begin
    Result := DefaultInterface.DefaultControl[ControlType];
end;

function TAccessForm.Get_Dynaset: IDispatch;
begin
    Result := DefaultInterface.Dynaset;
end;

function TAccessForm.Get_RecordsetClone: Recordset;
begin
    Result := DefaultInterface.RecordsetClone;
end;

function TAccessForm.Get_Section(var_: OleVariant): AccessSection;
begin
    Result := DefaultInterface.Section[var_];
end;

function TAccessForm.Get_Form: AccessForm;
begin
    Result := DefaultInterface.Form;
end;

function TAccessForm.Get_Module: Module;
begin
    Result := DefaultInterface.Module;
end;

function TAccessForm.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessForm.Get_ConnectControl: AccessControl;
begin
    Result := DefaultInterface.ConnectControl;
end;

function TAccessForm.Get_Controls: Controls;
begin
    Result := DefaultInterface.Controls;
end;

procedure TAccessForm.Undo;
begin
  DefaultInterface.Undo;
end;

procedure TAccessForm.Recalc;
begin
  DefaultInterface.Recalc;
end;

procedure TAccessForm.Requery;
begin
  DefaultInterface.Requery;
end;

procedure TAccessForm.Refresh;
begin
  DefaultInterface.Refresh;
end;

procedure TAccessForm.Repaint;
begin
  DefaultInterface.Repaint;
end;

procedure TAccessForm.GoToPage(PageNumber: Integer; Right: Integer; Down: Integer);
begin
  DefaultInterface.GoToPage(PageNumber, Right, Down);
end;

procedure TAccessForm.SetFocus;
begin
  DefaultInterface.SetFocus;
end;

function TAccessForm._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAccessFormProperties.Create(AServer: TAccessForm);
begin
  inherited Create;
  FServer := AServer;
end;

function TAccessFormProperties.GetDefaultInterface: _Form;
begin
  Result := FServer.DefaultInterface;
end;

function TAccessFormProperties.Get_FormName: WideString;
begin
    Result := DefaultInterface.FormName;
end;

procedure TAccessFormProperties.Set_FormName(const pRet: WideString);
  { Warning: The property FormName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FormName := pRet;
end;

function TAccessFormProperties.Get_RecordSource: WideString;
begin
    Result := DefaultInterface.RecordSource;
end;

procedure TAccessFormProperties.Set_RecordSource(const pRet: WideString);
  { Warning: The property RecordSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RecordSource := pRet;
end;

function TAccessFormProperties.Get_Filter: WideString;
begin
    Result := DefaultInterface.Filter;
end;

procedure TAccessFormProperties.Set_Filter(const pRet: WideString);
  { Warning: The property Filter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Filter := pRet;
end;

function TAccessFormProperties.Get_FilterOn: WordBool;
begin
    Result := DefaultInterface.FilterOn;
end;

procedure TAccessFormProperties.Set_FilterOn(pRet: WordBool);
begin
  DefaultInterface.Set_FilterOn(pRet);
end;

function TAccessFormProperties.Get_OrderBy: WideString;
begin
    Result := DefaultInterface.OrderBy;
end;

procedure TAccessFormProperties.Set_OrderBy(const pRet: WideString);
  { Warning: The property OrderBy has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OrderBy := pRet;
end;

function TAccessFormProperties.Get_OrderByOn: WordBool;
begin
    Result := DefaultInterface.OrderByOn;
end;

procedure TAccessFormProperties.Set_OrderByOn(pRet: WordBool);
begin
  DefaultInterface.Set_OrderByOn(pRet);
end;

function TAccessFormProperties.Get_AllowFilters: WordBool;
begin
    Result := DefaultInterface.AllowFilters;
end;

procedure TAccessFormProperties.Set_AllowFilters(pRet: WordBool);
begin
  DefaultInterface.Set_AllowFilters(pRet);
end;

function TAccessFormProperties.Get_Caption: WideString;
begin
    Result := DefaultInterface.Caption;
end;

procedure TAccessFormProperties.Set_Caption(const pRet: WideString);
  { Warning: The property Caption has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Caption := pRet;
end;

function TAccessFormProperties.Get_DefaultView: Byte;
begin
    Result := DefaultInterface.DefaultView;
end;

procedure TAccessFormProperties.Set_DefaultView(pRet: Byte);
begin
  DefaultInterface.Set_DefaultView(pRet);
end;

function TAccessFormProperties.Get_ViewsAllowed: Byte;
begin
    Result := DefaultInterface.ViewsAllowed;
end;

procedure TAccessFormProperties.Set_ViewsAllowed(pRet: Byte);
begin
  DefaultInterface.Set_ViewsAllowed(pRet);
end;

function TAccessFormProperties.Get_AllowEditing: WordBool;
begin
    Result := DefaultInterface.AllowEditing;
end;

procedure TAccessFormProperties.Set_AllowEditing(pRet: WordBool);
begin
  DefaultInterface.Set_AllowEditing(pRet);
end;

function TAccessFormProperties.Get_DefaultEditing: Smallint;
begin
    Result := DefaultInterface.DefaultEditing;
end;

procedure TAccessFormProperties.Set_DefaultEditing(pRet: Smallint);
begin
  DefaultInterface.Set_DefaultEditing(pRet);
end;

function TAccessFormProperties.Get_AllowEdits: WordBool;
begin
    Result := DefaultInterface.AllowEdits;
end;

procedure TAccessFormProperties.Set_AllowEdits(pRet: WordBool);
begin
  DefaultInterface.Set_AllowEdits(pRet);
end;

function TAccessFormProperties.Get_AllowDeletions: WordBool;
begin
    Result := DefaultInterface.AllowDeletions;
end;

procedure TAccessFormProperties.Set_AllowDeletions(pRet: WordBool);
begin
  DefaultInterface.Set_AllowDeletions(pRet);
end;

function TAccessFormProperties.Get_AllowAdditions: WordBool;
begin
    Result := DefaultInterface.AllowAdditions;
end;

procedure TAccessFormProperties.Set_AllowAdditions(pRet: WordBool);
begin
  DefaultInterface.Set_AllowAdditions(pRet);
end;

function TAccessFormProperties.Get_DataEntry: WordBool;
begin
    Result := DefaultInterface.DataEntry;
end;

procedure TAccessFormProperties.Set_DataEntry(pRet: WordBool);
begin
  DefaultInterface.Set_DataEntry(pRet);
end;

function TAccessFormProperties.Get_AllowUpdating: Byte;
begin
    Result := DefaultInterface.AllowUpdating;
end;

procedure TAccessFormProperties.Set_AllowUpdating(pRet: Byte);
begin
  DefaultInterface.Set_AllowUpdating(pRet);
end;

function TAccessFormProperties.Get_RecordsetType: Byte;
begin
    Result := DefaultInterface.RecordsetType;
end;

procedure TAccessFormProperties.Set_RecordsetType(pRet: Byte);
begin
  DefaultInterface.Set_RecordsetType(pRet);
end;

function TAccessFormProperties.Get_RecordLocks: Byte;
begin
    Result := DefaultInterface.RecordLocks;
end;

procedure TAccessFormProperties.Set_RecordLocks(pRet: Byte);
begin
  DefaultInterface.Set_RecordLocks(pRet);
end;

function TAccessFormProperties.Get_ScrollBars: Byte;
begin
    Result := DefaultInterface.ScrollBars;
end;

procedure TAccessFormProperties.Set_ScrollBars(pRet: Byte);
begin
  DefaultInterface.Set_ScrollBars(pRet);
end;

function TAccessFormProperties.Get_RecordSelectors: WordBool;
begin
    Result := DefaultInterface.RecordSelectors;
end;

procedure TAccessFormProperties.Set_RecordSelectors(pRet: WordBool);
begin
  DefaultInterface.Set_RecordSelectors(pRet);
end;

function TAccessFormProperties.Get_NavigationButtons: WordBool;
begin
    Result := DefaultInterface.NavigationButtons;
end;

procedure TAccessFormProperties.Set_NavigationButtons(pRet: WordBool);
begin
  DefaultInterface.Set_NavigationButtons(pRet);
end;

function TAccessFormProperties.Get_DividingLines: WordBool;
begin
    Result := DefaultInterface.DividingLines;
end;

procedure TAccessFormProperties.Set_DividingLines(pRet: WordBool);
begin
  DefaultInterface.Set_DividingLines(pRet);
end;

function TAccessFormProperties.Get_AutoResize: WordBool;
begin
    Result := DefaultInterface.AutoResize;
end;

procedure TAccessFormProperties.Set_AutoResize(pRet: WordBool);
begin
  DefaultInterface.Set_AutoResize(pRet);
end;

function TAccessFormProperties.Get_AutoCenter: WordBool;
begin
    Result := DefaultInterface.AutoCenter;
end;

procedure TAccessFormProperties.Set_AutoCenter(pRet: WordBool);
begin
  DefaultInterface.Set_AutoCenter(pRet);
end;

function TAccessFormProperties.Get_PopUp: WordBool;
begin
    Result := DefaultInterface.PopUp;
end;

procedure TAccessFormProperties.Set_PopUp(pRet: WordBool);
begin
  DefaultInterface.Set_PopUp(pRet);
end;

function TAccessFormProperties.Get_Modal: WordBool;
begin
    Result := DefaultInterface.Modal;
end;

procedure TAccessFormProperties.Set_Modal(pRet: WordBool);
begin
  DefaultInterface.Set_Modal(pRet);
end;

function TAccessFormProperties.Get_BorderStyle: Byte;
begin
    Result := DefaultInterface.BorderStyle;
end;

procedure TAccessFormProperties.Set_BorderStyle(pRet: Byte);
begin
  DefaultInterface.Set_BorderStyle(pRet);
end;

function TAccessFormProperties.Get_ControlBox: WordBool;
begin
    Result := DefaultInterface.ControlBox;
end;

procedure TAccessFormProperties.Set_ControlBox(pRet: WordBool);
begin
  DefaultInterface.Set_ControlBox(pRet);
end;

function TAccessFormProperties.Get_MinButton: WordBool;
begin
    Result := DefaultInterface.MinButton;
end;

procedure TAccessFormProperties.Set_MinButton(pRet: WordBool);
begin
  DefaultInterface.Set_MinButton(pRet);
end;

function TAccessFormProperties.Get_MaxButton: WordBool;
begin
    Result := DefaultInterface.MaxButton;
end;

procedure TAccessFormProperties.Set_MaxButton(pRet: WordBool);
begin
  DefaultInterface.Set_MaxButton(pRet);
end;

function TAccessFormProperties.Get_MinMaxButtons: Byte;
begin
    Result := DefaultInterface.MinMaxButtons;
end;

procedure TAccessFormProperties.Set_MinMaxButtons(pRet: Byte);
begin
  DefaultInterface.Set_MinMaxButtons(pRet);
end;

function TAccessFormProperties.Get_CloseButton: WordBool;
begin
    Result := DefaultInterface.CloseButton;
end;

procedure TAccessFormProperties.Set_CloseButton(pRet: WordBool);
begin
  DefaultInterface.Set_CloseButton(pRet);
end;

function TAccessFormProperties.Get_WhatsThisButton: WordBool;
begin
    Result := DefaultInterface.WhatsThisButton;
end;

procedure TAccessFormProperties.Set_WhatsThisButton(pRet: WordBool);
begin
  DefaultInterface.Set_WhatsThisButton(pRet);
end;

function TAccessFormProperties.Get_Width: Smallint;
begin
    Result := DefaultInterface.Width;
end;

procedure TAccessFormProperties.Set_Width(pRet: Smallint);
begin
  DefaultInterface.Set_Width(pRet);
end;

function TAccessFormProperties.Get_Picture: WideString;
begin
    Result := DefaultInterface.Picture;
end;

procedure TAccessFormProperties.Set_Picture(const pRet: WideString);
  { Warning: The property Picture has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Picture := pRet;
end;

function TAccessFormProperties.Get_PictureType: Byte;
begin
    Result := DefaultInterface.PictureType;
end;

procedure TAccessFormProperties.Set_PictureType(pRet: Byte);
begin
  DefaultInterface.Set_PictureType(pRet);
end;

function TAccessFormProperties.Get_PictureSizeMode: Byte;
begin
    Result := DefaultInterface.PictureSizeMode;
end;

procedure TAccessFormProperties.Set_PictureSizeMode(pRet: Byte);
begin
  DefaultInterface.Set_PictureSizeMode(pRet);
end;

function TAccessFormProperties.Get_PictureAlignment: Byte;
begin
    Result := DefaultInterface.PictureAlignment;
end;

procedure TAccessFormProperties.Set_PictureAlignment(pRet: Byte);
begin
  DefaultInterface.Set_PictureAlignment(pRet);
end;

function TAccessFormProperties.Get_PictureTiling: WordBool;
begin
    Result := DefaultInterface.PictureTiling;
end;

procedure TAccessFormProperties.Set_PictureTiling(pRet: WordBool);
begin
  DefaultInterface.Set_PictureTiling(pRet);
end;

function TAccessFormProperties.Get_Cycle: Byte;
begin
    Result := DefaultInterface.Cycle;
end;

procedure TAccessFormProperties.Set_Cycle(pRet: Byte);
begin
  DefaultInterface.Set_Cycle(pRet);
end;

function TAccessFormProperties.Get_MenuBar: WideString;
begin
    Result := DefaultInterface.MenuBar;
end;

procedure TAccessFormProperties.Set_MenuBar(const pRet: WideString);
  { Warning: The property MenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.MenuBar := pRet;
end;

function TAccessFormProperties.Get_Toolbar: WideString;
begin
    Result := DefaultInterface.Toolbar;
end;

procedure TAccessFormProperties.Set_Toolbar(const pRet: WideString);
  { Warning: The property Toolbar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Toolbar := pRet;
end;

function TAccessFormProperties.Get_ShortcutMenu: WordBool;
begin
    Result := DefaultInterface.ShortcutMenu;
end;

procedure TAccessFormProperties.Set_ShortcutMenu(pRet: WordBool);
begin
  DefaultInterface.Set_ShortcutMenu(pRet);
end;

function TAccessFormProperties.Get_ShortcutMenuBar: WideString;
begin
    Result := DefaultInterface.ShortcutMenuBar;
end;

procedure TAccessFormProperties.Set_ShortcutMenuBar(const pRet: WideString);
  { Warning: The property ShortcutMenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ShortcutMenuBar := pRet;
end;

function TAccessFormProperties.Get_GridX: Smallint;
begin
    Result := DefaultInterface.GridX;
end;

procedure TAccessFormProperties.Set_GridX(pRet: Smallint);
begin
  DefaultInterface.Set_GridX(pRet);
end;

function TAccessFormProperties.Get_GridY: Smallint;
begin
    Result := DefaultInterface.GridY;
end;

procedure TAccessFormProperties.Set_GridY(pRet: Smallint);
begin
  DefaultInterface.Set_GridY(pRet);
end;

function TAccessFormProperties.Get_LayoutForPrint: WordBool;
begin
    Result := DefaultInterface.LayoutForPrint;
end;

procedure TAccessFormProperties.Set_LayoutForPrint(pRet: WordBool);
begin
  DefaultInterface.Set_LayoutForPrint(pRet);
end;

function TAccessFormProperties.Get_FastLaserPrinting: WordBool;
begin
    Result := DefaultInterface.FastLaserPrinting;
end;

procedure TAccessFormProperties.Set_FastLaserPrinting(pRet: WordBool);
begin
  DefaultInterface.Set_FastLaserPrinting(pRet);
end;

function TAccessFormProperties.Get_HelpFile: WideString;
begin
    Result := DefaultInterface.HelpFile;
end;

procedure TAccessFormProperties.Set_HelpFile(const pRet: WideString);
  { Warning: The property HelpFile has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HelpFile := pRet;
end;

function TAccessFormProperties.Get_HelpContextId: Integer;
begin
    Result := DefaultInterface.HelpContextId;
end;

procedure TAccessFormProperties.Set_HelpContextId(pRet: Integer);
begin
  DefaultInterface.Set_HelpContextId(pRet);
end;

function TAccessFormProperties.Get_RowHeight: Smallint;
begin
    Result := DefaultInterface.RowHeight;
end;

procedure TAccessFormProperties.Set_RowHeight(pRet: Smallint);
begin
  DefaultInterface.Set_RowHeight(pRet);
end;

function TAccessFormProperties.Get_DatasheetFontName: WideString;
begin
    Result := DefaultInterface.DatasheetFontName;
end;

procedure TAccessFormProperties.Set_DatasheetFontName(const pRet: WideString);
  { Warning: The property DatasheetFontName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.DatasheetFontName := pRet;
end;

function TAccessFormProperties.Get_DatasheetFontHeight: Smallint;
begin
    Result := DefaultInterface.DatasheetFontHeight;
end;

procedure TAccessFormProperties.Set_DatasheetFontHeight(pRet: Smallint);
begin
  DefaultInterface.Set_DatasheetFontHeight(pRet);
end;

function TAccessFormProperties.Get_DatasheetFontWeight: Smallint;
begin
    Result := DefaultInterface.DatasheetFontWeight;
end;

procedure TAccessFormProperties.Set_DatasheetFontWeight(pRet: Smallint);
begin
  DefaultInterface.Set_DatasheetFontWeight(pRet);
end;

function TAccessFormProperties.Get_DatasheetFontItalic: WordBool;
begin
    Result := DefaultInterface.DatasheetFontItalic;
end;

procedure TAccessFormProperties.Set_DatasheetFontItalic(pRet: WordBool);
begin
  DefaultInterface.Set_DatasheetFontItalic(pRet);
end;

function TAccessFormProperties.Get_DatasheetFontUnderline: WordBool;
begin
    Result := DefaultInterface.DatasheetFontUnderline;
end;

procedure TAccessFormProperties.Set_DatasheetFontUnderline(pRet: WordBool);
begin
  DefaultInterface.Set_DatasheetFontUnderline(pRet);
end;

function TAccessFormProperties.Get_TabularCharSet: Byte;
begin
    Result := DefaultInterface.TabularCharSet;
end;

procedure TAccessFormProperties.Set_TabularCharSet(pRet: Byte);
begin
  DefaultInterface.Set_TabularCharSet(pRet);
end;

function TAccessFormProperties.Get_DatasheetGridlinesBehavior: Byte;
begin
    Result := DefaultInterface.DatasheetGridlinesBehavior;
end;

procedure TAccessFormProperties.Set_DatasheetGridlinesBehavior(pRet: Byte);
begin
  DefaultInterface.Set_DatasheetGridlinesBehavior(pRet);
end;

function TAccessFormProperties.Get_DatasheetGridlinesColor: Integer;
begin
    Result := DefaultInterface.DatasheetGridlinesColor;
end;

procedure TAccessFormProperties.Set_DatasheetGridlinesColor(pRet: Integer);
begin
  DefaultInterface.Set_DatasheetGridlinesColor(pRet);
end;

function TAccessFormProperties.Get_DatasheetCellsEffect: Byte;
begin
    Result := DefaultInterface.DatasheetCellsEffect;
end;

procedure TAccessFormProperties.Set_DatasheetCellsEffect(pRet: Byte);
begin
  DefaultInterface.Set_DatasheetCellsEffect(pRet);
end;

function TAccessFormProperties.Get_DatasheetForeColor: Integer;
begin
    Result := DefaultInterface.DatasheetForeColor;
end;

procedure TAccessFormProperties.Set_DatasheetForeColor(pRet: Integer);
begin
  DefaultInterface.Set_DatasheetForeColor(pRet);
end;

function TAccessFormProperties.Get_ShowGrid: WordBool;
begin
    Result := DefaultInterface.ShowGrid;
end;

procedure TAccessFormProperties.Set_ShowGrid(pRet: WordBool);
begin
  DefaultInterface.Set_ShowGrid(pRet);
end;

function TAccessFormProperties.Get_DatasheetBackColor: Integer;
begin
    Result := DefaultInterface.DatasheetBackColor;
end;

procedure TAccessFormProperties.Set_DatasheetBackColor(pRet: Integer);
begin
  DefaultInterface.Set_DatasheetBackColor(pRet);
end;

function TAccessFormProperties.Get_Hwnd: Integer;
begin
    Result := DefaultInterface.Hwnd;
end;

procedure TAccessFormProperties.Set_Hwnd(pRet: Integer);
begin
  DefaultInterface.Set_Hwnd(pRet);
end;

function TAccessFormProperties.Get_Count: Smallint;
begin
    Result := DefaultInterface.Count;
end;

procedure TAccessFormProperties.Set_Count(pRet: Smallint);
begin
  DefaultInterface.Set_Count(pRet);
end;

function TAccessFormProperties.Get_Page: Integer;
begin
    Result := DefaultInterface.Page;
end;

procedure TAccessFormProperties.Set_Page(pRet: Integer);
begin
  DefaultInterface.Set_Page(pRet);
end;

function TAccessFormProperties.Get_Pages: Smallint;
begin
    Result := DefaultInterface.Pages;
end;

procedure TAccessFormProperties.Set_Pages(pRet: Smallint);
begin
  DefaultInterface.Set_Pages(pRet);
end;

function TAccessFormProperties.Get_LogicalPageWidth: Integer;
begin
    Result := DefaultInterface.LogicalPageWidth;
end;

procedure TAccessFormProperties.Set_LogicalPageWidth(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageWidth(pRet);
end;

function TAccessFormProperties.Get_LogicalPageHeight: Integer;
begin
    Result := DefaultInterface.LogicalPageHeight;
end;

procedure TAccessFormProperties.Set_LogicalPageHeight(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageHeight(pRet);
end;

function TAccessFormProperties.Get_ZoomControl: Integer;
begin
    Result := DefaultInterface.ZoomControl;
end;

procedure TAccessFormProperties.Set_ZoomControl(pRet: Integer);
begin
  DefaultInterface.Set_ZoomControl(pRet);
end;

function TAccessFormProperties.Get_Visible: WordBool;
begin
    Result := DefaultInterface.Visible;
end;

procedure TAccessFormProperties.Set_Visible(pRet: WordBool);
begin
  DefaultInterface.Set_Visible(pRet);
end;

function TAccessFormProperties.Get_Painting: WordBool;
begin
    Result := DefaultInterface.Painting;
end;

procedure TAccessFormProperties.Set_Painting(pRet: WordBool);
begin
  DefaultInterface.Set_Painting(pRet);
end;

function TAccessFormProperties.Get_PrtMip: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtMip;
end;

procedure TAccessFormProperties.Set_PrtMip(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtMip(pRet);
end;

function TAccessFormProperties.Get_PrtDevMode: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevMode;
end;

procedure TAccessFormProperties.Set_PrtDevMode(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevMode(pRet);
end;

function TAccessFormProperties.Get_PrtDevNames: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevNames;
end;

procedure TAccessFormProperties.Set_PrtDevNames(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevNames(pRet);
end;

function TAccessFormProperties.Get_FrozenColumns: Smallint;
begin
    Result := DefaultInterface.FrozenColumns;
end;

procedure TAccessFormProperties.Set_FrozenColumns(pRet: Smallint);
begin
  DefaultInterface.Set_FrozenColumns(pRet);
end;

function TAccessFormProperties.Get_Bookmark: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Bookmark;
end;

procedure TAccessFormProperties.Set_Bookmark(pRet: OleVariant);
begin
  DefaultInterface.Set_Bookmark(pRet);
end;

function TAccessFormProperties.Get_TabularFamily: Byte;
begin
    Result := DefaultInterface.TabularFamily;
end;

procedure TAccessFormProperties.Set_TabularFamily(pRet: Byte);
begin
  DefaultInterface.Set_TabularFamily(pRet);
end;

function TAccessFormProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAccessFormProperties.Set_Name(const pRet: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pRet;
end;

function TAccessFormProperties.Get_PaletteSource: WideString;
begin
    Result := DefaultInterface.PaletteSource;
end;

procedure TAccessFormProperties.Set_PaletteSource(const pRet: WideString);
  { Warning: The property PaletteSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PaletteSource := pRet;
end;

function TAccessFormProperties.Get_Tag: WideString;
begin
    Result := DefaultInterface.Tag;
end;

procedure TAccessFormProperties.Set_Tag(const pRet: WideString);
  { Warning: The property Tag has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Tag := pRet;
end;

function TAccessFormProperties.Get_PaintPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PaintPalette;
end;

procedure TAccessFormProperties.Set_PaintPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PaintPalette(pRet);
end;

function TAccessFormProperties.Get_OnMenu: WideString;
begin
    Result := DefaultInterface.OnMenu;
end;

procedure TAccessFormProperties.Set_OnMenu(const pRet: WideString);
  { Warning: The property OnMenu has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMenu := pRet;
end;

function TAccessFormProperties.Get_OpenArgs: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OpenArgs;
end;

procedure TAccessFormProperties.Set_OpenArgs(pRet: OleVariant);
begin
  DefaultInterface.Set_OpenArgs(pRet);
end;

function TAccessFormProperties.Get_ConnectSynch: Smallint;
begin
    Result := DefaultInterface.ConnectSynch;
end;

procedure TAccessFormProperties.Set_ConnectSynch(pRet: Smallint);
begin
  DefaultInterface.Set_ConnectSynch(pRet);
end;

function TAccessFormProperties.Get_OnCurrent: WideString;
begin
    Result := DefaultInterface.OnCurrent;
end;

procedure TAccessFormProperties.Set_OnCurrent(const pRet: WideString);
  { Warning: The property OnCurrent has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnCurrent := pRet;
end;

function TAccessFormProperties.Get_OnInsert: WideString;
begin
    Result := DefaultInterface.OnInsert;
end;

procedure TAccessFormProperties.Set_OnInsert(const pRet: WideString);
  { Warning: The property OnInsert has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnInsert := pRet;
end;

function TAccessFormProperties.Get_BeforeInsert: WideString;
begin
    Result := DefaultInterface.BeforeInsert;
end;

procedure TAccessFormProperties.Set_BeforeInsert(const pRet: WideString);
  { Warning: The property BeforeInsert has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.BeforeInsert := pRet;
end;

function TAccessFormProperties.Get_AfterInsert: WideString;
begin
    Result := DefaultInterface.AfterInsert;
end;

procedure TAccessFormProperties.Set_AfterInsert(const pRet: WideString);
  { Warning: The property AfterInsert has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.AfterInsert := pRet;
end;

function TAccessFormProperties.Get_BeforeUpdate: WideString;
begin
    Result := DefaultInterface.BeforeUpdate;
end;

procedure TAccessFormProperties.Set_BeforeUpdate(const pRet: WideString);
  { Warning: The property BeforeUpdate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.BeforeUpdate := pRet;
end;

function TAccessFormProperties.Get_AfterUpdate: WideString;
begin
    Result := DefaultInterface.AfterUpdate;
end;

procedure TAccessFormProperties.Set_AfterUpdate(const pRet: WideString);
  { Warning: The property AfterUpdate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.AfterUpdate := pRet;
end;

function TAccessFormProperties.Get_OnDelete: WideString;
begin
    Result := DefaultInterface.OnDelete;
end;

procedure TAccessFormProperties.Set_OnDelete(const pRet: WideString);
  { Warning: The property OnDelete has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDelete := pRet;
end;

function TAccessFormProperties.Get_BeforeDelConfirm: WideString;
begin
    Result := DefaultInterface.BeforeDelConfirm;
end;

procedure TAccessFormProperties.Set_BeforeDelConfirm(const pRet: WideString);
  { Warning: The property BeforeDelConfirm has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.BeforeDelConfirm := pRet;
end;

function TAccessFormProperties.Get_AfterDelConfirm: WideString;
begin
    Result := DefaultInterface.AfterDelConfirm;
end;

procedure TAccessFormProperties.Set_AfterDelConfirm(const pRet: WideString);
  { Warning: The property AfterDelConfirm has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.AfterDelConfirm := pRet;
end;

function TAccessFormProperties.Get_OnOpen: WideString;
begin
    Result := DefaultInterface.OnOpen;
end;

procedure TAccessFormProperties.Set_OnOpen(const pRet: WideString);
  { Warning: The property OnOpen has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnOpen := pRet;
end;

function TAccessFormProperties.Get_OnLoad: WideString;
begin
    Result := DefaultInterface.OnLoad;
end;

procedure TAccessFormProperties.Set_OnLoad(const pRet: WideString);
  { Warning: The property OnLoad has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnLoad := pRet;
end;

function TAccessFormProperties.Get_OnResize: WideString;
begin
    Result := DefaultInterface.OnResize;
end;

procedure TAccessFormProperties.Set_OnResize(const pRet: WideString);
  { Warning: The property OnResize has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnResize := pRet;
end;

function TAccessFormProperties.Get_OnUnload: WideString;
begin
    Result := DefaultInterface.OnUnload;
end;

procedure TAccessFormProperties.Set_OnUnload(const pRet: WideString);
  { Warning: The property OnUnload has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnUnload := pRet;
end;

function TAccessFormProperties.Get_OnClose: WideString;
begin
    Result := DefaultInterface.OnClose;
end;

procedure TAccessFormProperties.Set_OnClose(const pRet: WideString);
  { Warning: The property OnClose has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnClose := pRet;
end;

function TAccessFormProperties.Get_OnActivate: WideString;
begin
    Result := DefaultInterface.OnActivate;
end;

procedure TAccessFormProperties.Set_OnActivate(const pRet: WideString);
  { Warning: The property OnActivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnActivate := pRet;
end;

function TAccessFormProperties.Get_OnDeactivate: WideString;
begin
    Result := DefaultInterface.OnDeactivate;
end;

procedure TAccessFormProperties.Set_OnDeactivate(const pRet: WideString);
  { Warning: The property OnDeactivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDeactivate := pRet;
end;

function TAccessFormProperties.Get_OnGotFocus: WideString;
begin
    Result := DefaultInterface.OnGotFocus;
end;

procedure TAccessFormProperties.Set_OnGotFocus(const pRet: WideString);
  { Warning: The property OnGotFocus has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnGotFocus := pRet;
end;

function TAccessFormProperties.Get_OnLostFocus: WideString;
begin
    Result := DefaultInterface.OnLostFocus;
end;

procedure TAccessFormProperties.Set_OnLostFocus(const pRet: WideString);
  { Warning: The property OnLostFocus has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnLostFocus := pRet;
end;

function TAccessFormProperties.Get_OnClick: WideString;
begin
    Result := DefaultInterface.OnClick;
end;

procedure TAccessFormProperties.Set_OnClick(const pRet: WideString);
  { Warning: The property OnClick has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnClick := pRet;
end;

function TAccessFormProperties.Get_OnDblClick: WideString;
begin
    Result := DefaultInterface.OnDblClick;
end;

procedure TAccessFormProperties.Set_OnDblClick(const pRet: WideString);
  { Warning: The property OnDblClick has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDblClick := pRet;
end;

function TAccessFormProperties.Get_OnMouseDown: WideString;
begin
    Result := DefaultInterface.OnMouseDown;
end;

procedure TAccessFormProperties.Set_OnMouseDown(const pRet: WideString);
  { Warning: The property OnMouseDown has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMouseDown := pRet;
end;

function TAccessFormProperties.Get_OnMouseMove: WideString;
begin
    Result := DefaultInterface.OnMouseMove;
end;

procedure TAccessFormProperties.Set_OnMouseMove(const pRet: WideString);
  { Warning: The property OnMouseMove has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMouseMove := pRet;
end;

function TAccessFormProperties.Get_OnMouseUp: WideString;
begin
    Result := DefaultInterface.OnMouseUp;
end;

procedure TAccessFormProperties.Set_OnMouseUp(const pRet: WideString);
  { Warning: The property OnMouseUp has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMouseUp := pRet;
end;

function TAccessFormProperties.Get_OnKeyDown: WideString;
begin
    Result := DefaultInterface.OnKeyDown;
end;

procedure TAccessFormProperties.Set_OnKeyDown(const pRet: WideString);
  { Warning: The property OnKeyDown has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnKeyDown := pRet;
end;

function TAccessFormProperties.Get_OnKeyUp: WideString;
begin
    Result := DefaultInterface.OnKeyUp;
end;

procedure TAccessFormProperties.Set_OnKeyUp(const pRet: WideString);
  { Warning: The property OnKeyUp has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnKeyUp := pRet;
end;

function TAccessFormProperties.Get_OnKeyPress: WideString;
begin
    Result := DefaultInterface.OnKeyPress;
end;

procedure TAccessFormProperties.Set_OnKeyPress(const pRet: WideString);
  { Warning: The property OnKeyPress has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnKeyPress := pRet;
end;

function TAccessFormProperties.Get_KeyPreview: WordBool;
begin
    Result := DefaultInterface.KeyPreview;
end;

procedure TAccessFormProperties.Set_KeyPreview(pRet: WordBool);
begin
  DefaultInterface.Set_KeyPreview(pRet);
end;

function TAccessFormProperties.Get_OnError: WideString;
begin
    Result := DefaultInterface.OnError;
end;

procedure TAccessFormProperties.Set_OnError(const pRet: WideString);
  { Warning: The property OnError has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnError := pRet;
end;

function TAccessFormProperties.Get_OnFilter: WideString;
begin
    Result := DefaultInterface.OnFilter;
end;

procedure TAccessFormProperties.Set_OnFilter(const pRet: WideString);
  { Warning: The property OnFilter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnFilter := pRet;
end;

function TAccessFormProperties.Get_OnApplyFilter: WideString;
begin
    Result := DefaultInterface.OnApplyFilter;
end;

procedure TAccessFormProperties.Set_OnApplyFilter(const pRet: WideString);
  { Warning: The property OnApplyFilter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnApplyFilter := pRet;
end;

function TAccessFormProperties.Get_OnTimer: WideString;
begin
    Result := DefaultInterface.OnTimer;
end;

procedure TAccessFormProperties.Set_OnTimer(const pRet: WideString);
  { Warning: The property OnTimer has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnTimer := pRet;
end;

function TAccessFormProperties.Get_TimerInterval: Integer;
begin
    Result := DefaultInterface.TimerInterval;
end;

procedure TAccessFormProperties.Set_TimerInterval(pRet: Integer);
begin
  DefaultInterface.Set_TimerInterval(pRet);
end;

function TAccessFormProperties.Get_Dirty: WordBool;
begin
    Result := DefaultInterface.Dirty;
end;

procedure TAccessFormProperties.Set_Dirty(pRet: WordBool);
begin
  DefaultInterface.Set_Dirty(pRet);
end;

function TAccessFormProperties.Get_WindowWidth: Smallint;
begin
    Result := DefaultInterface.WindowWidth;
end;

procedure TAccessFormProperties.Set_WindowWidth(pRet: Smallint);
begin
  DefaultInterface.Set_WindowWidth(pRet);
end;

function TAccessFormProperties.Get_WindowHeight: Smallint;
begin
    Result := DefaultInterface.WindowHeight;
end;

procedure TAccessFormProperties.Set_WindowHeight(pRet: Smallint);
begin
  DefaultInterface.Set_WindowHeight(pRet);
end;

function TAccessFormProperties.Get_CurrentView: Smallint;
begin
    Result := DefaultInterface.CurrentView;
end;

procedure TAccessFormProperties.Set_CurrentView(pRet: Smallint);
begin
  DefaultInterface.Set_CurrentView(pRet);
end;

function TAccessFormProperties.Get_CurrentSectionTop: Smallint;
begin
    Result := DefaultInterface.CurrentSectionTop;
end;

procedure TAccessFormProperties.Set_CurrentSectionTop(pRet: Smallint);
begin
  DefaultInterface.Set_CurrentSectionTop(pRet);
end;

function TAccessFormProperties.Get_CurrentSectionLeft: Smallint;
begin
    Result := DefaultInterface.CurrentSectionLeft;
end;

procedure TAccessFormProperties.Set_CurrentSectionLeft(pRet: Smallint);
begin
  DefaultInterface.Set_CurrentSectionLeft(pRet);
end;

function TAccessFormProperties.Get_SelLeft: Integer;
begin
    Result := DefaultInterface.SelLeft;
end;

procedure TAccessFormProperties.Set_SelLeft(pRet: Integer);
begin
  DefaultInterface.Set_SelLeft(pRet);
end;

function TAccessFormProperties.Get_SelTop: Integer;
begin
    Result := DefaultInterface.SelTop;
end;

procedure TAccessFormProperties.Set_SelTop(pRet: Integer);
begin
  DefaultInterface.Set_SelTop(pRet);
end;

function TAccessFormProperties.Get_SelWidth: Integer;
begin
    Result := DefaultInterface.SelWidth;
end;

procedure TAccessFormProperties.Set_SelWidth(pRet: Integer);
begin
  DefaultInterface.Set_SelWidth(pRet);
end;

function TAccessFormProperties.Get_SelHeight: Integer;
begin
    Result := DefaultInterface.SelHeight;
end;

procedure TAccessFormProperties.Set_SelHeight(pRet: Integer);
begin
  DefaultInterface.Set_SelHeight(pRet);
end;

function TAccessFormProperties.Get_CurrentRecord: Integer;
begin
    Result := DefaultInterface.CurrentRecord;
end;

procedure TAccessFormProperties.Set_CurrentRecord(pRet: Integer);
begin
  DefaultInterface.Set_CurrentRecord(pRet);
end;

function TAccessFormProperties.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessFormProperties.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessFormProperties.Get_InsideHeight: Integer;
begin
    Result := DefaultInterface.InsideHeight;
end;

procedure TAccessFormProperties.Set_InsideHeight(pRet: Integer);
begin
  DefaultInterface.Set_InsideHeight(pRet);
end;

function TAccessFormProperties.Get_InsideWidth: Integer;
begin
    Result := DefaultInterface.InsideWidth;
end;

procedure TAccessFormProperties.Set_InsideWidth(pRet: Integer);
begin
  DefaultInterface.Set_InsideWidth(pRet);
end;

function TAccessFormProperties.Get_PicturePalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PicturePalette;
end;

procedure TAccessFormProperties.Set_PicturePalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PicturePalette(pRet);
end;

function TAccessFormProperties.Get_HasModule: WordBool;
begin
    Result := DefaultInterface.HasModule;
end;

procedure TAccessFormProperties.Set_HasModule(pRet: WordBool);
begin
  DefaultInterface.Set_HasModule(pRet);
end;

function TAccessFormProperties.Get_acHiddenCurrentPage: Integer;
begin
    Result := DefaultInterface.acHiddenCurrentPage;
end;

procedure TAccessFormProperties.Set_acHiddenCurrentPage(pRet: Integer);
begin
  DefaultInterface.Set_acHiddenCurrentPage(pRet);
end;

function TAccessFormProperties.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessFormProperties.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessFormProperties.Get_NewRecord: Smallint;
begin
    Result := DefaultInterface.NewRecord;
end;

function TAccessFormProperties.Get_ActiveControl: AccessControl;
begin
    Result := DefaultInterface.ActiveControl;
end;

function TAccessFormProperties.Get_DefaultControl(ControlType: Integer): AccessControl;
begin
    Result := DefaultInterface.DefaultControl[ControlType];
end;

function TAccessFormProperties.Get_Dynaset: IDispatch;
begin
    Result := DefaultInterface.Dynaset;
end;

function TAccessFormProperties.Get_RecordsetClone: Recordset;
begin
    Result := DefaultInterface.RecordsetClone;
end;

function TAccessFormProperties.Get_Section(var_: OleVariant): AccessSection;
begin
    Result := DefaultInterface.Section[var_];
end;

function TAccessFormProperties.Get_Form: AccessForm;
begin
    Result := DefaultInterface.Form;
end;

function TAccessFormProperties.Get_Module: Module;
begin
    Result := DefaultInterface.Module;
end;

function TAccessFormProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessFormProperties.Get_ConnectControl: AccessControl;
begin
    Result := DefaultInterface.ConnectControl;
end;

function TAccessFormProperties.Get_Controls: Controls;
begin
    Result := DefaultInterface.Controls;
end;

{$ENDIF}

class function CoAccessReport.Create: _Report;
begin
  Result := CreateComObject(CLASS_AccessReport) as _Report;
end;

class function CoAccessReport.CreateRemote(const MachineName: string): _Report;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccessReport) as _Report;
end;

procedure TAccessReport.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{27CE30A0-91FF-101B-AF4E-00AA003F0F07}';
    IntfIID:   '{3E8B6B00-91FF-101B-AF4E-00AA003F0F07}';
    EventIID:  '{BC9E4357-F037-11CD-8701-00AA003F0F07}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAccessReport.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as _Report;
  end;
end;

procedure TAccessReport.ConnectTo(svrIntf: _Report);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TAccessReport.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TAccessReport.GetDefaultInterface: _Report;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAccessReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAccessReportProperties.Create(Self);
{$ENDIF}
end;

destructor TAccessReport.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAccessReport.GetServerProperties: TAccessReportProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TAccessReport.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    2066: if Assigned(FOnOpen) then
         FOnOpen(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2070: if Assigned(FOnClose) then
         FOnClose(Self);
    2071: if Assigned(FOnActivate) then
         FOnActivate(Self);
    2072: if Assigned(FOnDeactivate) then
         FOnDeactivate(Self);
    2083: if Assigned(FOnError) then
         FOnError(Self,
                  Smallint((TVarData(Params[0]).VPointer)^) {var Smallint},
                  Smallint((TVarData(Params[1]).VPointer)^) {out Smallint});
    2161: if Assigned(FOnNoData) then
         FOnNoData(Self, Smallint((TVarData(Params[0]).VPointer)^) {out Smallint});
    2162: if Assigned(FOnPage) then
         FOnPage(Self);
  end; {case DispID}
end;

function TAccessReport.Get_FormName: WideString;
begin
    Result := DefaultInterface.FormName;
end;

procedure TAccessReport.Set_FormName(const pRet: WideString);
  { Warning: The property FormName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FormName := pRet;
end;

function TAccessReport.Get_RecordSource: WideString;
begin
    Result := DefaultInterface.RecordSource;
end;

procedure TAccessReport.Set_RecordSource(const pRet: WideString);
  { Warning: The property RecordSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RecordSource := pRet;
end;

function TAccessReport.Get_Filter: WideString;
begin
    Result := DefaultInterface.Filter;
end;

procedure TAccessReport.Set_Filter(const pRet: WideString);
  { Warning: The property Filter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Filter := pRet;
end;

function TAccessReport.Get_FilterOn: WordBool;
begin
    Result := DefaultInterface.FilterOn;
end;

procedure TAccessReport.Set_FilterOn(pRet: WordBool);
begin
  DefaultInterface.Set_FilterOn(pRet);
end;

function TAccessReport.Get_OrderBy: WideString;
begin
    Result := DefaultInterface.OrderBy;
end;

procedure TAccessReport.Set_OrderBy(const pRet: WideString);
  { Warning: The property OrderBy has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OrderBy := pRet;
end;

function TAccessReport.Get_OrderByOn: WordBool;
begin
    Result := DefaultInterface.OrderByOn;
end;

procedure TAccessReport.Set_OrderByOn(pRet: WordBool);
begin
  DefaultInterface.Set_OrderByOn(pRet);
end;

function TAccessReport.Get_Caption: WideString;
begin
    Result := DefaultInterface.Caption;
end;

procedure TAccessReport.Set_Caption(const pRet: WideString);
  { Warning: The property Caption has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Caption := pRet;
end;

function TAccessReport.Get_RecordLocks: Byte;
begin
    Result := DefaultInterface.RecordLocks;
end;

procedure TAccessReport.Set_RecordLocks(pRet: Byte);
begin
  DefaultInterface.Set_RecordLocks(pRet);
end;

function TAccessReport.Get_PageHeader: Byte;
begin
    Result := DefaultInterface.PageHeader;
end;

procedure TAccessReport.Set_PageHeader(pRet: Byte);
begin
  DefaultInterface.Set_PageHeader(pRet);
end;

function TAccessReport.Get_PageFooter: Byte;
begin
    Result := DefaultInterface.PageFooter;
end;

procedure TAccessReport.Set_PageFooter(pRet: Byte);
begin
  DefaultInterface.Set_PageFooter(pRet);
end;

function TAccessReport.Get_DateGrouping: Byte;
begin
    Result := DefaultInterface.DateGrouping;
end;

procedure TAccessReport.Set_DateGrouping(pRet: Byte);
begin
  DefaultInterface.Set_DateGrouping(pRet);
end;

function TAccessReport.Get_GrpKeepTogether: Byte;
begin
    Result := DefaultInterface.GrpKeepTogether;
end;

procedure TAccessReport.Set_GrpKeepTogether(pRet: Byte);
begin
  DefaultInterface.Set_GrpKeepTogether(pRet);
end;

function TAccessReport.Get_MinButton: WordBool;
begin
    Result := DefaultInterface.MinButton;
end;

procedure TAccessReport.Set_MinButton(pRet: WordBool);
begin
  DefaultInterface.Set_MinButton(pRet);
end;

function TAccessReport.Get_MaxButton: WordBool;
begin
    Result := DefaultInterface.MaxButton;
end;

procedure TAccessReport.Set_MaxButton(pRet: WordBool);
begin
  DefaultInterface.Set_MaxButton(pRet);
end;

function TAccessReport.Get_Width: Smallint;
begin
    Result := DefaultInterface.Width;
end;

procedure TAccessReport.Set_Width(pRet: Smallint);
begin
  DefaultInterface.Set_Width(pRet);
end;

function TAccessReport.Get_Picture: WideString;
begin
    Result := DefaultInterface.Picture;
end;

procedure TAccessReport.Set_Picture(const pRet: WideString);
  { Warning: The property Picture has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Picture := pRet;
end;

function TAccessReport.Get_PictureType: Byte;
begin
    Result := DefaultInterface.PictureType;
end;

procedure TAccessReport.Set_PictureType(pRet: Byte);
begin
  DefaultInterface.Set_PictureType(pRet);
end;

function TAccessReport.Get_PictureSizeMode: Byte;
begin
    Result := DefaultInterface.PictureSizeMode;
end;

procedure TAccessReport.Set_PictureSizeMode(pRet: Byte);
begin
  DefaultInterface.Set_PictureSizeMode(pRet);
end;

function TAccessReport.Get_PictureAlignment: Byte;
begin
    Result := DefaultInterface.PictureAlignment;
end;

procedure TAccessReport.Set_PictureAlignment(pRet: Byte);
begin
  DefaultInterface.Set_PictureAlignment(pRet);
end;

function TAccessReport.Get_PictureTiling: WordBool;
begin
    Result := DefaultInterface.PictureTiling;
end;

procedure TAccessReport.Set_PictureTiling(pRet: WordBool);
begin
  DefaultInterface.Set_PictureTiling(pRet);
end;

function TAccessReport.Get_PicturePages: Byte;
begin
    Result := DefaultInterface.PicturePages;
end;

procedure TAccessReport.Set_PicturePages(pRet: Byte);
begin
  DefaultInterface.Set_PicturePages(pRet);
end;

function TAccessReport.Get_MenuBar: WideString;
begin
    Result := DefaultInterface.MenuBar;
end;

procedure TAccessReport.Set_MenuBar(const pRet: WideString);
  { Warning: The property MenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.MenuBar := pRet;
end;

function TAccessReport.Get_Toolbar: WideString;
begin
    Result := DefaultInterface.Toolbar;
end;

procedure TAccessReport.Set_Toolbar(const pRet: WideString);
  { Warning: The property Toolbar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Toolbar := pRet;
end;

function TAccessReport.Get_ShortcutMenuBar: WideString;
begin
    Result := DefaultInterface.ShortcutMenuBar;
end;

procedure TAccessReport.Set_ShortcutMenuBar(const pRet: WideString);
  { Warning: The property ShortcutMenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ShortcutMenuBar := pRet;
end;

function TAccessReport.Get_GridX: Smallint;
begin
    Result := DefaultInterface.GridX;
end;

procedure TAccessReport.Set_GridX(pRet: Smallint);
begin
  DefaultInterface.Set_GridX(pRet);
end;

function TAccessReport.Get_GridY: Smallint;
begin
    Result := DefaultInterface.GridY;
end;

procedure TAccessReport.Set_GridY(pRet: Smallint);
begin
  DefaultInterface.Set_GridY(pRet);
end;

function TAccessReport.Get_LayoutForPrint: WordBool;
begin
    Result := DefaultInterface.LayoutForPrint;
end;

procedure TAccessReport.Set_LayoutForPrint(pRet: WordBool);
begin
  DefaultInterface.Set_LayoutForPrint(pRet);
end;

function TAccessReport.Get_FastLaserPrinting: WordBool;
begin
    Result := DefaultInterface.FastLaserPrinting;
end;

procedure TAccessReport.Set_FastLaserPrinting(pRet: WordBool);
begin
  DefaultInterface.Set_FastLaserPrinting(pRet);
end;

function TAccessReport.Get_HelpFile: WideString;
begin
    Result := DefaultInterface.HelpFile;
end;

procedure TAccessReport.Set_HelpFile(const pRet: WideString);
  { Warning: The property HelpFile has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HelpFile := pRet;
end;

function TAccessReport.Get_HelpContextId: Integer;
begin
    Result := DefaultInterface.HelpContextId;
end;

procedure TAccessReport.Set_HelpContextId(pRet: Integer);
begin
  DefaultInterface.Set_HelpContextId(pRet);
end;

function TAccessReport.Get_Hwnd: Integer;
begin
    Result := DefaultInterface.Hwnd;
end;

procedure TAccessReport.Set_Hwnd(pRet: Integer);
begin
  DefaultInterface.Set_Hwnd(pRet);
end;

function TAccessReport.Get_Count: Smallint;
begin
    Result := DefaultInterface.Count;
end;

procedure TAccessReport.Set_Count(pRet: Smallint);
begin
  DefaultInterface.Set_Count(pRet);
end;

function TAccessReport.Get_Page: Integer;
begin
    Result := DefaultInterface.Page;
end;

procedure TAccessReport.Set_Page(pRet: Integer);
begin
  DefaultInterface.Set_Page(pRet);
end;

function TAccessReport.Get_Pages: Smallint;
begin
    Result := DefaultInterface.Pages;
end;

procedure TAccessReport.Set_Pages(pRet: Smallint);
begin
  DefaultInterface.Set_Pages(pRet);
end;

function TAccessReport.Get_LogicalPageWidth: Integer;
begin
    Result := DefaultInterface.LogicalPageWidth;
end;

procedure TAccessReport.Set_LogicalPageWidth(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageWidth(pRet);
end;

function TAccessReport.Get_LogicalPageHeight: Integer;
begin
    Result := DefaultInterface.LogicalPageHeight;
end;

procedure TAccessReport.Set_LogicalPageHeight(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageHeight(pRet);
end;

function TAccessReport.Get_ZoomControl: Integer;
begin
    Result := DefaultInterface.ZoomControl;
end;

procedure TAccessReport.Set_ZoomControl(pRet: Integer);
begin
  DefaultInterface.Set_ZoomControl(pRet);
end;

function TAccessReport.Get_HasData: Integer;
begin
    Result := DefaultInterface.HasData;
end;

procedure TAccessReport.Set_HasData(pRet: Integer);
begin
  DefaultInterface.Set_HasData(pRet);
end;

function TAccessReport.Get_Left: Integer;
begin
    Result := DefaultInterface.Left;
end;

procedure TAccessReport.Set_Left(pRet: Integer);
begin
  DefaultInterface.Set_Left(pRet);
end;

function TAccessReport.Get_Top: Integer;
begin
    Result := DefaultInterface.Top;
end;

procedure TAccessReport.Set_Top(pRet: Integer);
begin
  DefaultInterface.Set_Top(pRet);
end;

function TAccessReport.Get_Height: Integer;
begin
    Result := DefaultInterface.Height;
end;

procedure TAccessReport.Set_Height(pRet: Integer);
begin
  DefaultInterface.Set_Height(pRet);
end;

function TAccessReport.Get_PrintSection: WordBool;
begin
    Result := DefaultInterface.PrintSection;
end;

procedure TAccessReport.Set_PrintSection(pRet: WordBool);
begin
  DefaultInterface.Set_PrintSection(pRet);
end;

function TAccessReport.Get_NextRecord: WordBool;
begin
    Result := DefaultInterface.NextRecord;
end;

procedure TAccessReport.Set_NextRecord(pRet: WordBool);
begin
  DefaultInterface.Set_NextRecord(pRet);
end;

function TAccessReport.Get_MoveLayout: WordBool;
begin
    Result := DefaultInterface.MoveLayout;
end;

procedure TAccessReport.Set_MoveLayout(pRet: WordBool);
begin
  DefaultInterface.Set_MoveLayout(pRet);
end;

function TAccessReport.Get_FormatCount: Smallint;
begin
    Result := DefaultInterface.FormatCount;
end;

procedure TAccessReport.Set_FormatCount(pRet: Smallint);
begin
  DefaultInterface.Set_FormatCount(pRet);
end;

function TAccessReport.Get_PrintCount: Smallint;
begin
    Result := DefaultInterface.PrintCount;
end;

procedure TAccessReport.Set_PrintCount(pRet: Smallint);
begin
  DefaultInterface.Set_PrintCount(pRet);
end;

function TAccessReport.Get_Visible: WordBool;
begin
    Result := DefaultInterface.Visible;
end;

procedure TAccessReport.Set_Visible(pRet: WordBool);
begin
  DefaultInterface.Set_Visible(pRet);
end;

function TAccessReport.Get_Painting: WordBool;
begin
    Result := DefaultInterface.Painting;
end;

procedure TAccessReport.Set_Painting(pRet: WordBool);
begin
  DefaultInterface.Set_Painting(pRet);
end;

function TAccessReport.Get_PrtMip: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtMip;
end;

procedure TAccessReport.Set_PrtMip(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtMip(pRet);
end;

function TAccessReport.Get_PrtDevMode: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevMode;
end;

procedure TAccessReport.Set_PrtDevMode(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevMode(pRet);
end;

function TAccessReport.Get_PrtDevNames: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevNames;
end;

procedure TAccessReport.Set_PrtDevNames(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevNames(pRet);
end;

function TAccessReport.Get_ForeColor: Integer;
begin
    Result := DefaultInterface.ForeColor;
end;

procedure TAccessReport.Set_ForeColor(pRet: Integer);
begin
  DefaultInterface.Set_ForeColor(pRet);
end;

function TAccessReport.Get_CurrentX: Single;
begin
    Result := DefaultInterface.CurrentX;
end;

procedure TAccessReport.Set_CurrentX(pRet: Single);
begin
  DefaultInterface.Set_CurrentX(pRet);
end;

function TAccessReport.Get_CurrentY: Single;
begin
    Result := DefaultInterface.CurrentY;
end;

procedure TAccessReport.Set_CurrentY(pRet: Single);
begin
  DefaultInterface.Set_CurrentY(pRet);
end;

function TAccessReport.Get_ScaleHeight: Single;
begin
    Result := DefaultInterface.ScaleHeight;
end;

procedure TAccessReport.Set_ScaleHeight(pRet: Single);
begin
  DefaultInterface.Set_ScaleHeight(pRet);
end;

function TAccessReport.Get_ScaleLeft: Single;
begin
    Result := DefaultInterface.ScaleLeft;
end;

procedure TAccessReport.Set_ScaleLeft(pRet: Single);
begin
  DefaultInterface.Set_ScaleLeft(pRet);
end;

function TAccessReport.Get_ScaleMode: Smallint;
begin
    Result := DefaultInterface.ScaleMode;
end;

procedure TAccessReport.Set_ScaleMode(pRet: Smallint);
begin
  DefaultInterface.Set_ScaleMode(pRet);
end;

function TAccessReport.Get_ScaleTop: Single;
begin
    Result := DefaultInterface.ScaleTop;
end;

procedure TAccessReport.Set_ScaleTop(pRet: Single);
begin
  DefaultInterface.Set_ScaleTop(pRet);
end;

function TAccessReport.Get_ScaleWidth: Single;
begin
    Result := DefaultInterface.ScaleWidth;
end;

procedure TAccessReport.Set_ScaleWidth(pRet: Single);
begin
  DefaultInterface.Set_ScaleWidth(pRet);
end;

function TAccessReport.Get_FontBold: Smallint;
begin
    Result := DefaultInterface.FontBold;
end;

procedure TAccessReport.Set_FontBold(pRet: Smallint);
begin
  DefaultInterface.Set_FontBold(pRet);
end;

function TAccessReport.Get_FontItalic: Smallint;
begin
    Result := DefaultInterface.FontItalic;
end;

procedure TAccessReport.Set_FontItalic(pRet: Smallint);
begin
  DefaultInterface.Set_FontItalic(pRet);
end;

function TAccessReport.Get_FontName: WideString;
begin
    Result := DefaultInterface.FontName;
end;

procedure TAccessReport.Set_FontName(const pRet: WideString);
  { Warning: The property FontName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FontName := pRet;
end;

function TAccessReport.Get_FontSize: Smallint;
begin
    Result := DefaultInterface.FontSize;
end;

procedure TAccessReport.Set_FontSize(pRet: Smallint);
begin
  DefaultInterface.Set_FontSize(pRet);
end;

function TAccessReport.Get_FontUnderline: Smallint;
begin
    Result := DefaultInterface.FontUnderline;
end;

procedure TAccessReport.Set_FontUnderline(pRet: Smallint);
begin
  DefaultInterface.Set_FontUnderline(pRet);
end;

function TAccessReport.Get_DrawMode: Smallint;
begin
    Result := DefaultInterface.DrawMode;
end;

procedure TAccessReport.Set_DrawMode(pRet: Smallint);
begin
  DefaultInterface.Set_DrawMode(pRet);
end;

function TAccessReport.Get_DrawStyle: Smallint;
begin
    Result := DefaultInterface.DrawStyle;
end;

procedure TAccessReport.Set_DrawStyle(pRet: Smallint);
begin
  DefaultInterface.Set_DrawStyle(pRet);
end;

function TAccessReport.Get_DrawWidth: Smallint;
begin
    Result := DefaultInterface.DrawWidth;
end;

procedure TAccessReport.Set_DrawWidth(pRet: Smallint);
begin
  DefaultInterface.Set_DrawWidth(pRet);
end;

function TAccessReport.Get_FillColor: Integer;
begin
    Result := DefaultInterface.FillColor;
end;

procedure TAccessReport.Set_FillColor(pRet: Integer);
begin
  DefaultInterface.Set_FillColor(pRet);
end;

function TAccessReport.Get_FillStyle: Smallint;
begin
    Result := DefaultInterface.FillStyle;
end;

procedure TAccessReport.Set_FillStyle(pRet: Smallint);
begin
  DefaultInterface.Set_FillStyle(pRet);
end;

function TAccessReport.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAccessReport.Set_Name(const pRet: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pRet;
end;

function TAccessReport.Get_PaletteSource: WideString;
begin
    Result := DefaultInterface.PaletteSource;
end;

procedure TAccessReport.Set_PaletteSource(const pRet: WideString);
  { Warning: The property PaletteSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PaletteSource := pRet;
end;

function TAccessReport.Get_Tag: WideString;
begin
    Result := DefaultInterface.Tag;
end;

procedure TAccessReport.Set_Tag(const pRet: WideString);
  { Warning: The property Tag has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Tag := pRet;
end;

function TAccessReport.Get_PaintPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PaintPalette;
end;

procedure TAccessReport.Set_PaintPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PaintPalette(pRet);
end;

function TAccessReport.Get_OnMenu: WideString;
begin
    Result := DefaultInterface.OnMenu;
end;

procedure TAccessReport.Set_OnMenu(const pRet: WideString);
  { Warning: The property OnMenu has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMenu := pRet;
end;

function TAccessReport.Get_OnOpen: WideString;
begin
    Result := DefaultInterface.OnOpen;
end;

procedure TAccessReport.Set_OnOpen(const pRet: WideString);
  { Warning: The property OnOpen has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnOpen := pRet;
end;

function TAccessReport.Get_OnClose: WideString;
begin
    Result := DefaultInterface.OnClose;
end;

procedure TAccessReport.Set_OnClose(const pRet: WideString);
  { Warning: The property OnClose has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnClose := pRet;
end;

function TAccessReport.Get_OnActivate: WideString;
begin
    Result := DefaultInterface.OnActivate;
end;

procedure TAccessReport.Set_OnActivate(const pRet: WideString);
  { Warning: The property OnActivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnActivate := pRet;
end;

function TAccessReport.Get_OnDeactivate: WideString;
begin
    Result := DefaultInterface.OnDeactivate;
end;

procedure TAccessReport.Set_OnDeactivate(const pRet: WideString);
  { Warning: The property OnDeactivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDeactivate := pRet;
end;

function TAccessReport.Get_OnNoData: WideString;
begin
    Result := DefaultInterface.OnNoData;
end;

procedure TAccessReport.Set_OnNoData(const pRet: WideString);
  { Warning: The property OnNoData has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnNoData := pRet;
end;

function TAccessReport.Get_OnPage: WideString;
begin
    Result := DefaultInterface.OnPage;
end;

procedure TAccessReport.Set_OnPage(const pRet: WideString);
  { Warning: The property OnPage has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnPage := pRet;
end;

function TAccessReport.Get_OnError: WideString;
begin
    Result := DefaultInterface.OnError;
end;

procedure TAccessReport.Set_OnError(const pRet: WideString);
  { Warning: The property OnError has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnError := pRet;
end;

function TAccessReport.Get_Dirty: WordBool;
begin
    Result := DefaultInterface.Dirty;
end;

procedure TAccessReport.Set_Dirty(pRet: WordBool);
begin
  DefaultInterface.Set_Dirty(pRet);
end;

function TAccessReport.Get_CurrentRecord: Integer;
begin
    Result := DefaultInterface.CurrentRecord;
end;

procedure TAccessReport.Set_CurrentRecord(pRet: Integer);
begin
  DefaultInterface.Set_CurrentRecord(pRet);
end;

function TAccessReport.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessReport.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessReport.Get_PicturePalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PicturePalette;
end;

procedure TAccessReport.Set_PicturePalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PicturePalette(pRet);
end;

function TAccessReport.Get_HasModule: WordBool;
begin
    Result := DefaultInterface.HasModule;
end;

procedure TAccessReport.Set_HasModule(pRet: WordBool);
begin
  DefaultInterface.Set_HasModule(pRet);
end;

function TAccessReport.Get_acHiddenCurrentPage: Integer;
begin
    Result := DefaultInterface.acHiddenCurrentPage;
end;

procedure TAccessReport.Set_acHiddenCurrentPage(pRet: Integer);
begin
  DefaultInterface.Set_acHiddenCurrentPage(pRet);
end;

function TAccessReport.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessReport.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessReport.Get_ActiveControl: AccessControl;
begin
    Result := DefaultInterface.ActiveControl;
end;

function TAccessReport.Get_DefaultControl(ControlType: Integer): AccessControl;
begin
    Result := DefaultInterface.DefaultControl[ControlType];
end;

function TAccessReport.Get_Section(Index: OleVariant): AccessSection;
begin
    Result := DefaultInterface.Section[Index];
end;

function TAccessReport.Get_GroupLevel(Index: Integer): AccessGroupLevel;
begin
    Result := DefaultInterface.GroupLevel[Index];
end;

function TAccessReport.Get_Report: AccessReport;
begin
    Result := DefaultInterface.Report;
end;

function TAccessReport.Get_Module: Module;
begin
    Result := DefaultInterface.Module;
end;

function TAccessReport.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessReport.Get_Controls: Controls;
begin
    Result := DefaultInterface.Controls;
end;

procedure TAccessReport.Circle(flags: Smallint; X: Single; Y: Single; radius: Single; 
                               color: Integer; start: Single; end_: Single; aspect: Single);
begin
  DefaultInterface.Circle(flags, X, Y, radius, color, start, end_, aspect);
end;

procedure TAccessReport.Line(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single; 
                             color: Integer);
begin
  DefaultInterface.Line(flags, x1, y1, x2, y2, color);
end;

procedure TAccessReport.PSet(flags: Smallint; X: Single; Y: Single; color: Integer);
begin
  DefaultInterface.PSet(flags, X, Y, color);
end;

procedure TAccessReport.Scale(flags: Smallint; x1: Single; y1: Single; x2: Single; y2: Single);
begin
  DefaultInterface.Scale(flags, x1, y1, x2, y2);
end;

function TAccessReport.TextWidth(const Expr: WideString): Single;
begin
  Result := DefaultInterface.TextWidth(Expr);
end;

function TAccessReport.TextHeight(const Expr: WideString): Single;
begin
  Result := DefaultInterface.TextHeight(Expr);
end;

procedure TAccessReport.Print(const Expr: WideString);
begin
  DefaultInterface.Print(Expr);
end;

function TAccessReport._Evaluate(const bstrExpr: WideString; var ppsa: PSafeArray): OleVariant;
begin
  Result := DefaultInterface._Evaluate(bstrExpr, ppsa);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAccessReportProperties.Create(AServer: TAccessReport);
begin
  inherited Create;
  FServer := AServer;
end;

function TAccessReportProperties.GetDefaultInterface: _Report;
begin
  Result := FServer.DefaultInterface;
end;

function TAccessReportProperties.Get_FormName: WideString;
begin
    Result := DefaultInterface.FormName;
end;

procedure TAccessReportProperties.Set_FormName(const pRet: WideString);
  { Warning: The property FormName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FormName := pRet;
end;

function TAccessReportProperties.Get_RecordSource: WideString;
begin
    Result := DefaultInterface.RecordSource;
end;

procedure TAccessReportProperties.Set_RecordSource(const pRet: WideString);
  { Warning: The property RecordSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RecordSource := pRet;
end;

function TAccessReportProperties.Get_Filter: WideString;
begin
    Result := DefaultInterface.Filter;
end;

procedure TAccessReportProperties.Set_Filter(const pRet: WideString);
  { Warning: The property Filter has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Filter := pRet;
end;

function TAccessReportProperties.Get_FilterOn: WordBool;
begin
    Result := DefaultInterface.FilterOn;
end;

procedure TAccessReportProperties.Set_FilterOn(pRet: WordBool);
begin
  DefaultInterface.Set_FilterOn(pRet);
end;

function TAccessReportProperties.Get_OrderBy: WideString;
begin
    Result := DefaultInterface.OrderBy;
end;

procedure TAccessReportProperties.Set_OrderBy(const pRet: WideString);
  { Warning: The property OrderBy has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OrderBy := pRet;
end;

function TAccessReportProperties.Get_OrderByOn: WordBool;
begin
    Result := DefaultInterface.OrderByOn;
end;

procedure TAccessReportProperties.Set_OrderByOn(pRet: WordBool);
begin
  DefaultInterface.Set_OrderByOn(pRet);
end;

function TAccessReportProperties.Get_Caption: WideString;
begin
    Result := DefaultInterface.Caption;
end;

procedure TAccessReportProperties.Set_Caption(const pRet: WideString);
  { Warning: The property Caption has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Caption := pRet;
end;

function TAccessReportProperties.Get_RecordLocks: Byte;
begin
    Result := DefaultInterface.RecordLocks;
end;

procedure TAccessReportProperties.Set_RecordLocks(pRet: Byte);
begin
  DefaultInterface.Set_RecordLocks(pRet);
end;

function TAccessReportProperties.Get_PageHeader: Byte;
begin
    Result := DefaultInterface.PageHeader;
end;

procedure TAccessReportProperties.Set_PageHeader(pRet: Byte);
begin
  DefaultInterface.Set_PageHeader(pRet);
end;

function TAccessReportProperties.Get_PageFooter: Byte;
begin
    Result := DefaultInterface.PageFooter;
end;

procedure TAccessReportProperties.Set_PageFooter(pRet: Byte);
begin
  DefaultInterface.Set_PageFooter(pRet);
end;

function TAccessReportProperties.Get_DateGrouping: Byte;
begin
    Result := DefaultInterface.DateGrouping;
end;

procedure TAccessReportProperties.Set_DateGrouping(pRet: Byte);
begin
  DefaultInterface.Set_DateGrouping(pRet);
end;

function TAccessReportProperties.Get_GrpKeepTogether: Byte;
begin
    Result := DefaultInterface.GrpKeepTogether;
end;

procedure TAccessReportProperties.Set_GrpKeepTogether(pRet: Byte);
begin
  DefaultInterface.Set_GrpKeepTogether(pRet);
end;

function TAccessReportProperties.Get_MinButton: WordBool;
begin
    Result := DefaultInterface.MinButton;
end;

procedure TAccessReportProperties.Set_MinButton(pRet: WordBool);
begin
  DefaultInterface.Set_MinButton(pRet);
end;

function TAccessReportProperties.Get_MaxButton: WordBool;
begin
    Result := DefaultInterface.MaxButton;
end;

procedure TAccessReportProperties.Set_MaxButton(pRet: WordBool);
begin
  DefaultInterface.Set_MaxButton(pRet);
end;

function TAccessReportProperties.Get_Width: Smallint;
begin
    Result := DefaultInterface.Width;
end;

procedure TAccessReportProperties.Set_Width(pRet: Smallint);
begin
  DefaultInterface.Set_Width(pRet);
end;

function TAccessReportProperties.Get_Picture: WideString;
begin
    Result := DefaultInterface.Picture;
end;

procedure TAccessReportProperties.Set_Picture(const pRet: WideString);
  { Warning: The property Picture has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Picture := pRet;
end;

function TAccessReportProperties.Get_PictureType: Byte;
begin
    Result := DefaultInterface.PictureType;
end;

procedure TAccessReportProperties.Set_PictureType(pRet: Byte);
begin
  DefaultInterface.Set_PictureType(pRet);
end;

function TAccessReportProperties.Get_PictureSizeMode: Byte;
begin
    Result := DefaultInterface.PictureSizeMode;
end;

procedure TAccessReportProperties.Set_PictureSizeMode(pRet: Byte);
begin
  DefaultInterface.Set_PictureSizeMode(pRet);
end;

function TAccessReportProperties.Get_PictureAlignment: Byte;
begin
    Result := DefaultInterface.PictureAlignment;
end;

procedure TAccessReportProperties.Set_PictureAlignment(pRet: Byte);
begin
  DefaultInterface.Set_PictureAlignment(pRet);
end;

function TAccessReportProperties.Get_PictureTiling: WordBool;
begin
    Result := DefaultInterface.PictureTiling;
end;

procedure TAccessReportProperties.Set_PictureTiling(pRet: WordBool);
begin
  DefaultInterface.Set_PictureTiling(pRet);
end;

function TAccessReportProperties.Get_PicturePages: Byte;
begin
    Result := DefaultInterface.PicturePages;
end;

procedure TAccessReportProperties.Set_PicturePages(pRet: Byte);
begin
  DefaultInterface.Set_PicturePages(pRet);
end;

function TAccessReportProperties.Get_MenuBar: WideString;
begin
    Result := DefaultInterface.MenuBar;
end;

procedure TAccessReportProperties.Set_MenuBar(const pRet: WideString);
  { Warning: The property MenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.MenuBar := pRet;
end;

function TAccessReportProperties.Get_Toolbar: WideString;
begin
    Result := DefaultInterface.Toolbar;
end;

procedure TAccessReportProperties.Set_Toolbar(const pRet: WideString);
  { Warning: The property Toolbar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Toolbar := pRet;
end;

function TAccessReportProperties.Get_ShortcutMenuBar: WideString;
begin
    Result := DefaultInterface.ShortcutMenuBar;
end;

procedure TAccessReportProperties.Set_ShortcutMenuBar(const pRet: WideString);
  { Warning: The property ShortcutMenuBar has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ShortcutMenuBar := pRet;
end;

function TAccessReportProperties.Get_GridX: Smallint;
begin
    Result := DefaultInterface.GridX;
end;

procedure TAccessReportProperties.Set_GridX(pRet: Smallint);
begin
  DefaultInterface.Set_GridX(pRet);
end;

function TAccessReportProperties.Get_GridY: Smallint;
begin
    Result := DefaultInterface.GridY;
end;

procedure TAccessReportProperties.Set_GridY(pRet: Smallint);
begin
  DefaultInterface.Set_GridY(pRet);
end;

function TAccessReportProperties.Get_LayoutForPrint: WordBool;
begin
    Result := DefaultInterface.LayoutForPrint;
end;

procedure TAccessReportProperties.Set_LayoutForPrint(pRet: WordBool);
begin
  DefaultInterface.Set_LayoutForPrint(pRet);
end;

function TAccessReportProperties.Get_FastLaserPrinting: WordBool;
begin
    Result := DefaultInterface.FastLaserPrinting;
end;

procedure TAccessReportProperties.Set_FastLaserPrinting(pRet: WordBool);
begin
  DefaultInterface.Set_FastLaserPrinting(pRet);
end;

function TAccessReportProperties.Get_HelpFile: WideString;
begin
    Result := DefaultInterface.HelpFile;
end;

procedure TAccessReportProperties.Set_HelpFile(const pRet: WideString);
  { Warning: The property HelpFile has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HelpFile := pRet;
end;

function TAccessReportProperties.Get_HelpContextId: Integer;
begin
    Result := DefaultInterface.HelpContextId;
end;

procedure TAccessReportProperties.Set_HelpContextId(pRet: Integer);
begin
  DefaultInterface.Set_HelpContextId(pRet);
end;

function TAccessReportProperties.Get_Hwnd: Integer;
begin
    Result := DefaultInterface.Hwnd;
end;

procedure TAccessReportProperties.Set_Hwnd(pRet: Integer);
begin
  DefaultInterface.Set_Hwnd(pRet);
end;

function TAccessReportProperties.Get_Count: Smallint;
begin
    Result := DefaultInterface.Count;
end;

procedure TAccessReportProperties.Set_Count(pRet: Smallint);
begin
  DefaultInterface.Set_Count(pRet);
end;

function TAccessReportProperties.Get_Page: Integer;
begin
    Result := DefaultInterface.Page;
end;

procedure TAccessReportProperties.Set_Page(pRet: Integer);
begin
  DefaultInterface.Set_Page(pRet);
end;

function TAccessReportProperties.Get_Pages: Smallint;
begin
    Result := DefaultInterface.Pages;
end;

procedure TAccessReportProperties.Set_Pages(pRet: Smallint);
begin
  DefaultInterface.Set_Pages(pRet);
end;

function TAccessReportProperties.Get_LogicalPageWidth: Integer;
begin
    Result := DefaultInterface.LogicalPageWidth;
end;

procedure TAccessReportProperties.Set_LogicalPageWidth(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageWidth(pRet);
end;

function TAccessReportProperties.Get_LogicalPageHeight: Integer;
begin
    Result := DefaultInterface.LogicalPageHeight;
end;

procedure TAccessReportProperties.Set_LogicalPageHeight(pRet: Integer);
begin
  DefaultInterface.Set_LogicalPageHeight(pRet);
end;

function TAccessReportProperties.Get_ZoomControl: Integer;
begin
    Result := DefaultInterface.ZoomControl;
end;

procedure TAccessReportProperties.Set_ZoomControl(pRet: Integer);
begin
  DefaultInterface.Set_ZoomControl(pRet);
end;

function TAccessReportProperties.Get_HasData: Integer;
begin
    Result := DefaultInterface.HasData;
end;

procedure TAccessReportProperties.Set_HasData(pRet: Integer);
begin
  DefaultInterface.Set_HasData(pRet);
end;

function TAccessReportProperties.Get_Left: Integer;
begin
    Result := DefaultInterface.Left;
end;

procedure TAccessReportProperties.Set_Left(pRet: Integer);
begin
  DefaultInterface.Set_Left(pRet);
end;

function TAccessReportProperties.Get_Top: Integer;
begin
    Result := DefaultInterface.Top;
end;

procedure TAccessReportProperties.Set_Top(pRet: Integer);
begin
  DefaultInterface.Set_Top(pRet);
end;

function TAccessReportProperties.Get_Height: Integer;
begin
    Result := DefaultInterface.Height;
end;

procedure TAccessReportProperties.Set_Height(pRet: Integer);
begin
  DefaultInterface.Set_Height(pRet);
end;

function TAccessReportProperties.Get_PrintSection: WordBool;
begin
    Result := DefaultInterface.PrintSection;
end;

procedure TAccessReportProperties.Set_PrintSection(pRet: WordBool);
begin
  DefaultInterface.Set_PrintSection(pRet);
end;

function TAccessReportProperties.Get_NextRecord: WordBool;
begin
    Result := DefaultInterface.NextRecord;
end;

procedure TAccessReportProperties.Set_NextRecord(pRet: WordBool);
begin
  DefaultInterface.Set_NextRecord(pRet);
end;

function TAccessReportProperties.Get_MoveLayout: WordBool;
begin
    Result := DefaultInterface.MoveLayout;
end;

procedure TAccessReportProperties.Set_MoveLayout(pRet: WordBool);
begin
  DefaultInterface.Set_MoveLayout(pRet);
end;

function TAccessReportProperties.Get_FormatCount: Smallint;
begin
    Result := DefaultInterface.FormatCount;
end;

procedure TAccessReportProperties.Set_FormatCount(pRet: Smallint);
begin
  DefaultInterface.Set_FormatCount(pRet);
end;

function TAccessReportProperties.Get_PrintCount: Smallint;
begin
    Result := DefaultInterface.PrintCount;
end;

procedure TAccessReportProperties.Set_PrintCount(pRet: Smallint);
begin
  DefaultInterface.Set_PrintCount(pRet);
end;

function TAccessReportProperties.Get_Visible: WordBool;
begin
    Result := DefaultInterface.Visible;
end;

procedure TAccessReportProperties.Set_Visible(pRet: WordBool);
begin
  DefaultInterface.Set_Visible(pRet);
end;

function TAccessReportProperties.Get_Painting: WordBool;
begin
    Result := DefaultInterface.Painting;
end;

procedure TAccessReportProperties.Set_Painting(pRet: WordBool);
begin
  DefaultInterface.Set_Painting(pRet);
end;

function TAccessReportProperties.Get_PrtMip: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtMip;
end;

procedure TAccessReportProperties.Set_PrtMip(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtMip(pRet);
end;

function TAccessReportProperties.Get_PrtDevMode: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevMode;
end;

procedure TAccessReportProperties.Set_PrtDevMode(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevMode(pRet);
end;

function TAccessReportProperties.Get_PrtDevNames: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrtDevNames;
end;

procedure TAccessReportProperties.Set_PrtDevNames(pRet: OleVariant);
begin
  DefaultInterface.Set_PrtDevNames(pRet);
end;

function TAccessReportProperties.Get_ForeColor: Integer;
begin
    Result := DefaultInterface.ForeColor;
end;

procedure TAccessReportProperties.Set_ForeColor(pRet: Integer);
begin
  DefaultInterface.Set_ForeColor(pRet);
end;

function TAccessReportProperties.Get_CurrentX: Single;
begin
    Result := DefaultInterface.CurrentX;
end;

procedure TAccessReportProperties.Set_CurrentX(pRet: Single);
begin
  DefaultInterface.Set_CurrentX(pRet);
end;

function TAccessReportProperties.Get_CurrentY: Single;
begin
    Result := DefaultInterface.CurrentY;
end;

procedure TAccessReportProperties.Set_CurrentY(pRet: Single);
begin
  DefaultInterface.Set_CurrentY(pRet);
end;

function TAccessReportProperties.Get_ScaleHeight: Single;
begin
    Result := DefaultInterface.ScaleHeight;
end;

procedure TAccessReportProperties.Set_ScaleHeight(pRet: Single);
begin
  DefaultInterface.Set_ScaleHeight(pRet);
end;

function TAccessReportProperties.Get_ScaleLeft: Single;
begin
    Result := DefaultInterface.ScaleLeft;
end;

procedure TAccessReportProperties.Set_ScaleLeft(pRet: Single);
begin
  DefaultInterface.Set_ScaleLeft(pRet);
end;

function TAccessReportProperties.Get_ScaleMode: Smallint;
begin
    Result := DefaultInterface.ScaleMode;
end;

procedure TAccessReportProperties.Set_ScaleMode(pRet: Smallint);
begin
  DefaultInterface.Set_ScaleMode(pRet);
end;

function TAccessReportProperties.Get_ScaleTop: Single;
begin
    Result := DefaultInterface.ScaleTop;
end;

procedure TAccessReportProperties.Set_ScaleTop(pRet: Single);
begin
  DefaultInterface.Set_ScaleTop(pRet);
end;

function TAccessReportProperties.Get_ScaleWidth: Single;
begin
    Result := DefaultInterface.ScaleWidth;
end;

procedure TAccessReportProperties.Set_ScaleWidth(pRet: Single);
begin
  DefaultInterface.Set_ScaleWidth(pRet);
end;

function TAccessReportProperties.Get_FontBold: Smallint;
begin
    Result := DefaultInterface.FontBold;
end;

procedure TAccessReportProperties.Set_FontBold(pRet: Smallint);
begin
  DefaultInterface.Set_FontBold(pRet);
end;

function TAccessReportProperties.Get_FontItalic: Smallint;
begin
    Result := DefaultInterface.FontItalic;
end;

procedure TAccessReportProperties.Set_FontItalic(pRet: Smallint);
begin
  DefaultInterface.Set_FontItalic(pRet);
end;

function TAccessReportProperties.Get_FontName: WideString;
begin
    Result := DefaultInterface.FontName;
end;

procedure TAccessReportProperties.Set_FontName(const pRet: WideString);
  { Warning: The property FontName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FontName := pRet;
end;

function TAccessReportProperties.Get_FontSize: Smallint;
begin
    Result := DefaultInterface.FontSize;
end;

procedure TAccessReportProperties.Set_FontSize(pRet: Smallint);
begin
  DefaultInterface.Set_FontSize(pRet);
end;

function TAccessReportProperties.Get_FontUnderline: Smallint;
begin
    Result := DefaultInterface.FontUnderline;
end;

procedure TAccessReportProperties.Set_FontUnderline(pRet: Smallint);
begin
  DefaultInterface.Set_FontUnderline(pRet);
end;

function TAccessReportProperties.Get_DrawMode: Smallint;
begin
    Result := DefaultInterface.DrawMode;
end;

procedure TAccessReportProperties.Set_DrawMode(pRet: Smallint);
begin
  DefaultInterface.Set_DrawMode(pRet);
end;

function TAccessReportProperties.Get_DrawStyle: Smallint;
begin
    Result := DefaultInterface.DrawStyle;
end;

procedure TAccessReportProperties.Set_DrawStyle(pRet: Smallint);
begin
  DefaultInterface.Set_DrawStyle(pRet);
end;

function TAccessReportProperties.Get_DrawWidth: Smallint;
begin
    Result := DefaultInterface.DrawWidth;
end;

procedure TAccessReportProperties.Set_DrawWidth(pRet: Smallint);
begin
  DefaultInterface.Set_DrawWidth(pRet);
end;

function TAccessReportProperties.Get_FillColor: Integer;
begin
    Result := DefaultInterface.FillColor;
end;

procedure TAccessReportProperties.Set_FillColor(pRet: Integer);
begin
  DefaultInterface.Set_FillColor(pRet);
end;

function TAccessReportProperties.Get_FillStyle: Smallint;
begin
    Result := DefaultInterface.FillStyle;
end;

procedure TAccessReportProperties.Set_FillStyle(pRet: Smallint);
begin
  DefaultInterface.Set_FillStyle(pRet);
end;

function TAccessReportProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TAccessReportProperties.Set_Name(const pRet: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pRet;
end;

function TAccessReportProperties.Get_PaletteSource: WideString;
begin
    Result := DefaultInterface.PaletteSource;
end;

procedure TAccessReportProperties.Set_PaletteSource(const pRet: WideString);
  { Warning: The property PaletteSource has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PaletteSource := pRet;
end;

function TAccessReportProperties.Get_Tag: WideString;
begin
    Result := DefaultInterface.Tag;
end;

procedure TAccessReportProperties.Set_Tag(const pRet: WideString);
  { Warning: The property Tag has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Tag := pRet;
end;

function TAccessReportProperties.Get_PaintPalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PaintPalette;
end;

procedure TAccessReportProperties.Set_PaintPalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PaintPalette(pRet);
end;

function TAccessReportProperties.Get_OnMenu: WideString;
begin
    Result := DefaultInterface.OnMenu;
end;

procedure TAccessReportProperties.Set_OnMenu(const pRet: WideString);
  { Warning: The property OnMenu has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnMenu := pRet;
end;

function TAccessReportProperties.Get_OnOpen: WideString;
begin
    Result := DefaultInterface.OnOpen;
end;

procedure TAccessReportProperties.Set_OnOpen(const pRet: WideString);
  { Warning: The property OnOpen has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnOpen := pRet;
end;

function TAccessReportProperties.Get_OnClose: WideString;
begin
    Result := DefaultInterface.OnClose;
end;

procedure TAccessReportProperties.Set_OnClose(const pRet: WideString);
  { Warning: The property OnClose has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnClose := pRet;
end;

function TAccessReportProperties.Get_OnActivate: WideString;
begin
    Result := DefaultInterface.OnActivate;
end;

procedure TAccessReportProperties.Set_OnActivate(const pRet: WideString);
  { Warning: The property OnActivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnActivate := pRet;
end;

function TAccessReportProperties.Get_OnDeactivate: WideString;
begin
    Result := DefaultInterface.OnDeactivate;
end;

procedure TAccessReportProperties.Set_OnDeactivate(const pRet: WideString);
  { Warning: The property OnDeactivate has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnDeactivate := pRet;
end;

function TAccessReportProperties.Get_OnNoData: WideString;
begin
    Result := DefaultInterface.OnNoData;
end;

procedure TAccessReportProperties.Set_OnNoData(const pRet: WideString);
  { Warning: The property OnNoData has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnNoData := pRet;
end;

function TAccessReportProperties.Get_OnPage: WideString;
begin
    Result := DefaultInterface.OnPage;
end;

procedure TAccessReportProperties.Set_OnPage(const pRet: WideString);
  { Warning: The property OnPage has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnPage := pRet;
end;

function TAccessReportProperties.Get_OnError: WideString;
begin
    Result := DefaultInterface.OnError;
end;

procedure TAccessReportProperties.Set_OnError(const pRet: WideString);
  { Warning: The property OnError has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OnError := pRet;
end;

function TAccessReportProperties.Get_Dirty: WordBool;
begin
    Result := DefaultInterface.Dirty;
end;

procedure TAccessReportProperties.Set_Dirty(pRet: WordBool);
begin
  DefaultInterface.Set_Dirty(pRet);
end;

function TAccessReportProperties.Get_CurrentRecord: Integer;
begin
    Result := DefaultInterface.CurrentRecord;
end;

procedure TAccessReportProperties.Set_CurrentRecord(pRet: Integer);
begin
  DefaultInterface.Set_CurrentRecord(pRet);
end;

function TAccessReportProperties.Get_PictureData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PictureData;
end;

procedure TAccessReportProperties.Set_PictureData(pRet: OleVariant);
begin
  DefaultInterface.Set_PictureData(pRet);
end;

function TAccessReportProperties.Get_PicturePalette: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PicturePalette;
end;

procedure TAccessReportProperties.Set_PicturePalette(pRet: OleVariant);
begin
  DefaultInterface.Set_PicturePalette(pRet);
end;

function TAccessReportProperties.Get_HasModule: WordBool;
begin
    Result := DefaultInterface.HasModule;
end;

procedure TAccessReportProperties.Set_HasModule(pRet: WordBool);
begin
  DefaultInterface.Set_HasModule(pRet);
end;

function TAccessReportProperties.Get_acHiddenCurrentPage: Integer;
begin
    Result := DefaultInterface.acHiddenCurrentPage;
end;

procedure TAccessReportProperties.Set_acHiddenCurrentPage(pRet: Integer);
begin
  DefaultInterface.Set_acHiddenCurrentPage(pRet);
end;

function TAccessReportProperties.Get_Application: AccessApplication;
begin
    Result := DefaultInterface.Application;
end;

function TAccessReportProperties.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessReportProperties.Get_ActiveControl: AccessControl;
begin
    Result := DefaultInterface.ActiveControl;
end;

function TAccessReportProperties.Get_DefaultControl(ControlType: Integer): AccessControl;
begin
    Result := DefaultInterface.DefaultControl[ControlType];
end;

function TAccessReportProperties.Get_Section(Index: OleVariant): AccessSection;
begin
    Result := DefaultInterface.Section[Index];
end;

function TAccessReportProperties.Get_GroupLevel(Index: Integer): AccessGroupLevel;
begin
    Result := DefaultInterface.GroupLevel[Index];
end;

function TAccessReportProperties.Get_Report: AccessReport;
begin
    Result := DefaultInterface.Report;
end;

function TAccessReportProperties.Get_Module: Module;
begin
    Result := DefaultInterface.Module;
end;

function TAccessReportProperties.Get_Properties: Properties;
begin
    Result := DefaultInterface.Properties;
end;

function TAccessReportProperties.Get_Controls: Controls;
begin
    Result := DefaultInterface.Controls;
end;

{$ENDIF}

class function CoAccessApplication.Create: _Application;
begin
  Result := CreateComObject(CLASS_AccessApplication) as _Application;
end;

class function CoAccessApplication.CreateRemote(const MachineName: string): _Application;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccessApplication) as _Application;
end;

class function CoAccessReferences.Create: _References;
begin
  Result := CreateComObject(CLASS_AccessReferences) as _References;
end;

class function CoAccessReferences.CreateRemote(const MachineName: string): _References;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccessReferences) as _References;
end;

procedure TAccessReferences.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{EB106214-9C89-11CF-A2B3-00A0C90542FF}';
    IntfIID:   '{EB106213-9C89-11CF-A2B3-00A0C90542FF}';
    EventIID:  '{F163F201-ADA2-11CF-89A9-00A0C9054129}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAccessReferences.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as _References;
  end;
end;

procedure TAccessReferences.ConnectTo(svrIntf: _References);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TAccessReferences.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TAccessReferences.GetDefaultInterface: _References;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAccessReferences.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAccessReferencesProperties.Create(Self);
{$ENDIF}
end;

destructor TAccessReferences.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAccessReferences.GetServerProperties: TAccessReferencesProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TAccessReferences.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    0: if Assigned(FOnItemAdded) then
         FOnItemAdded(Self, IUnknown(TVarData(Params[0]).VPointer) as Reference {const Reference});
    1: if Assigned(FOnItemRemoved) then
         FOnItemRemoved(Self, IUnknown(TVarData(Params[0]).VPointer) as Reference {const Reference});
  end; {case DispID}
end;

function TAccessReferences.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessReferences.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TAccessReferences.Item(var_: OleVariant): Reference;
begin
  Result := DefaultInterface.Item(var_);
end;

function TAccessReferences._NewEnum: IUnknown;
begin
  Result := DefaultInterface._NewEnum;
end;

function TAccessReferences.AddFromGuid(const Guid: WideString; Major: Integer; Minor: Integer): Reference;
begin
  Result := DefaultInterface.AddFromGuid(Guid, Major, Minor);
end;

function TAccessReferences.AddFromFile(const FileName: WideString): Reference;
begin
  Result := DefaultInterface.AddFromFile(FileName);
end;

procedure TAccessReferences.Remove(const Reference: Reference);
begin
  DefaultInterface.Remove(Reference);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAccessReferencesProperties.Create(AServer: TAccessReferences);
begin
  inherited Create;
  FServer := AServer;
end;

function TAccessReferencesProperties.GetDefaultInterface: _References;
begin
  Result := FServer.DefaultInterface;
end;

function TAccessReferencesProperties.Get_Parent: IDispatch;
begin
    Result := DefaultInterface.Parent;
end;

function TAccessReferencesProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

{$ENDIF}

class function CoClass_.Create: _Dummy;
begin
  Result := CreateComObject(CLASS_Class_) as _Dummy;
end;

class function CoClass_.CreateRemote(const MachineName: string): _Dummy;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Class_) as _Dummy;
end;

class function Co___CodeModule.Create: ___IVbaModule;
begin
  Result := CreateComObject(CLASS____CodeModule) as ___IVbaModule;
end;

class function Co___CodeModule.CreateRemote(const MachineName: string): ___IVbaModule;
begin
  Result := CreateRemoteComObject(MachineName, CLASS____CodeModule) as ___IVbaModule;
end;

class function Co___Editors.Create: ___IVbaEditors;
begin
  Result := CreateComObject(CLASS____Editors) as ___IVbaEditors;
end;

class function Co___Editors.CreateRemote(const MachineName: string): ___IVbaEditors;
begin
  Result := CreateRemoteComObject(MachineName, CLASS____Editors) as ___IVbaEditors;
end;

class function Co___Editor.Create: ___IVbaEditor;
begin
  Result := CreateComObject(CLASS____Editor) as ___IVbaEditor;
end;

class function Co___Editor.CreateRemote(const MachineName: string): ___IVbaEditor;
begin
  Result := CreateRemoteComObject(MachineName, CLASS____Editor) as ___IVbaEditor;
end;

class function Co___References.Create: IVbaReferences;
begin
  Result := CreateComObject(CLASS____References) as IVbaReferences;
end;

class function Co___References.CreateRemote(const MachineName: string): IVbaReferences;
begin
  Result := CreateRemoteComObject(MachineName, CLASS____References) as IVbaReferences;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TAccessControl, TAccessLabel, TAccessRectangle, TAccessLine, 
    TAccessImage, TAccessCommandButton, TAccessOptionButton, TAccessCheckBox, TAccessOptionGroup, 
    TAccessBoundObjectFrame, TAccessTextBox, TAccessListBox, TAccessComboBox, TAccessObjectFrame, 
    TAccessPageBreak, TAccessToggleButton, TAccessSubForm, TAccessSubReport, TAccessCustomControl, 
    TAccessTabControl, TAccessPage, TAccessSection, TAccessGroupLevel]);
  RegisterComponents(dtlServerPage, [TDoCmd, TAccessHyperlink, TAccessForm, TAccessReport, 
    TAccessReferences]);
end;

end.
