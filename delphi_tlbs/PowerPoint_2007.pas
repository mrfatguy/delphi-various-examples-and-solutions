unit PowerPoint_2007;

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
// File generated on 2010-09-02 11:30:35 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Microsoft Office\Office12\MSPPT.OLB (1)
// LIBID: {91493440-5A91-11CF-8700-00AA0060263B}
// LCID: 0
// Helpfile: C:\Program Files\Microsoft Office\Office12\VBAPP10.CHM
// HelpString: Microsoft PowerPoint 12.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v2.4 Office, (C:\Program Files\Common Files\Microsoft Shared\OFFICE12\MSO.DLL)
//   (3) v5.3 VBIDE, (C:\Program Files\Common Files\Microsoft Shared\VBA\VBA6\VBE6EXT.OLB)
// Errors:
//   Hint: Symbol 'Application' renamed to 'PowerPointApplication'
//   Hint: Symbol 'Global' renamed to 'PowerPointGlobal'
//   Hint: Symbol 'Presentation' renamed to 'PowerPointPresentation'
//   Hint: Symbol 'Slide' renamed to 'PowerPointSlide'
//   Hint: Symbol 'OLEControl' renamed to 'OLECtrl'
//   Hint: Parameter 'Type' of _Application.PPFileDialog changed to 'Type_'
//   Hint: Parameter 'Type' of _Application.FileDialog changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ColorFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Selection.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of View.Type changed to 'Type_'
//   Hint: Parameter 'To' of View.PrintOut changed to 'To_'
//   Hint: Parameter 'End' of PrintRanges.Add changed to 'End_'
//   Hint: Member 'End' of 'PrintRange' changed to 'End_'
//   Hint: Parameter 'End' of PrintRange.End changed to 'End_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Hyperlink.Type changed to 'Type_'
//   Hint: Parameter 'Type' of ExtraColors.Add changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of SoundEffect.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of SoundEffect.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of SoundFormat.Type changed to 'Type_'
//   Hint: Parameter 'Type' of Shapes.AddCallout changed to 'Type_'
//   Hint: Parameter 'Type' of Shapes.AddConnector changed to 'Type_'
//   Hint: Parameter 'Label' of Shapes.AddLabel changed to 'Label_'
//   Hint: Parameter 'Type' of Shapes.AddShape changed to 'Type_'
//   Hint: Parameter 'Type' of Shapes.AddPlaceholder changed to 'Type_'
//   Hint: Parameter 'Type' of Shapes.AddDiagram changed to 'Type_'
//   Hint: Parameter 'Type' of Shapes.AddChart changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of PlaceholderFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Shape.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ShapeRange.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of FillFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ShadowFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ShadowFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ConnectorFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of ConnectorFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of CalloutFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of CalloutFormat.Type changed to 'Type_'
//   Hint: Member 'Object' of 'OLEFormat' changed to 'Object_'
//   Hint: Parameter 'Object' of OLEFormat.Object changed to 'Object_'
//   Hint: Parameter 'Type' of TextRange.ChangeCase changed to 'Type_'
//   Hint: Parameter 'Type' of TabStops.Add changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of TabStop.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of TabStop.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of BulletFormat.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of BulletFormat.Type changed to 'Type_'
//   Hint: Parameter 'Type' of TextStyles.Item changed to 'Type_'
//   Hint: Parameter 'To' of _Presentation.PrintOut changed to 'To_'
//   Hint: Parameter 'Type' of _Presentation.RemoveDocumentInformation changed to 'Type_'
//   Hint: Parameter 'Type' of DiagramNode.Layout changed to 'Type_'
//   Hint: Parameter 'Type' of DiagramNode.Layout changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Diagram.Type changed to 'Type_'
//   Hint: Parameter 'Type' of Diagram.Convert changed to 'Type_'
//   Hint: Parameter 'Type' of AnimationBehaviors.Add changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of AnimationBehavior.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of AnimationBehavior.Type changed to 'Type_'
//   Hint: Member 'To' of 'ColorEffect' changed to 'To_'
//   Hint: Parameter 'To' of ColorEffect.To changed to 'To_'
//   Hint: Member 'To' of 'RotationEffect' changed to 'To_'
//   Hint: Parameter 'To' of RotationEffect.To changed to 'To_'
//   Hint: Parameter 'To' of RotationEffect.To changed to 'To_'
//   Hint: Member 'Property' of 'PropertyEffect' changed to 'Property_'
//   Hint: Parameter 'Property' of PropertyEffect.Property changed to 'Property_'
//   Hint: Parameter 'Property' of PropertyEffect.Property changed to 'Property_'
//   Hint: Member 'To' of 'PropertyEffect' changed to 'To_'
//   Hint: Parameter 'To' of PropertyEffect.To changed to 'To_'
//   Hint: Parameter 'To' of PropertyEffect.To changed to 'To_'
//   Hint: Parameter 'Type' of CanvasShapes.AddCallout changed to 'Type_'
//   Hint: Parameter 'Type' of CanvasShapes.AddConnector changed to 'Type_'
//   Hint: Parameter 'Label' of CanvasShapes.AddLabel changed to 'Label_'
//   Hint: Parameter 'Type' of CanvasShapes.AddShape changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of CommandEffect.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of CommandEffect.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of FilterEffect.Type changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of FilterEffect.Type changed to 'Type_'
//   Hint: Member 'Property' of 'SetEffect' changed to 'Property_'
//   Hint: Parameter 'Property' of SetEffect.Property changed to 'Property_'
//   Hint: Parameter 'Property' of SetEffect.Property changed to 'Property_'
//   Hint: Member 'To' of 'SetEffect' changed to 'To_'
//   Hint: Parameter 'To' of SetEffect.To changed to 'To_'
//   Hint: Parameter 'To' of SetEffect.To changed to 'To_'
//   Error creating palette bitmap of (TPowerPointApplication) : Access violation at address 00A65353 in module 'tlib70.bpl'. Read of address 00000000
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

uses Windows, ActiveX, Classes, Graphics, Office_TLB, OleServer, StdVCL, Variants, 
VBIDE_TLB;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PowerPointMajorVersion = 2;
  PowerPointMinorVersion = 9;

  LIBID_PowerPoint: TGUID = '{91493440-5A91-11CF-8700-00AA0060263B}';

  IID_Collection: TGUID = '{91493450-5A91-11CF-8700-00AA0060263B}';
  IID__Application: TGUID = '{91493442-5A91-11CF-8700-00AA0060263B}';
  IID__Global: TGUID = '{91493451-5A91-11CF-8700-00AA0060263B}';
  IID_EApplication: TGUID = '{914934C2-5A91-11CF-8700-00AA0060263B}';
  CLASS_PowerPointGlobal: TGUID = '{91493443-5A91-11CF-8700-00AA0060263B}';
  IID_ColorFormat: TGUID = '{91493452-5A91-11CF-8700-00AA0060263B}';
  IID_SlideShowWindow: TGUID = '{91493453-5A91-11CF-8700-00AA0060263B}';
  IID_Selection: TGUID = '{91493454-5A91-11CF-8700-00AA0060263B}';
  IID_DocumentWindows: TGUID = '{91493455-5A91-11CF-8700-00AA0060263B}';
  IID_SlideShowWindows: TGUID = '{91493456-5A91-11CF-8700-00AA0060263B}';
  IID_DocumentWindow: TGUID = '{91493457-5A91-11CF-8700-00AA0060263B}';
  IID_View: TGUID = '{91493458-5A91-11CF-8700-00AA0060263B}';
  IID_SlideShowView: TGUID = '{91493459-5A91-11CF-8700-00AA0060263B}';
  IID_SlideShowSettings: TGUID = '{9149345A-5A91-11CF-8700-00AA0060263B}';
  IID_NamedSlideShows: TGUID = '{9149345B-5A91-11CF-8700-00AA0060263B}';
  IID_NamedSlideShow: TGUID = '{9149345C-5A91-11CF-8700-00AA0060263B}';
  IID_PrintOptions: TGUID = '{9149345D-5A91-11CF-8700-00AA0060263B}';
  IID_PrintRanges: TGUID = '{9149345E-5A91-11CF-8700-00AA0060263B}';
  IID_PrintRange: TGUID = '{9149345F-5A91-11CF-8700-00AA0060263B}';
  IID_AddIns: TGUID = '{91493460-5A91-11CF-8700-00AA0060263B}';
  IID_AddIn: TGUID = '{91493461-5A91-11CF-8700-00AA0060263B}';
  IID_Presentations: TGUID = '{91493462-5A91-11CF-8700-00AA0060263B}';
  IID_PresEvents: TGUID = '{91493463-5A91-11CF-8700-00AA0060263B}';
  IID__Presentation: TGUID = '{9149349D-5A91-11CF-8700-00AA0060263B}';
  IID_Hyperlinks: TGUID = '{91493464-5A91-11CF-8700-00AA0060263B}';
  IID_Hyperlink: TGUID = '{91493465-5A91-11CF-8700-00AA0060263B}';
  IID_PageSetup: TGUID = '{91493466-5A91-11CF-8700-00AA0060263B}';
  IID_Fonts: TGUID = '{91493467-5A91-11CF-8700-00AA0060263B}';
  IID_ExtraColors: TGUID = '{91493468-5A91-11CF-8700-00AA0060263B}';
  IID_Slides: TGUID = '{91493469-5A91-11CF-8700-00AA0060263B}';
  IID__Slide: TGUID = '{9149346A-5A91-11CF-8700-00AA0060263B}';
  IID_SlideRange: TGUID = '{9149346B-5A91-11CF-8700-00AA0060263B}';
  IID__Master: TGUID = '{9149346C-5A91-11CF-8700-00AA0060263B}';
  IID_SldEvents: TGUID = '{9149346D-5A91-11CF-8700-00AA0060263B}';
  CLASS_PowerPointSlide: TGUID = '{91493445-5A91-11CF-8700-00AA0060263B}';
  IID_ColorSchemes: TGUID = '{9149346E-5A91-11CF-8700-00AA0060263B}';
  IID_ColorScheme: TGUID = '{9149346F-5A91-11CF-8700-00AA0060263B}';
  IID_RGBColor: TGUID = '{91493470-5A91-11CF-8700-00AA0060263B}';
  IID_SlideShowTransition: TGUID = '{91493471-5A91-11CF-8700-00AA0060263B}';
  IID_SoundEffect: TGUID = '{91493472-5A91-11CF-8700-00AA0060263B}';
  IID_SoundFormat: TGUID = '{91493473-5A91-11CF-8700-00AA0060263B}';
  IID_HeadersFooters: TGUID = '{91493474-5A91-11CF-8700-00AA0060263B}';
  IID_Shapes: TGUID = '{91493475-5A91-11CF-8700-00AA0060263B}';
  IID_Placeholders: TGUID = '{91493476-5A91-11CF-8700-00AA0060263B}';
  IID_PlaceholderFormat: TGUID = '{91493477-5A91-11CF-8700-00AA0060263B}';
  IID_FreeformBuilder: TGUID = '{91493478-5A91-11CF-8700-00AA0060263B}';
  IID_Shape: TGUID = '{91493479-5A91-11CF-8700-00AA0060263B}';
  IID_ShapeRange: TGUID = '{9149347A-5A91-11CF-8700-00AA0060263B}';
  IID_GroupShapes: TGUID = '{9149347B-5A91-11CF-8700-00AA0060263B}';
  IID_Adjustments: TGUID = '{9149347C-5A91-11CF-8700-00AA0060263B}';
  IID_PictureFormat: TGUID = '{9149347D-5A91-11CF-8700-00AA0060263B}';
  IID_FillFormat: TGUID = '{9149347E-5A91-11CF-8700-00AA0060263B}';
  IID_LineFormat: TGUID = '{9149347F-5A91-11CF-8700-00AA0060263B}';
  IID_ShadowFormat: TGUID = '{91493480-5A91-11CF-8700-00AA0060263B}';
  IID_ConnectorFormat: TGUID = '{91493481-5A91-11CF-8700-00AA0060263B}';
  IID_TextEffectFormat: TGUID = '{91493482-5A91-11CF-8700-00AA0060263B}';
  IID_ThreeDFormat: TGUID = '{91493483-5A91-11CF-8700-00AA0060263B}';
  IID_TextFrame: TGUID = '{91493484-5A91-11CF-8700-00AA0060263B}';
  IID_CalloutFormat: TGUID = '{91493485-5A91-11CF-8700-00AA0060263B}';
  IID_ShapeNodes: TGUID = '{91493486-5A91-11CF-8700-00AA0060263B}';
  IID_ShapeNode: TGUID = '{91493487-5A91-11CF-8700-00AA0060263B}';
  IID_OLEFormat: TGUID = '{91493488-5A91-11CF-8700-00AA0060263B}';
  IID_LinkFormat: TGUID = '{91493489-5A91-11CF-8700-00AA0060263B}';
  IID_ObjectVerbs: TGUID = '{9149348A-5A91-11CF-8700-00AA0060263B}';
  IID_AnimationSettings: TGUID = '{9149348B-5A91-11CF-8700-00AA0060263B}';
  IID_ActionSettings: TGUID = '{9149348C-5A91-11CF-8700-00AA0060263B}';
  IID_ActionSetting: TGUID = '{9149348D-5A91-11CF-8700-00AA0060263B}';
  IID_PlaySettings: TGUID = '{9149348E-5A91-11CF-8700-00AA0060263B}';
  IID_TextRange: TGUID = '{9149348F-5A91-11CF-8700-00AA0060263B}';
  IID_Ruler: TGUID = '{91493490-5A91-11CF-8700-00AA0060263B}';
  IID_RulerLevels: TGUID = '{91493491-5A91-11CF-8700-00AA0060263B}';
  IID_RulerLevel: TGUID = '{91493492-5A91-11CF-8700-00AA0060263B}';
  IID_TabStops: TGUID = '{91493493-5A91-11CF-8700-00AA0060263B}';
  IID_TabStop: TGUID = '{91493494-5A91-11CF-8700-00AA0060263B}';
  IID_Font: TGUID = '{91493495-5A91-11CF-8700-00AA0060263B}';
  IID_ParagraphFormat: TGUID = '{91493496-5A91-11CF-8700-00AA0060263B}';
  IID_BulletFormat: TGUID = '{91493497-5A91-11CF-8700-00AA0060263B}';
  IID_TextStyles: TGUID = '{91493498-5A91-11CF-8700-00AA0060263B}';
  IID_TextStyle: TGUID = '{91493499-5A91-11CF-8700-00AA0060263B}';
  IID_TextStyleLevels: TGUID = '{9149349A-5A91-11CF-8700-00AA0060263B}';
  IID_TextStyleLevel: TGUID = '{9149349B-5A91-11CF-8700-00AA0060263B}';
  IID_HeaderFooter: TGUID = '{9149349C-5A91-11CF-8700-00AA0060263B}';
  CLASS_PowerPointPresentation: TGUID = '{91493444-5A91-11CF-8700-00AA0060263B}';
  IID_Tags: TGUID = '{914934B9-5A91-11CF-8700-00AA0060263B}';
  IID_MouseTracker: TGUID = '{914934BE-5A91-11CF-8700-00AA0060263B}';
  IID_MouseDownHandler: TGUID = '{914934BF-5A91-11CF-8700-00AA0060263B}';
  IID_OCXExtender: TGUID = '{914934C0-5A91-11CF-8700-00AA0060263B}';
  IID_OCXExtenderEvents: TGUID = '{914934C1-5A91-11CF-8700-00AA0060263B}';
  CLASS_OLECtrl: TGUID = '{91493446-5A91-11CF-8700-00AA0060263B}';
  CLASS_PowerPointApplication: TGUID = '{91493441-5A91-11CF-8700-00AA0060263B}';
  IID_Table: TGUID = '{914934C3-5A91-11CF-8700-00AA0060263B}';
  IID_Columns: TGUID = '{914934C4-5A91-11CF-8700-00AA0060263B}';
  IID_Column: TGUID = '{914934C5-5A91-11CF-8700-00AA0060263B}';
  IID_Rows: TGUID = '{914934C6-5A91-11CF-8700-00AA0060263B}';
  IID_Row: TGUID = '{914934C7-5A91-11CF-8700-00AA0060263B}';
  IID_CellRange: TGUID = '{914934C8-5A91-11CF-8700-00AA0060263B}';
  IID_Cell: TGUID = '{914934C9-5A91-11CF-8700-00AA0060263B}';
  IID_Borders: TGUID = '{914934CA-5A91-11CF-8700-00AA0060263B}';
  IID_Panes: TGUID = '{914934CB-5A91-11CF-8700-00AA0060263B}';
  IID_Pane: TGUID = '{914934CC-5A91-11CF-8700-00AA0060263B}';
  IID_DefaultWebOptions: TGUID = '{914934CD-5A91-11CF-8700-00AA0060263B}';
  IID_WebOptions: TGUID = '{914934CE-5A91-11CF-8700-00AA0060263B}';
  IID_PublishObjects: TGUID = '{914934CF-5A91-11CF-8700-00AA0060263B}';
  IID_PublishObject: TGUID = '{914934D0-5A91-11CF-8700-00AA0060263B}';
  IID_MasterEvents: TGUID = '{914934D2-5A91-11CF-8700-00AA0060263B}';
  CLASS_Master: TGUID = '{91493447-5A91-11CF-8700-00AA0060263B}';
  IID__PowerRex: TGUID = '{914934D3-5A91-11CF-8700-00AA0060263B}';
  CLASS_PowerRex: TGUID = '{91493448-5A91-11CF-8700-00AA0060263B}';
  IID_Comments: TGUID = '{914934D4-5A91-11CF-8700-00AA0060263B}';
  IID_Comment: TGUID = '{914934D5-5A91-11CF-8700-00AA0060263B}';
  IID_Designs: TGUID = '{914934D6-5A91-11CF-8700-00AA0060263B}';
  IID_Design: TGUID = '{914934D7-5A91-11CF-8700-00AA0060263B}';
  IID_DiagramNode: TGUID = '{914934D8-5A91-11CF-8700-00AA0060263B}';
  IID_DiagramNodeChildren: TGUID = '{914934D9-5A91-11CF-8700-00AA0060263B}';
  IID_DiagramNodes: TGUID = '{914934DA-5A91-11CF-8700-00AA0060263B}';
  IID_Diagram: TGUID = '{914934DB-5A91-11CF-8700-00AA0060263B}';
  IID_TimeLine: TGUID = '{914934DC-5A91-11CF-8700-00AA0060263B}';
  IID_Sequences: TGUID = '{914934DD-5A91-11CF-8700-00AA0060263B}';
  IID_Sequence: TGUID = '{914934DE-5A91-11CF-8700-00AA0060263B}';
  IID_Effect: TGUID = '{914934DF-5A91-11CF-8700-00AA0060263B}';
  IID_Timing: TGUID = '{914934E0-5A91-11CF-8700-00AA0060263B}';
  IID_EffectParameters: TGUID = '{914934E1-5A91-11CF-8700-00AA0060263B}';
  IID_EffectInformation: TGUID = '{914934E2-5A91-11CF-8700-00AA0060263B}';
  IID_AnimationBehaviors: TGUID = '{914934E3-5A91-11CF-8700-00AA0060263B}';
  IID_AnimationBehavior: TGUID = '{914934E4-5A91-11CF-8700-00AA0060263B}';
  IID_MotionEffect: TGUID = '{914934E5-5A91-11CF-8700-00AA0060263B}';
  IID_ColorEffect: TGUID = '{914934E6-5A91-11CF-8700-00AA0060263B}';
  IID_ScaleEffect: TGUID = '{914934E7-5A91-11CF-8700-00AA0060263B}';
  IID_RotationEffect: TGUID = '{914934E8-5A91-11CF-8700-00AA0060263B}';
  IID_PropertyEffect: TGUID = '{914934E9-5A91-11CF-8700-00AA0060263B}';
  IID_AnimationPoints: TGUID = '{914934EA-5A91-11CF-8700-00AA0060263B}';
  IID_AnimationPoint: TGUID = '{914934EB-5A91-11CF-8700-00AA0060263B}';
  IID_CanvasShapes: TGUID = '{914934EC-5A91-11CF-8700-00AA0060263B}';
  IID_AutoCorrect: TGUID = '{914934ED-5A91-11CF-8700-00AA0060263B}';
  IID_Options: TGUID = '{914934EE-5A91-11CF-8700-00AA0060263B}';
  IID_CommandEffect: TGUID = '{914934EF-5A91-11CF-8700-00AA0060263B}';
  IID_FilterEffect: TGUID = '{914934F0-5A91-11CF-8700-00AA0060263B}';
  IID_SetEffect: TGUID = '{914934F1-5A91-11CF-8700-00AA0060263B}';
  IID_CustomLayouts: TGUID = '{914934F2-5A91-11CF-8700-00AA0060263B}';
  IID_CustomLayout: TGUID = '{914934F3-5A91-11CF-8700-00AA0060263B}';
  IID_TableStyle: TGUID = '{914934F5-5A91-11CF-8700-00AA0060263B}';
  IID_CustomerData: TGUID = '{914934F6-5A91-11CF-8700-00AA0060263B}';
  IID_Research: TGUID = '{914934F7-5A91-11CF-8700-00AA0060263B}';
  IID_TableBackground: TGUID = '{914934F8-5A91-11CF-8700-00AA0060263B}';
  IID_TextFrame2: TGUID = '{914934F9-5A91-11CF-8700-00AA0060263B}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum PpWindowState
type
  PpWindowState = TOleEnum;
const
  ppWindowNormal = $00000001;
  ppWindowMinimized = $00000002;
  ppWindowMaximized = $00000003;

// Constants for enum PpArrangeStyle
type
  PpArrangeStyle = TOleEnum;
const
  ppArrangeTiled = $00000001;
  ppArrangeCascade = $00000002;

// Constants for enum PpViewType
type
  PpViewType = TOleEnum;
const
  ppViewSlide = $00000001;
  ppViewSlideMaster = $00000002;
  ppViewNotesPage = $00000003;
  ppViewHandoutMaster = $00000004;
  ppViewNotesMaster = $00000005;
  ppViewOutline = $00000006;
  ppViewSlideSorter = $00000007;
  ppViewTitleMaster = $00000008;
  ppViewNormal = $00000009;
  ppViewPrintPreview = $0000000A;
  ppViewThumbnails = $0000000B;
  ppViewMasterThumbnails = $0000000C;

// Constants for enum PpColorSchemeIndex
type
  PpColorSchemeIndex = TOleEnum;
const
  ppSchemeColorMixed = $FFFFFFFE;
  ppNotSchemeColor = $00000000;
  ppBackground = $00000001;
  ppForeground = $00000002;
  ppShadow = $00000003;
  ppTitle = $00000004;
  ppFill = $00000005;
  ppAccent1 = $00000006;
  ppAccent2 = $00000007;
  ppAccent3 = $00000008;

// Constants for enum PpSlideSizeType
type
  PpSlideSizeType = TOleEnum;
const
  ppSlideSizeOnScreen = $00000001;
  ppSlideSizeLetterPaper = $00000002;
  ppSlideSizeA4Paper = $00000003;
  ppSlideSize35MM = $00000004;
  ppSlideSizeOverhead = $00000005;
  ppSlideSizeBanner = $00000006;
  ppSlideSizeCustom = $00000007;
  ppSlideSizeLedgerPaper = $00000008;
  ppSlideSizeA3Paper = $00000009;
  ppSlideSizeB4ISOPaper = $0000000A;
  ppSlideSizeB5ISOPaper = $0000000B;
  ppSlideSizeB4JISPaper = $0000000C;
  ppSlideSizeB5JISPaper = $0000000D;
  ppSlideSizeHagakiCard = $0000000E;
  ppSlideSizeOnScreen16x9 = $0000000F;
  ppSlideSizeOnScreen16x10 = $00000010;

// Constants for enum PpSaveAsFileType
type
  PpSaveAsFileType = TOleEnum;
const
  ppSaveAsPresentation = $00000001;
  ppSaveAsPowerPoint7 = $00000002;
  ppSaveAsPowerPoint4 = $00000003;
  ppSaveAsPowerPoint3 = $00000004;
  ppSaveAsTemplate = $00000005;
  ppSaveAsRTF = $00000006;
  ppSaveAsShow = $00000007;
  ppSaveAsAddIn = $00000008;
  ppSaveAsPowerPoint4FarEast = $0000000A;
  ppSaveAsDefault = $0000000B;
  ppSaveAsHTML = $0000000C;
  ppSaveAsHTMLv3 = $0000000D;
  ppSaveAsHTMLDual = $0000000E;
  ppSaveAsMetaFile = $0000000F;
  ppSaveAsGIF = $00000010;
  ppSaveAsJPG = $00000011;
  ppSaveAsPNG = $00000012;
  ppSaveAsBMP = $00000013;
  ppSaveAsWebArchive = $00000014;
  ppSaveAsTIF = $00000015;
  ppSaveAsPresForReview = $00000016;
  ppSaveAsEMF = $00000017;
  ppSaveAsOpenXMLPresentation = $00000018;
  ppSaveAsOpenXMLPresentationMacroEnabled = $00000019;
  ppSaveAsOpenXMLTemplate = $0000001A;
  ppSaveAsOpenXMLTemplateMacroEnabled = $0000001B;
  ppSaveAsOpenXMLShow = $0000001C;
  ppSaveAsOpenXMLShowMacroEnabled = $0000001D;
  ppSaveAsOpenXMLAddin = $0000001E;
  ppSaveAsOpenXMLTheme = $0000001F;
  ppSaveAsPDF = $00000020;
  ppSaveAsXPS = $00000021;
  ppSaveAsXMLPresentation = $00000022;

// Constants for enum PpTextStyleType
type
  PpTextStyleType = TOleEnum;
const
  ppDefaultStyle = $00000001;
  ppTitleStyle = $00000002;
  ppBodyStyle = $00000003;

// Constants for enum PpSlideLayout
type
  PpSlideLayout = TOleEnum;
const
  ppLayoutMixed = $FFFFFFFE;
  ppLayoutTitle = $00000001;
  ppLayoutText = $00000002;
  ppLayoutTwoColumnText = $00000003;
  ppLayoutTable = $00000004;
  ppLayoutTextAndChart = $00000005;
  ppLayoutChartAndText = $00000006;
  ppLayoutOrgchart = $00000007;
  ppLayoutChart = $00000008;
  ppLayoutTextAndClipart = $00000009;
  ppLayoutClipartAndText = $0000000A;
  ppLayoutTitleOnly = $0000000B;
  ppLayoutBlank = $0000000C;
  ppLayoutTextAndObject = $0000000D;
  ppLayoutObjectAndText = $0000000E;
  ppLayoutLargeObject = $0000000F;
  ppLayoutObject = $00000010;
  ppLayoutTextAndMediaClip = $00000011;
  ppLayoutMediaClipAndText = $00000012;
  ppLayoutObjectOverText = $00000013;
  ppLayoutTextOverObject = $00000014;
  ppLayoutTextAndTwoObjects = $00000015;
  ppLayoutTwoObjectsAndText = $00000016;
  ppLayoutTwoObjectsOverText = $00000017;
  ppLayoutFourObjects = $00000018;
  ppLayoutVerticalText = $00000019;
  ppLayoutClipArtAndVerticalText = $0000001A;
  ppLayoutVerticalTitleAndText = $0000001B;
  ppLayoutVerticalTitleAndTextOverChart = $0000001C;
  ppLayoutTwoObjects = $0000001D;
  ppLayoutObjectAndTwoObjects = $0000001E;
  ppLayoutTwoObjectsAndObject = $0000001F;
  ppLayoutCustom = $00000020;
  ppLayoutSectionHeader = $00000021;
  ppLayoutComparison = $00000022;
  ppLayoutContentWithCaption = $00000023;
  ppLayoutPictureWithCaption = $00000024;

// Constants for enum PpEntryEffect
type
  PpEntryEffect = TOleEnum;
const
  ppEffectMixed = $FFFFFFFE;
  ppEffectNone = $00000000;
  ppEffectCut = $00000101;
  ppEffectCutThroughBlack = $00000102;
  ppEffectRandom = $00000201;
  ppEffectBlindsHorizontal = $00000301;
  ppEffectBlindsVertical = $00000302;
  ppEffectCheckerboardAcross = $00000401;
  ppEffectCheckerboardDown = $00000402;
  ppEffectCoverLeft = $00000501;
  ppEffectCoverUp = $00000502;
  ppEffectCoverRight = $00000503;
  ppEffectCoverDown = $00000504;
  ppEffectCoverLeftUp = $00000505;
  ppEffectCoverRightUp = $00000506;
  ppEffectCoverLeftDown = $00000507;
  ppEffectCoverRightDown = $00000508;
  ppEffectDissolve = $00000601;
  ppEffectFade = $00000701;
  ppEffectUncoverLeft = $00000801;
  ppEffectUncoverUp = $00000802;
  ppEffectUncoverRight = $00000803;
  ppEffectUncoverDown = $00000804;
  ppEffectUncoverLeftUp = $00000805;
  ppEffectUncoverRightUp = $00000806;
  ppEffectUncoverLeftDown = $00000807;
  ppEffectUncoverRightDown = $00000808;
  ppEffectRandomBarsHorizontal = $00000901;
  ppEffectRandomBarsVertical = $00000902;
  ppEffectStripsUpLeft = $00000A01;
  ppEffectStripsUpRight = $00000A02;
  ppEffectStripsDownLeft = $00000A03;
  ppEffectStripsDownRight = $00000A04;
  ppEffectStripsLeftUp = $00000A05;
  ppEffectStripsRightUp = $00000A06;
  ppEffectStripsLeftDown = $00000A07;
  ppEffectStripsRightDown = $00000A08;
  ppEffectWipeLeft = $00000B01;
  ppEffectWipeUp = $00000B02;
  ppEffectWipeRight = $00000B03;
  ppEffectWipeDown = $00000B04;
  ppEffectBoxOut = $00000C01;
  ppEffectBoxIn = $00000C02;
  ppEffectFlyFromLeft = $00000D01;
  ppEffectFlyFromTop = $00000D02;
  ppEffectFlyFromRight = $00000D03;
  ppEffectFlyFromBottom = $00000D04;
  ppEffectFlyFromTopLeft = $00000D05;
  ppEffectFlyFromTopRight = $00000D06;
  ppEffectFlyFromBottomLeft = $00000D07;
  ppEffectFlyFromBottomRight = $00000D08;
  ppEffectPeekFromLeft = $00000D09;
  ppEffectPeekFromDown = $00000D0A;
  ppEffectPeekFromRight = $00000D0B;
  ppEffectPeekFromUp = $00000D0C;
  ppEffectCrawlFromLeft = $00000D0D;
  ppEffectCrawlFromUp = $00000D0E;
  ppEffectCrawlFromRight = $00000D0F;
  ppEffectCrawlFromDown = $00000D10;
  ppEffectZoomIn = $00000D11;
  ppEffectZoomInSlightly = $00000D12;
  ppEffectZoomOut = $00000D13;
  ppEffectZoomOutSlightly = $00000D14;
  ppEffectZoomCenter = $00000D15;
  ppEffectZoomBottom = $00000D16;
  ppEffectStretchAcross = $00000D17;
  ppEffectStretchLeft = $00000D18;
  ppEffectStretchUp = $00000D19;
  ppEffectStretchRight = $00000D1A;
  ppEffectStretchDown = $00000D1B;
  ppEffectSwivel = $00000D1C;
  ppEffectSpiral = $00000D1D;
  ppEffectSplitHorizontalOut = $00000E01;
  ppEffectSplitHorizontalIn = $00000E02;
  ppEffectSplitVerticalOut = $00000E03;
  ppEffectSplitVerticalIn = $00000E04;
  ppEffectFlashOnceFast = $00000F01;
  ppEffectFlashOnceMedium = $00000F02;
  ppEffectFlashOnceSlow = $00000F03;
  ppEffectAppear = $00000F04;
  ppEffectCircleOut = $00000F05;
  ppEffectDiamondOut = $00000F06;
  ppEffectCombHorizontal = $00000F07;
  ppEffectCombVertical = $00000F08;
  ppEffectFadeSmoothly = $00000F09;
  ppEffectNewsflash = $00000F0A;
  ppEffectPlusOut = $00000F0B;
  ppEffectPushDown = $00000F0C;
  ppEffectPushLeft = $00000F0D;
  ppEffectPushRight = $00000F0E;
  ppEffectPushUp = $00000F0F;
  ppEffectWedge = $00000F10;
  ppEffectWheel1Spoke = $00000F11;
  ppEffectWheel2Spokes = $00000F12;
  ppEffectWheel3Spokes = $00000F13;
  ppEffectWheel4Spokes = $00000F14;
  ppEffectWheel8Spokes = $00000F15;

// Constants for enum PpTextLevelEffect
type
  PpTextLevelEffect = TOleEnum;
const
  ppAnimateLevelMixed = $FFFFFFFE;
  ppAnimateLevelNone = $00000000;
  ppAnimateByFirstLevel = $00000001;
  ppAnimateBySecondLevel = $00000002;
  ppAnimateByThirdLevel = $00000003;
  ppAnimateByFourthLevel = $00000004;
  ppAnimateByFifthLevel = $00000005;
  ppAnimateByAllLevels = $00000010;

// Constants for enum PpTextUnitEffect
type
  PpTextUnitEffect = TOleEnum;
const
  ppAnimateUnitMixed = $FFFFFFFE;
  ppAnimateByParagraph = $00000000;
  ppAnimateByWord = $00000001;
  ppAnimateByCharacter = $00000002;

// Constants for enum PpChartUnitEffect
type
  PpChartUnitEffect = TOleEnum;
const
  ppAnimateChartMixed = $FFFFFFFE;
  ppAnimateBySeries = $00000001;
  ppAnimateByCategory = $00000002;
  ppAnimateBySeriesElements = $00000003;
  ppAnimateByCategoryElements = $00000004;
  ppAnimateChartAllAtOnce = $00000005;

// Constants for enum PpAfterEffect
type
  PpAfterEffect = TOleEnum;
const
  ppAfterEffectMixed = $FFFFFFFE;
  ppAfterEffectNothing = $00000000;
  ppAfterEffectHide = $00000001;
  ppAfterEffectDim = $00000002;
  ppAfterEffectHideOnClick = $00000003;

// Constants for enum PpAdvanceMode
type
  PpAdvanceMode = TOleEnum;
const
  ppAdvanceModeMixed = $FFFFFFFE;
  ppAdvanceOnClick = $00000001;
  ppAdvanceOnTime = $00000002;

// Constants for enum PpSoundEffectType
type
  PpSoundEffectType = TOleEnum;
const
  ppSoundEffectsMixed = $FFFFFFFE;
  ppSoundNone = $00000000;
  ppSoundStopPrevious = $00000001;
  ppSoundFile = $00000002;

// Constants for enum PpFollowColors
type
  PpFollowColors = TOleEnum;
const
  ppFollowColorsMixed = $FFFFFFFE;
  ppFollowColorsNone = $00000000;
  ppFollowColorsScheme = $00000001;
  ppFollowColorsTextAndBackground = $00000002;

// Constants for enum PpUpdateOption
type
  PpUpdateOption = TOleEnum;
const
  ppUpdateOptionMixed = $FFFFFFFE;
  ppUpdateOptionManual = $00000001;
  ppUpdateOptionAutomatic = $00000002;

// Constants for enum PpParagraphAlignment
type
  PpParagraphAlignment = TOleEnum;
const
  ppAlignmentMixed = $FFFFFFFE;
  ppAlignLeft = $00000001;
  ppAlignCenter = $00000002;
  ppAlignRight = $00000003;
  ppAlignJustify = $00000004;
  ppAlignDistribute = $00000005;
  ppAlignThaiDistribute = $00000006;
  ppAlignJustifyLow = $00000007;

// Constants for enum PpBaselineAlignment
type
  PpBaselineAlignment = TOleEnum;
const
  ppBaselineAlignMixed = $FFFFFFFE;
  ppBaselineAlignBaseline = $00000001;
  ppBaselineAlignTop = $00000002;
  ppBaselineAlignCenter = $00000003;
  ppBaselineAlignFarEast50 = $00000004;
  ppBaselineAlignAuto = $00000005;

// Constants for enum PpTabStopType
type
  PpTabStopType = TOleEnum;
const
  ppTabStopMixed = $FFFFFFFE;
  ppTabStopLeft = $00000001;
  ppTabStopCenter = $00000002;
  ppTabStopRight = $00000003;
  ppTabStopDecimal = $00000004;

// Constants for enum PpIndentControl
type
  PpIndentControl = TOleEnum;
const
  ppIndentControlMixed = $FFFFFFFE;
  ppIndentReplaceAttr = $00000001;
  ppIndentKeepAttr = $00000002;

// Constants for enum PpChangeCase
type
  PpChangeCase = TOleEnum;
const
  ppCaseSentence = $00000001;
  ppCaseLower = $00000002;
  ppCaseUpper = $00000003;
  ppCaseTitle = $00000004;
  ppCaseToggle = $00000005;

// Constants for enum PpSlideShowPointerType
type
  PpSlideShowPointerType = TOleEnum;
const
  ppSlideShowPointerNone = $00000000;
  ppSlideShowPointerArrow = $00000001;
  ppSlideShowPointerPen = $00000002;
  ppSlideShowPointerAlwaysHidden = $00000003;
  ppSlideShowPointerAutoArrow = $00000004;
  ppSlideShowPointerEraser = $00000005;

// Constants for enum PpSlideShowState
type
  PpSlideShowState = TOleEnum;
const
  ppSlideShowRunning = $00000001;
  ppSlideShowPaused = $00000002;
  ppSlideShowBlackScreen = $00000003;
  ppSlideShowWhiteScreen = $00000004;
  ppSlideShowDone = $00000005;

// Constants for enum PpSlideShowAdvanceMode
type
  PpSlideShowAdvanceMode = TOleEnum;
const
  ppSlideShowManualAdvance = $00000001;
  ppSlideShowUseSlideTimings = $00000002;
  ppSlideShowRehearseNewTimings = $00000003;

// Constants for enum PpFileDialogType
type
  PpFileDialogType = TOleEnum;
const
  ppFileDialogOpen = $00000001;
  ppFileDialogSave = $00000002;

// Constants for enum PpPrintOutputType
type
  PpPrintOutputType = TOleEnum;
const
  ppPrintOutputSlides = $00000001;
  ppPrintOutputTwoSlideHandouts = $00000002;
  ppPrintOutputThreeSlideHandouts = $00000003;
  ppPrintOutputSixSlideHandouts = $00000004;
  ppPrintOutputNotesPages = $00000005;
  ppPrintOutputOutline = $00000006;
  ppPrintOutputBuildSlides = $00000007;
  ppPrintOutputFourSlideHandouts = $00000008;
  ppPrintOutputNineSlideHandouts = $00000009;
  ppPrintOutputOneSlideHandouts = $0000000A;

// Constants for enum PpPrintHandoutOrder
type
  PpPrintHandoutOrder = TOleEnum;
const
  ppPrintHandoutVerticalFirst = $00000001;
  ppPrintHandoutHorizontalFirst = $00000002;

// Constants for enum PpPrintColorType
type
  PpPrintColorType = TOleEnum;
const
  ppPrintColor = $00000001;
  ppPrintBlackAndWhite = $00000002;
  ppPrintPureBlackAndWhite = $00000003;

// Constants for enum PpSelectionType
type
  PpSelectionType = TOleEnum;
const
  ppSelectionNone = $00000000;
  ppSelectionSlides = $00000001;
  ppSelectionShapes = $00000002;
  ppSelectionText = $00000003;

// Constants for enum PpDirection
type
  PpDirection = TOleEnum;
const
  ppDirectionMixed = $FFFFFFFE;
  ppDirectionLeftToRight = $00000001;
  ppDirectionRightToLeft = $00000002;

// Constants for enum PpDateTimeFormat
type
  PpDateTimeFormat = TOleEnum;
const
  ppDateTimeFormatMixed = $FFFFFFFE;
  ppDateTimeMdyy = $00000001;
  ppDateTimeddddMMMMddyyyy = $00000002;
  ppDateTimedMMMMyyyy = $00000003;
  ppDateTimeMMMMdyyyy = $00000004;
  ppDateTimedMMMyy = $00000005;
  ppDateTimeMMMMyy = $00000006;
  ppDateTimeMMyy = $00000007;
  ppDateTimeMMddyyHmm = $00000008;
  ppDateTimeMMddyyhmmAMPM = $00000009;
  ppDateTimeHmm = $0000000A;
  ppDateTimeHmmss = $0000000B;
  ppDateTimehmmAMPM = $0000000C;
  ppDateTimehmmssAMPM = $0000000D;
  ppDateTimeFigureOut = $0000000E;

// Constants for enum PpTransitionSpeed
type
  PpTransitionSpeed = TOleEnum;
const
  ppTransitionSpeedMixed = $FFFFFFFE;
  ppTransitionSpeedSlow = $00000001;
  ppTransitionSpeedMedium = $00000002;
  ppTransitionSpeedFast = $00000003;

// Constants for enum PpMouseActivation
type
  PpMouseActivation = TOleEnum;
const
  ppMouseClick = $00000001;
  ppMouseOver = $00000002;

// Constants for enum PpActionType
type
  PpActionType = TOleEnum;
const
  ppActionMixed = $FFFFFFFE;
  ppActionNone = $00000000;
  ppActionNextSlide = $00000001;
  ppActionPreviousSlide = $00000002;
  ppActionFirstSlide = $00000003;
  ppActionLastSlide = $00000004;
  ppActionLastSlideViewed = $00000005;
  ppActionEndShow = $00000006;
  ppActionHyperlink = $00000007;
  ppActionRunMacro = $00000008;
  ppActionRunProgram = $00000009;
  ppActionNamedSlideShow = $0000000A;
  ppActionOLEVerb = $0000000B;
  ppActionPlay = $0000000C;

// Constants for enum PpPlaceholderType
type
  PpPlaceholderType = TOleEnum;
const
  ppPlaceholderMixed = $FFFFFFFE;
  ppPlaceholderTitle = $00000001;
  ppPlaceholderBody = $00000002;
  ppPlaceholderCenterTitle = $00000003;
  ppPlaceholderSubtitle = $00000004;
  ppPlaceholderVerticalTitle = $00000005;
  ppPlaceholderVerticalBody = $00000006;
  ppPlaceholderObject = $00000007;
  ppPlaceholderChart = $00000008;
  ppPlaceholderBitmap = $00000009;
  ppPlaceholderMediaClip = $0000000A;
  ppPlaceholderOrgChart = $0000000B;
  ppPlaceholderTable = $0000000C;
  ppPlaceholderSlideNumber = $0000000D;
  ppPlaceholderHeader = $0000000E;
  ppPlaceholderFooter = $0000000F;
  ppPlaceholderDate = $00000010;
  ppPlaceholderVerticalObject = $00000011;
  ppPlaceholderPicture = $00000012;

// Constants for enum PpSlideShowType
type
  PpSlideShowType = TOleEnum;
const
  ppShowTypeSpeaker = $00000001;
  ppShowTypeWindow = $00000002;
  ppShowTypeKiosk = $00000003;

// Constants for enum PpPrintRangeType
type
  PpPrintRangeType = TOleEnum;
const
  ppPrintAll = $00000001;
  ppPrintSelection = $00000002;
  ppPrintCurrent = $00000003;
  ppPrintSlideRange = $00000004;
  ppPrintNamedSlideShow = $00000005;

// Constants for enum PpAutoSize
type
  PpAutoSize = TOleEnum;
const
  ppAutoSizeMixed = $FFFFFFFE;
  ppAutoSizeNone = $00000000;
  ppAutoSizeShapeToFitText = $00000001;

// Constants for enum PpMediaType
type
  PpMediaType = TOleEnum;
const
  ppMediaTypeMixed = $FFFFFFFE;
  ppMediaTypeOther = $00000001;
  ppMediaTypeSound = $00000002;
  ppMediaTypeMovie = $00000003;

// Constants for enum PpSoundFormatType
type
  PpSoundFormatType = TOleEnum;
const
  ppSoundFormatMixed = $FFFFFFFE;
  ppSoundFormatNone = $00000000;
  ppSoundFormatWAV = $00000001;
  ppSoundFormatMIDI = $00000002;
  ppSoundFormatCDAudio = $00000003;

// Constants for enum PpFarEastLineBreakLevel
type
  PpFarEastLineBreakLevel = TOleEnum;
const
  ppFarEastLineBreakLevelNormal = $00000001;
  ppFarEastLineBreakLevelStrict = $00000002;
  ppFarEastLineBreakLevelCustom = $00000003;

// Constants for enum PpSlideShowRangeType
type
  PpSlideShowRangeType = TOleEnum;
const
  ppShowAll = $00000001;
  ppShowSlideRange = $00000002;
  ppShowNamedSlideShow = $00000003;

// Constants for enum PpFrameColors
type
  PpFrameColors = TOleEnum;
const
  ppFrameColorsBrowserColors = $00000001;
  ppFrameColorsPresentationSchemeTextColor = $00000002;
  ppFrameColorsPresentationSchemeAccentColor = $00000003;
  ppFrameColorsWhiteTextOnBlack = $00000004;
  ppFrameColorsBlackTextOnWhite = $00000005;

// Constants for enum PpBorderType
type
  PpBorderType = TOleEnum;
const
  ppBorderTop = $00000001;
  ppBorderLeft = $00000002;
  ppBorderBottom = $00000003;
  ppBorderRight = $00000004;
  ppBorderDiagonalDown = $00000005;
  ppBorderDiagonalUp = $00000006;

// Constants for enum PpHTMLVersion
type
  PpHTMLVersion = TOleEnum;
const
  ppHTMLv3 = $00000001;
  ppHTMLv4 = $00000002;
  ppHTMLDual = $00000003;
  ppHTMLAutodetect = $00000004;

// Constants for enum PpPublishSourceType
type
  PpPublishSourceType = TOleEnum;
const
  ppPublishAll = $00000001;
  ppPublishSlideRange = $00000002;
  ppPublishNamedSlideShow = $00000003;

// Constants for enum PpBulletType
type
  PpBulletType = TOleEnum;
const
  ppBulletMixed = $FFFFFFFE;
  ppBulletNone = $00000000;
  ppBulletUnnumbered = $00000001;
  ppBulletNumbered = $00000002;
  ppBulletPicture = $00000003;

// Constants for enum PpNumberedBulletStyle
type
  PpNumberedBulletStyle = TOleEnum;
const
  ppBulletStyleMixed = $FFFFFFFE;
  ppBulletAlphaLCPeriod = $00000000;
  ppBulletAlphaUCPeriod = $00000001;
  ppBulletArabicParenRight = $00000002;
  ppBulletArabicPeriod = $00000003;
  ppBulletRomanLCParenBoth = $00000004;
  ppBulletRomanLCParenRight = $00000005;
  ppBulletRomanLCPeriod = $00000006;
  ppBulletRomanUCPeriod = $00000007;
  ppBulletAlphaLCParenBoth = $00000008;
  ppBulletAlphaLCParenRight = $00000009;
  ppBulletAlphaUCParenBoth = $0000000A;
  ppBulletAlphaUCParenRight = $0000000B;
  ppBulletArabicParenBoth = $0000000C;
  ppBulletArabicPlain = $0000000D;
  ppBulletRomanUCParenBoth = $0000000E;
  ppBulletRomanUCParenRight = $0000000F;
  ppBulletSimpChinPlain = $00000010;
  ppBulletSimpChinPeriod = $00000011;
  ppBulletCircleNumDBPlain = $00000012;
  ppBulletCircleNumWDWhitePlain = $00000013;
  ppBulletCircleNumWDBlackPlain = $00000014;
  ppBulletTradChinPlain = $00000015;
  ppBulletTradChinPeriod = $00000016;
  ppBulletArabicAlphaDash = $00000017;
  ppBulletArabicAbjadDash = $00000018;
  ppBulletHebrewAlphaDash = $00000019;
  ppBulletKanjiKoreanPlain = $0000001A;
  ppBulletKanjiKoreanPeriod = $0000001B;
  ppBulletArabicDBPlain = $0000001C;
  ppBulletArabicDBPeriod = $0000001D;
  ppBulletThaiAlphaPeriod = $0000001E;
  ppBulletThaiAlphaParenRight = $0000001F;
  ppBulletThaiAlphaParenBoth = $00000020;
  ppBulletThaiNumPeriod = $00000021;
  ppBulletThaiNumParenRight = $00000022;
  ppBulletThaiNumParenBoth = $00000023;
  ppBulletHindiAlphaPeriod = $00000024;
  ppBulletHindiNumPeriod = $00000025;
  ppBulletKanjiSimpChinDBPeriod = $00000026;
  ppBulletHindiNumParenRight = $00000027;
  ppBulletHindiAlpha1Period = $00000028;

// Constants for enum PpShapeFormat
type
  PpShapeFormat = TOleEnum;
const
  ppShapeFormatGIF = $00000000;
  ppShapeFormatJPG = $00000001;
  ppShapeFormatPNG = $00000002;
  ppShapeFormatBMP = $00000003;
  ppShapeFormatWMF = $00000004;
  ppShapeFormatEMF = $00000005;

// Constants for enum PpExportMode
type
  PpExportMode = TOleEnum;
const
  ppRelativeToSlide = $00000001;
  ppClipRelativeToSlide = $00000002;
  ppScaleToFit = $00000003;
  ppScaleXY = $00000004;

// Constants for enum PpPasteDataType
type
  PpPasteDataType = TOleEnum;
const
  ppPasteDefault = $00000000;
  ppPasteBitmap = $00000001;
  ppPasteEnhancedMetafile = $00000002;
  ppPasteMetafilePicture = $00000003;
  ppPasteGIF = $00000004;
  ppPasteJPG = $00000005;
  ppPastePNG = $00000006;
  ppPasteText = $00000007;
  ppPasteHTML = $00000008;
  ppPasteRTF = $00000009;
  ppPasteOLEObject = $0000000A;
  ppPasteShape = $0000000B;

// Constants for enum MsoAnimEffect
type
  MsoAnimEffect = TOleEnum;
const
  msoAnimEffectCustom = $00000000;
  msoAnimEffectAppear = $00000001;
  msoAnimEffectFly = $00000002;
  msoAnimEffectBlinds = $00000003;
  msoAnimEffectBox = $00000004;
  msoAnimEffectCheckerboard = $00000005;
  msoAnimEffectCircle = $00000006;
  msoAnimEffectCrawl = $00000007;
  msoAnimEffectDiamond = $00000008;
  msoAnimEffectDissolve = $00000009;
  msoAnimEffectFade = $0000000A;
  msoAnimEffectFlashOnce = $0000000B;
  msoAnimEffectPeek = $0000000C;
  msoAnimEffectPlus = $0000000D;
  msoAnimEffectRandomBars = $0000000E;
  msoAnimEffectSpiral = $0000000F;
  msoAnimEffectSplit = $00000010;
  msoAnimEffectStretch = $00000011;
  msoAnimEffectStrips = $00000012;
  msoAnimEffectSwivel = $00000013;
  msoAnimEffectWedge = $00000014;
  msoAnimEffectWheel = $00000015;
  msoAnimEffectWipe = $00000016;
  msoAnimEffectZoom = $00000017;
  msoAnimEffectRandomEffects = $00000018;
  msoAnimEffectBoomerang = $00000019;
  msoAnimEffectBounce = $0000001A;
  msoAnimEffectColorReveal = $0000001B;
  msoAnimEffectCredits = $0000001C;
  msoAnimEffectEaseIn = $0000001D;
  msoAnimEffectFloat = $0000001E;
  msoAnimEffectGrowAndTurn = $0000001F;
  msoAnimEffectLightSpeed = $00000020;
  msoAnimEffectPinwheel = $00000021;
  msoAnimEffectRiseUp = $00000022;
  msoAnimEffectSwish = $00000023;
  msoAnimEffectThinLine = $00000024;
  msoAnimEffectUnfold = $00000025;
  msoAnimEffectWhip = $00000026;
  msoAnimEffectAscend = $00000027;
  msoAnimEffectCenterRevolve = $00000028;
  msoAnimEffectFadedSwivel = $00000029;
  msoAnimEffectDescend = $0000002A;
  msoAnimEffectSling = $0000002B;
  msoAnimEffectSpinner = $0000002C;
  msoAnimEffectStretchy = $0000002D;
  msoAnimEffectZip = $0000002E;
  msoAnimEffectArcUp = $0000002F;
  msoAnimEffectFadedZoom = $00000030;
  msoAnimEffectGlide = $00000031;
  msoAnimEffectExpand = $00000032;
  msoAnimEffectFlip = $00000033;
  msoAnimEffectShimmer = $00000034;
  msoAnimEffectFold = $00000035;
  msoAnimEffectChangeFillColor = $00000036;
  msoAnimEffectChangeFont = $00000037;
  msoAnimEffectChangeFontColor = $00000038;
  msoAnimEffectChangeFontSize = $00000039;
  msoAnimEffectChangeFontStyle = $0000003A;
  msoAnimEffectGrowShrink = $0000003B;
  msoAnimEffectChangeLineColor = $0000003C;
  msoAnimEffectSpin = $0000003D;
  msoAnimEffectTransparency = $0000003E;
  msoAnimEffectBoldFlash = $0000003F;
  msoAnimEffectBlast = $00000040;
  msoAnimEffectBoldReveal = $00000041;
  msoAnimEffectBrushOnColor = $00000042;
  msoAnimEffectBrushOnUnderline = $00000043;
  msoAnimEffectColorBlend = $00000044;
  msoAnimEffectColorWave = $00000045;
  msoAnimEffectComplementaryColor = $00000046;
  msoAnimEffectComplementaryColor2 = $00000047;
  msoAnimEffectContrastingColor = $00000048;
  msoAnimEffectDarken = $00000049;
  msoAnimEffectDesaturate = $0000004A;
  msoAnimEffectFlashBulb = $0000004B;
  msoAnimEffectFlicker = $0000004C;
  msoAnimEffectGrowWithColor = $0000004D;
  msoAnimEffectLighten = $0000004E;
  msoAnimEffectStyleEmphasis = $0000004F;
  msoAnimEffectTeeter = $00000050;
  msoAnimEffectVerticalGrow = $00000051;
  msoAnimEffectWave = $00000052;
  msoAnimEffectMediaPlay = $00000053;
  msoAnimEffectMediaPause = $00000054;
  msoAnimEffectMediaStop = $00000055;
  msoAnimEffectPathCircle = $00000056;
  msoAnimEffectPathRightTriangle = $00000057;
  msoAnimEffectPathDiamond = $00000058;
  msoAnimEffectPathHexagon = $00000059;
  msoAnimEffectPath5PointStar = $0000005A;
  msoAnimEffectPathCrescentMoon = $0000005B;
  msoAnimEffectPathSquare = $0000005C;
  msoAnimEffectPathTrapezoid = $0000005D;
  msoAnimEffectPathHeart = $0000005E;
  msoAnimEffectPathOctagon = $0000005F;
  msoAnimEffectPath6PointStar = $00000060;
  msoAnimEffectPathFootball = $00000061;
  msoAnimEffectPathEqualTriangle = $00000062;
  msoAnimEffectPathParallelogram = $00000063;
  msoAnimEffectPathPentagon = $00000064;
  msoAnimEffectPath4PointStar = $00000065;
  msoAnimEffectPath8PointStar = $00000066;
  msoAnimEffectPathTeardrop = $00000067;
  msoAnimEffectPathPointyStar = $00000068;
  msoAnimEffectPathCurvedSquare = $00000069;
  msoAnimEffectPathCurvedX = $0000006A;
  msoAnimEffectPathVerticalFigure8 = $0000006B;
  msoAnimEffectPathCurvyStar = $0000006C;
  msoAnimEffectPathLoopdeLoop = $0000006D;
  msoAnimEffectPathBuzzsaw = $0000006E;
  msoAnimEffectPathHorizontalFigure8 = $0000006F;
  msoAnimEffectPathPeanut = $00000070;
  msoAnimEffectPathFigure8Four = $00000071;
  msoAnimEffectPathNeutron = $00000072;
  msoAnimEffectPathSwoosh = $00000073;
  msoAnimEffectPathBean = $00000074;
  msoAnimEffectPathPlus = $00000075;
  msoAnimEffectPathInvertedTriangle = $00000076;
  msoAnimEffectPathInvertedSquare = $00000077;
  msoAnimEffectPathLeft = $00000078;
  msoAnimEffectPathTurnRight = $00000079;
  msoAnimEffectPathArcDown = $0000007A;
  msoAnimEffectPathZigzag = $0000007B;
  msoAnimEffectPathSCurve2 = $0000007C;
  msoAnimEffectPathSineWave = $0000007D;
  msoAnimEffectPathBounceLeft = $0000007E;
  msoAnimEffectPathDown = $0000007F;
  msoAnimEffectPathTurnUp = $00000080;
  msoAnimEffectPathArcUp = $00000081;
  msoAnimEffectPathHeartbeat = $00000082;
  msoAnimEffectPathSpiralRight = $00000083;
  msoAnimEffectPathWave = $00000084;
  msoAnimEffectPathCurvyLeft = $00000085;
  msoAnimEffectPathDiagonalDownRight = $00000086;
  msoAnimEffectPathTurnDown = $00000087;
  msoAnimEffectPathArcLeft = $00000088;
  msoAnimEffectPathFunnel = $00000089;
  msoAnimEffectPathSpring = $0000008A;
  msoAnimEffectPathBounceRight = $0000008B;
  msoAnimEffectPathSpiralLeft = $0000008C;
  msoAnimEffectPathDiagonalUpRight = $0000008D;
  msoAnimEffectPathTurnUpRight = $0000008E;
  msoAnimEffectPathArcRight = $0000008F;
  msoAnimEffectPathSCurve1 = $00000090;
  msoAnimEffectPathDecayingWave = $00000091;
  msoAnimEffectPathCurvyRight = $00000092;
  msoAnimEffectPathStairsDown = $00000093;
  msoAnimEffectPathUp = $00000094;
  msoAnimEffectPathRight = $00000095;

// Constants for enum MsoAnimateByLevel
type
  MsoAnimateByLevel = TOleEnum;
const
  msoAnimateLevelMixed = $FFFFFFFF;
  msoAnimateLevelNone = $00000000;
  msoAnimateTextByAllLevels = $00000001;
  msoAnimateTextByFirstLevel = $00000002;
  msoAnimateTextBySecondLevel = $00000003;
  msoAnimateTextByThirdLevel = $00000004;
  msoAnimateTextByFourthLevel = $00000005;
  msoAnimateTextByFifthLevel = $00000006;
  msoAnimateChartAllAtOnce = $00000007;
  msoAnimateChartByCategory = $00000008;
  msoAnimateChartByCategoryElements = $00000009;
  msoAnimateChartBySeries = $0000000A;
  msoAnimateChartBySeriesElements = $0000000B;
  msoAnimateDiagramAllAtOnce = $0000000C;
  msoAnimateDiagramDepthByNode = $0000000D;
  msoAnimateDiagramDepthByBranch = $0000000E;
  msoAnimateDiagramBreadthByNode = $0000000F;
  msoAnimateDiagramBreadthByLevel = $00000010;
  msoAnimateDiagramClockwise = $00000011;
  msoAnimateDiagramClockwiseIn = $00000012;
  msoAnimateDiagramClockwiseOut = $00000013;
  msoAnimateDiagramCounterClockwise = $00000014;
  msoAnimateDiagramCounterClockwiseIn = $00000015;
  msoAnimateDiagramCounterClockwiseOut = $00000016;
  msoAnimateDiagramInByRing = $00000017;
  msoAnimateDiagramOutByRing = $00000018;
  msoAnimateDiagramUp = $00000019;
  msoAnimateDiagramDown = $0000001A;

// Constants for enum MsoAnimTriggerType
type
  MsoAnimTriggerType = TOleEnum;
const
  msoAnimTriggerMixed = $FFFFFFFF;
  msoAnimTriggerNone = $00000000;
  msoAnimTriggerOnPageClick = $00000001;
  msoAnimTriggerWithPrevious = $00000002;
  msoAnimTriggerAfterPrevious = $00000003;
  msoAnimTriggerOnShapeClick = $00000004;

// Constants for enum MsoAnimAfterEffect
type
  MsoAnimAfterEffect = TOleEnum;
const
  msoAnimAfterEffectMixed = $FFFFFFFF;
  msoAnimAfterEffectNone = $00000000;
  msoAnimAfterEffectDim = $00000001;
  msoAnimAfterEffectHide = $00000002;
  msoAnimAfterEffectHideOnNextClick = $00000003;

// Constants for enum MsoAnimTextUnitEffect
type
  MsoAnimTextUnitEffect = TOleEnum;
const
  msoAnimTextUnitEffectMixed = $FFFFFFFF;
  msoAnimTextUnitEffectByParagraph = $00000000;
  msoAnimTextUnitEffectByCharacter = $00000001;
  msoAnimTextUnitEffectByWord = $00000002;

// Constants for enum MsoAnimEffectRestart
type
  MsoAnimEffectRestart = TOleEnum;
const
  msoAnimEffectRestartAlways = $00000001;
  msoAnimEffectRestartWhenOff = $00000002;
  msoAnimEffectRestartNever = $00000003;

// Constants for enum MsoAnimEffectAfter
type
  MsoAnimEffectAfter = TOleEnum;
const
  msoAnimEffectAfterFreeze = $00000001;
  msoAnimEffectAfterRemove = $00000002;
  msoAnimEffectAfterHold = $00000003;
  msoAnimEffectAfterTransition = $00000004;

// Constants for enum MsoAnimDirection
type
  MsoAnimDirection = TOleEnum;
const
  msoAnimDirectionNone = $00000000;
  msoAnimDirectionUp = $00000001;
  msoAnimDirectionRight = $00000002;
  msoAnimDirectionDown = $00000003;
  msoAnimDirectionLeft = $00000004;
  msoAnimDirectionOrdinalMask = $00000005;
  msoAnimDirectionUpLeft = $00000006;
  msoAnimDirectionUpRight = $00000007;
  msoAnimDirectionDownRight = $00000008;
  msoAnimDirectionDownLeft = $00000009;
  msoAnimDirectionTop = $0000000A;
  msoAnimDirectionBottom = $0000000B;
  msoAnimDirectionTopLeft = $0000000C;
  msoAnimDirectionTopRight = $0000000D;
  msoAnimDirectionBottomRight = $0000000E;
  msoAnimDirectionBottomLeft = $0000000F;
  msoAnimDirectionHorizontal = $00000010;
  msoAnimDirectionVertical = $00000011;
  msoAnimDirectionAcross = $00000012;
  msoAnimDirectionIn = $00000013;
  msoAnimDirectionOut = $00000014;
  msoAnimDirectionClockwise = $00000015;
  msoAnimDirectionCounterclockwise = $00000016;
  msoAnimDirectionHorizontalIn = $00000017;
  msoAnimDirectionHorizontalOut = $00000018;
  msoAnimDirectionVerticalIn = $00000019;
  msoAnimDirectionVerticalOut = $0000001A;
  msoAnimDirectionSlightly = $0000001B;
  msoAnimDirectionCenter = $0000001C;
  msoAnimDirectionInSlightly = $0000001D;
  msoAnimDirectionInCenter = $0000001E;
  msoAnimDirectionInBottom = $0000001F;
  msoAnimDirectionOutSlightly = $00000020;
  msoAnimDirectionOutCenter = $00000021;
  msoAnimDirectionOutBottom = $00000022;
  msoAnimDirectionFontBold = $00000023;
  msoAnimDirectionFontItalic = $00000024;
  msoAnimDirectionFontUnderline = $00000025;
  msoAnimDirectionFontStrikethrough = $00000026;
  msoAnimDirectionFontShadow = $00000027;
  msoAnimDirectionFontAllCaps = $00000028;
  msoAnimDirectionInstant = $00000029;
  msoAnimDirectionGradual = $0000002A;
  msoAnimDirectionCycleClockwise = $0000002B;
  msoAnimDirectionCycleCounterclockwise = $0000002C;

// Constants for enum MsoAnimType
type
  MsoAnimType = TOleEnum;
const
  msoAnimTypeMixed = $FFFFFFFE;
  msoAnimTypeNone = $00000000;
  msoAnimTypeMotion = $00000001;
  msoAnimTypeColor = $00000002;
  msoAnimTypeScale = $00000003;
  msoAnimTypeRotation = $00000004;
  msoAnimTypeProperty = $00000005;
  msoAnimTypeCommand = $00000006;
  msoAnimTypeFilter = $00000007;
  msoAnimTypeSet = $00000008;

// Constants for enum MsoAnimAdditive
type
  MsoAnimAdditive = TOleEnum;
const
  msoAnimAdditiveAddBase = $00000001;
  msoAnimAdditiveAddSum = $00000002;

// Constants for enum MsoAnimAccumulate
type
  MsoAnimAccumulate = TOleEnum;
const
  msoAnimAccumulateNone = $00000001;
  msoAnimAccumulateAlways = $00000002;

// Constants for enum MsoAnimProperty
type
  MsoAnimProperty = TOleEnum;
const
  msoAnimNone = $00000000;
  msoAnimX = $00000001;
  msoAnimY = $00000002;
  msoAnimWidth = $00000003;
  msoAnimHeight = $00000004;
  msoAnimOpacity = $00000005;
  msoAnimRotation = $00000006;
  msoAnimColor = $00000007;
  msoAnimVisibility = $00000008;
  msoAnimTextFontBold = $00000064;
  msoAnimTextFontColor = $00000065;
  msoAnimTextFontEmboss = $00000066;
  msoAnimTextFontItalic = $00000067;
  msoAnimTextFontName = $00000068;
  msoAnimTextFontShadow = $00000069;
  msoAnimTextFontSize = $0000006A;
  msoAnimTextFontSubscript = $0000006B;
  msoAnimTextFontSuperscript = $0000006C;
  msoAnimTextFontUnderline = $0000006D;
  msoAnimTextFontStrikeThrough = $0000006E;
  msoAnimTextBulletCharacter = $0000006F;
  msoAnimTextBulletFontName = $00000070;
  msoAnimTextBulletNumber = $00000071;
  msoAnimTextBulletColor = $00000072;
  msoAnimTextBulletRelativeSize = $00000073;
  msoAnimTextBulletStyle = $00000074;
  msoAnimTextBulletType = $00000075;
  msoAnimShapePictureContrast = $000003E8;
  msoAnimShapePictureBrightness = $000003E9;
  msoAnimShapePictureGamma = $000003EA;
  msoAnimShapePictureGrayscale = $000003EB;
  msoAnimShapeFillOn = $000003EC;
  msoAnimShapeFillColor = $000003ED;
  msoAnimShapeFillOpacity = $000003EE;
  msoAnimShapeFillBackColor = $000003EF;
  msoAnimShapeLineOn = $000003F0;
  msoAnimShapeLineColor = $000003F1;
  msoAnimShapeShadowOn = $000003F2;
  msoAnimShapeShadowType = $000003F3;
  msoAnimShapeShadowColor = $000003F4;
  msoAnimShapeShadowOpacity = $000003F5;
  msoAnimShapeShadowOffsetX = $000003F6;
  msoAnimShapeShadowOffsetY = $000003F7;

// Constants for enum PpAlertLevel
type
  PpAlertLevel = TOleEnum;
const
  ppAlertsNone = $00000001;
  ppAlertsAll = $00000002;

// Constants for enum PpRevisionInfo
type
  PpRevisionInfo = TOleEnum;
const
  ppRevisionInfoNone = $00000000;
  ppRevisionInfoBaseline = $00000001;
  ppRevisionInfoMerged = $00000002;

// Constants for enum MsoAnimCommandType
type
  MsoAnimCommandType = TOleEnum;
const
  msoAnimCommandTypeEvent = $00000000;
  msoAnimCommandTypeCall = $00000001;
  msoAnimCommandTypeVerb = $00000002;

// Constants for enum MsoAnimFilterEffectType
type
  MsoAnimFilterEffectType = TOleEnum;
const
  msoAnimFilterEffectTypeNone = $00000000;
  msoAnimFilterEffectTypeBarn = $00000001;
  msoAnimFilterEffectTypeBlinds = $00000002;
  msoAnimFilterEffectTypeBox = $00000003;
  msoAnimFilterEffectTypeCheckerboard = $00000004;
  msoAnimFilterEffectTypeCircle = $00000005;
  msoAnimFilterEffectTypeDiamond = $00000006;
  msoAnimFilterEffectTypeDissolve = $00000007;
  msoAnimFilterEffectTypeFade = $00000008;
  msoAnimFilterEffectTypeImage = $00000009;
  msoAnimFilterEffectTypePixelate = $0000000A;
  msoAnimFilterEffectTypePlus = $0000000B;
  msoAnimFilterEffectTypeRandomBar = $0000000C;
  msoAnimFilterEffectTypeSlide = $0000000D;
  msoAnimFilterEffectTypeStretch = $0000000E;
  msoAnimFilterEffectTypeStrips = $0000000F;
  msoAnimFilterEffectTypeWedge = $00000010;
  msoAnimFilterEffectTypeWheel = $00000011;
  msoAnimFilterEffectTypeWipe = $00000012;

// Constants for enum MsoAnimFilterEffectSubtype
type
  MsoAnimFilterEffectSubtype = TOleEnum;
const
  msoAnimFilterEffectSubtypeNone = $00000000;
  msoAnimFilterEffectSubtypeInVertical = $00000001;
  msoAnimFilterEffectSubtypeOutVertical = $00000002;
  msoAnimFilterEffectSubtypeInHorizontal = $00000003;
  msoAnimFilterEffectSubtypeOutHorizontal = $00000004;
  msoAnimFilterEffectSubtypeHorizontal = $00000005;
  msoAnimFilterEffectSubtypeVertical = $00000006;
  msoAnimFilterEffectSubtypeIn = $00000007;
  msoAnimFilterEffectSubtypeOut = $00000008;
  msoAnimFilterEffectSubtypeAcross = $00000009;
  msoAnimFilterEffectSubtypeFromLeft = $0000000A;
  msoAnimFilterEffectSubtypeFromRight = $0000000B;
  msoAnimFilterEffectSubtypeFromTop = $0000000C;
  msoAnimFilterEffectSubtypeFromBottom = $0000000D;
  msoAnimFilterEffectSubtypeDownLeft = $0000000E;
  msoAnimFilterEffectSubtypeUpLeft = $0000000F;
  msoAnimFilterEffectSubtypeDownRight = $00000010;
  msoAnimFilterEffectSubtypeUpRight = $00000011;
  msoAnimFilterEffectSubtypeSpokes1 = $00000012;
  msoAnimFilterEffectSubtypeSpokes2 = $00000013;
  msoAnimFilterEffectSubtypeSpokes3 = $00000014;
  msoAnimFilterEffectSubtypeSpokes4 = $00000015;
  msoAnimFilterEffectSubtypeSpokes8 = $00000016;
  msoAnimFilterEffectSubtypeLeft = $00000017;
  msoAnimFilterEffectSubtypeRight = $00000018;
  msoAnimFilterEffectSubtypeDown = $00000019;
  msoAnimFilterEffectSubtypeUp = $0000001A;

// Constants for enum PpRemoveDocInfoType
type
  PpRemoveDocInfoType = TOleEnum;
const
  ppRDIComments = $00000001;
  ppRDIRemovePersonalInformation = $00000004;
  ppRDIDocumentProperties = $00000008;
  ppRDIDocumentWorkspace = $0000000A;
  ppRDIInkAnnotations = $0000000B;
  ppRDIPublishPath = $0000000D;
  ppRDIDocumentServerProperties = $0000000E;
  ppRDIDocumentManagementPolicy = $0000000F;
  ppRDIContentType = $00000010;
  ppRDISlideUpdateInformation = $00000011;
  ppRDIAll = $00000063;

// Constants for enum PpCheckInVersionType
type
  PpCheckInVersionType = TOleEnum;
const
  ppCheckInMinorVersion = $00000000;
  ppCheckInMajorVersion = $00000001;
  ppCheckInOverwriteVersion = $00000002;

// Constants for enum MsoClickState
type
  MsoClickState = TOleEnum;
const
  msoClickStateAfterAllAnimations = $FFFFFFFE;
  msoClickStateBeforeAutomaticAnimations = $FFFFFFFF;

// Constants for enum PpFixedFormatType
type
  PpFixedFormatType = TOleEnum;
const
  ppFixedFormatTypeXPS = $00000001;
  ppFixedFormatTypePDF = $00000002;

// Constants for enum PpFixedFormatIntent
type
  PpFixedFormatIntent = TOleEnum;
const
  ppFixedFormatIntentScreen = $00000001;
  ppFixedFormatIntentPrint = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Collection = interface;
  CollectionDisp = dispinterface;
  _Application = interface;
  _ApplicationDisp = dispinterface;
  _Global = interface;
  _GlobalDisp = dispinterface;
  EApplication = interface;
  ColorFormat = interface;
  ColorFormatDisp = dispinterface;
  SlideShowWindow = interface;
  SlideShowWindowDisp = dispinterface;
  Selection = interface;
  SelectionDisp = dispinterface;
  DocumentWindows = interface;
  DocumentWindowsDisp = dispinterface;
  SlideShowWindows = interface;
  SlideShowWindowsDisp = dispinterface;
  DocumentWindow = interface;
  DocumentWindowDisp = dispinterface;
  View = interface;
  ViewDisp = dispinterface;
  SlideShowView = interface;
  SlideShowViewDisp = dispinterface;
  SlideShowSettings = interface;
  SlideShowSettingsDisp = dispinterface;
  NamedSlideShows = interface;
  NamedSlideShowsDisp = dispinterface;
  NamedSlideShow = interface;
  NamedSlideShowDisp = dispinterface;
  PrintOptions = interface;
  PrintOptionsDisp = dispinterface;
  PrintRanges = interface;
  PrintRangesDisp = dispinterface;
  PrintRange = interface;
  PrintRangeDisp = dispinterface;
  AddIns = interface;
  AddInsDisp = dispinterface;
  AddIn = interface;
  AddInDisp = dispinterface;
  Presentations = interface;
  PresentationsDisp = dispinterface;
  PresEvents = interface;
  _Presentation = interface;
  _PresentationDisp = dispinterface;
  Hyperlinks = interface;
  HyperlinksDisp = dispinterface;
  Hyperlink = interface;
  HyperlinkDisp = dispinterface;
  PageSetup = interface;
  PageSetupDisp = dispinterface;
  Fonts = interface;
  FontsDisp = dispinterface;
  ExtraColors = interface;
  ExtraColorsDisp = dispinterface;
  Slides = interface;
  SlidesDisp = dispinterface;
  _Slide = interface;
  _SlideDisp = dispinterface;
  SlideRange = interface;
  SlideRangeDisp = dispinterface;
  _Master = interface;
  _MasterDisp = dispinterface;
  SldEvents = interface;
  ColorSchemes = interface;
  ColorSchemesDisp = dispinterface;
  ColorScheme = interface;
  ColorSchemeDisp = dispinterface;
  RGBColor = interface;
  RGBColorDisp = dispinterface;
  SlideShowTransition = interface;
  SlideShowTransitionDisp = dispinterface;
  SoundEffect = interface;
  SoundEffectDisp = dispinterface;
  SoundFormat = interface;
  SoundFormatDisp = dispinterface;
  HeadersFooters = interface;
  HeadersFootersDisp = dispinterface;
  Shapes = interface;
  ShapesDisp = dispinterface;
  Placeholders = interface;
  PlaceholdersDisp = dispinterface;
  PlaceholderFormat = interface;
  PlaceholderFormatDisp = dispinterface;
  FreeformBuilder = interface;
  FreeformBuilderDisp = dispinterface;
  Shape = interface;
  ShapeDisp = dispinterface;
  ShapeRange = interface;
  ShapeRangeDisp = dispinterface;
  GroupShapes = interface;
  GroupShapesDisp = dispinterface;
  Adjustments = interface;
  AdjustmentsDisp = dispinterface;
  PictureFormat = interface;
  PictureFormatDisp = dispinterface;
  FillFormat = interface;
  FillFormatDisp = dispinterface;
  LineFormat = interface;
  LineFormatDisp = dispinterface;
  ShadowFormat = interface;
  ShadowFormatDisp = dispinterface;
  ConnectorFormat = interface;
  ConnectorFormatDisp = dispinterface;
  TextEffectFormat = interface;
  TextEffectFormatDisp = dispinterface;
  ThreeDFormat = interface;
  ThreeDFormatDisp = dispinterface;
  TextFrame = interface;
  TextFrameDisp = dispinterface;
  CalloutFormat = interface;
  CalloutFormatDisp = dispinterface;
  ShapeNodes = interface;
  ShapeNodesDisp = dispinterface;
  ShapeNode = interface;
  ShapeNodeDisp = dispinterface;
  OLEFormat = interface;
  OLEFormatDisp = dispinterface;
  LinkFormat = interface;
  LinkFormatDisp = dispinterface;
  ObjectVerbs = interface;
  ObjectVerbsDisp = dispinterface;
  AnimationSettings = interface;
  AnimationSettingsDisp = dispinterface;
  ActionSettings = interface;
  ActionSettingsDisp = dispinterface;
  ActionSetting = interface;
  ActionSettingDisp = dispinterface;
  PlaySettings = interface;
  PlaySettingsDisp = dispinterface;
  TextRange = interface;
  TextRangeDisp = dispinterface;
  Ruler = interface;
  RulerDisp = dispinterface;
  RulerLevels = interface;
  RulerLevelsDisp = dispinterface;
  RulerLevel = interface;
  RulerLevelDisp = dispinterface;
  TabStops = interface;
  TabStopsDisp = dispinterface;
  TabStop = interface;
  TabStopDisp = dispinterface;
  Font = interface;
  FontDisp = dispinterface;
  ParagraphFormat = interface;
  ParagraphFormatDisp = dispinterface;
  BulletFormat = interface;
  BulletFormatDisp = dispinterface;
  TextStyles = interface;
  TextStylesDisp = dispinterface;
  TextStyle = interface;
  TextStyleDisp = dispinterface;
  TextStyleLevels = interface;
  TextStyleLevelsDisp = dispinterface;
  TextStyleLevel = interface;
  TextStyleLevelDisp = dispinterface;
  HeaderFooter = interface;
  HeaderFooterDisp = dispinterface;
  Tags = interface;
  TagsDisp = dispinterface;
  MouseTracker = interface;
  MouseDownHandler = interface;
  OCXExtender = interface;
  OCXExtenderDisp = dispinterface;
  OCXExtenderEvents = interface;
  Table = interface;
  TableDisp = dispinterface;
  Columns = interface;
  ColumnsDisp = dispinterface;
  Column = interface;
  ColumnDisp = dispinterface;
  Rows = interface;
  RowsDisp = dispinterface;
  Row = interface;
  RowDisp = dispinterface;
  CellRange = interface;
  CellRangeDisp = dispinterface;
  Cell = interface;
  CellDisp = dispinterface;
  Borders = interface;
  BordersDisp = dispinterface;
  Panes = interface;
  PanesDisp = dispinterface;
  Pane = interface;
  PaneDisp = dispinterface;
  DefaultWebOptions = interface;
  DefaultWebOptionsDisp = dispinterface;
  WebOptions = interface;
  WebOptionsDisp = dispinterface;
  PublishObjects = interface;
  PublishObjectsDisp = dispinterface;
  PublishObject = interface;
  PublishObjectDisp = dispinterface;
  MasterEvents = interface;
  _PowerRex = interface;
  _PowerRexDisp = dispinterface;
  Comments = interface;
  CommentsDisp = dispinterface;
  Comment = interface;
  CommentDisp = dispinterface;
  Designs = interface;
  DesignsDisp = dispinterface;
  Design = interface;
  DesignDisp = dispinterface;
  DiagramNode = interface;
  DiagramNodeDisp = dispinterface;
  DiagramNodeChildren = interface;
  DiagramNodeChildrenDisp = dispinterface;
  DiagramNodes = interface;
  DiagramNodesDisp = dispinterface;
  Diagram = interface;
  DiagramDisp = dispinterface;
  TimeLine = interface;
  TimeLineDisp = dispinterface;
  Sequences = interface;
  SequencesDisp = dispinterface;
  Sequence = interface;
  SequenceDisp = dispinterface;
  Effect = interface;
  EffectDisp = dispinterface;
  Timing = interface;
  TimingDisp = dispinterface;
  EffectParameters = interface;
  EffectParametersDisp = dispinterface;
  EffectInformation = interface;
  EffectInformationDisp = dispinterface;
  AnimationBehaviors = interface;
  AnimationBehaviorsDisp = dispinterface;
  AnimationBehavior = interface;
  AnimationBehaviorDisp = dispinterface;
  MotionEffect = interface;
  MotionEffectDisp = dispinterface;
  ColorEffect = interface;
  ColorEffectDisp = dispinterface;
  ScaleEffect = interface;
  ScaleEffectDisp = dispinterface;
  RotationEffect = interface;
  RotationEffectDisp = dispinterface;
  PropertyEffect = interface;
  PropertyEffectDisp = dispinterface;
  AnimationPoints = interface;
  AnimationPointsDisp = dispinterface;
  AnimationPoint = interface;
  AnimationPointDisp = dispinterface;
  CanvasShapes = interface;
  CanvasShapesDisp = dispinterface;
  AutoCorrect = interface;
  AutoCorrectDisp = dispinterface;
  Options = interface;
  OptionsDisp = dispinterface;
  CommandEffect = interface;
  CommandEffectDisp = dispinterface;
  FilterEffect = interface;
  FilterEffectDisp = dispinterface;
  SetEffect = interface;
  SetEffectDisp = dispinterface;
  CustomLayouts = interface;
  CustomLayoutsDisp = dispinterface;
  CustomLayout = interface;
  CustomLayoutDisp = dispinterface;
  TableStyle = interface;
  TableStyleDisp = dispinterface;
  CustomerData = interface;
  CustomerDataDisp = dispinterface;
  Research = interface;
  ResearchDisp = dispinterface;
  TableBackground = interface;
  TableBackgroundDisp = dispinterface;
  TextFrame2 = interface;
  TextFrame2Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  PowerPointGlobal = _Global;
  PowerPointSlide = _Slide;
  PowerPointPresentation = _Presentation;
  OLECtrl = OCXExtender;
  PowerPointApplication = _Application;
  Master = _Master;
  PowerRex = _PowerRex;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}
  POleVariant1 = ^OleVariant; {*}
  PSingle1 = ^Single; {*}


// *********************************************************************//
// Interface: Collection
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {91493450-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Collection = interface(IDispatch)
    ['{91493450-5A91-11CF-8700-00AA0060263B}']
    function Get__NewEnum: IUnknown; safecall;
    function _Index(Index: SYSINT): OleVariant; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  CollectionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {91493450-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CollectionDisp = dispinterface
    ['{91493450-5A91-11CF-8700-00AA0060263B}']
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: _Application
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493442-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _Application = interface(IDispatch)
    ['{91493442-5A91-11CF-8700-00AA0060263B}']
    function Get_Presentations: Presentations; safecall;
    function Get_Windows: DocumentWindows; safecall;
    function Get_Dialogs: IUnknown; safecall;
    function Get_ActiveWindow: DocumentWindow; safecall;
    function Get_ActivePresentation: PowerPointPresentation; safecall;
    function Get_SlideShowWindows: SlideShowWindows; safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_Path: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Caption: WideString); safecall;
    function Get_Assistant: Assistant; safecall;
    function Get_FileSearch: FileSearch; safecall;
    function Get_FileFind: IFind; safecall;
    function Get_Build: WideString; safecall;
    function Get_Version: WideString; safecall;
    function Get_OperatingSystem: WideString; safecall;
    function Get_ActivePrinter: WideString; safecall;
    function Get_Creator: Integer; safecall;
    function Get_AddIns: AddIns; safecall;
    function Get_VBE: VBE; safecall;
    procedure Help(const HelpFile: WideString; ContextID: SYSINT); safecall;
    procedure Quit; safecall;
    function Run(const MacroName: WideString; var safeArrayOfParams: PSafeArray): OleVariant; safecall;
    function PPFileDialog(Type_: PpFileDialogType): IUnknown; safecall;
    procedure LaunchSpelling(const pWindow: DocumentWindow); safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Left: Single); safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Top: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    function Get_WindowState: PpWindowState; safecall;
    procedure Set_WindowState(WindowState: PpWindowState); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_HWND: Integer; safecall;
    function Get_Active: MsoTriState; safecall;
    procedure Activate; safecall;
    function Get_AnswerWizard: AnswerWizard; safecall;
    function Get_COMAddIns: COMAddIns; safecall;
    function Get_ProductCode: WideString; safecall;
    function Get_DefaultWebOptions: DefaultWebOptions; safecall;
    function Get_LanguageSettings: LanguageSettings; safecall;
    function Get_MsoDebugOptions: MsoDebugOptions; safecall;
    function Get_ShowWindowsInTaskbar: MsoTriState; safecall;
    procedure Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar: MsoTriState); safecall;
    function Get_Marker: IUnknown; safecall;
    function Get_FeatureInstall: MsoFeatureInstall; safecall;
    procedure Set_FeatureInstall(FeatureInstall: MsoFeatureInstall); safecall;
    function GetOptionFlag(Option: Integer; Persist: WordBool): WordBool; safecall;
    procedure SetOptionFlag(Option: Integer; State: WordBool; Persist: WordBool); safecall;
    function Get_FileDialog(Type_: MsoFileDialogType): FileDialog; safecall;
    function Get_DisplayGridLines: MsoTriState; safecall;
    procedure Set_DisplayGridLines(DisplayGridLines: MsoTriState); safecall;
    function Get_AutomationSecurity: MsoAutomationSecurity; safecall;
    procedure Set_AutomationSecurity(AutomationSecurity: MsoAutomationSecurity); safecall;
    function Get_NewPresentation: NewFile; safecall;
    function Get_DisplayAlerts: PpAlertLevel; safecall;
    procedure Set_DisplayAlerts(DisplayAlerts: PpAlertLevel); safecall;
    function Get_ShowStartupDialog: MsoTriState; safecall;
    procedure Set_ShowStartupDialog(ShowStartupDialog: MsoTriState); safecall;
    procedure SetPerfMarker(Marker: SYSINT); safecall;
    function Get_AutoCorrect: AutoCorrect; safecall;
    function Get_Options: Options; safecall;
    procedure LaunchPublishSlidesDialog(const SlideLibraryUrl: WideString); safecall;
    procedure LaunchSendToPPTDialog(var SlideUrls: OleVariant); safecall;
    function Get_DisplayDocumentInformationPanel: WordBool; safecall;
    procedure Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel: WordBool); safecall;
    function Get_Assistance: IAssistance; safecall;
    function Get_ActiveEncryptionSession: Integer; safecall;
    property Presentations: Presentations read Get_Presentations;
    property Windows: DocumentWindows read Get_Windows;
    property Dialogs: IUnknown read Get_Dialogs;
    property ActiveWindow: DocumentWindow read Get_ActiveWindow;
    property ActivePresentation: PowerPointPresentation read Get_ActivePresentation;
    property SlideShowWindows: SlideShowWindows read Get_SlideShowWindows;
    property CommandBars: CommandBars read Get_CommandBars;
    property Path: WideString read Get_Path;
    property Name: WideString read Get_Name;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Assistant: Assistant read Get_Assistant;
    property FileSearch: FileSearch read Get_FileSearch;
    property FileFind: IFind read Get_FileFind;
    property Build: WideString read Get_Build;
    property Version: WideString read Get_Version;
    property OperatingSystem: WideString read Get_OperatingSystem;
    property ActivePrinter: WideString read Get_ActivePrinter;
    property Creator: Integer read Get_Creator;
    property AddIns: AddIns read Get_AddIns;
    property VBE: VBE read Get_VBE;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property WindowState: PpWindowState read Get_WindowState write Set_WindowState;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property HWND: Integer read Get_HWND;
    property Active: MsoTriState read Get_Active;
    property AnswerWizard: AnswerWizard read Get_AnswerWizard;
    property COMAddIns: COMAddIns read Get_COMAddIns;
    property ProductCode: WideString read Get_ProductCode;
    property DefaultWebOptions: DefaultWebOptions read Get_DefaultWebOptions;
    property LanguageSettings: LanguageSettings read Get_LanguageSettings;
    property MsoDebugOptions: MsoDebugOptions read Get_MsoDebugOptions;
    property ShowWindowsInTaskbar: MsoTriState read Get_ShowWindowsInTaskbar write Set_ShowWindowsInTaskbar;
    property Marker: IUnknown read Get_Marker;
    property FeatureInstall: MsoFeatureInstall read Get_FeatureInstall write Set_FeatureInstall;
    property FileDialog[Type_: MsoFileDialogType]: FileDialog read Get_FileDialog;
    property DisplayGridLines: MsoTriState read Get_DisplayGridLines write Set_DisplayGridLines;
    property AutomationSecurity: MsoAutomationSecurity read Get_AutomationSecurity write Set_AutomationSecurity;
    property NewPresentation: NewFile read Get_NewPresentation;
    property DisplayAlerts: PpAlertLevel read Get_DisplayAlerts write Set_DisplayAlerts;
    property ShowStartupDialog: MsoTriState read Get_ShowStartupDialog write Set_ShowStartupDialog;
    property AutoCorrect: AutoCorrect read Get_AutoCorrect;
    property Options: Options read Get_Options;
    property DisplayDocumentInformationPanel: WordBool read Get_DisplayDocumentInformationPanel write Set_DisplayDocumentInformationPanel;
    property Assistance: IAssistance read Get_Assistance;
    property ActiveEncryptionSession: Integer read Get_ActiveEncryptionSession;
  end;

// *********************************************************************//
// DispIntf:  _ApplicationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493442-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _ApplicationDisp = dispinterface
    ['{91493442-5A91-11CF-8700-00AA0060263B}']
    property Presentations: Presentations readonly dispid 2001;
    property Windows: DocumentWindows readonly dispid 2002;
    property Dialogs: IUnknown readonly dispid 2003;
    property ActiveWindow: DocumentWindow readonly dispid 2004;
    property ActivePresentation: PowerPointPresentation readonly dispid 2005;
    property SlideShowWindows: SlideShowWindows readonly dispid 2006;
    property CommandBars: CommandBars readonly dispid 2007;
    property Path: WideString readonly dispid 2008;
    property Name: WideString readonly dispid 0;
    property Caption: WideString dispid 2009;
    property Assistant: Assistant readonly dispid 2010;
    property FileSearch: FileSearch readonly dispid 2011;
    property FileFind: IFind readonly dispid 2012;
    property Build: WideString readonly dispid 2013;
    property Version: WideString readonly dispid 2014;
    property OperatingSystem: WideString readonly dispid 2015;
    property ActivePrinter: WideString readonly dispid 2016;
    property Creator: Integer readonly dispid 2017;
    property AddIns: AddIns readonly dispid 2018;
    property VBE: VBE readonly dispid 2019;
    procedure Help(const HelpFile: WideString; ContextID: SYSINT); dispid 2020;
    procedure Quit; dispid 2021;
    function Run(const MacroName: WideString; var safeArrayOfParams: {??PSafeArray}OleVariant): OleVariant; dispid 2022;
    function PPFileDialog(Type_: PpFileDialogType): IUnknown; dispid 2023;
    procedure LaunchSpelling(const pWindow: DocumentWindow); dispid 2024;
    property Left: Single dispid 2025;
    property Top: Single dispid 2026;
    property Width: Single dispid 2027;
    property Height: Single dispid 2028;
    property WindowState: PpWindowState dispid 2029;
    property Visible: MsoTriState dispid 2030;
    property HWND: Integer readonly dispid 2031;
    property Active: MsoTriState readonly dispid 2032;
    procedure Activate; dispid 2033;
    property AnswerWizard: AnswerWizard readonly dispid 2034;
    property COMAddIns: COMAddIns readonly dispid 2035;
    property ProductCode: WideString readonly dispid 2036;
    property DefaultWebOptions: DefaultWebOptions readonly dispid 2037;
    property LanguageSettings: LanguageSettings readonly dispid 2038;
    property MsoDebugOptions: MsoDebugOptions readonly dispid 2039;
    property ShowWindowsInTaskbar: MsoTriState dispid 2040;
    property Marker: IUnknown readonly dispid 2041;
    property FeatureInstall: MsoFeatureInstall dispid 2042;
    function GetOptionFlag(Option: Integer; Persist: WordBool): WordBool; dispid 2043;
    procedure SetOptionFlag(Option: Integer; State: WordBool; Persist: WordBool); dispid 2044;
    property FileDialog[Type_: MsoFileDialogType]: FileDialog readonly dispid 2045;
    property DisplayGridLines: MsoTriState dispid 2046;
    property AutomationSecurity: MsoAutomationSecurity dispid 2047;
    property NewPresentation: NewFile readonly dispid 2048;
    property DisplayAlerts: PpAlertLevel dispid 2049;
    property ShowStartupDialog: MsoTriState dispid 2050;
    procedure SetPerfMarker(Marker: SYSINT); dispid 2051;
    property AutoCorrect: AutoCorrect readonly dispid 2052;
    property Options: Options readonly dispid 2053;
    procedure LaunchPublishSlidesDialog(const SlideLibraryUrl: WideString); dispid 2054;
    procedure LaunchSendToPPTDialog(var SlideUrls: OleVariant); dispid 2055;
    property DisplayDocumentInformationPanel: WordBool dispid 2056;
    property Assistance: IAssistance readonly dispid 2057;
    property ActiveEncryptionSession: Integer readonly dispid 2058;
  end;

// *********************************************************************//
// Interface: _Global
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493451-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _Global = interface(IDispatch)
    ['{91493451-5A91-11CF-8700-00AA0060263B}']
    function Get_ActivePresentation: PowerPointPresentation; safecall;
    function Get_ActiveWindow: DocumentWindow; safecall;
    function Get_AddIns: AddIns; safecall;
    function Get_Application: PowerPointApplication; safecall;
    function Get_Assistant: Assistant; safecall;
    function Get_Dialogs: IUnknown; safecall;
    function Get_Presentations: Presentations; safecall;
    function Get_SlideShowWindows: SlideShowWindows; safecall;
    function Get_Windows: DocumentWindows; safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_AnswerWizard: AnswerWizard; safecall;
    property ActivePresentation: PowerPointPresentation read Get_ActivePresentation;
    property ActiveWindow: DocumentWindow read Get_ActiveWindow;
    property AddIns: AddIns read Get_AddIns;
    property Application: PowerPointApplication read Get_Application;
    property Assistant: Assistant read Get_Assistant;
    property Dialogs: IUnknown read Get_Dialogs;
    property Presentations: Presentations read Get_Presentations;
    property SlideShowWindows: SlideShowWindows read Get_SlideShowWindows;
    property Windows: DocumentWindows read Get_Windows;
    property CommandBars: CommandBars read Get_CommandBars;
    property AnswerWizard: AnswerWizard read Get_AnswerWizard;
  end;

// *********************************************************************//
// DispIntf:  _GlobalDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493451-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _GlobalDisp = dispinterface
    ['{91493451-5A91-11CF-8700-00AA0060263B}']
    property ActivePresentation: PowerPointPresentation readonly dispid 2001;
    property ActiveWindow: DocumentWindow readonly dispid 2002;
    property AddIns: AddIns readonly dispid 2003;
    property Application: PowerPointApplication readonly dispid 2004;
    property Assistant: Assistant readonly dispid 2005;
    property Dialogs: IUnknown readonly dispid 2006;
    property Presentations: Presentations readonly dispid 2007;
    property SlideShowWindows: SlideShowWindows readonly dispid 2008;
    property Windows: DocumentWindows readonly dispid 2009;
    property CommandBars: CommandBars readonly dispid 2010;
    property AnswerWizard: AnswerWizard readonly dispid 2011;
  end;

// *********************************************************************//
// Interface: EApplication
// Flags:     (4096) Dispatchable
// GUID:      {914934C2-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  EApplication = interface(IDispatch)
    ['{914934C2-5A91-11CF-8700-00AA0060263B}']
    function WindowSelectionChange(const Sel: Selection): HResult; stdcall;
    function WindowBeforeRightClick(const Sel: Selection; var Cancel: WordBool): HResult; stdcall;
    function WindowBeforeDoubleClick(const Sel: Selection; var Cancel: WordBool): HResult; stdcall;
    function PresentationClose(const Pres: PowerPointPresentation): HResult; stdcall;
    function PresentationSave(const Pres: PowerPointPresentation): HResult; stdcall;
    function PresentationOpen(const Pres: PowerPointPresentation): HResult; stdcall;
    function NewPresentation(const Pres: PowerPointPresentation): HResult; stdcall;
    function PresentationNewSlide(const Sld: PowerPointSlide): HResult; stdcall;
    function WindowActivate(const Pres: PowerPointPresentation; const Wn: DocumentWindow): HResult; stdcall;
    function WindowDeactivate(const Pres: PowerPointPresentation; const Wn: DocumentWindow): HResult; stdcall;
    function SlideShowBegin(const Wn: SlideShowWindow): HResult; stdcall;
    function SlideShowNextBuild(const Wn: SlideShowWindow): HResult; stdcall;
    function SlideShowNextSlide(const Wn: SlideShowWindow): HResult; stdcall;
    function SlideShowEnd(const Pres: PowerPointPresentation): HResult; stdcall;
    function PresentationPrint(const Pres: PowerPointPresentation): HResult; stdcall;
    function SlideSelectionChanged(const SldRange: SlideRange): HResult; stdcall;
    function ColorSchemeChanged(const SldRange: SlideRange): HResult; stdcall;
    function PresentationBeforeSave(const Pres: PowerPointPresentation; var Cancel: WordBool): HResult; stdcall;
    function SlideShowNextClick(const Wn: SlideShowWindow; const nEffect: Effect): HResult; stdcall;
    function AfterNewPresentation(const Pres: PowerPointPresentation): HResult; stdcall;
    function AfterPresentationOpen(const Pres: PowerPointPresentation): HResult; stdcall;
    function PresentationSync(const Pres: PowerPointPresentation; SyncEventType: MsoSyncEventType): HResult; stdcall;
    function SlideShowOnNext(const Wn: SlideShowWindow): HResult; stdcall;
    function SlideShowOnPrevious(const Wn: SlideShowWindow): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ColorFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493452-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorFormat = interface(IDispatch)
    ['{91493452-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_RGB: MsoRGBType; safecall;
    procedure Set_RGB(RGB: MsoRGBType); safecall;
    function Get_type_: MsoColorType; safecall;
    function Get_SchemeColor: PpColorSchemeIndex; safecall;
    procedure Set_SchemeColor(SchemeColor: PpColorSchemeIndex); safecall;
    function Get_TintAndShade: Single; safecall;
    procedure Set_TintAndShade(pValue: Single); safecall;
    function Get_ObjectThemeColor: MsoThemeColorIndex; safecall;
    procedure Set_ObjectThemeColor(ObjectThemeColor: MsoThemeColorIndex); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property RGB: MsoRGBType read Get_RGB write Set_RGB;
    property type_: MsoColorType read Get_type_;
    property SchemeColor: PpColorSchemeIndex read Get_SchemeColor write Set_SchemeColor;
    property TintAndShade: Single read Get_TintAndShade write Set_TintAndShade;
    property ObjectThemeColor: MsoThemeColorIndex read Get_ObjectThemeColor write Set_ObjectThemeColor;
  end;

// *********************************************************************//
// DispIntf:  ColorFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493452-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorFormatDisp = dispinterface
    ['{91493452-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property RGB: MsoRGBType dispid 0;
    property type_: MsoColorType readonly dispid 101;
    property SchemeColor: PpColorSchemeIndex dispid 2003;
    property TintAndShade: Single dispid 103;
    property ObjectThemeColor: MsoThemeColorIndex dispid 104;
  end;

// *********************************************************************//
// Interface: SlideShowWindow
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493453-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowWindow = interface(IDispatch)
    ['{91493453-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_View: SlideShowView; safecall;
    function Get_Presentation: PowerPointPresentation; safecall;
    function Get_IsFullScreen: MsoTriState; safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Left: Single); safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Top: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    function Get_HWND: Integer; safecall;
    function Get_Active: MsoTriState; safecall;
    procedure Activate; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property View: SlideShowView read Get_View;
    property Presentation: PowerPointPresentation read Get_Presentation;
    property IsFullScreen: MsoTriState read Get_IsFullScreen;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property HWND: Integer read Get_HWND;
    property Active: MsoTriState read Get_Active;
  end;

// *********************************************************************//
// DispIntf:  SlideShowWindowDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493453-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowWindowDisp = dispinterface
    ['{91493453-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property View: SlideShowView readonly dispid 2003;
    property Presentation: PowerPointPresentation readonly dispid 2004;
    property IsFullScreen: MsoTriState readonly dispid 2005;
    property Left: Single dispid 2006;
    property Top: Single dispid 2007;
    property Width: Single dispid 2008;
    property Height: Single dispid 2009;
    property HWND: Integer readonly dispid 2010;
    property Active: MsoTriState readonly dispid 2011;
    procedure Activate; dispid 2012;
  end;

// *********************************************************************//
// Interface: Selection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493454-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Selection = interface(IDispatch)
    ['{91493454-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Delete; safecall;
    procedure Unselect; safecall;
    function Get_type_: PpSelectionType; safecall;
    function Get_SlideRange: SlideRange; safecall;
    function Get_ShapeRange: ShapeRange; safecall;
    function Get_TextRange: TextRange; safecall;
    function Get_ChildShapeRange: ShapeRange; safecall;
    function Get_HasChildShapeRange: WordBool; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: PpSelectionType read Get_type_;
    property SlideRange: SlideRange read Get_SlideRange;
    property ShapeRange: ShapeRange read Get_ShapeRange;
    property TextRange: TextRange read Get_TextRange;
    property ChildShapeRange: ShapeRange read Get_ChildShapeRange;
    property HasChildShapeRange: WordBool read Get_HasChildShapeRange;
  end;

// *********************************************************************//
// DispIntf:  SelectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493454-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SelectionDisp = dispinterface
    ['{91493454-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    procedure Cut; dispid 2003;
    procedure Copy; dispid 2004;
    procedure Delete; dispid 2005;
    procedure Unselect; dispid 2006;
    property type_: PpSelectionType readonly dispid 2007;
    property SlideRange: SlideRange readonly dispid 2008;
    property ShapeRange: ShapeRange readonly dispid 2009;
    property TextRange: TextRange readonly dispid 2010;
    property ChildShapeRange: ShapeRange readonly dispid 2011;
    property HasChildShapeRange: WordBool readonly dispid 2012;
  end;

// *********************************************************************//
// Interface: DocumentWindows
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493455-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DocumentWindows = interface(Collection)
    ['{91493455-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): DocumentWindow; safecall;
    procedure Arrange(arrangeStyle: PpArrangeStyle); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  DocumentWindowsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493455-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DocumentWindowsDisp = dispinterface
    ['{91493455-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): DocumentWindow; dispid 0;
    procedure Arrange(arrangeStyle: PpArrangeStyle); dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: SlideShowWindows
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493456-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowWindows = interface(Collection)
    ['{91493456-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): SlideShowWindow; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  SlideShowWindowsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493456-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowWindowsDisp = dispinterface
    ['{91493456-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): SlideShowWindow; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: DocumentWindow
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493457-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DocumentWindow = interface(IDispatch)
    ['{91493457-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Selection: Selection; safecall;
    function Get_View: View; safecall;
    function Get_Presentation: PowerPointPresentation; safecall;
    function Get_ViewType: PpViewType; safecall;
    procedure Set_ViewType(ViewType: PpViewType); safecall;
    function Get_BlackAndWhite: MsoTriState; safecall;
    procedure Set_BlackAndWhite(BlackAndWhite: MsoTriState); safecall;
    function Get_Active: MsoTriState; safecall;
    function Get_WindowState: PpWindowState; safecall;
    procedure Set_WindowState(WindowState: PpWindowState); safecall;
    function Get_Caption: WideString; safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Left: Single); safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Top: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    procedure FitToPage; safecall;
    procedure Activate; safecall;
    procedure LargeScroll(Down: SYSINT; Up: SYSINT; ToRight: SYSINT; ToLeft: SYSINT); safecall;
    procedure SmallScroll(Down: SYSINT; Up: SYSINT; ToRight: SYSINT; ToLeft: SYSINT); safecall;
    function NewWindow: DocumentWindow; safecall;
    procedure Close; safecall;
    function Get_HWND: Integer; safecall;
    function Get_ActivePane: Pane; safecall;
    function Get_Panes: Panes; safecall;
    function Get_SplitVertical: Integer; safecall;
    procedure Set_SplitVertical(SplitVertical: Integer); safecall;
    function Get_SplitHorizontal: Integer; safecall;
    procedure Set_SplitHorizontal(SplitHorizontal: Integer); safecall;
    function RangeFromPoint(X: SYSINT; Y: SYSINT): IDispatch; safecall;
    function PointsToScreenPixelsX(Points: Single): SYSINT; safecall;
    function PointsToScreenPixelsY(Points: Single): SYSINT; safecall;
    procedure ScrollIntoView(Left: Single; Top: Single; Width: Single; Height: Single; 
                             Start: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Selection: Selection read Get_Selection;
    property View: View read Get_View;
    property Presentation: PowerPointPresentation read Get_Presentation;
    property ViewType: PpViewType read Get_ViewType write Set_ViewType;
    property BlackAndWhite: MsoTriState read Get_BlackAndWhite write Set_BlackAndWhite;
    property Active: MsoTriState read Get_Active;
    property WindowState: PpWindowState read Get_WindowState write Set_WindowState;
    property Caption: WideString read Get_Caption;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property HWND: Integer read Get_HWND;
    property ActivePane: Pane read Get_ActivePane;
    property Panes: Panes read Get_Panes;
    property SplitVertical: Integer read Get_SplitVertical write Set_SplitVertical;
    property SplitHorizontal: Integer read Get_SplitHorizontal write Set_SplitHorizontal;
  end;

// *********************************************************************//
// DispIntf:  DocumentWindowDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493457-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DocumentWindowDisp = dispinterface
    ['{91493457-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Selection: Selection readonly dispid 2003;
    property View: View readonly dispid 2004;
    property Presentation: PowerPointPresentation readonly dispid 2005;
    property ViewType: PpViewType dispid 2006;
    property BlackAndWhite: MsoTriState dispid 2007;
    property Active: MsoTriState readonly dispid 2008;
    property WindowState: PpWindowState dispid 2009;
    property Caption: WideString readonly dispid 0;
    property Left: Single dispid 2010;
    property Top: Single dispid 2011;
    property Width: Single dispid 2012;
    property Height: Single dispid 2013;
    procedure FitToPage; dispid 2014;
    procedure Activate; dispid 2015;
    procedure LargeScroll(Down: SYSINT; Up: SYSINT; ToRight: SYSINT; ToLeft: SYSINT); dispid 2016;
    procedure SmallScroll(Down: SYSINT; Up: SYSINT; ToRight: SYSINT; ToLeft: SYSINT); dispid 2017;
    function NewWindow: DocumentWindow; dispid 2018;
    procedure Close; dispid 2019;
    property HWND: Integer readonly dispid 2020;
    property ActivePane: Pane readonly dispid 2021;
    property Panes: Panes readonly dispid 2022;
    property SplitVertical: Integer dispid 2023;
    property SplitHorizontal: Integer dispid 2024;
    function RangeFromPoint(X: SYSINT; Y: SYSINT): IDispatch; dispid 2025;
    function PointsToScreenPixelsX(Points: Single): SYSINT; dispid 2026;
    function PointsToScreenPixelsY(Points: Single): SYSINT; dispid 2027;
    procedure ScrollIntoView(Left: Single; Top: Single; Width: Single; Height: Single; 
                             Start: MsoTriState); dispid 2028;
  end;

// *********************************************************************//
// Interface: View
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493458-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  View = interface(IDispatch)
    ['{91493458-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_type_: PpViewType; safecall;
    function Get_Zoom: SYSINT; safecall;
    procedure Set_Zoom(Zoom: SYSINT); safecall;
    procedure Paste; safecall;
    function Get_Slide: IDispatch; safecall;
    procedure Set_Slide(const Slide: IDispatch); safecall;
    procedure GotoSlide(Index: SYSINT); safecall;
    function Get_DisplaySlideMiniature: MsoTriState; safecall;
    procedure Set_DisplaySlideMiniature(DisplaySlideMiniature: MsoTriState); safecall;
    function Get_ZoomToFit: MsoTriState; safecall;
    procedure Set_ZoomToFit(ZoomToFit: MsoTriState); safecall;
    procedure PasteSpecial(DataType: PpPasteDataType; DisplayAsIcon: MsoTriState; 
                           const IconFileName: WideString; IconIndex: SYSINT; 
                           const IconLabel: WideString; Link: MsoTriState); safecall;
    function Get_PrintOptions: PrintOptions; safecall;
    procedure PrintOut(From: SYSINT; To_: SYSINT; const PrintToFile: WideString; Copies: SYSINT; 
                       Collate: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: PpViewType read Get_type_;
    property Zoom: SYSINT read Get_Zoom write Set_Zoom;
    property Slide: IDispatch read Get_Slide write Set_Slide;
    property DisplaySlideMiniature: MsoTriState read Get_DisplaySlideMiniature write Set_DisplaySlideMiniature;
    property ZoomToFit: MsoTriState read Get_ZoomToFit write Set_ZoomToFit;
    property PrintOptions: PrintOptions read Get_PrintOptions;
  end;

// *********************************************************************//
// DispIntf:  ViewDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493458-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ViewDisp = dispinterface
    ['{91493458-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property type_: PpViewType readonly dispid 2003;
    property Zoom: SYSINT dispid 2004;
    procedure Paste; dispid 2005;
    property Slide: IDispatch dispid 2006;
    procedure GotoSlide(Index: SYSINT); dispid 2007;
    property DisplaySlideMiniature: MsoTriState dispid 2008;
    property ZoomToFit: MsoTriState dispid 2009;
    procedure PasteSpecial(DataType: PpPasteDataType; DisplayAsIcon: MsoTriState; 
                           const IconFileName: WideString; IconIndex: SYSINT; 
                           const IconLabel: WideString; Link: MsoTriState); dispid 2010;
    property PrintOptions: PrintOptions readonly dispid 2011;
    procedure PrintOut(From: SYSINT; To_: SYSINT; const PrintToFile: WideString; Copies: SYSINT; 
                       Collate: MsoTriState); dispid 2012;
  end;

// *********************************************************************//
// Interface: SlideShowView
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493459-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowView = interface(IDispatch)
    ['{91493459-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Zoom: SYSINT; safecall;
    function Get_Slide: PowerPointSlide; safecall;
    function Get_PointerType: PpSlideShowPointerType; safecall;
    procedure Set_PointerType(PointerType: PpSlideShowPointerType); safecall;
    function Get_State: PpSlideShowState; safecall;
    procedure Set_State(State: PpSlideShowState); safecall;
    function Get_AcceleratorsEnabled: MsoTriState; safecall;
    procedure Set_AcceleratorsEnabled(AcceleratorsEnabled: MsoTriState); safecall;
    function Get_PresentationElapsedTime: Single; safecall;
    function Get_SlideElapsedTime: Single; safecall;
    procedure Set_SlideElapsedTime(SlideElapsedTime: Single); safecall;
    function Get_LastSlideViewed: PowerPointSlide; safecall;
    function Get_AdvanceMode: PpSlideShowAdvanceMode; safecall;
    function Get_PointerColor: ColorFormat; safecall;
    function Get_IsNamedShow: MsoTriState; safecall;
    function Get_SlideShowName: WideString; safecall;
    procedure DrawLine(BeginX: Single; BeginY: Single; EndX: Single; EndY: Single); safecall;
    procedure EraseDrawing; safecall;
    procedure First; safecall;
    procedure Last; safecall;
    procedure Next; safecall;
    procedure Previous; safecall;
    procedure GotoSlide(Index: SYSINT; ResetSlide: MsoTriState); safecall;
    procedure GotoNamedShow(const SlideShowName: WideString); safecall;
    procedure EndNamedShow; safecall;
    procedure ResetSlideTime; safecall;
    procedure Exit; safecall;
    procedure InstallTracker(const pTracker: MouseTracker; Presenter: MsoTriState); safecall;
    function Get_CurrentShowPosition: SYSINT; safecall;
    procedure GotoClick(Index: SYSINT); safecall;
    function GetClickIndex: SYSINT; safecall;
    function GetClickCount: SYSINT; safecall;
    function FirstAnimationIsAutomatic: WordBool; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Zoom: SYSINT read Get_Zoom;
    property Slide: PowerPointSlide read Get_Slide;
    property PointerType: PpSlideShowPointerType read Get_PointerType write Set_PointerType;
    property State: PpSlideShowState read Get_State write Set_State;
    property AcceleratorsEnabled: MsoTriState read Get_AcceleratorsEnabled write Set_AcceleratorsEnabled;
    property PresentationElapsedTime: Single read Get_PresentationElapsedTime;
    property SlideElapsedTime: Single read Get_SlideElapsedTime write Set_SlideElapsedTime;
    property LastSlideViewed: PowerPointSlide read Get_LastSlideViewed;
    property AdvanceMode: PpSlideShowAdvanceMode read Get_AdvanceMode;
    property PointerColor: ColorFormat read Get_PointerColor;
    property IsNamedShow: MsoTriState read Get_IsNamedShow;
    property SlideShowName: WideString read Get_SlideShowName;
    property CurrentShowPosition: SYSINT read Get_CurrentShowPosition;
  end;

// *********************************************************************//
// DispIntf:  SlideShowViewDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493459-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowViewDisp = dispinterface
    ['{91493459-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Zoom: SYSINT readonly dispid 2003;
    property Slide: PowerPointSlide readonly dispid 2004;
    property PointerType: PpSlideShowPointerType dispid 2005;
    property State: PpSlideShowState dispid 2006;
    property AcceleratorsEnabled: MsoTriState dispid 2007;
    property PresentationElapsedTime: Single readonly dispid 2008;
    property SlideElapsedTime: Single dispid 2009;
    property LastSlideViewed: PowerPointSlide readonly dispid 2010;
    property AdvanceMode: PpSlideShowAdvanceMode readonly dispid 2011;
    property PointerColor: ColorFormat readonly dispid 2012;
    property IsNamedShow: MsoTriState readonly dispid 2013;
    property SlideShowName: WideString readonly dispid 2014;
    procedure DrawLine(BeginX: Single; BeginY: Single; EndX: Single; EndY: Single); dispid 2015;
    procedure EraseDrawing; dispid 2016;
    procedure First; dispid 2017;
    procedure Last; dispid 2018;
    procedure Next; dispid 2019;
    procedure Previous; dispid 2020;
    procedure GotoSlide(Index: SYSINT; ResetSlide: MsoTriState); dispid 2021;
    procedure GotoNamedShow(const SlideShowName: WideString); dispid 2022;
    procedure EndNamedShow; dispid 2023;
    procedure ResetSlideTime; dispid 2024;
    procedure Exit; dispid 2025;
    procedure InstallTracker(const pTracker: MouseTracker; Presenter: MsoTriState); dispid 2026;
    property CurrentShowPosition: SYSINT readonly dispid 2027;
    procedure GotoClick(Index: SYSINT); dispid 2028;
    function GetClickIndex: SYSINT; dispid 2029;
    function GetClickCount: SYSINT; dispid 2030;
    function FirstAnimationIsAutomatic: WordBool; dispid 2031;
  end;

// *********************************************************************//
// Interface: SlideShowSettings
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowSettings = interface(IDispatch)
    ['{9149345A-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_PointerColor: ColorFormat; safecall;
    function Get_NamedSlideShows: NamedSlideShows; safecall;
    function Get_StartingSlide: SYSINT; safecall;
    procedure Set_StartingSlide(StartingSlide: SYSINT); safecall;
    function Get_EndingSlide: SYSINT; safecall;
    procedure Set_EndingSlide(EndingSlide: SYSINT); safecall;
    function Get_AdvanceMode: PpSlideShowAdvanceMode; safecall;
    procedure Set_AdvanceMode(AdvanceMode: PpSlideShowAdvanceMode); safecall;
    function Run: SlideShowWindow; safecall;
    function Get_LoopUntilStopped: MsoTriState; safecall;
    procedure Set_LoopUntilStopped(LoopUntilStopped: MsoTriState); safecall;
    function Get_ShowType: PpSlideShowType; safecall;
    procedure Set_ShowType(ShowType: PpSlideShowType); safecall;
    function Get_ShowWithNarration: MsoTriState; safecall;
    procedure Set_ShowWithNarration(ShowWithNarration: MsoTriState); safecall;
    function Get_ShowWithAnimation: MsoTriState; safecall;
    procedure Set_ShowWithAnimation(ShowWithAnimation: MsoTriState); safecall;
    function Get_SlideShowName: WideString; safecall;
    procedure Set_SlideShowName(const SlideShowName: WideString); safecall;
    function Get_RangeType: PpSlideShowRangeType; safecall;
    procedure Set_RangeType(RangeType: PpSlideShowRangeType); safecall;
    function Get_ShowScrollbar: MsoTriState; safecall;
    procedure Set_ShowScrollbar(ShowScrollbar: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property PointerColor: ColorFormat read Get_PointerColor;
    property NamedSlideShows: NamedSlideShows read Get_NamedSlideShows;
    property StartingSlide: SYSINT read Get_StartingSlide write Set_StartingSlide;
    property EndingSlide: SYSINT read Get_EndingSlide write Set_EndingSlide;
    property AdvanceMode: PpSlideShowAdvanceMode read Get_AdvanceMode write Set_AdvanceMode;
    property LoopUntilStopped: MsoTriState read Get_LoopUntilStopped write Set_LoopUntilStopped;
    property ShowType: PpSlideShowType read Get_ShowType write Set_ShowType;
    property ShowWithNarration: MsoTriState read Get_ShowWithNarration write Set_ShowWithNarration;
    property ShowWithAnimation: MsoTriState read Get_ShowWithAnimation write Set_ShowWithAnimation;
    property SlideShowName: WideString read Get_SlideShowName write Set_SlideShowName;
    property RangeType: PpSlideShowRangeType read Get_RangeType write Set_RangeType;
    property ShowScrollbar: MsoTriState read Get_ShowScrollbar write Set_ShowScrollbar;
  end;

// *********************************************************************//
// DispIntf:  SlideShowSettingsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowSettingsDisp = dispinterface
    ['{9149345A-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property PointerColor: ColorFormat readonly dispid 2003;
    property NamedSlideShows: NamedSlideShows readonly dispid 2004;
    property StartingSlide: SYSINT dispid 2005;
    property EndingSlide: SYSINT dispid 2006;
    property AdvanceMode: PpSlideShowAdvanceMode dispid 2007;
    function Run: SlideShowWindow; dispid 2008;
    property LoopUntilStopped: MsoTriState dispid 2009;
    property ShowType: PpSlideShowType dispid 2010;
    property ShowWithNarration: MsoTriState dispid 2011;
    property ShowWithAnimation: MsoTriState dispid 2012;
    property SlideShowName: WideString dispid 2013;
    property RangeType: PpSlideShowRangeType dispid 2014;
    property ShowScrollbar: MsoTriState dispid 2015;
  end;

// *********************************************************************//
// Interface: NamedSlideShows
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  NamedSlideShows = interface(Collection)
    ['{9149345B-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: OleVariant): NamedSlideShow; safecall;
    function Add(const Name: WideString; safeArrayOfSlideIDs: OleVariant): NamedSlideShow; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  NamedSlideShowsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  NamedSlideShowsDisp = dispinterface
    ['{9149345B-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: OleVariant): NamedSlideShow; dispid 0;
    function Add(const Name: WideString; safeArrayOfSlideIDs: OleVariant): NamedSlideShow; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: NamedSlideShow
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  NamedSlideShow = interface(IDispatch)
    ['{9149345C-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    procedure Delete; safecall;
    function Get_SlideIDs: OleVariant; safecall;
    function Get_Count: Integer; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property SlideIDs: OleVariant read Get_SlideIDs;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  NamedSlideShowDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  NamedSlideShowDisp = dispinterface
    ['{9149345C-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Name: WideString readonly dispid 2003;
    procedure Delete; dispid 2004;
    property SlideIDs: OleVariant readonly dispid 2005;
    property Count: Integer readonly dispid 2006;
  end;

// *********************************************************************//
// Interface: PrintOptions
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PrintOptions = interface(IDispatch)
    ['{9149345D-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_PrintColorType: PpPrintColorType; safecall;
    procedure Set_PrintColorType(PrintColorType: PpPrintColorType); safecall;
    function Get_Collate: MsoTriState; safecall;
    procedure Set_Collate(Collate: MsoTriState); safecall;
    function Get_FitToPage: MsoTriState; safecall;
    procedure Set_FitToPage(FitToPage: MsoTriState); safecall;
    function Get_FrameSlides: MsoTriState; safecall;
    procedure Set_FrameSlides(FrameSlides: MsoTriState); safecall;
    function Get_NumberOfCopies: SYSINT; safecall;
    procedure Set_NumberOfCopies(NumberOfCopies: SYSINT); safecall;
    function Get_OutputType: PpPrintOutputType; safecall;
    procedure Set_OutputType(OutputType: PpPrintOutputType); safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_PrintHiddenSlides: MsoTriState; safecall;
    procedure Set_PrintHiddenSlides(PrintHiddenSlides: MsoTriState); safecall;
    function Get_PrintInBackground: MsoTriState; safecall;
    procedure Set_PrintInBackground(PrintInBackground: MsoTriState); safecall;
    function Get_RangeType: PpPrintRangeType; safecall;
    procedure Set_RangeType(RangeType: PpPrintRangeType); safecall;
    function Get_Ranges: PrintRanges; safecall;
    function Get_PrintFontsAsGraphics: MsoTriState; safecall;
    procedure Set_PrintFontsAsGraphics(PrintFontsAsGraphics: MsoTriState); safecall;
    function Get_SlideShowName: WideString; safecall;
    procedure Set_SlideShowName(const SlideShowName: WideString); safecall;
    function Get_ActivePrinter: WideString; safecall;
    procedure Set_ActivePrinter(const ActivePrinter: WideString); safecall;
    function Get_HandoutOrder: PpPrintHandoutOrder; safecall;
    procedure Set_HandoutOrder(HandoutOrder: PpPrintHandoutOrder); safecall;
    function Get_PrintComments: MsoTriState; safecall;
    procedure Set_PrintComments(PrintComments: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property PrintColorType: PpPrintColorType read Get_PrintColorType write Set_PrintColorType;
    property Collate: MsoTriState read Get_Collate write Set_Collate;
    property FitToPage: MsoTriState read Get_FitToPage write Set_FitToPage;
    property FrameSlides: MsoTriState read Get_FrameSlides write Set_FrameSlides;
    property NumberOfCopies: SYSINT read Get_NumberOfCopies write Set_NumberOfCopies;
    property OutputType: PpPrintOutputType read Get_OutputType write Set_OutputType;
    property Parent: IDispatch read Get_Parent;
    property PrintHiddenSlides: MsoTriState read Get_PrintHiddenSlides write Set_PrintHiddenSlides;
    property PrintInBackground: MsoTriState read Get_PrintInBackground write Set_PrintInBackground;
    property RangeType: PpPrintRangeType read Get_RangeType write Set_RangeType;
    property Ranges: PrintRanges read Get_Ranges;
    property PrintFontsAsGraphics: MsoTriState read Get_PrintFontsAsGraphics write Set_PrintFontsAsGraphics;
    property SlideShowName: WideString read Get_SlideShowName write Set_SlideShowName;
    property ActivePrinter: WideString read Get_ActivePrinter write Set_ActivePrinter;
    property HandoutOrder: PpPrintHandoutOrder read Get_HandoutOrder write Set_HandoutOrder;
    property PrintComments: MsoTriState read Get_PrintComments write Set_PrintComments;
  end;

// *********************************************************************//
// DispIntf:  PrintOptionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PrintOptionsDisp = dispinterface
    ['{9149345D-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property PrintColorType: PpPrintColorType dispid 2002;
    property Collate: MsoTriState dispid 2003;
    property FitToPage: MsoTriState dispid 2004;
    property FrameSlides: MsoTriState dispid 2005;
    property NumberOfCopies: SYSINT dispid 2006;
    property OutputType: PpPrintOutputType dispid 2007;
    property Parent: IDispatch readonly dispid 2008;
    property PrintHiddenSlides: MsoTriState dispid 2009;
    property PrintInBackground: MsoTriState dispid 2010;
    property RangeType: PpPrintRangeType dispid 2011;
    property Ranges: PrintRanges readonly dispid 2012;
    property PrintFontsAsGraphics: MsoTriState dispid 2013;
    property SlideShowName: WideString dispid 2014;
    property ActivePrinter: WideString dispid 2015;
    property HandoutOrder: PpPrintHandoutOrder dispid 2016;
    property PrintComments: MsoTriState dispid 2017;
  end;

// *********************************************************************//
// Interface: PrintRanges
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PrintRanges = interface(Collection)
    ['{9149345E-5A91-11CF-8700-00AA0060263B}']
    function Add(Start: SYSINT; End_: SYSINT): PrintRange; safecall;
    function Get_Application: PowerPointApplication; safecall;
    procedure ClearAll; safecall;
    function Item(Index: SYSINT): PrintRange; safecall;
    function Get_Parent: IDispatch; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  PrintRangesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PrintRangesDisp = dispinterface
    ['{9149345E-5A91-11CF-8700-00AA0060263B}']
    function Add(Start: SYSINT; End_: SYSINT): PrintRange; dispid 2001;
    property Application: PowerPointApplication readonly dispid 2002;
    procedure ClearAll; dispid 2003;
    function Item(Index: SYSINT): PrintRange; dispid 0;
    property Parent: IDispatch readonly dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: PrintRange
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PrintRange = interface(IDispatch)
    ['{9149345F-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Start: SYSINT; safecall;
    function Get_End_: SYSINT; safecall;
    procedure Delete; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Start: SYSINT read Get_Start;
    property End_: SYSINT read Get_End_;
  end;

// *********************************************************************//
// DispIntf:  PrintRangeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149345F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PrintRangeDisp = dispinterface
    ['{9149345F-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Start: SYSINT readonly dispid 2003;
    property End_: SYSINT readonly dispid 2004;
    procedure Delete; dispid 2005;
  end;

// *********************************************************************//
// Interface: AddIns
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493460-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AddIns = interface(Collection)
    ['{91493460-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): AddIn; safecall;
    function Add(const FileName: WideString): AddIn; safecall;
    procedure Remove(var Index: OleVariant); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  AddInsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493460-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AddInsDisp = dispinterface
    ['{91493460-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(var Index: OleVariant): AddIn; dispid 0;
    function Add(const FileName: WideString): AddIn; dispid 2003;
    procedure Remove(var Index: OleVariant); dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: AddIn
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493461-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AddIn = interface(IDispatch)
    ['{91493461-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_Registered: MsoTriState; safecall;
    procedure Set_Registered(Registered: MsoTriState); safecall;
    function Get_AutoLoad: MsoTriState; safecall;
    procedure Set_AutoLoad(AutoLoad: MsoTriState); safecall;
    function Get_Loaded: MsoTriState; safecall;
    procedure Set_Loaded(Loaded: MsoTriState); safecall;
    function Get_DisplayAlerts: MsoTriState; safecall;
    procedure Set_DisplayAlerts(DisplayAlerts: MsoTriState); safecall;
    function Get_RegisteredInHKLM: MsoTriState; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property FullName: WideString read Get_FullName;
    property Name: WideString read Get_Name;
    property Path: WideString read Get_Path;
    property Registered: MsoTriState read Get_Registered write Set_Registered;
    property AutoLoad: MsoTriState read Get_AutoLoad write Set_AutoLoad;
    property Loaded: MsoTriState read Get_Loaded write Set_Loaded;
    property DisplayAlerts: MsoTriState read Get_DisplayAlerts write Set_DisplayAlerts;
    property RegisteredInHKLM: MsoTriState read Get_RegisteredInHKLM;
  end;

// *********************************************************************//
// DispIntf:  AddInDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493461-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AddInDisp = dispinterface
    ['{91493461-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property FullName: WideString readonly dispid 2003;
    property Name: WideString readonly dispid 2004;
    property Path: WideString readonly dispid 2005;
    property Registered: MsoTriState dispid 2006;
    property AutoLoad: MsoTriState dispid 2007;
    property Loaded: MsoTriState dispid 2008;
    property DisplayAlerts: MsoTriState dispid 2009;
    property RegisteredInHKLM: MsoTriState readonly dispid 2010;
  end;

// *********************************************************************//
// Interface: Presentations
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493462-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Presentations = interface(Collection)
    ['{91493462-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: OleVariant): PowerPointPresentation; safecall;
    function Add(WithWindow: MsoTriState): PowerPointPresentation; safecall;
    function OpenOld(const FileName: WideString; ReadOnly: MsoTriState; Untitled: MsoTriState; 
                     WithWindow: MsoTriState): PowerPointPresentation; safecall;
    function Open(const FileName: WideString; ReadOnly: MsoTriState; Untitled: MsoTriState; 
                  WithWindow: MsoTriState): PowerPointPresentation; safecall;
    procedure CheckOut(const FileName: WideString); safecall;
    function CanCheckOut(const FileName: WideString): WordBool; safecall;
    function Open2007(const FileName: WideString; ReadOnly: MsoTriState; Untitled: MsoTriState; 
                      WithWindow: MsoTriState; OpenAndRepair: MsoTriState): PowerPointPresentation; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  PresentationsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493462-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PresentationsDisp = dispinterface
    ['{91493462-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: OleVariant): PowerPointPresentation; dispid 0;
    function Add(WithWindow: MsoTriState): PowerPointPresentation; dispid 2003;
    function OpenOld(const FileName: WideString; ReadOnly: MsoTriState; Untitled: MsoTriState; 
                     WithWindow: MsoTriState): PowerPointPresentation; dispid 2004;
    function Open(const FileName: WideString; ReadOnly: MsoTriState; Untitled: MsoTriState; 
                  WithWindow: MsoTriState): PowerPointPresentation; dispid 2005;
    procedure CheckOut(const FileName: WideString); dispid 2006;
    function CanCheckOut(const FileName: WideString): WordBool; dispid 2007;
    function Open2007(const FileName: WideString; ReadOnly: MsoTriState; Untitled: MsoTriState; 
                      WithWindow: MsoTriState; OpenAndRepair: MsoTriState): PowerPointPresentation; dispid 2008;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: PresEvents
// Flags:     (16) Hidden
// GUID:      {91493463-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PresEvents = interface(IUnknown)
    ['{91493463-5A91-11CF-8700-00AA0060263B}']
  end;

// *********************************************************************//
// Interface: _Presentation
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _Presentation = interface(IDispatch)
    ['{9149349D-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_SlideMaster: _Master; safecall;
    function Get_TitleMaster: _Master; safecall;
    function Get_HasTitleMaster: MsoTriState; safecall;
    function AddTitleMaster: _Master; safecall;
    procedure ApplyTemplate(const FileName: WideString); safecall;
    function Get_TemplateName: WideString; safecall;
    function Get_NotesMaster: _Master; safecall;
    function Get_HandoutMaster: _Master; safecall;
    function Get_Slides: Slides; safecall;
    function Get_PageSetup: PageSetup; safecall;
    function Get_ColorSchemes: ColorSchemes; safecall;
    function Get_ExtraColors: ExtraColors; safecall;
    function Get_SlideShowSettings: SlideShowSettings; safecall;
    function Get_Fonts: Fonts; safecall;
    function Get_Windows: DocumentWindows; safecall;
    function Get_Tags: Tags; safecall;
    function Get_DefaultShape: Shape; safecall;
    function Get_BuiltInDocumentProperties: IDispatch; safecall;
    function Get_CustomDocumentProperties: IDispatch; safecall;
    function Get_VBProject: VBProject; safecall;
    function Get_ReadOnly: MsoTriState; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_Saved: MsoTriState; safecall;
    procedure Set_Saved(Saved: MsoTriState); safecall;
    function Get_LayoutDirection: PpDirection; safecall;
    procedure Set_LayoutDirection(LayoutDirection: PpDirection); safecall;
    function NewWindow: DocumentWindow; safecall;
    procedure FollowHyperlink(const Address: WideString; const SubAddress: WideString; 
                              NewWindow: WordBool; AddHistory: WordBool; 
                              const ExtraInfo: WideString; Method: MsoExtraInfoMethod; 
                              const HeaderInfo: WideString); safecall;
    procedure AddToFavorites; safecall;
    procedure Unused; safecall;
    function Get_PrintOptions: PrintOptions; safecall;
    procedure PrintOut(From: SYSINT; To_: SYSINT; const PrintToFile: WideString; Copies: SYSINT; 
                       Collate: MsoTriState); safecall;
    procedure Save; safecall;
    procedure SaveAs(const FileName: WideString; FileFormat: PpSaveAsFileType; 
                     EmbedTrueTypeFonts: MsoTriState); safecall;
    procedure SaveCopyAs(const FileName: WideString; FileFormat: PpSaveAsFileType; 
                         EmbedTrueTypeFonts: MsoTriState); safecall;
    procedure Export(const Path: WideString; const FilterName: WideString; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT); safecall;
    procedure Close; safecall;
    procedure SetUndoText(const Text: WideString); safecall;
    function Get_Container: IDispatch; safecall;
    function Get_DisplayComments: MsoTriState; safecall;
    procedure Set_DisplayComments(DisplayComments: MsoTriState); safecall;
    function Get_FarEastLineBreakLevel: PpFarEastLineBreakLevel; safecall;
    procedure Set_FarEastLineBreakLevel(FarEastLineBreakLevel: PpFarEastLineBreakLevel); safecall;
    function Get_NoLineBreakBefore: WideString; safecall;
    procedure Set_NoLineBreakBefore(const NoLineBreakBefore: WideString); safecall;
    function Get_NoLineBreakAfter: WideString; safecall;
    procedure Set_NoLineBreakAfter(const NoLineBreakAfter: WideString); safecall;
    procedure UpdateLinks; safecall;
    function Get_SlideShowWindow: SlideShowWindow; safecall;
    function Get_FarEastLineBreakLanguage: MsoFarEastLineBreakLanguageID; safecall;
    procedure Set_FarEastLineBreakLanguage(FarEastLineBreakLanguage: MsoFarEastLineBreakLanguageID); safecall;
    procedure WebPagePreview; safecall;
    function Get_DefaultLanguageID: MsoLanguageID; safecall;
    procedure Set_DefaultLanguageID(DefaultLanguageID: MsoLanguageID); safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_PublishObjects: PublishObjects; safecall;
    function Get_WebOptions: WebOptions; safecall;
    function Get_HTMLProject: HTMLProject; safecall;
    procedure ReloadAs(cp: MsoEncoding); safecall;
    procedure MakeIntoTemplate(IsDesignTemplate: MsoTriState); safecall;
    function Get_EnvelopeVisible: MsoTriState; safecall;
    procedure Set_EnvelopeVisible(EnvelopeVisible: MsoTriState); safecall;
    procedure sblt(const s: WideString); safecall;
    function Get_VBASigned: MsoTriState; safecall;
    function Get_SnapToGrid: MsoTriState; safecall;
    procedure Set_SnapToGrid(SnapToGrid: MsoTriState); safecall;
    function Get_GridDistance: Single; safecall;
    procedure Set_GridDistance(GridDistance: Single); safecall;
    function Get_Designs: Designs; safecall;
    procedure Merge(const Path: WideString); safecall;
    procedure CheckIn(SaveChanges: WordBool; Comments: OleVariant; MakePublic: OleVariant); safecall;
    function CanCheckIn: WordBool; safecall;
    function Get_Signatures: SignatureSet; safecall;
    function Get_RemovePersonalInformation: MsoTriState; safecall;
    procedure Set_RemovePersonalInformation(RemovePersonalInformation: MsoTriState); safecall;
    procedure SendForReview(const Recipients: WideString; const Subject: WideString; 
                            ShowMessage: WordBool; IncludeAttachment: OleVariant); safecall;
    procedure ReplyWithChanges(ShowMessage: WordBool); safecall;
    procedure EndReview; safecall;
    function Get_HasRevisionInfo: PpRevisionInfo; safecall;
    procedure AddBaseline(const FileName: WideString); safecall;
    procedure RemoveBaseline; safecall;
    function Get_PasswordEncryptionProvider: WideString; safecall;
    function Get_PasswordEncryptionAlgorithm: WideString; safecall;
    function Get_PasswordEncryptionKeyLength: SYSINT; safecall;
    function Get_PasswordEncryptionFileProperties: WordBool; safecall;
    procedure SetPasswordEncryptionOptions(const PasswordEncryptionProvider: WideString; 
                                           const PasswordEncryptionAlgorithm: WideString; 
                                           PasswordEncryptionKeyLength: SYSINT; 
                                           PasswordEncryptionFileProperties: WordBool); safecall;
    function Get_Password: WideString; safecall;
    procedure Set_Password(const Password: WideString); safecall;
    function Get_WritePassword: WideString; safecall;
    procedure Set_WritePassword(const WritePassword: WideString); safecall;
    function Get_Permission: Permission; safecall;
    function Get_SharedWorkspace: SharedWorkspace; safecall;
    function Get_Sync: Sync; safecall;
    procedure SendFaxOverInternet(const Recipients: WideString; const Subject: WideString; 
                                  ShowMessage: WordBool); safecall;
    function Get_DocumentLibraryVersions: DocumentLibraryVersions; safecall;
    function Get_ContentTypeProperties: MetaProperties; safecall;
    function Get_SectionCount: SYSINT; safecall;
    function Get_HasSections: WordBool; safecall;
    procedure NewSectionAfter(Index: SYSINT; AfterSlide: WordBool; const sectionTitle: WideString; 
                              out newSectionIndex: SYSINT); safecall;
    procedure DeleteSection(Index: SYSINT); safecall;
    procedure DisableSections; safecall;
    function sectionTitle(Index: SYSINT): WideString; safecall;
    procedure RemoveDocumentInformation(Type_: PpRemoveDocInfoType); safecall;
    procedure CheckInWithVersion(SaveChanges: WordBool; Comments: OleVariant; 
                                 MakePublic: OleVariant; VersionType: OleVariant); safecall;
    procedure ExportAsFixedFormat(const Path: WideString; FixedFormatType: PpFixedFormatType; 
                                  Intent: PpFixedFormatIntent; FrameSlides: MsoTriState; 
                                  HandoutOrder: PpPrintHandoutOrder; OutputType: PpPrintOutputType; 
                                  PrintHiddenSlides: MsoTriState; const PrintRange: PrintRange; 
                                  RangeType: PpPrintRangeType; const SlideShowName: WideString; 
                                  IncludeDocProperties: WordBool; KeepIRMSettings: WordBool; 
                                  DocStructureTags: WordBool; BitmapMissingFonts: WordBool; 
                                  UseISO19005_1: WordBool; ExternalExporter: OleVariant); safecall;
    function Get_ServerPolicy: ServerPolicy; safecall;
    function GetWorkflowTasks: WorkflowTasks; safecall;
    function GetWorkflowTemplates: WorkflowTemplates; safecall;
    procedure LockServerFile; safecall;
    function Get_DocumentInspectors: DocumentInspectors; safecall;
    function Get_HasVBProject: WordBool; safecall;
    function Get_CustomXMLParts: CustomXMLParts; safecall;
    function Get_Final: WordBool; safecall;
    procedure Set_Final(Final: WordBool); safecall;
    procedure ApplyTheme(const themeName: WideString); safecall;
    function Get_CustomerData: CustomerData; safecall;
    function Get_Research: Research; safecall;
    procedure PublishSlides(const SlideLibraryUrl: WideString; Overwrite: WordBool; 
                            UseSlideOrder: WordBool); safecall;
    function Get_EncryptionProvider: WideString; safecall;
    procedure Set_EncryptionProvider(const EncryptionProvider: WideString); safecall;
    procedure Convert; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property SlideMaster: _Master read Get_SlideMaster;
    property TitleMaster: _Master read Get_TitleMaster;
    property HasTitleMaster: MsoTriState read Get_HasTitleMaster;
    property TemplateName: WideString read Get_TemplateName;
    property NotesMaster: _Master read Get_NotesMaster;
    property HandoutMaster: _Master read Get_HandoutMaster;
    property Slides: Slides read Get_Slides;
    property PageSetup: PageSetup read Get_PageSetup;
    property ColorSchemes: ColorSchemes read Get_ColorSchemes;
    property ExtraColors: ExtraColors read Get_ExtraColors;
    property SlideShowSettings: SlideShowSettings read Get_SlideShowSettings;
    property Fonts: Fonts read Get_Fonts;
    property Windows: DocumentWindows read Get_Windows;
    property Tags: Tags read Get_Tags;
    property DefaultShape: Shape read Get_DefaultShape;
    property BuiltInDocumentProperties: IDispatch read Get_BuiltInDocumentProperties;
    property CustomDocumentProperties: IDispatch read Get_CustomDocumentProperties;
    property VBProject: VBProject read Get_VBProject;
    property ReadOnly: MsoTriState read Get_ReadOnly;
    property FullName: WideString read Get_FullName;
    property Name: WideString read Get_Name;
    property Path: WideString read Get_Path;
    property Saved: MsoTriState read Get_Saved write Set_Saved;
    property LayoutDirection: PpDirection read Get_LayoutDirection write Set_LayoutDirection;
    property PrintOptions: PrintOptions read Get_PrintOptions;
    property Container: IDispatch read Get_Container;
    property DisplayComments: MsoTriState read Get_DisplayComments write Set_DisplayComments;
    property FarEastLineBreakLevel: PpFarEastLineBreakLevel read Get_FarEastLineBreakLevel write Set_FarEastLineBreakLevel;
    property NoLineBreakBefore: WideString read Get_NoLineBreakBefore write Set_NoLineBreakBefore;
    property NoLineBreakAfter: WideString read Get_NoLineBreakAfter write Set_NoLineBreakAfter;
    property SlideShowWindow: SlideShowWindow read Get_SlideShowWindow;
    property FarEastLineBreakLanguage: MsoFarEastLineBreakLanguageID read Get_FarEastLineBreakLanguage write Set_FarEastLineBreakLanguage;
    property DefaultLanguageID: MsoLanguageID read Get_DefaultLanguageID write Set_DefaultLanguageID;
    property CommandBars: CommandBars read Get_CommandBars;
    property PublishObjects: PublishObjects read Get_PublishObjects;
    property WebOptions: WebOptions read Get_WebOptions;
    property HTMLProject: HTMLProject read Get_HTMLProject;
    property EnvelopeVisible: MsoTriState read Get_EnvelopeVisible write Set_EnvelopeVisible;
    property VBASigned: MsoTriState read Get_VBASigned;
    property SnapToGrid: MsoTriState read Get_SnapToGrid write Set_SnapToGrid;
    property GridDistance: Single read Get_GridDistance write Set_GridDistance;
    property Designs: Designs read Get_Designs;
    property Signatures: SignatureSet read Get_Signatures;
    property RemovePersonalInformation: MsoTriState read Get_RemovePersonalInformation write Set_RemovePersonalInformation;
    property HasRevisionInfo: PpRevisionInfo read Get_HasRevisionInfo;
    property PasswordEncryptionProvider: WideString read Get_PasswordEncryptionProvider;
    property PasswordEncryptionAlgorithm: WideString read Get_PasswordEncryptionAlgorithm;
    property PasswordEncryptionKeyLength: SYSINT read Get_PasswordEncryptionKeyLength;
    property PasswordEncryptionFileProperties: WordBool read Get_PasswordEncryptionFileProperties;
    property Password: WideString read Get_Password write Set_Password;
    property WritePassword: WideString read Get_WritePassword write Set_WritePassword;
    property Permission: Permission read Get_Permission;
    property SharedWorkspace: SharedWorkspace read Get_SharedWorkspace;
    property Sync: Sync read Get_Sync;
    property DocumentLibraryVersions: DocumentLibraryVersions read Get_DocumentLibraryVersions;
    property ContentTypeProperties: MetaProperties read Get_ContentTypeProperties;
    property SectionCount: SYSINT read Get_SectionCount;
    property HasSections: WordBool read Get_HasSections;
    property ServerPolicy: ServerPolicy read Get_ServerPolicy;
    property DocumentInspectors: DocumentInspectors read Get_DocumentInspectors;
    property HasVBProject: WordBool read Get_HasVBProject;
    property CustomXMLParts: CustomXMLParts read Get_CustomXMLParts;
    property Final: WordBool read Get_Final write Set_Final;
    property CustomerData: CustomerData read Get_CustomerData;
    property Research: Research read Get_Research;
    property EncryptionProvider: WideString read Get_EncryptionProvider write Set_EncryptionProvider;
  end;

// *********************************************************************//
// DispIntf:  _PresentationDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _PresentationDisp = dispinterface
    ['{9149349D-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property SlideMaster: _Master readonly dispid 2003;
    property TitleMaster: _Master readonly dispid 2004;
    property HasTitleMaster: MsoTriState readonly dispid 2005;
    function AddTitleMaster: _Master; dispid 2006;
    procedure ApplyTemplate(const FileName: WideString); dispid 2007;
    property TemplateName: WideString readonly dispid 2008;
    property NotesMaster: _Master readonly dispid 2009;
    property HandoutMaster: _Master readonly dispid 2010;
    property Slides: Slides readonly dispid 2011;
    property PageSetup: PageSetup readonly dispid 2012;
    property ColorSchemes: ColorSchemes readonly dispid 2013;
    property ExtraColors: ExtraColors readonly dispid 2014;
    property SlideShowSettings: SlideShowSettings readonly dispid 2015;
    property Fonts: Fonts readonly dispid 2016;
    property Windows: DocumentWindows readonly dispid 2017;
    property Tags: Tags readonly dispid 2018;
    property DefaultShape: Shape readonly dispid 2019;
    property BuiltInDocumentProperties: IDispatch readonly dispid 2020;
    property CustomDocumentProperties: IDispatch readonly dispid 2021;
    property VBProject: VBProject readonly dispid 2022;
    property ReadOnly: MsoTriState readonly dispid 2023;
    property FullName: WideString readonly dispid 2024;
    property Name: WideString readonly dispid 2025;
    property Path: WideString readonly dispid 2026;
    property Saved: MsoTriState dispid 2027;
    property LayoutDirection: PpDirection dispid 2028;
    function NewWindow: DocumentWindow; dispid 2029;
    procedure FollowHyperlink(const Address: WideString; const SubAddress: WideString; 
                              NewWindow: WordBool; AddHistory: WordBool; 
                              const ExtraInfo: WideString; Method: MsoExtraInfoMethod; 
                              const HeaderInfo: WideString); dispid 2030;
    procedure AddToFavorites; dispid 2031;
    procedure Unused; dispid 2032;
    property PrintOptions: PrintOptions readonly dispid 2033;
    procedure PrintOut(From: SYSINT; To_: SYSINT; const PrintToFile: WideString; Copies: SYSINT; 
                       Collate: MsoTriState); dispid 2034;
    procedure Save; dispid 2035;
    procedure SaveAs(const FileName: WideString; FileFormat: PpSaveAsFileType; 
                     EmbedTrueTypeFonts: MsoTriState); dispid 2036;
    procedure SaveCopyAs(const FileName: WideString; FileFormat: PpSaveAsFileType; 
                         EmbedTrueTypeFonts: MsoTriState); dispid 2037;
    procedure Export(const Path: WideString; const FilterName: WideString; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT); dispid 2038;
    procedure Close; dispid 2039;
    procedure SetUndoText(const Text: WideString); dispid 2040;
    property Container: IDispatch readonly dispid 2041;
    property DisplayComments: MsoTriState dispid 2042;
    property FarEastLineBreakLevel: PpFarEastLineBreakLevel dispid 2043;
    property NoLineBreakBefore: WideString dispid 2044;
    property NoLineBreakAfter: WideString dispid 2045;
    procedure UpdateLinks; dispid 2046;
    property SlideShowWindow: SlideShowWindow readonly dispid 2047;
    property FarEastLineBreakLanguage: MsoFarEastLineBreakLanguageID dispid 2048;
    procedure WebPagePreview; dispid 2049;
    property DefaultLanguageID: MsoLanguageID dispid 2050;
    property CommandBars: CommandBars readonly dispid 2051;
    property PublishObjects: PublishObjects readonly dispid 2052;
    property WebOptions: WebOptions readonly dispid 2053;
    property HTMLProject: HTMLProject readonly dispid 2054;
    procedure ReloadAs(cp: MsoEncoding); dispid 2055;
    procedure MakeIntoTemplate(IsDesignTemplate: MsoTriState); dispid 2056;
    property EnvelopeVisible: MsoTriState dispid 2057;
    procedure sblt(const s: WideString); dispid 2058;
    property VBASigned: MsoTriState readonly dispid 2059;
    property SnapToGrid: MsoTriState dispid 2061;
    property GridDistance: Single dispid 2062;
    property Designs: Designs readonly dispid 2063;
    procedure Merge(const Path: WideString); dispid 2064;
    procedure CheckIn(SaveChanges: WordBool; Comments: OleVariant; MakePublic: OleVariant); dispid 2065;
    function CanCheckIn: WordBool; dispid 2066;
    property Signatures: SignatureSet readonly dispid 2067;
    property RemovePersonalInformation: MsoTriState dispid 2068;
    procedure SendForReview(const Recipients: WideString; const Subject: WideString; 
                            ShowMessage: WordBool; IncludeAttachment: OleVariant); dispid 2069;
    procedure ReplyWithChanges(ShowMessage: WordBool); dispid 2070;
    procedure EndReview; dispid 2071;
    property HasRevisionInfo: PpRevisionInfo readonly dispid 2072;
    procedure AddBaseline(const FileName: WideString); dispid 2073;
    procedure RemoveBaseline; dispid 2074;
    property PasswordEncryptionProvider: WideString readonly dispid 2075;
    property PasswordEncryptionAlgorithm: WideString readonly dispid 2076;
    property PasswordEncryptionKeyLength: SYSINT readonly dispid 2077;
    property PasswordEncryptionFileProperties: WordBool readonly dispid 2078;
    procedure SetPasswordEncryptionOptions(const PasswordEncryptionProvider: WideString; 
                                           const PasswordEncryptionAlgorithm: WideString; 
                                           PasswordEncryptionKeyLength: SYSINT; 
                                           PasswordEncryptionFileProperties: WordBool); dispid 2079;
    property Password: WideString dispid 2080;
    property WritePassword: WideString dispid 2081;
    property Permission: Permission readonly dispid 2082;
    property SharedWorkspace: SharedWorkspace readonly dispid 2083;
    property Sync: Sync readonly dispid 2084;
    procedure SendFaxOverInternet(const Recipients: WideString; const Subject: WideString; 
                                  ShowMessage: WordBool); dispid 2085;
    property DocumentLibraryVersions: DocumentLibraryVersions readonly dispid 2086;
    property ContentTypeProperties: MetaProperties readonly dispid 2087;
    property SectionCount: SYSINT readonly dispid 2088;
    property HasSections: WordBool readonly dispid 2089;
    procedure NewSectionAfter(Index: SYSINT; AfterSlide: WordBool; const sectionTitle: WideString; 
                              out newSectionIndex: SYSINT); dispid 2090;
    procedure DeleteSection(Index: SYSINT); dispid 2091;
    procedure DisableSections; dispid 2092;
    function sectionTitle(Index: SYSINT): WideString; dispid 2093;
    procedure RemoveDocumentInformation(Type_: PpRemoveDocInfoType); dispid 2094;
    procedure CheckInWithVersion(SaveChanges: WordBool; Comments: OleVariant; 
                                 MakePublic: OleVariant; VersionType: OleVariant); dispid 2095;
    procedure ExportAsFixedFormat(const Path: WideString; FixedFormatType: PpFixedFormatType; 
                                  Intent: PpFixedFormatIntent; FrameSlides: MsoTriState; 
                                  HandoutOrder: PpPrintHandoutOrder; OutputType: PpPrintOutputType; 
                                  PrintHiddenSlides: MsoTriState; const PrintRange: PrintRange; 
                                  RangeType: PpPrintRangeType; const SlideShowName: WideString; 
                                  IncludeDocProperties: WordBool; KeepIRMSettings: WordBool; 
                                  DocStructureTags: WordBool; BitmapMissingFonts: WordBool; 
                                  UseISO19005_1: WordBool; ExternalExporter: OleVariant); dispid 2096;
    property ServerPolicy: ServerPolicy readonly dispid 2097;
    function GetWorkflowTasks: WorkflowTasks; dispid 2098;
    function GetWorkflowTemplates: WorkflowTemplates; dispid 2099;
    procedure LockServerFile; dispid 2100;
    property DocumentInspectors: DocumentInspectors readonly dispid 2101;
    property HasVBProject: WordBool readonly dispid 2102;
    property CustomXMLParts: CustomXMLParts readonly dispid 2103;
    property Final: WordBool dispid 2104;
    procedure ApplyTheme(const themeName: WideString); dispid 2105;
    property CustomerData: CustomerData readonly dispid 2106;
    property Research: Research readonly dispid 2107;
    procedure PublishSlides(const SlideLibraryUrl: WideString; Overwrite: WordBool; 
                            UseSlideOrder: WordBool); dispid 2108;
    property EncryptionProvider: WideString dispid 2109;
    procedure Convert; dispid 2110;
  end;

// *********************************************************************//
// Interface: Hyperlinks
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493464-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Hyperlinks = interface(Collection)
    ['{91493464-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Hyperlink; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  HyperlinksDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493464-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  HyperlinksDisp = dispinterface
    ['{91493464-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Hyperlink; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Hyperlink
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493465-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Hyperlink = interface(IDispatch)
    ['{91493465-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_type_: MsoHyperlinkType; safecall;
    function Get_Address: WideString; safecall;
    procedure Set_Address(const Address: WideString); safecall;
    function Get_SubAddress: WideString; safecall;
    procedure Set_SubAddress(const SubAddress: WideString); safecall;
    procedure AddToFavorites; safecall;
    function Get_EmailSubject: WideString; safecall;
    procedure Set_EmailSubject(const EmailSubject: WideString); safecall;
    function Get_ScreenTip: WideString; safecall;
    procedure Set_ScreenTip(const ScreenTip: WideString); safecall;
    function Get_TextToDisplay: WideString; safecall;
    procedure Set_TextToDisplay(const TextToDisplay: WideString); safecall;
    function Get_ShowAndReturn: MsoTriState; safecall;
    procedure Set_ShowAndReturn(ShowAndReturn: MsoTriState); safecall;
    procedure Follow; safecall;
    procedure CreateNewDocument(const FileName: WideString; EditNow: MsoTriState; 
                                Overwrite: MsoTriState); safecall;
    procedure Delete; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: MsoHyperlinkType read Get_type_;
    property Address: WideString read Get_Address write Set_Address;
    property SubAddress: WideString read Get_SubAddress write Set_SubAddress;
    property EmailSubject: WideString read Get_EmailSubject write Set_EmailSubject;
    property ScreenTip: WideString read Get_ScreenTip write Set_ScreenTip;
    property TextToDisplay: WideString read Get_TextToDisplay write Set_TextToDisplay;
    property ShowAndReturn: MsoTriState read Get_ShowAndReturn write Set_ShowAndReturn;
  end;

// *********************************************************************//
// DispIntf:  HyperlinkDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493465-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  HyperlinkDisp = dispinterface
    ['{91493465-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property type_: MsoHyperlinkType readonly dispid 2003;
    property Address: WideString dispid 2004;
    property SubAddress: WideString dispid 2005;
    procedure AddToFavorites; dispid 2006;
    property EmailSubject: WideString dispid 2007;
    property ScreenTip: WideString dispid 2008;
    property TextToDisplay: WideString dispid 2009;
    property ShowAndReturn: MsoTriState dispid 2010;
    procedure Follow; dispid 2011;
    procedure CreateNewDocument(const FileName: WideString; EditNow: MsoTriState; 
                                Overwrite: MsoTriState); dispid 2012;
    procedure Delete; dispid 2013;
  end;

// *********************************************************************//
// Interface: PageSetup
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493466-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PageSetup = interface(IDispatch)
    ['{91493466-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_FirstSlideNumber: SYSINT; safecall;
    procedure Set_FirstSlideNumber(FirstSlideNumber: SYSINT); safecall;
    function Get_SlideHeight: Single; safecall;
    procedure Set_SlideHeight(SlideHeight: Single); safecall;
    function Get_SlideWidth: Single; safecall;
    procedure Set_SlideWidth(SlideWidth: Single); safecall;
    function Get_SlideSize: PpSlideSizeType; safecall;
    procedure Set_SlideSize(SlideSize: PpSlideSizeType); safecall;
    function Get_NotesOrientation: MsoOrientation; safecall;
    procedure Set_NotesOrientation(NotesOrientation: MsoOrientation); safecall;
    function Get_SlideOrientation: MsoOrientation; safecall;
    procedure Set_SlideOrientation(SlideOrientation: MsoOrientation); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property FirstSlideNumber: SYSINT read Get_FirstSlideNumber write Set_FirstSlideNumber;
    property SlideHeight: Single read Get_SlideHeight write Set_SlideHeight;
    property SlideWidth: Single read Get_SlideWidth write Set_SlideWidth;
    property SlideSize: PpSlideSizeType read Get_SlideSize write Set_SlideSize;
    property NotesOrientation: MsoOrientation read Get_NotesOrientation write Set_NotesOrientation;
    property SlideOrientation: MsoOrientation read Get_SlideOrientation write Set_SlideOrientation;
  end;

// *********************************************************************//
// DispIntf:  PageSetupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493466-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PageSetupDisp = dispinterface
    ['{91493466-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property FirstSlideNumber: SYSINT dispid 2003;
    property SlideHeight: Single dispid 2004;
    property SlideWidth: Single dispid 2005;
    property SlideSize: PpSlideSizeType dispid 2006;
    property NotesOrientation: MsoOrientation dispid 2007;
    property SlideOrientation: MsoOrientation dispid 2008;
  end;

// *********************************************************************//
// Interface: Fonts
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493467-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Fonts = interface(Collection)
    ['{91493467-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: OleVariant): Font; safecall;
    procedure Replace(const Original: WideString; const Replacement: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  FontsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493467-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FontsDisp = dispinterface
    ['{91493467-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: OleVariant): Font; dispid 0;
    procedure Replace(const Original: WideString; const Replacement: WideString); dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: ExtraColors
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493468-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ExtraColors = interface(Collection)
    ['{91493468-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): MsoRGBType; safecall;
    procedure Add(Type_: MsoRGBType); safecall;
    procedure Clear; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ExtraColorsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493468-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ExtraColorsDisp = dispinterface
    ['{91493468-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): MsoRGBType; dispid 0;
    procedure Add(Type_: MsoRGBType); dispid 2003;
    procedure Clear; dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Slides
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493469-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Slides = interface(Collection)
    ['{91493469-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: OleVariant): PowerPointSlide; safecall;
    function FindBySlideID(SlideID: Integer): PowerPointSlide; safecall;
    function Add(Index: SYSINT; Layout: PpSlideLayout): PowerPointSlide; safecall;
    function InsertFromFile(const FileName: WideString; Index: SYSINT; SlideStart: SYSINT; 
                            SlideEnd: SYSINT): SYSINT; safecall;
    function Range(Index: OleVariant): SlideRange; safecall;
    function Paste(Index: SYSINT): SlideRange; safecall;
    function AddSlide(Index: SYSINT; const pCustomLayout: CustomLayout): PowerPointSlide; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  SlidesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493469-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlidesDisp = dispinterface
    ['{91493469-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: OleVariant): PowerPointSlide; dispid 0;
    function FindBySlideID(SlideID: Integer): PowerPointSlide; dispid 2003;
    function Add(Index: SYSINT; Layout: PpSlideLayout): PowerPointSlide; dispid 2004;
    function InsertFromFile(const FileName: WideString; Index: SYSINT; SlideStart: SYSINT; 
                            SlideEnd: SYSINT): SYSINT; dispid 2005;
    function Range(Index: OleVariant): SlideRange; dispid 2006;
    function Paste(Index: SYSINT): SlideRange; dispid 2007;
    function AddSlide(Index: SYSINT; const pCustomLayout: CustomLayout): PowerPointSlide; dispid 2008;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: _Slide
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _Slide = interface(IDispatch)
    ['{9149346A-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Shapes: Shapes; safecall;
    function Get_HeadersFooters: HeadersFooters; safecall;
    function Get_SlideShowTransition: SlideShowTransition; safecall;
    function Get_ColorScheme: ColorScheme; safecall;
    procedure Set_ColorScheme(const ColorScheme: ColorScheme); safecall;
    function Get_Background: ShapeRange; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_SlideID: Integer; safecall;
    function Get_PrintSteps: SYSINT; safecall;
    procedure Select; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    function Get_Layout: PpSlideLayout; safecall;
    procedure Set_Layout(Layout: PpSlideLayout); safecall;
    function Duplicate: SlideRange; safecall;
    procedure Delete; safecall;
    function Get_Tags: Tags; safecall;
    function Get_SlideIndex: SYSINT; safecall;
    function Get_SlideNumber: SYSINT; safecall;
    function Get_DisplayMasterShapes: MsoTriState; safecall;
    procedure Set_DisplayMasterShapes(DisplayMasterShapes: MsoTriState); safecall;
    function Get_FollowMasterBackground: MsoTriState; safecall;
    procedure Set_FollowMasterBackground(FollowMasterBackground: MsoTriState); safecall;
    function Get_NotesPage: SlideRange; safecall;
    function Get_Master: _Master; safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    procedure Export(const FileName: WideString; const FilterName: WideString; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT); safecall;
    function Get_Scripts: Scripts; safecall;
    function Get_Comments: Comments; safecall;
    function Get_Design: Design; safecall;
    procedure Set_Design(const Design: Design); safecall;
    procedure MoveTo(toPos: SYSINT); safecall;
    function Get_TimeLine: TimeLine; safecall;
    procedure ApplyTemplate(const FileName: WideString); safecall;
    function Get_SectionNumber: SYSINT; safecall;
    function Get_CustomLayout: CustomLayout; safecall;
    procedure Set_CustomLayout(const CustomLayout: CustomLayout); safecall;
    procedure ApplyTheme(const themeName: WideString); safecall;
    function Get_ThemeColorScheme: ThemeColorScheme; safecall;
    procedure ApplyThemeColorScheme(const themeColorSchemeName: WideString); safecall;
    function Get_BackgroundStyle: MsoBackgroundStyleIndex; safecall;
    procedure Set_BackgroundStyle(BackgroundStyle: MsoBackgroundStyleIndex); safecall;
    function Get_CustomerData: CustomerData; safecall;
    procedure PublishSlides(const SlideLibraryUrl: WideString; Overwrite: WordBool; 
                            UseSlideOrder: WordBool); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Shapes: Shapes read Get_Shapes;
    property HeadersFooters: HeadersFooters read Get_HeadersFooters;
    property SlideShowTransition: SlideShowTransition read Get_SlideShowTransition;
    property ColorScheme: ColorScheme read Get_ColorScheme write Set_ColorScheme;
    property Background: ShapeRange read Get_Background;
    property Name: WideString read Get_Name write Set_Name;
    property SlideID: Integer read Get_SlideID;
    property PrintSteps: SYSINT read Get_PrintSteps;
    property Layout: PpSlideLayout read Get_Layout write Set_Layout;
    property Tags: Tags read Get_Tags;
    property SlideIndex: SYSINT read Get_SlideIndex;
    property SlideNumber: SYSINT read Get_SlideNumber;
    property DisplayMasterShapes: MsoTriState read Get_DisplayMasterShapes write Set_DisplayMasterShapes;
    property FollowMasterBackground: MsoTriState read Get_FollowMasterBackground write Set_FollowMasterBackground;
    property NotesPage: SlideRange read Get_NotesPage;
    property Master: _Master read Get_Master;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property Scripts: Scripts read Get_Scripts;
    property Comments: Comments read Get_Comments;
    property Design: Design read Get_Design write Set_Design;
    property TimeLine: TimeLine read Get_TimeLine;
    property SectionNumber: SYSINT read Get_SectionNumber;
    property CustomLayout: CustomLayout read Get_CustomLayout write Set_CustomLayout;
    property ThemeColorScheme: ThemeColorScheme read Get_ThemeColorScheme;
    property BackgroundStyle: MsoBackgroundStyleIndex read Get_BackgroundStyle write Set_BackgroundStyle;
    property CustomerData: CustomerData read Get_CustomerData;
  end;

// *********************************************************************//
// DispIntf:  _SlideDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _SlideDisp = dispinterface
    ['{9149346A-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Shapes: Shapes readonly dispid 2003;
    property HeadersFooters: HeadersFooters readonly dispid 2004;
    property SlideShowTransition: SlideShowTransition readonly dispid 2005;
    property ColorScheme: ColorScheme dispid 2006;
    property Background: ShapeRange readonly dispid 2007;
    property Name: WideString dispid 2008;
    property SlideID: Integer readonly dispid 2009;
    property PrintSteps: SYSINT readonly dispid 2010;
    procedure Select; dispid 2011;
    procedure Cut; dispid 2012;
    procedure Copy; dispid 2013;
    property Layout: PpSlideLayout dispid 2014;
    function Duplicate: SlideRange; dispid 2015;
    procedure Delete; dispid 2016;
    property Tags: Tags readonly dispid 2017;
    property SlideIndex: SYSINT readonly dispid 2018;
    property SlideNumber: SYSINT readonly dispid 2019;
    property DisplayMasterShapes: MsoTriState dispid 2020;
    property FollowMasterBackground: MsoTriState dispid 2021;
    property NotesPage: SlideRange readonly dispid 2022;
    property Master: _Master readonly dispid 2023;
    property Hyperlinks: Hyperlinks readonly dispid 2024;
    procedure Export(const FileName: WideString; const FilterName: WideString; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT); dispid 2025;
    property Scripts: Scripts readonly dispid 2026;
    property Comments: Comments readonly dispid 2028;
    property Design: Design dispid 2029;
    procedure MoveTo(toPos: SYSINT); dispid 2030;
    property TimeLine: TimeLine readonly dispid 2031;
    procedure ApplyTemplate(const FileName: WideString); dispid 2032;
    property SectionNumber: SYSINT readonly dispid 2033;
    property CustomLayout: CustomLayout dispid 2034;
    procedure ApplyTheme(const themeName: WideString); dispid 2035;
    property ThemeColorScheme: ThemeColorScheme readonly dispid 2036;
    procedure ApplyThemeColorScheme(const themeColorSchemeName: WideString); dispid 2037;
    property BackgroundStyle: MsoBackgroundStyleIndex dispid 2038;
    property CustomerData: CustomerData readonly dispid 2039;
    procedure PublishSlides(const SlideLibraryUrl: WideString; Overwrite: WordBool; 
                            UseSlideOrder: WordBool); dispid 2040;
  end;

// *********************************************************************//
// Interface: SlideRange
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideRange = interface(IDispatch)
    ['{9149346B-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Shapes: Shapes; safecall;
    function Get_HeadersFooters: HeadersFooters; safecall;
    function Get_SlideShowTransition: SlideShowTransition; safecall;
    function Get_ColorScheme: ColorScheme; safecall;
    procedure Set_ColorScheme(const ColorScheme: ColorScheme); safecall;
    function Get_Background: ShapeRange; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_SlideID: Integer; safecall;
    function Get_PrintSteps: SYSINT; safecall;
    procedure Select; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    function Get_Layout: PpSlideLayout; safecall;
    procedure Set_Layout(Layout: PpSlideLayout); safecall;
    function Duplicate: SlideRange; safecall;
    procedure Delete; safecall;
    function Get_Tags: Tags; safecall;
    function Get_SlideIndex: SYSINT; safecall;
    function Get_SlideNumber: SYSINT; safecall;
    function Get_DisplayMasterShapes: MsoTriState; safecall;
    procedure Set_DisplayMasterShapes(DisplayMasterShapes: MsoTriState); safecall;
    function Get_FollowMasterBackground: MsoTriState; safecall;
    procedure Set_FollowMasterBackground(FollowMasterBackground: MsoTriState); safecall;
    function Get_NotesPage: SlideRange; safecall;
    function Get_Master: _Master; safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    procedure Export(const FileName: WideString; const FilterName: WideString; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT); safecall;
    function Item(Index: OleVariant): PowerPointSlide; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function _Index(Index: SYSINT): OleVariant; safecall;
    function Get_Count: Integer; safecall;
    function Get_Scripts: Scripts; safecall;
    function Get_Comments: Comments; safecall;
    function Get_Design: Design; safecall;
    procedure Set_Design(const Design: Design); safecall;
    procedure MoveTo(toPos: SYSINT); safecall;
    function Get_TimeLine: TimeLine; safecall;
    procedure ApplyTemplate(const FileName: WideString); safecall;
    function Get_SectionNumber: SYSINT; safecall;
    function Get_CustomLayout: CustomLayout; safecall;
    procedure Set_CustomLayout(const CustomLayout: CustomLayout); safecall;
    procedure ApplyTheme(const themeName: WideString); safecall;
    function Get_ThemeColorScheme: ThemeColorScheme; safecall;
    procedure ApplyThemeColorScheme(const themeColorSchemeName: WideString); safecall;
    function Get_BackgroundStyle: MsoBackgroundStyleIndex; safecall;
    procedure Set_BackgroundStyle(BackgroundStyle: MsoBackgroundStyleIndex); safecall;
    function Get_CustomerData: CustomerData; safecall;
    procedure PublishSlides(const SlideLibraryUrl: WideString; Overwrite: WordBool; 
                            UseSlideOrder: WordBool); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Shapes: Shapes read Get_Shapes;
    property HeadersFooters: HeadersFooters read Get_HeadersFooters;
    property SlideShowTransition: SlideShowTransition read Get_SlideShowTransition;
    property ColorScheme: ColorScheme read Get_ColorScheme write Set_ColorScheme;
    property Background: ShapeRange read Get_Background;
    property Name: WideString read Get_Name write Set_Name;
    property SlideID: Integer read Get_SlideID;
    property PrintSteps: SYSINT read Get_PrintSteps;
    property Layout: PpSlideLayout read Get_Layout write Set_Layout;
    property Tags: Tags read Get_Tags;
    property SlideIndex: SYSINT read Get_SlideIndex;
    property SlideNumber: SYSINT read Get_SlideNumber;
    property DisplayMasterShapes: MsoTriState read Get_DisplayMasterShapes write Set_DisplayMasterShapes;
    property FollowMasterBackground: MsoTriState read Get_FollowMasterBackground write Set_FollowMasterBackground;
    property NotesPage: SlideRange read Get_NotesPage;
    property Master: _Master read Get_Master;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Scripts: Scripts read Get_Scripts;
    property Comments: Comments read Get_Comments;
    property Design: Design read Get_Design write Set_Design;
    property TimeLine: TimeLine read Get_TimeLine;
    property SectionNumber: SYSINT read Get_SectionNumber;
    property CustomLayout: CustomLayout read Get_CustomLayout write Set_CustomLayout;
    property ThemeColorScheme: ThemeColorScheme read Get_ThemeColorScheme;
    property BackgroundStyle: MsoBackgroundStyleIndex read Get_BackgroundStyle write Set_BackgroundStyle;
    property CustomerData: CustomerData read Get_CustomerData;
  end;

// *********************************************************************//
// DispIntf:  SlideRangeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideRangeDisp = dispinterface
    ['{9149346B-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Shapes: Shapes readonly dispid 2003;
    property HeadersFooters: HeadersFooters readonly dispid 2004;
    property SlideShowTransition: SlideShowTransition readonly dispid 2005;
    property ColorScheme: ColorScheme dispid 2006;
    property Background: ShapeRange readonly dispid 2007;
    property Name: WideString dispid 2008;
    property SlideID: Integer readonly dispid 2009;
    property PrintSteps: SYSINT readonly dispid 2010;
    procedure Select; dispid 2011;
    procedure Cut; dispid 2012;
    procedure Copy; dispid 2013;
    property Layout: PpSlideLayout dispid 2014;
    function Duplicate: SlideRange; dispid 2015;
    procedure Delete; dispid 2016;
    property Tags: Tags readonly dispid 2017;
    property SlideIndex: SYSINT readonly dispid 2018;
    property SlideNumber: SYSINT readonly dispid 2019;
    property DisplayMasterShapes: MsoTriState dispid 2020;
    property FollowMasterBackground: MsoTriState dispid 2021;
    property NotesPage: SlideRange readonly dispid 2022;
    property Master: _Master readonly dispid 2023;
    property Hyperlinks: Hyperlinks readonly dispid 2024;
    procedure Export(const FileName: WideString; const FilterName: WideString; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT); dispid 2025;
    function Item(Index: OleVariant): PowerPointSlide; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
    property Scripts: Scripts readonly dispid 2026;
    property Comments: Comments readonly dispid 2028;
    property Design: Design dispid 2029;
    procedure MoveTo(toPos: SYSINT); dispid 2030;
    property TimeLine: TimeLine readonly dispid 2031;
    procedure ApplyTemplate(const FileName: WideString); dispid 2032;
    property SectionNumber: SYSINT readonly dispid 2033;
    property CustomLayout: CustomLayout dispid 2034;
    procedure ApplyTheme(const themeName: WideString); dispid 2035;
    property ThemeColorScheme: ThemeColorScheme readonly dispid 2036;
    procedure ApplyThemeColorScheme(const themeColorSchemeName: WideString); dispid 2037;
    property BackgroundStyle: MsoBackgroundStyleIndex dispid 2038;
    property CustomerData: CustomerData readonly dispid 2039;
    procedure PublishSlides(const SlideLibraryUrl: WideString; Overwrite: WordBool; 
                            UseSlideOrder: WordBool); dispid 2040;
  end;

// *********************************************************************//
// Interface: _Master
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _Master = interface(IDispatch)
    ['{9149346C-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Shapes: Shapes; safecall;
    function Get_HeadersFooters: HeadersFooters; safecall;
    function Get_ColorScheme: ColorScheme; safecall;
    procedure Set_ColorScheme(const ColorScheme: ColorScheme); safecall;
    function Get_Background: ShapeRange; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    procedure Delete; safecall;
    function Get_Height: Single; safecall;
    function Get_Width: Single; safecall;
    function Get_TextStyles: TextStyles; safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    function Get_Scripts: Scripts; safecall;
    function Get_Design: Design; safecall;
    function Get_TimeLine: TimeLine; safecall;
    function Get_SlideShowTransition: SlideShowTransition; safecall;
    function Get_CustomLayouts: CustomLayouts; safecall;
    function Get_Theme: OfficeTheme; safecall;
    procedure ApplyTheme(const themeName: WideString); safecall;
    function Get_BackgroundStyle: MsoBackgroundStyleIndex; safecall;
    procedure Set_BackgroundStyle(BackgroundStyle: MsoBackgroundStyleIndex); safecall;
    function Get_CustomerData: CustomerData; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Shapes: Shapes read Get_Shapes;
    property HeadersFooters: HeadersFooters read Get_HeadersFooters;
    property ColorScheme: ColorScheme read Get_ColorScheme write Set_ColorScheme;
    property Background: ShapeRange read Get_Background;
    property Name: WideString read Get_Name write Set_Name;
    property Height: Single read Get_Height;
    property Width: Single read Get_Width;
    property TextStyles: TextStyles read Get_TextStyles;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property Scripts: Scripts read Get_Scripts;
    property Design: Design read Get_Design;
    property TimeLine: TimeLine read Get_TimeLine;
    property SlideShowTransition: SlideShowTransition read Get_SlideShowTransition;
    property CustomLayouts: CustomLayouts read Get_CustomLayouts;
    property Theme: OfficeTheme read Get_Theme;
    property BackgroundStyle: MsoBackgroundStyleIndex read Get_BackgroundStyle write Set_BackgroundStyle;
    property CustomerData: CustomerData read Get_CustomerData;
  end;

// *********************************************************************//
// DispIntf:  _MasterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _MasterDisp = dispinterface
    ['{9149346C-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Shapes: Shapes readonly dispid 2003;
    property HeadersFooters: HeadersFooters readonly dispid 2004;
    property ColorScheme: ColorScheme dispid 2005;
    property Background: ShapeRange readonly dispid 2006;
    property Name: WideString dispid 2007;
    procedure Delete; dispid 2008;
    property Height: Single readonly dispid 2009;
    property Width: Single readonly dispid 2010;
    property TextStyles: TextStyles readonly dispid 2011;
    property Hyperlinks: Hyperlinks readonly dispid 2012;
    property Scripts: Scripts readonly dispid 2013;
    property Design: Design readonly dispid 2014;
    property TimeLine: TimeLine readonly dispid 2015;
    property SlideShowTransition: SlideShowTransition readonly dispid 2016;
    property CustomLayouts: CustomLayouts readonly dispid 2017;
    property Theme: OfficeTheme readonly dispid 2018;
    procedure ApplyTheme(const themeName: WideString); dispid 2019;
    property BackgroundStyle: MsoBackgroundStyleIndex dispid 2020;
    property CustomerData: CustomerData readonly dispid 2021;
  end;

// *********************************************************************//
// Interface: SldEvents
// Flags:     (16) Hidden
// GUID:      {9149346D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SldEvents = interface(IUnknown)
    ['{9149346D-5A91-11CF-8700-00AA0060263B}']
  end;

// *********************************************************************//
// Interface: ColorSchemes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorSchemes = interface(Collection)
    ['{9149346E-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): ColorScheme; safecall;
    function Add(const Scheme: ColorScheme): ColorScheme; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ColorSchemesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorSchemesDisp = dispinterface
    ['{9149346E-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): ColorScheme; dispid 0;
    function Add(const Scheme: ColorScheme): ColorScheme; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: ColorScheme
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorScheme = interface(Collection)
    ['{9149346F-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Colors(SchemeColor: PpColorSchemeIndex): RGBColor; safecall;
    procedure Delete; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ColorSchemeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149346F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorSchemeDisp = dispinterface
    ['{9149346F-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Colors(SchemeColor: PpColorSchemeIndex): RGBColor; dispid 0;
    procedure Delete; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: RGBColor
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493470-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RGBColor = interface(IDispatch)
    ['{91493470-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_RGB: MsoRGBType; safecall;
    procedure Set_RGB(RGB: MsoRGBType); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property RGB: MsoRGBType read Get_RGB write Set_RGB;
  end;

// *********************************************************************//
// DispIntf:  RGBColorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493470-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RGBColorDisp = dispinterface
    ['{91493470-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property RGB: MsoRGBType dispid 0;
  end;

// *********************************************************************//
// Interface: SlideShowTransition
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493471-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowTransition = interface(IDispatch)
    ['{91493471-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_AdvanceOnClick: MsoTriState; safecall;
    procedure Set_AdvanceOnClick(AdvanceOnClick: MsoTriState); safecall;
    function Get_AdvanceOnTime: MsoTriState; safecall;
    procedure Set_AdvanceOnTime(AdvanceOnTime: MsoTriState); safecall;
    function Get_AdvanceTime: Single; safecall;
    procedure Set_AdvanceTime(AdvanceTime: Single); safecall;
    function Get_EntryEffect: PpEntryEffect; safecall;
    procedure Set_EntryEffect(EntryEffect: PpEntryEffect); safecall;
    function Get_Hidden: MsoTriState; safecall;
    procedure Set_Hidden(Hidden: MsoTriState); safecall;
    function Get_LoopSoundUntilNext: MsoTriState; safecall;
    procedure Set_LoopSoundUntilNext(LoopSoundUntilNext: MsoTriState); safecall;
    function Get_SoundEffect: SoundEffect; safecall;
    function Get_Speed: PpTransitionSpeed; safecall;
    procedure Set_Speed(Speed: PpTransitionSpeed); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property AdvanceOnClick: MsoTriState read Get_AdvanceOnClick write Set_AdvanceOnClick;
    property AdvanceOnTime: MsoTriState read Get_AdvanceOnTime write Set_AdvanceOnTime;
    property AdvanceTime: Single read Get_AdvanceTime write Set_AdvanceTime;
    property EntryEffect: PpEntryEffect read Get_EntryEffect write Set_EntryEffect;
    property Hidden: MsoTriState read Get_Hidden write Set_Hidden;
    property LoopSoundUntilNext: MsoTriState read Get_LoopSoundUntilNext write Set_LoopSoundUntilNext;
    property SoundEffect: SoundEffect read Get_SoundEffect;
    property Speed: PpTransitionSpeed read Get_Speed write Set_Speed;
  end;

// *********************************************************************//
// DispIntf:  SlideShowTransitionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493471-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SlideShowTransitionDisp = dispinterface
    ['{91493471-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property AdvanceOnClick: MsoTriState dispid 2003;
    property AdvanceOnTime: MsoTriState dispid 2004;
    property AdvanceTime: Single dispid 2005;
    property EntryEffect: PpEntryEffect dispid 2006;
    property Hidden: MsoTriState dispid 2007;
    property LoopSoundUntilNext: MsoTriState dispid 2008;
    property SoundEffect: SoundEffect readonly dispid 2009;
    property Speed: PpTransitionSpeed dispid 2010;
  end;

// *********************************************************************//
// Interface: SoundEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493472-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SoundEffect = interface(IDispatch)
    ['{91493472-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_type_: PpSoundEffectType; safecall;
    procedure Set_type_(Type_: PpSoundEffectType); safecall;
    procedure ImportFromFile(const FileName: WideString); safecall;
    procedure Play; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name write Set_Name;
    property type_: PpSoundEffectType read Get_type_ write Set_type_;
  end;

// *********************************************************************//
// DispIntf:  SoundEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493472-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SoundEffectDisp = dispinterface
    ['{91493472-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Name: WideString dispid 2003;
    property type_: PpSoundEffectType dispid 2004;
    procedure ImportFromFile(const FileName: WideString); dispid 2005;
    procedure Play; dispid 2006;
  end;

// *********************************************************************//
// Interface: SoundFormat
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493473-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SoundFormat = interface(IDispatch)
    ['{91493473-5A91-11CF-8700-00AA0060263B}']
    procedure Play; safecall;
    procedure Import(const FileName: WideString); safecall;
    function Export(const FileName: WideString): PpSoundFormatType; safecall;
    function Get_type_: PpSoundFormatType; safecall;
    function Get_SourceFullName: WideString; safecall;
    property type_: PpSoundFormatType read Get_type_;
    property SourceFullName: WideString read Get_SourceFullName;
  end;

// *********************************************************************//
// DispIntf:  SoundFormatDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493473-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SoundFormatDisp = dispinterface
    ['{91493473-5A91-11CF-8700-00AA0060263B}']
    procedure Play; dispid 2000;
    procedure Import(const FileName: WideString); dispid 2001;
    function Export(const FileName: WideString): PpSoundFormatType; dispid 2002;
    property type_: PpSoundFormatType readonly dispid 2003;
    property SourceFullName: WideString readonly dispid 2004;
  end;

// *********************************************************************//
// Interface: HeadersFooters
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493474-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  HeadersFooters = interface(IDispatch)
    ['{91493474-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_DateAndTime: HeaderFooter; safecall;
    function Get_SlideNumber: HeaderFooter; safecall;
    function Get_Header: HeaderFooter; safecall;
    function Get_Footer: HeaderFooter; safecall;
    function Get_DisplayOnTitleSlide: MsoTriState; safecall;
    procedure Set_DisplayOnTitleSlide(DisplayOnTitleSlide: MsoTriState); safecall;
    procedure Clear; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property DateAndTime: HeaderFooter read Get_DateAndTime;
    property SlideNumber: HeaderFooter read Get_SlideNumber;
    property Header: HeaderFooter read Get_Header;
    property Footer: HeaderFooter read Get_Footer;
    property DisplayOnTitleSlide: MsoTriState read Get_DisplayOnTitleSlide write Set_DisplayOnTitleSlide;
  end;

// *********************************************************************//
// DispIntf:  HeadersFootersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493474-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  HeadersFootersDisp = dispinterface
    ['{91493474-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property DateAndTime: HeaderFooter readonly dispid 2003;
    property SlideNumber: HeaderFooter readonly dispid 2004;
    property Header: HeaderFooter readonly dispid 2005;
    property Footer: HeaderFooter readonly dispid 2006;
    property DisplayOnTitleSlide: MsoTriState dispid 2007;
    procedure Clear; dispid 2008;
  end;

// *********************************************************************//
// Interface: Shapes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493475-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Shapes = interface(IDispatch)
    ['{91493475-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    function Item(Index: OleVariant): Shape; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function AddCallout(Type_: MsoCalloutType; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function AddConnector(Type_: MsoConnectorType; BeginX: Single; BeginY: Single; EndX: Single; 
                          EndY: Single): Shape; safecall;
    function AddCurve(SafeArrayOfPoints: OleVariant): Shape; safecall;
    function AddLabel(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; safecall;
    function AddLine(BeginX: Single; BeginY: Single; EndX: Single; EndY: Single): Shape; safecall;
    function AddPicture(const FileName: WideString; LinkToFile: MsoTriState; 
                        SaveWithDocument: MsoTriState; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function AddPolyline(SafeArrayOfPoints: OleVariant): Shape; safecall;
    function AddShape(Type_: MsoAutoShapeType; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; safecall;
    function AddTextEffect(PresetTextEffect: MsoPresetTextEffect; const Text: WideString; 
                           const FontName: WideString; FontSize: Single; FontBold: MsoTriState; 
                           FontItalic: MsoTriState; Left: Single; Top: Single): Shape; safecall;
    function AddTextbox(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function BuildFreeform(EditingType: MsoEditingType; X1: Single; Y1: Single): FreeformBuilder; safecall;
    procedure SelectAll; safecall;
    function Range(Index: OleVariant): ShapeRange; safecall;
    function Get_HasTitle: MsoTriState; safecall;
    function AddTitle: Shape; safecall;
    function Get_Title: Shape; safecall;
    function Get_Placeholders: Placeholders; safecall;
    function AddOLEObject(Left: Single; Top: Single; Width: Single; Height: Single; 
                          const ClassName: WideString; const FileName: WideString; 
                          DisplayAsIcon: MsoTriState; const IconFileName: WideString; 
                          IconIndex: SYSINT; const IconLabel: WideString; Link: MsoTriState): Shape; safecall;
    function AddComment(Left: Single; Top: Single; Width: Single; Height: Single): Shape; safecall;
    function AddPlaceholder(Type_: PpPlaceholderType; Left: Single; Top: Single; Width: Single; 
                            Height: Single): Shape; safecall;
    function AddMediaObject(const FileName: WideString; Left: Single; Top: Single; Width: Single; 
                            Height: Single): Shape; safecall;
    function Paste: ShapeRange; safecall;
    function AddTable(NumRows: SYSINT; NumColumns: SYSINT; Left: Single; Top: Single; 
                      Width: Single; Height: Single): Shape; safecall;
    function PasteSpecial(DataType: PpPasteDataType; DisplayAsIcon: MsoTriState; 
                          const IconFileName: WideString; IconIndex: SYSINT; 
                          const IconLabel: WideString; Link: MsoTriState): ShapeRange; safecall;
    function AddDiagram(Type_: MsoDiagramType; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function AddCanvas(Left: Single; Top: Single; Width: Single; Height: Single): Shape; safecall;
    function AddChart(Type_: XlChartType; Left: Single; Top: Single; Width: Single; Height: Single): Shape; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property HasTitle: MsoTriState read Get_HasTitle;
    property Title: Shape read Get_Title;
    property Placeholders: Placeholders read Get_Placeholders;
  end;

// *********************************************************************//
// DispIntf:  ShapesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493475-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapesDisp = dispinterface
    ['{91493475-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property Count: SYSINT readonly dispid 2;
    function Item(Index: OleVariant): Shape; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function AddCallout(Type_: MsoCalloutType; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 10;
    function AddConnector(Type_: MsoConnectorType; BeginX: Single; BeginY: Single; EndX: Single; 
                          EndY: Single): Shape; dispid 11;
    function AddCurve(SafeArrayOfPoints: OleVariant): Shape; dispid 12;
    function AddLabel(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; dispid 13;
    function AddLine(BeginX: Single; BeginY: Single; EndX: Single; EndY: Single): Shape; dispid 14;
    function AddPicture(const FileName: WideString; LinkToFile: MsoTriState; 
                        SaveWithDocument: MsoTriState; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 15;
    function AddPolyline(SafeArrayOfPoints: OleVariant): Shape; dispid 16;
    function AddShape(Type_: MsoAutoShapeType; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; dispid 17;
    function AddTextEffect(PresetTextEffect: MsoPresetTextEffect; const Text: WideString; 
                           const FontName: WideString; FontSize: Single; FontBold: MsoTriState; 
                           FontItalic: MsoTriState; Left: Single; Top: Single): Shape; dispid 18;
    function AddTextbox(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 19;
    function BuildFreeform(EditingType: MsoEditingType; X1: Single; Y1: Single): FreeformBuilder; dispid 20;
    procedure SelectAll; dispid 22;
    function Range(Index: OleVariant): ShapeRange; dispid 2003;
    property HasTitle: MsoTriState readonly dispid 2004;
    function AddTitle: Shape; dispid 2005;
    property Title: Shape readonly dispid 2006;
    property Placeholders: Placeholders readonly dispid 2007;
    function AddOLEObject(Left: Single; Top: Single; Width: Single; Height: Single; 
                          const ClassName: WideString; const FileName: WideString; 
                          DisplayAsIcon: MsoTriState; const IconFileName: WideString; 
                          IconIndex: SYSINT; const IconLabel: WideString; Link: MsoTriState): Shape; dispid 2008;
    function AddComment(Left: Single; Top: Single; Width: Single; Height: Single): Shape; dispid 2009;
    function AddPlaceholder(Type_: PpPlaceholderType; Left: Single; Top: Single; Width: Single; 
                            Height: Single): Shape; dispid 2010;
    function AddMediaObject(const FileName: WideString; Left: Single; Top: Single; Width: Single; 
                            Height: Single): Shape; dispid 2011;
    function Paste: ShapeRange; dispid 2012;
    function AddTable(NumRows: SYSINT; NumColumns: SYSINT; Left: Single; Top: Single; 
                      Width: Single; Height: Single): Shape; dispid 2013;
    function PasteSpecial(DataType: PpPasteDataType; DisplayAsIcon: MsoTriState; 
                          const IconFileName: WideString; IconIndex: SYSINT; 
                          const IconLabel: WideString; Link: MsoTriState): ShapeRange; dispid 2014;
    function AddDiagram(Type_: MsoDiagramType; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 23;
    function AddCanvas(Left: Single; Top: Single; Width: Single; Height: Single): Shape; dispid 25;
    function AddChart(Type_: XlChartType; Left: Single; Top: Single; Width: Single; Height: Single): Shape; dispid 26;
  end;

// *********************************************************************//
// Interface: Placeholders
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493476-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Placeholders = interface(Collection)
    ['{91493476-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Shape; safecall;
    function FindByName(Index: OleVariant): Shape; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  PlaceholdersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493476-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PlaceholdersDisp = dispinterface
    ['{91493476-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Shape; dispid 0;
    function FindByName(Index: OleVariant): Shape; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: PlaceholderFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493477-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PlaceholderFormat = interface(IDispatch)
    ['{91493477-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_type_: PpPlaceholderType; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_ContainedType: MsoShapeType; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: PpPlaceholderType read Get_type_;
    property Name: WideString read Get_Name write Set_Name;
    property ContainedType: MsoShapeType read Get_ContainedType;
  end;

// *********************************************************************//
// DispIntf:  PlaceholderFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493477-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PlaceholderFormatDisp = dispinterface
    ['{91493477-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property type_: PpPlaceholderType readonly dispid 2003;
    property Name: WideString dispid 2004;
    property ContainedType: MsoShapeType readonly dispid 2005;
  end;

// *********************************************************************//
// Interface: FreeformBuilder
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493478-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FreeformBuilder = interface(IDispatch)
    ['{91493478-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure AddNodes(SegmentType: MsoSegmentType; EditingType: MsoEditingType; X1: Single; 
                       Y1: Single; X2: Single; Y2: Single; X3: Single; Y3: Single); safecall;
    function ConvertToShape: Shape; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  FreeformBuilderDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493478-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FreeformBuilderDisp = dispinterface
    ['{91493478-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure AddNodes(SegmentType: MsoSegmentType; EditingType: MsoEditingType; X1: Single; 
                       Y1: Single; X2: Single; Y2: Single; X3: Single; Y3: Single); dispid 10;
    function ConvertToShape: Shape; dispid 11;
  end;

// *********************************************************************//
// Interface: Shape
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493479-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Shape = interface(IDispatch)
    ['{91493479-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Apply; safecall;
    procedure Delete; safecall;
    procedure Flip(FlipCmd: MsoFlipCmd); safecall;
    procedure IncrementLeft(Increment: Single); safecall;
    procedure IncrementRotation(Increment: Single); safecall;
    procedure IncrementTop(Increment: Single); safecall;
    procedure PickUp; safecall;
    procedure RerouteConnections; safecall;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); safecall;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); safecall;
    procedure SetShapesDefaultProperties; safecall;
    function Ungroup: ShapeRange; safecall;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); safecall;
    function Get_Adjustments: Adjustments; safecall;
    function Get_AutoShapeType: MsoAutoShapeType; safecall;
    procedure Set_AutoShapeType(AutoShapeType: MsoAutoShapeType); safecall;
    function Get_BlackWhiteMode: MsoBlackWhiteMode; safecall;
    procedure Set_BlackWhiteMode(BlackWhiteMode: MsoBlackWhiteMode); safecall;
    function Get_Callout: CalloutFormat; safecall;
    function Get_ConnectionSiteCount: SYSINT; safecall;
    function Get_Connector: MsoTriState; safecall;
    function Get_ConnectorFormat: ConnectorFormat; safecall;
    function Get_Fill: FillFormat; safecall;
    function Get_GroupItems: GroupShapes; safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    function Get_HorizontalFlip: MsoTriState; safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Left: Single); safecall;
    function Get_Line: LineFormat; safecall;
    function Get_LockAspectRatio: MsoTriState; safecall;
    procedure Set_LockAspectRatio(LockAspectRatio: MsoTriState); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_Nodes: ShapeNodes; safecall;
    function Get_Rotation: Single; safecall;
    procedure Set_Rotation(Rotation: Single); safecall;
    function Get_PictureFormat: PictureFormat; safecall;
    function Get_Shadow: ShadowFormat; safecall;
    function Get_TextEffect: TextEffectFormat; safecall;
    function Get_TextFrame: TextFrame; safecall;
    function Get_ThreeD: ThreeDFormat; safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Top: Single); safecall;
    function Get_type_: MsoShapeType; safecall;
    function Get_VerticalFlip: MsoTriState; safecall;
    function Get_Vertices: OleVariant; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    function Get_ZOrderPosition: SYSINT; safecall;
    function Get_OLEFormat: OLEFormat; safecall;
    function Get_LinkFormat: LinkFormat; safecall;
    function Get_PlaceholderFormat: PlaceholderFormat; safecall;
    function Get_AnimationSettings: AnimationSettings; safecall;
    function Get_ActionSettings: ActionSettings; safecall;
    function Get_Tags: Tags; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Select(Replace: MsoTriState); safecall;
    function Duplicate: ShapeRange; safecall;
    function Get_MediaType: PpMediaType; safecall;
    function Get_HasTextFrame: MsoTriState; safecall;
    function Get_SoundFormat: SoundFormat; safecall;
    function Get_Script: Script; safecall;
    function Get_AlternativeText: WideString; safecall;
    procedure Set_AlternativeText(const AlternativeText: WideString); safecall;
    function Get_HasTable: MsoTriState; safecall;
    function Get_Table: Table; safecall;
    procedure Export(const PathName: WideString; Filter: PpShapeFormat; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT; ExportMode: PpExportMode); safecall;
    function Get_HasDiagram: MsoTriState; safecall;
    function Get_Diagram: Diagram; safecall;
    function Get_HasDiagramNode: MsoTriState; safecall;
    function Get_DiagramNode: DiagramNode; safecall;
    function Get_Child: MsoTriState; safecall;
    function Get_ParentGroup: Shape; safecall;
    function Get_CanvasItems: CanvasShapes; safecall;
    function Get_Id: SYSINT; safecall;
    procedure CanvasCropLeft(Increment: Single); safecall;
    procedure CanvasCropTop(Increment: Single); safecall;
    procedure CanvasCropRight(Increment: Single); safecall;
    procedure CanvasCropBottom(Increment: Single); safecall;
    procedure Set_RTF(const Param1: WideString); safecall;
    function Get_CustomerData: CustomerData; safecall;
    function Get_TextFrame2: TextFrame2; safecall;
    function Get_HasChart: MsoTriState; safecall;
    function Get_ShapeStyle: MsoShapeStyleIndex; safecall;
    procedure Set_ShapeStyle(ShapeStyle: MsoShapeStyleIndex); safecall;
    function Get_BackgroundStyle: MsoBackgroundStyleIndex; safecall;
    procedure Set_BackgroundStyle(BackgroundStyle: MsoBackgroundStyleIndex); safecall;
    function Get_SoftEdge: SoftEdgeFormat; safecall;
    function Get_Glow: GlowFormat; safecall;
    function Get_Reflection: ReflectionFormat; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Adjustments: Adjustments read Get_Adjustments;
    property AutoShapeType: MsoAutoShapeType read Get_AutoShapeType write Set_AutoShapeType;
    property BlackWhiteMode: MsoBlackWhiteMode read Get_BlackWhiteMode write Set_BlackWhiteMode;
    property Callout: CalloutFormat read Get_Callout;
    property ConnectionSiteCount: SYSINT read Get_ConnectionSiteCount;
    property Connector: MsoTriState read Get_Connector;
    property ConnectorFormat: ConnectorFormat read Get_ConnectorFormat;
    property Fill: FillFormat read Get_Fill;
    property GroupItems: GroupShapes read Get_GroupItems;
    property Height: Single read Get_Height write Set_Height;
    property HorizontalFlip: MsoTriState read Get_HorizontalFlip;
    property Left: Single read Get_Left write Set_Left;
    property Line: LineFormat read Get_Line;
    property LockAspectRatio: MsoTriState read Get_LockAspectRatio write Set_LockAspectRatio;
    property Name: WideString read Get_Name write Set_Name;
    property Nodes: ShapeNodes read Get_Nodes;
    property Rotation: Single read Get_Rotation write Set_Rotation;
    property PictureFormat: PictureFormat read Get_PictureFormat;
    property Shadow: ShadowFormat read Get_Shadow;
    property TextEffect: TextEffectFormat read Get_TextEffect;
    property TextFrame: TextFrame read Get_TextFrame;
    property ThreeD: ThreeDFormat read Get_ThreeD;
    property Top: Single read Get_Top write Set_Top;
    property type_: MsoShapeType read Get_type_;
    property VerticalFlip: MsoTriState read Get_VerticalFlip;
    property Vertices: OleVariant read Get_Vertices;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Width: Single read Get_Width write Set_Width;
    property ZOrderPosition: SYSINT read Get_ZOrderPosition;
    property OLEFormat: OLEFormat read Get_OLEFormat;
    property LinkFormat: LinkFormat read Get_LinkFormat;
    property PlaceholderFormat: PlaceholderFormat read Get_PlaceholderFormat;
    property AnimationSettings: AnimationSettings read Get_AnimationSettings;
    property ActionSettings: ActionSettings read Get_ActionSettings;
    property Tags: Tags read Get_Tags;
    property MediaType: PpMediaType read Get_MediaType;
    property HasTextFrame: MsoTriState read Get_HasTextFrame;
    property SoundFormat: SoundFormat read Get_SoundFormat;
    property Script: Script read Get_Script;
    property AlternativeText: WideString read Get_AlternativeText write Set_AlternativeText;
    property HasTable: MsoTriState read Get_HasTable;
    property Table: Table read Get_Table;
    property HasDiagram: MsoTriState read Get_HasDiagram;
    property Diagram: Diagram read Get_Diagram;
    property HasDiagramNode: MsoTriState read Get_HasDiagramNode;
    property DiagramNode: DiagramNode read Get_DiagramNode;
    property Child: MsoTriState read Get_Child;
    property ParentGroup: Shape read Get_ParentGroup;
    property CanvasItems: CanvasShapes read Get_CanvasItems;
    property Id: SYSINT read Get_Id;
    property RTF: WideString write Set_RTF;
    property CustomerData: CustomerData read Get_CustomerData;
    property TextFrame2: TextFrame2 read Get_TextFrame2;
    property HasChart: MsoTriState read Get_HasChart;
    property ShapeStyle: MsoShapeStyleIndex read Get_ShapeStyle write Set_ShapeStyle;
    property BackgroundStyle: MsoBackgroundStyleIndex read Get_BackgroundStyle write Set_BackgroundStyle;
    property SoftEdge: SoftEdgeFormat read Get_SoftEdge;
    property Glow: GlowFormat read Get_Glow;
    property Reflection: ReflectionFormat read Get_Reflection;
  end;

// *********************************************************************//
// DispIntf:  ShapeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493479-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeDisp = dispinterface
    ['{91493479-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure Apply; dispid 10;
    procedure Delete; dispid 11;
    procedure Flip(FlipCmd: MsoFlipCmd); dispid 13;
    procedure IncrementLeft(Increment: Single); dispid 14;
    procedure IncrementRotation(Increment: Single); dispid 15;
    procedure IncrementTop(Increment: Single); dispid 16;
    procedure PickUp; dispid 17;
    procedure RerouteConnections; dispid 18;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); dispid 19;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); dispid 20;
    procedure SetShapesDefaultProperties; dispid 22;
    function Ungroup: ShapeRange; dispid 23;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); dispid 24;
    property Adjustments: Adjustments readonly dispid 100;
    property AutoShapeType: MsoAutoShapeType dispid 101;
    property BlackWhiteMode: MsoBlackWhiteMode dispid 102;
    property Callout: CalloutFormat readonly dispid 103;
    property ConnectionSiteCount: SYSINT readonly dispid 104;
    property Connector: MsoTriState readonly dispid 105;
    property ConnectorFormat: ConnectorFormat readonly dispid 106;
    property Fill: FillFormat readonly dispid 107;
    property GroupItems: GroupShapes readonly dispid 108;
    property Height: Single dispid 109;
    property HorizontalFlip: MsoTriState readonly dispid 110;
    property Left: Single dispid 111;
    property Line: LineFormat readonly dispid 112;
    property LockAspectRatio: MsoTriState dispid 113;
    property Name: WideString dispid 115;
    property Nodes: ShapeNodes readonly dispid 116;
    property Rotation: Single dispid 117;
    property PictureFormat: PictureFormat readonly dispid 118;
    property Shadow: ShadowFormat readonly dispid 119;
    property TextEffect: TextEffectFormat readonly dispid 120;
    property TextFrame: TextFrame readonly dispid 121;
    property ThreeD: ThreeDFormat readonly dispid 122;
    property Top: Single dispid 123;
    property type_: MsoShapeType readonly dispid 124;
    property VerticalFlip: MsoTriState readonly dispid 125;
    property Vertices: OleVariant readonly dispid 126;
    property Visible: MsoTriState dispid 127;
    property Width: Single dispid 128;
    property ZOrderPosition: SYSINT readonly dispid 129;
    property OLEFormat: OLEFormat readonly dispid 2003;
    property LinkFormat: LinkFormat readonly dispid 2004;
    property PlaceholderFormat: PlaceholderFormat readonly dispid 2005;
    property AnimationSettings: AnimationSettings readonly dispid 2006;
    property ActionSettings: ActionSettings readonly dispid 2007;
    property Tags: Tags readonly dispid 2008;
    procedure Cut; dispid 2009;
    procedure Copy; dispid 2010;
    procedure Select(Replace: MsoTriState); dispid 2011;
    function Duplicate: ShapeRange; dispid 2012;
    property MediaType: PpMediaType readonly dispid 2013;
    property HasTextFrame: MsoTriState readonly dispid 2014;
    property SoundFormat: SoundFormat readonly dispid 2015;
    property Script: Script readonly dispid 130;
    property AlternativeText: WideString dispid 131;
    property HasTable: MsoTriState readonly dispid 2016;
    property Table: Table readonly dispid 2017;
    procedure Export(const PathName: WideString; Filter: PpShapeFormat; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT; ExportMode: PpExportMode); dispid 2018;
    property HasDiagram: MsoTriState readonly dispid 132;
    property Diagram: Diagram readonly dispid 133;
    property HasDiagramNode: MsoTriState readonly dispid 134;
    property DiagramNode: DiagramNode readonly dispid 135;
    property Child: MsoTriState readonly dispid 136;
    property ParentGroup: Shape readonly dispid 137;
    property CanvasItems: CanvasShapes readonly dispid 138;
    property Id: SYSINT readonly dispid 139;
    procedure CanvasCropLeft(Increment: Single); dispid 140;
    procedure CanvasCropTop(Increment: Single); dispid 141;
    procedure CanvasCropRight(Increment: Single); dispid 142;
    procedure CanvasCropBottom(Increment: Single); dispid 143;
    property RTF: WideString writeonly dispid 144;
    property CustomerData: CustomerData readonly dispid 2020;
    property TextFrame2: TextFrame2 readonly dispid 145;
    property HasChart: MsoTriState readonly dispid 148;
    property ShapeStyle: MsoShapeStyleIndex dispid 150;
    property BackgroundStyle: MsoBackgroundStyleIndex dispid 151;
    property SoftEdge: SoftEdgeFormat readonly dispid 152;
    property Glow: GlowFormat readonly dispid 153;
    property Reflection: ReflectionFormat readonly dispid 154;
  end;

// *********************************************************************//
// Interface: ShapeRange
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeRange = interface(IDispatch)
    ['{9149347A-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Apply; safecall;
    procedure Delete; safecall;
    procedure Flip(FlipCmd: MsoFlipCmd); safecall;
    procedure IncrementLeft(Increment: Single); safecall;
    procedure IncrementRotation(Increment: Single); safecall;
    procedure IncrementTop(Increment: Single); safecall;
    procedure PickUp; safecall;
    procedure RerouteConnections; safecall;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); safecall;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); safecall;
    procedure SetShapesDefaultProperties; safecall;
    function Ungroup: ShapeRange; safecall;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); safecall;
    function Get_Adjustments: Adjustments; safecall;
    function Get_AutoShapeType: MsoAutoShapeType; safecall;
    procedure Set_AutoShapeType(AutoShapeType: MsoAutoShapeType); safecall;
    function Get_BlackWhiteMode: MsoBlackWhiteMode; safecall;
    procedure Set_BlackWhiteMode(BlackWhiteMode: MsoBlackWhiteMode); safecall;
    function Get_Callout: CalloutFormat; safecall;
    function Get_ConnectionSiteCount: SYSINT; safecall;
    function Get_Connector: MsoTriState; safecall;
    function Get_ConnectorFormat: ConnectorFormat; safecall;
    function Get_Fill: FillFormat; safecall;
    function Get_GroupItems: GroupShapes; safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    function Get_HorizontalFlip: MsoTriState; safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Left: Single); safecall;
    function Get_Line: LineFormat; safecall;
    function Get_LockAspectRatio: MsoTriState; safecall;
    procedure Set_LockAspectRatio(LockAspectRatio: MsoTriState); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_Nodes: ShapeNodes; safecall;
    function Get_Rotation: Single; safecall;
    procedure Set_Rotation(Rotation: Single); safecall;
    function Get_PictureFormat: PictureFormat; safecall;
    function Get_Shadow: ShadowFormat; safecall;
    function Get_TextEffect: TextEffectFormat; safecall;
    function Get_TextFrame: TextFrame; safecall;
    function Get_ThreeD: ThreeDFormat; safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Top: Single); safecall;
    function Get_type_: MsoShapeType; safecall;
    function Get_VerticalFlip: MsoTriState; safecall;
    function Get_Vertices: OleVariant; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    function Get_ZOrderPosition: SYSINT; safecall;
    function Get_OLEFormat: OLEFormat; safecall;
    function Get_LinkFormat: LinkFormat; safecall;
    function Get_PlaceholderFormat: PlaceholderFormat; safecall;
    function Get_AnimationSettings: AnimationSettings; safecall;
    function Get_ActionSettings: ActionSettings; safecall;
    function Get_Tags: Tags; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Select(Replace: MsoTriState); safecall;
    function Duplicate: ShapeRange; safecall;
    function Get_MediaType: PpMediaType; safecall;
    function Get_HasTextFrame: MsoTriState; safecall;
    function Get_SoundFormat: SoundFormat; safecall;
    function Item(Index: OleVariant): Shape; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function _Index(Index: SYSINT): OleVariant; safecall;
    function Get_Count: Integer; safecall;
    function Group: Shape; safecall;
    function Regroup: Shape; safecall;
    procedure Align(AlignCmd: MsoAlignCmd; RelativeTo: MsoTriState); safecall;
    procedure Distribute(DistributeCmd: MsoDistributeCmd; RelativeTo: MsoTriState); safecall;
    procedure GetPolygonalRepresentation(maxPointsInBuffer: LongWord; var pPoints: Single; 
                                         out numPointsInPolygon: LongWord; out IsOpen: MsoTriState); safecall;
    function Get_Script: Script; safecall;
    function Get_AlternativeText: WideString; safecall;
    procedure Set_AlternativeText(const AlternativeText: WideString); safecall;
    function Get_HasTable: MsoTriState; safecall;
    function Get_Table: Table; safecall;
    procedure Export(const PathName: WideString; Filter: PpShapeFormat; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT; ExportMode: PpExportMode); safecall;
    function Get_HasDiagram: MsoTriState; safecall;
    function Get_Diagram: Diagram; safecall;
    function Get_HasDiagramNode: MsoTriState; safecall;
    function Get_DiagramNode: DiagramNode; safecall;
    function Get_Child: MsoTriState; safecall;
    function Get_ParentGroup: Shape; safecall;
    function Get_CanvasItems: CanvasShapes; safecall;
    function Get_Id: SYSINT; safecall;
    procedure CanvasCropLeft(Increment: Single); safecall;
    procedure CanvasCropTop(Increment: Single); safecall;
    procedure CanvasCropRight(Increment: Single); safecall;
    procedure CanvasCropBottom(Increment: Single); safecall;
    procedure Set_RTF(const Param1: WideString); safecall;
    function Get_CustomerData: CustomerData; safecall;
    function Get_TextFrame2: TextFrame2; safecall;
    function Get_HasChart: MsoTriState; safecall;
    function Get_ShapeStyle: MsoShapeStyleIndex; safecall;
    procedure Set_ShapeStyle(ShapeStyle: MsoShapeStyleIndex); safecall;
    function Get_BackgroundStyle: MsoBackgroundStyleIndex; safecall;
    procedure Set_BackgroundStyle(BackgroundStyle: MsoBackgroundStyleIndex); safecall;
    function Get_SoftEdge: SoftEdgeFormat; safecall;
    function Get_Glow: GlowFormat; safecall;
    function Get_Reflection: ReflectionFormat; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Adjustments: Adjustments read Get_Adjustments;
    property AutoShapeType: MsoAutoShapeType read Get_AutoShapeType write Set_AutoShapeType;
    property BlackWhiteMode: MsoBlackWhiteMode read Get_BlackWhiteMode write Set_BlackWhiteMode;
    property Callout: CalloutFormat read Get_Callout;
    property ConnectionSiteCount: SYSINT read Get_ConnectionSiteCount;
    property Connector: MsoTriState read Get_Connector;
    property ConnectorFormat: ConnectorFormat read Get_ConnectorFormat;
    property Fill: FillFormat read Get_Fill;
    property GroupItems: GroupShapes read Get_GroupItems;
    property Height: Single read Get_Height write Set_Height;
    property HorizontalFlip: MsoTriState read Get_HorizontalFlip;
    property Left: Single read Get_Left write Set_Left;
    property Line: LineFormat read Get_Line;
    property LockAspectRatio: MsoTriState read Get_LockAspectRatio write Set_LockAspectRatio;
    property Name: WideString read Get_Name write Set_Name;
    property Nodes: ShapeNodes read Get_Nodes;
    property Rotation: Single read Get_Rotation write Set_Rotation;
    property PictureFormat: PictureFormat read Get_PictureFormat;
    property Shadow: ShadowFormat read Get_Shadow;
    property TextEffect: TextEffectFormat read Get_TextEffect;
    property TextFrame: TextFrame read Get_TextFrame;
    property ThreeD: ThreeDFormat read Get_ThreeD;
    property Top: Single read Get_Top write Set_Top;
    property type_: MsoShapeType read Get_type_;
    property VerticalFlip: MsoTriState read Get_VerticalFlip;
    property Vertices: OleVariant read Get_Vertices;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Width: Single read Get_Width write Set_Width;
    property ZOrderPosition: SYSINT read Get_ZOrderPosition;
    property OLEFormat: OLEFormat read Get_OLEFormat;
    property LinkFormat: LinkFormat read Get_LinkFormat;
    property PlaceholderFormat: PlaceholderFormat read Get_PlaceholderFormat;
    property AnimationSettings: AnimationSettings read Get_AnimationSettings;
    property ActionSettings: ActionSettings read Get_ActionSettings;
    property Tags: Tags read Get_Tags;
    property MediaType: PpMediaType read Get_MediaType;
    property HasTextFrame: MsoTriState read Get_HasTextFrame;
    property SoundFormat: SoundFormat read Get_SoundFormat;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Script: Script read Get_Script;
    property AlternativeText: WideString read Get_AlternativeText write Set_AlternativeText;
    property HasTable: MsoTriState read Get_HasTable;
    property Table: Table read Get_Table;
    property HasDiagram: MsoTriState read Get_HasDiagram;
    property Diagram: Diagram read Get_Diagram;
    property HasDiagramNode: MsoTriState read Get_HasDiagramNode;
    property DiagramNode: DiagramNode read Get_DiagramNode;
    property Child: MsoTriState read Get_Child;
    property ParentGroup: Shape read Get_ParentGroup;
    property CanvasItems: CanvasShapes read Get_CanvasItems;
    property Id: SYSINT read Get_Id;
    property RTF: WideString write Set_RTF;
    property CustomerData: CustomerData read Get_CustomerData;
    property TextFrame2: TextFrame2 read Get_TextFrame2;
    property HasChart: MsoTriState read Get_HasChart;
    property ShapeStyle: MsoShapeStyleIndex read Get_ShapeStyle write Set_ShapeStyle;
    property BackgroundStyle: MsoBackgroundStyleIndex read Get_BackgroundStyle write Set_BackgroundStyle;
    property SoftEdge: SoftEdgeFormat read Get_SoftEdge;
    property Glow: GlowFormat read Get_Glow;
    property Reflection: ReflectionFormat read Get_Reflection;
  end;

// *********************************************************************//
// DispIntf:  ShapeRangeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeRangeDisp = dispinterface
    ['{9149347A-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure Apply; dispid 10;
    procedure Delete; dispid 11;
    procedure Flip(FlipCmd: MsoFlipCmd); dispid 13;
    procedure IncrementLeft(Increment: Single); dispid 14;
    procedure IncrementRotation(Increment: Single); dispid 15;
    procedure IncrementTop(Increment: Single); dispid 16;
    procedure PickUp; dispid 17;
    procedure RerouteConnections; dispid 18;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); dispid 19;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; fScale: MsoScaleFrom); dispid 20;
    procedure SetShapesDefaultProperties; dispid 22;
    function Ungroup: ShapeRange; dispid 23;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); dispid 24;
    property Adjustments: Adjustments readonly dispid 100;
    property AutoShapeType: MsoAutoShapeType dispid 101;
    property BlackWhiteMode: MsoBlackWhiteMode dispid 102;
    property Callout: CalloutFormat readonly dispid 103;
    property ConnectionSiteCount: SYSINT readonly dispid 104;
    property Connector: MsoTriState readonly dispid 105;
    property ConnectorFormat: ConnectorFormat readonly dispid 106;
    property Fill: FillFormat readonly dispid 107;
    property GroupItems: GroupShapes readonly dispid 108;
    property Height: Single dispid 109;
    property HorizontalFlip: MsoTriState readonly dispid 110;
    property Left: Single dispid 111;
    property Line: LineFormat readonly dispid 112;
    property LockAspectRatio: MsoTriState dispid 113;
    property Name: WideString dispid 115;
    property Nodes: ShapeNodes readonly dispid 116;
    property Rotation: Single dispid 117;
    property PictureFormat: PictureFormat readonly dispid 118;
    property Shadow: ShadowFormat readonly dispid 119;
    property TextEffect: TextEffectFormat readonly dispid 120;
    property TextFrame: TextFrame readonly dispid 121;
    property ThreeD: ThreeDFormat readonly dispid 122;
    property Top: Single dispid 123;
    property type_: MsoShapeType readonly dispid 124;
    property VerticalFlip: MsoTriState readonly dispid 125;
    property Vertices: OleVariant readonly dispid 126;
    property Visible: MsoTriState dispid 127;
    property Width: Single dispid 128;
    property ZOrderPosition: SYSINT readonly dispid 129;
    property OLEFormat: OLEFormat readonly dispid 2003;
    property LinkFormat: LinkFormat readonly dispid 2004;
    property PlaceholderFormat: PlaceholderFormat readonly dispid 2005;
    property AnimationSettings: AnimationSettings readonly dispid 2006;
    property ActionSettings: ActionSettings readonly dispid 2007;
    property Tags: Tags readonly dispid 2008;
    procedure Cut; dispid 2009;
    procedure Copy; dispid 2010;
    procedure Select(Replace: MsoTriState); dispid 2011;
    function Duplicate: ShapeRange; dispid 2012;
    property MediaType: PpMediaType readonly dispid 2013;
    property HasTextFrame: MsoTriState readonly dispid 2014;
    property SoundFormat: SoundFormat readonly dispid 2015;
    function Item(Index: OleVariant): Shape; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 8;
    property Count: Integer readonly dispid 9;
    function Group: Shape; dispid 2016;
    function Regroup: Shape; dispid 2017;
    procedure Align(AlignCmd: MsoAlignCmd; RelativeTo: MsoTriState); dispid 2018;
    procedure Distribute(DistributeCmd: MsoDistributeCmd; RelativeTo: MsoTriState); dispid 2019;
    procedure GetPolygonalRepresentation(maxPointsInBuffer: LongWord; var pPoints: Single; 
                                         out numPointsInPolygon: LongWord; out IsOpen: MsoTriState); dispid 2020;
    property Script: Script readonly dispid 130;
    property AlternativeText: WideString dispid 131;
    property HasTable: MsoTriState readonly dispid 2021;
    property Table: Table readonly dispid 2022;
    procedure Export(const PathName: WideString; Filter: PpShapeFormat; ScaleWidth: SYSINT; 
                     ScaleHeight: SYSINT; ExportMode: PpExportMode); dispid 2023;
    property HasDiagram: MsoTriState readonly dispid 132;
    property Diagram: Diagram readonly dispid 133;
    property HasDiagramNode: MsoTriState readonly dispid 134;
    property DiagramNode: DiagramNode readonly dispid 135;
    property Child: MsoTriState readonly dispid 136;
    property ParentGroup: Shape readonly dispid 137;
    property CanvasItems: CanvasShapes readonly dispid 138;
    property Id: SYSINT readonly dispid 139;
    procedure CanvasCropLeft(Increment: Single); dispid 140;
    procedure CanvasCropTop(Increment: Single); dispid 141;
    procedure CanvasCropRight(Increment: Single); dispid 142;
    procedure CanvasCropBottom(Increment: Single); dispid 143;
    property RTF: WideString writeonly dispid 144;
    property CustomerData: CustomerData readonly dispid 2025;
    property TextFrame2: TextFrame2 readonly dispid 145;
    property HasChart: MsoTriState readonly dispid 148;
    property ShapeStyle: MsoShapeStyleIndex dispid 150;
    property BackgroundStyle: MsoBackgroundStyleIndex dispid 151;
    property SoftEdge: SoftEdgeFormat readonly dispid 152;
    property Glow: GlowFormat readonly dispid 153;
    property Reflection: ReflectionFormat readonly dispid 154;
  end;

// *********************************************************************//
// Interface: GroupShapes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  GroupShapes = interface(IDispatch)
    ['{9149347B-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    function Item(Index: OleVariant): Shape; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Range(Index: OleVariant): ShapeRange; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  GroupShapesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  GroupShapesDisp = dispinterface
    ['{9149347B-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property Count: SYSINT readonly dispid 2;
    function Item(Index: OleVariant): Shape; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function Range(Index: OleVariant): ShapeRange; dispid 10;
  end;

// *********************************************************************//
// Interface: Adjustments
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Adjustments = interface(IDispatch)
    ['{9149347C-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    function Get_Item(Index: SYSINT): Single; safecall;
    procedure Set_Item(Index: SYSINT; Val: Single); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
    property Item[Index: SYSINT]: Single read Get_Item write Set_Item; default;
  end;

// *********************************************************************//
// DispIntf:  AdjustmentsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AdjustmentsDisp = dispinterface
    ['{9149347C-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property Count: SYSINT readonly dispid 2;
    property Item[Index: SYSINT]: Single dispid 0; default;
  end;

// *********************************************************************//
// Interface: PictureFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PictureFormat = interface(IDispatch)
    ['{9149347D-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure IncrementBrightness(Increment: Single); safecall;
    procedure IncrementContrast(Increment: Single); safecall;
    function Get_Brightness: Single; safecall;
    procedure Set_Brightness(Brightness: Single); safecall;
    function Get_ColorType: MsoPictureColorType; safecall;
    procedure Set_ColorType(ColorType: MsoPictureColorType); safecall;
    function Get_Contrast: Single; safecall;
    procedure Set_Contrast(Contrast: Single); safecall;
    function Get_CropBottom: Single; safecall;
    procedure Set_CropBottom(CropBottom: Single); safecall;
    function Get_CropLeft: Single; safecall;
    procedure Set_CropLeft(CropLeft: Single); safecall;
    function Get_CropRight: Single; safecall;
    procedure Set_CropRight(CropRight: Single); safecall;
    function Get_CropTop: Single; safecall;
    procedure Set_CropTop(CropTop: Single); safecall;
    function Get_TransparencyColor: MsoRGBType; safecall;
    procedure Set_TransparencyColor(TransparencyColor: MsoRGBType); safecall;
    function Get_TransparentBackground: MsoTriState; safecall;
    procedure Set_TransparentBackground(TransparentBackground: MsoTriState); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Brightness: Single read Get_Brightness write Set_Brightness;
    property ColorType: MsoPictureColorType read Get_ColorType write Set_ColorType;
    property Contrast: Single read Get_Contrast write Set_Contrast;
    property CropBottom: Single read Get_CropBottom write Set_CropBottom;
    property CropLeft: Single read Get_CropLeft write Set_CropLeft;
    property CropRight: Single read Get_CropRight write Set_CropRight;
    property CropTop: Single read Get_CropTop write Set_CropTop;
    property TransparencyColor: MsoRGBType read Get_TransparencyColor write Set_TransparencyColor;
    property TransparentBackground: MsoTriState read Get_TransparentBackground write Set_TransparentBackground;
  end;

// *********************************************************************//
// DispIntf:  PictureFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PictureFormatDisp = dispinterface
    ['{9149347D-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure IncrementBrightness(Increment: Single); dispid 10;
    procedure IncrementContrast(Increment: Single); dispid 11;
    property Brightness: Single dispid 100;
    property ColorType: MsoPictureColorType dispid 101;
    property Contrast: Single dispid 102;
    property CropBottom: Single dispid 103;
    property CropLeft: Single dispid 104;
    property CropRight: Single dispid 105;
    property CropTop: Single dispid 106;
    property TransparencyColor: MsoRGBType dispid 107;
    property TransparentBackground: MsoTriState dispid 108;
  end;

// *********************************************************************//
// Interface: FillFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FillFormat = interface(IDispatch)
    ['{9149347E-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Background; safecall;
    procedure OneColorGradient(Style: MsoGradientStyle; Variant: SYSINT; Degree: Single); safecall;
    procedure Patterned(Pattern: MsoPatternType); safecall;
    procedure PresetGradient(Style: MsoGradientStyle; Variant: SYSINT; 
                             PresetGradientType: MsoPresetGradientType); safecall;
    procedure PresetTextured(PresetTexture: MsoPresetTexture); safecall;
    procedure Solid; safecall;
    procedure TwoColorGradient(Style: MsoGradientStyle; Variant: SYSINT); safecall;
    procedure UserPicture(const PictureFile: WideString); safecall;
    procedure UserTextured(const TextureFile: WideString); safecall;
    function Get_BackColor: ColorFormat; safecall;
    procedure Set_BackColor(const BackColor: ColorFormat); safecall;
    function Get_ForeColor: ColorFormat; safecall;
    procedure Set_ForeColor(const ForeColor: ColorFormat); safecall;
    function Get_GradientColorType: MsoGradientColorType; safecall;
    function Get_GradientDegree: Single; safecall;
    function Get_GradientStyle: MsoGradientStyle; safecall;
    function Get_GradientVariant: SYSINT; safecall;
    function Get_Pattern: MsoPatternType; safecall;
    function Get_PresetGradientType: MsoPresetGradientType; safecall;
    function Get_PresetTexture: MsoPresetTexture; safecall;
    function Get_TextureName: WideString; safecall;
    function Get_TextureType: MsoTextureType; safecall;
    function Get_Transparency: Single; safecall;
    procedure Set_Transparency(Transparency: Single); safecall;
    function Get_type_: MsoFillType; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_GradientStops: GradientStops; safecall;
    function Get_TextureOffsetX: Single; safecall;
    procedure Set_TextureOffsetX(TextureOffsetX: Single); safecall;
    function Get_TextureOffsetY: Single; safecall;
    procedure Set_TextureOffsetY(TextureOffsetY: Single); safecall;
    function Get_TextureAlignment: MsoTextureAlignment; safecall;
    procedure Set_TextureAlignment(TextureAlignment: MsoTextureAlignment); safecall;
    function Get_TextureHorizontalScale: Single; safecall;
    procedure Set_TextureHorizontalScale(HorizontalScale: Single); safecall;
    function Get_TextureVerticalScale: Single; safecall;
    procedure Set_TextureVerticalScale(VerticalScale: Single); safecall;
    function Get_TextureTile: MsoTriState; safecall;
    procedure Set_TextureTile(TextureTile: MsoTriState); safecall;
    function Get_RotateWithObject: MsoTriState; safecall;
    procedure Set_RotateWithObject(RotateWithObject: MsoTriState); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BackColor: ColorFormat read Get_BackColor write Set_BackColor;
    property ForeColor: ColorFormat read Get_ForeColor write Set_ForeColor;
    property GradientColorType: MsoGradientColorType read Get_GradientColorType;
    property GradientDegree: Single read Get_GradientDegree;
    property GradientStyle: MsoGradientStyle read Get_GradientStyle;
    property GradientVariant: SYSINT read Get_GradientVariant;
    property Pattern: MsoPatternType read Get_Pattern;
    property PresetGradientType: MsoPresetGradientType read Get_PresetGradientType;
    property PresetTexture: MsoPresetTexture read Get_PresetTexture;
    property TextureName: WideString read Get_TextureName;
    property TextureType: MsoTextureType read Get_TextureType;
    property Transparency: Single read Get_Transparency write Set_Transparency;
    property type_: MsoFillType read Get_type_;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property GradientStops: GradientStops read Get_GradientStops;
    property TextureOffsetX: Single read Get_TextureOffsetX write Set_TextureOffsetX;
    property TextureOffsetY: Single read Get_TextureOffsetY write Set_TextureOffsetY;
    property TextureAlignment: MsoTextureAlignment read Get_TextureAlignment write Set_TextureAlignment;
    property TextureHorizontalScale: Single read Get_TextureHorizontalScale write Set_TextureHorizontalScale;
    property TextureVerticalScale: Single read Get_TextureVerticalScale write Set_TextureVerticalScale;
    property TextureTile: MsoTriState read Get_TextureTile write Set_TextureTile;
    property RotateWithObject: MsoTriState read Get_RotateWithObject write Set_RotateWithObject;
  end;

// *********************************************************************//
// DispIntf:  FillFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FillFormatDisp = dispinterface
    ['{9149347E-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure Background; dispid 10;
    procedure OneColorGradient(Style: MsoGradientStyle; Variant: SYSINT; Degree: Single); dispid 11;
    procedure Patterned(Pattern: MsoPatternType); dispid 12;
    procedure PresetGradient(Style: MsoGradientStyle; Variant: SYSINT; 
                             PresetGradientType: MsoPresetGradientType); dispid 13;
    procedure PresetTextured(PresetTexture: MsoPresetTexture); dispid 14;
    procedure Solid; dispid 15;
    procedure TwoColorGradient(Style: MsoGradientStyle; Variant: SYSINT); dispid 16;
    procedure UserPicture(const PictureFile: WideString); dispid 17;
    procedure UserTextured(const TextureFile: WideString); dispid 18;
    property BackColor: ColorFormat dispid 100;
    property ForeColor: ColorFormat dispid 101;
    property GradientColorType: MsoGradientColorType readonly dispid 102;
    property GradientDegree: Single readonly dispid 103;
    property GradientStyle: MsoGradientStyle readonly dispid 104;
    property GradientVariant: SYSINT readonly dispid 105;
    property Pattern: MsoPatternType readonly dispid 106;
    property PresetGradientType: MsoPresetGradientType readonly dispid 107;
    property PresetTexture: MsoPresetTexture readonly dispid 108;
    property TextureName: WideString readonly dispid 109;
    property TextureType: MsoTextureType readonly dispid 110;
    property Transparency: Single dispid 111;
    property type_: MsoFillType readonly dispid 112;
    property Visible: MsoTriState dispid 113;
    property GradientStops: GradientStops readonly dispid 114;
    property TextureOffsetX: Single dispid 115;
    property TextureOffsetY: Single dispid 116;
    property TextureAlignment: MsoTextureAlignment dispid 117;
    property TextureHorizontalScale: Single dispid 118;
    property TextureVerticalScale: Single dispid 119;
    property TextureTile: MsoTriState dispid 120;
    property RotateWithObject: MsoTriState dispid 121;
  end;

// *********************************************************************//
// Interface: LineFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  LineFormat = interface(IDispatch)
    ['{9149347F-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_BackColor: ColorFormat; safecall;
    procedure Set_BackColor(const BackColor: ColorFormat); safecall;
    function Get_BeginArrowheadLength: MsoArrowheadLength; safecall;
    procedure Set_BeginArrowheadLength(BeginArrowheadLength: MsoArrowheadLength); safecall;
    function Get_BeginArrowheadStyle: MsoArrowheadStyle; safecall;
    procedure Set_BeginArrowheadStyle(BeginArrowheadStyle: MsoArrowheadStyle); safecall;
    function Get_BeginArrowheadWidth: MsoArrowheadWidth; safecall;
    procedure Set_BeginArrowheadWidth(BeginArrowheadWidth: MsoArrowheadWidth); safecall;
    function Get_DashStyle: MsoLineDashStyle; safecall;
    procedure Set_DashStyle(DashStyle: MsoLineDashStyle); safecall;
    function Get_EndArrowheadLength: MsoArrowheadLength; safecall;
    procedure Set_EndArrowheadLength(EndArrowheadLength: MsoArrowheadLength); safecall;
    function Get_EndArrowheadStyle: MsoArrowheadStyle; safecall;
    procedure Set_EndArrowheadStyle(EndArrowheadStyle: MsoArrowheadStyle); safecall;
    function Get_EndArrowheadWidth: MsoArrowheadWidth; safecall;
    procedure Set_EndArrowheadWidth(EndArrowheadWidth: MsoArrowheadWidth); safecall;
    function Get_ForeColor: ColorFormat; safecall;
    procedure Set_ForeColor(const ForeColor: ColorFormat); safecall;
    function Get_Pattern: MsoPatternType; safecall;
    procedure Set_Pattern(Pattern: MsoPatternType); safecall;
    function Get_Style: MsoLineStyle; safecall;
    procedure Set_Style(Style: MsoLineStyle); safecall;
    function Get_Transparency: Single; safecall;
    procedure Set_Transparency(Transparency: Single); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_Weight: Single; safecall;
    procedure Set_Weight(Weight: Single); safecall;
    function Get_InsetPen: MsoTriState; safecall;
    procedure Set_InsetPen(InsetPen: MsoTriState); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BackColor: ColorFormat read Get_BackColor write Set_BackColor;
    property BeginArrowheadLength: MsoArrowheadLength read Get_BeginArrowheadLength write Set_BeginArrowheadLength;
    property BeginArrowheadStyle: MsoArrowheadStyle read Get_BeginArrowheadStyle write Set_BeginArrowheadStyle;
    property BeginArrowheadWidth: MsoArrowheadWidth read Get_BeginArrowheadWidth write Set_BeginArrowheadWidth;
    property DashStyle: MsoLineDashStyle read Get_DashStyle write Set_DashStyle;
    property EndArrowheadLength: MsoArrowheadLength read Get_EndArrowheadLength write Set_EndArrowheadLength;
    property EndArrowheadStyle: MsoArrowheadStyle read Get_EndArrowheadStyle write Set_EndArrowheadStyle;
    property EndArrowheadWidth: MsoArrowheadWidth read Get_EndArrowheadWidth write Set_EndArrowheadWidth;
    property ForeColor: ColorFormat read Get_ForeColor write Set_ForeColor;
    property Pattern: MsoPatternType read Get_Pattern write Set_Pattern;
    property Style: MsoLineStyle read Get_Style write Set_Style;
    property Transparency: Single read Get_Transparency write Set_Transparency;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Weight: Single read Get_Weight write Set_Weight;
    property InsetPen: MsoTriState read Get_InsetPen write Set_InsetPen;
  end;

// *********************************************************************//
// DispIntf:  LineFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149347F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  LineFormatDisp = dispinterface
    ['{9149347F-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property BackColor: ColorFormat dispid 100;
    property BeginArrowheadLength: MsoArrowheadLength dispid 101;
    property BeginArrowheadStyle: MsoArrowheadStyle dispid 102;
    property BeginArrowheadWidth: MsoArrowheadWidth dispid 103;
    property DashStyle: MsoLineDashStyle dispid 104;
    property EndArrowheadLength: MsoArrowheadLength dispid 105;
    property EndArrowheadStyle: MsoArrowheadStyle dispid 106;
    property EndArrowheadWidth: MsoArrowheadWidth dispid 107;
    property ForeColor: ColorFormat dispid 108;
    property Pattern: MsoPatternType dispid 109;
    property Style: MsoLineStyle dispid 110;
    property Transparency: Single dispid 111;
    property Visible: MsoTriState dispid 112;
    property Weight: Single dispid 113;
    property InsetPen: MsoTriState dispid 114;
  end;

// *********************************************************************//
// Interface: ShadowFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493480-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShadowFormat = interface(IDispatch)
    ['{91493480-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure IncrementOffsetX(Increment: Single); safecall;
    procedure IncrementOffsetY(Increment: Single); safecall;
    function Get_ForeColor: ColorFormat; safecall;
    procedure Set_ForeColor(const ForeColor: ColorFormat); safecall;
    function Get_Obscured: MsoTriState; safecall;
    procedure Set_Obscured(Obscured: MsoTriState); safecall;
    function Get_OffsetX: Single; safecall;
    procedure Set_OffsetX(OffsetX: Single); safecall;
    function Get_OffsetY: Single; safecall;
    procedure Set_OffsetY(OffsetY: Single); safecall;
    function Get_Transparency: Single; safecall;
    procedure Set_Transparency(Transparency: Single); safecall;
    function Get_type_: MsoShadowType; safecall;
    procedure Set_type_(Type_: MsoShadowType); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_Style: MsoShadowStyle; safecall;
    procedure Set_Style(ShadowStyle: MsoShadowStyle); safecall;
    function Get_Blur: Single; safecall;
    procedure Set_Blur(Blur: Single); safecall;
    function Get_Size: Single; safecall;
    procedure Set_Size(Size: Single); safecall;
    function Get_RotateWithShape: MsoTriState; safecall;
    procedure Set_RotateWithShape(RotateWithShape: MsoTriState); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ForeColor: ColorFormat read Get_ForeColor write Set_ForeColor;
    property Obscured: MsoTriState read Get_Obscured write Set_Obscured;
    property OffsetX: Single read Get_OffsetX write Set_OffsetX;
    property OffsetY: Single read Get_OffsetY write Set_OffsetY;
    property Transparency: Single read Get_Transparency write Set_Transparency;
    property type_: MsoShadowType read Get_type_ write Set_type_;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Style: MsoShadowStyle read Get_Style write Set_Style;
    property Blur: Single read Get_Blur write Set_Blur;
    property Size: Single read Get_Size write Set_Size;
    property RotateWithShape: MsoTriState read Get_RotateWithShape write Set_RotateWithShape;
  end;

// *********************************************************************//
// DispIntf:  ShadowFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493480-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShadowFormatDisp = dispinterface
    ['{91493480-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure IncrementOffsetX(Increment: Single); dispid 10;
    procedure IncrementOffsetY(Increment: Single); dispid 11;
    property ForeColor: ColorFormat dispid 100;
    property Obscured: MsoTriState dispid 101;
    property OffsetX: Single dispid 102;
    property OffsetY: Single dispid 103;
    property Transparency: Single dispid 104;
    property type_: MsoShadowType dispid 105;
    property Visible: MsoTriState dispid 106;
    property Style: MsoShadowStyle dispid 107;
    property Blur: Single dispid 108;
    property Size: Single dispid 109;
    property RotateWithShape: MsoTriState dispid 110;
  end;

// *********************************************************************//
// Interface: ConnectorFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493481-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ConnectorFormat = interface(IDispatch)
    ['{91493481-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure BeginConnect(const ConnectedShape: Shape; ConnectionSite: SYSINT); safecall;
    procedure BeginDisconnect; safecall;
    procedure EndConnect(const ConnectedShape: Shape; ConnectionSite: SYSINT); safecall;
    procedure EndDisconnect; safecall;
    function Get_BeginConnected: MsoTriState; safecall;
    function Get_BeginConnectedShape: Shape; safecall;
    function Get_BeginConnectionSite: SYSINT; safecall;
    function Get_EndConnected: MsoTriState; safecall;
    function Get_EndConnectedShape: Shape; safecall;
    function Get_EndConnectionSite: SYSINT; safecall;
    function Get_type_: MsoConnectorType; safecall;
    procedure Set_type_(Type_: MsoConnectorType); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BeginConnected: MsoTriState read Get_BeginConnected;
    property BeginConnectedShape: Shape read Get_BeginConnectedShape;
    property BeginConnectionSite: SYSINT read Get_BeginConnectionSite;
    property EndConnected: MsoTriState read Get_EndConnected;
    property EndConnectedShape: Shape read Get_EndConnectedShape;
    property EndConnectionSite: SYSINT read Get_EndConnectionSite;
    property type_: MsoConnectorType read Get_type_ write Set_type_;
  end;

// *********************************************************************//
// DispIntf:  ConnectorFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493481-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ConnectorFormatDisp = dispinterface
    ['{91493481-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure BeginConnect(const ConnectedShape: Shape; ConnectionSite: SYSINT); dispid 10;
    procedure BeginDisconnect; dispid 11;
    procedure EndConnect(const ConnectedShape: Shape; ConnectionSite: SYSINT); dispid 12;
    procedure EndDisconnect; dispid 13;
    property BeginConnected: MsoTriState readonly dispid 100;
    property BeginConnectedShape: Shape readonly dispid 101;
    property BeginConnectionSite: SYSINT readonly dispid 102;
    property EndConnected: MsoTriState readonly dispid 103;
    property EndConnectedShape: Shape readonly dispid 104;
    property EndConnectionSite: SYSINT readonly dispid 105;
    property type_: MsoConnectorType dispid 106;
  end;

// *********************************************************************//
// Interface: TextEffectFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493482-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextEffectFormat = interface(IDispatch)
    ['{91493482-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure ToggleVerticalText; safecall;
    function Get_Alignment: MsoTextEffectAlignment; safecall;
    procedure Set_Alignment(Alignment: MsoTextEffectAlignment); safecall;
    function Get_FontBold: MsoTriState; safecall;
    procedure Set_FontBold(FontBold: MsoTriState); safecall;
    function Get_FontItalic: MsoTriState; safecall;
    procedure Set_FontItalic(FontItalic: MsoTriState); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const FontName: WideString); safecall;
    function Get_FontSize: Single; safecall;
    procedure Set_FontSize(FontSize: Single); safecall;
    function Get_KernedPairs: MsoTriState; safecall;
    procedure Set_KernedPairs(KernedPairs: MsoTriState); safecall;
    function Get_NormalizedHeight: MsoTriState; safecall;
    procedure Set_NormalizedHeight(NormalizedHeight: MsoTriState); safecall;
    function Get_PresetShape: MsoPresetTextEffectShape; safecall;
    procedure Set_PresetShape(PresetShape: MsoPresetTextEffectShape); safecall;
    function Get_PresetTextEffect: MsoPresetTextEffect; safecall;
    procedure Set_PresetTextEffect(Preset: MsoPresetTextEffect); safecall;
    function Get_RotatedChars: MsoTriState; safecall;
    procedure Set_RotatedChars(RotatedChars: MsoTriState); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Text: WideString); safecall;
    function Get_Tracking: Single; safecall;
    procedure Set_Tracking(Tracking: Single); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Alignment: MsoTextEffectAlignment read Get_Alignment write Set_Alignment;
    property FontBold: MsoTriState read Get_FontBold write Set_FontBold;
    property FontItalic: MsoTriState read Get_FontItalic write Set_FontItalic;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Single read Get_FontSize write Set_FontSize;
    property KernedPairs: MsoTriState read Get_KernedPairs write Set_KernedPairs;
    property NormalizedHeight: MsoTriState read Get_NormalizedHeight write Set_NormalizedHeight;
    property PresetShape: MsoPresetTextEffectShape read Get_PresetShape write Set_PresetShape;
    property PresetTextEffect: MsoPresetTextEffect read Get_PresetTextEffect write Set_PresetTextEffect;
    property RotatedChars: MsoTriState read Get_RotatedChars write Set_RotatedChars;
    property Text: WideString read Get_Text write Set_Text;
    property Tracking: Single read Get_Tracking write Set_Tracking;
  end;

// *********************************************************************//
// DispIntf:  TextEffectFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493482-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextEffectFormatDisp = dispinterface
    ['{91493482-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure ToggleVerticalText; dispid 10;
    property Alignment: MsoTextEffectAlignment dispid 100;
    property FontBold: MsoTriState dispid 101;
    property FontItalic: MsoTriState dispid 102;
    property FontName: WideString dispid 103;
    property FontSize: Single dispid 104;
    property KernedPairs: MsoTriState dispid 105;
    property NormalizedHeight: MsoTriState dispid 106;
    property PresetShape: MsoPresetTextEffectShape dispid 107;
    property PresetTextEffect: MsoPresetTextEffect dispid 108;
    property RotatedChars: MsoTriState dispid 109;
    property Text: WideString dispid 110;
    property Tracking: Single dispid 111;
  end;

// *********************************************************************//
// Interface: ThreeDFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493483-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ThreeDFormat = interface(IDispatch)
    ['{91493483-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure IncrementRotationX(Increment: Single); safecall;
    procedure IncrementRotationY(Increment: Single); safecall;
    procedure ResetRotation; safecall;
    procedure SetThreeDFormat(PresetThreeDFormat: MsoPresetThreeDFormat); safecall;
    procedure SetExtrusionDirection(PresetExtrusionDirection: MsoPresetExtrusionDirection); safecall;
    function Get_Depth: Single; safecall;
    procedure Set_Depth(Depth: Single); safecall;
    function Get_ExtrusionColor: ColorFormat; safecall;
    function Get_ExtrusionColorType: MsoExtrusionColorType; safecall;
    procedure Set_ExtrusionColorType(ExtrusionColorType: MsoExtrusionColorType); safecall;
    function Get_Perspective: MsoTriState; safecall;
    procedure Set_Perspective(Perspective: MsoTriState); safecall;
    function Get_PresetExtrusionDirection: MsoPresetExtrusionDirection; safecall;
    function Get_PresetLightingDirection: MsoPresetLightingDirection; safecall;
    procedure Set_PresetLightingDirection(PresetLightingDirection: MsoPresetLightingDirection); safecall;
    function Get_PresetLightingSoftness: MsoPresetLightingSoftness; safecall;
    procedure Set_PresetLightingSoftness(PresetLightingSoftness: MsoPresetLightingSoftness); safecall;
    function Get_PresetMaterial: MsoPresetMaterial; safecall;
    procedure Set_PresetMaterial(PresetMaterial: MsoPresetMaterial); safecall;
    function Get_PresetThreeDFormat: MsoPresetThreeDFormat; safecall;
    function Get_RotationX: Single; safecall;
    procedure Set_RotationX(RotationX: Single); safecall;
    function Get_RotationY: Single; safecall;
    procedure Set_RotationY(RotationY: Single); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    procedure SetPresetCamera(PresetCamera: MsoPresetCamera); safecall;
    procedure IncrementRotationZ(Increment: Single); safecall;
    procedure IncrementRotationHorizontal(Increment: Single); safecall;
    procedure IncrementRotationVertical(Increment: Single); safecall;
    function Get_PresetLighting: MsoLightRigType; safecall;
    procedure Set_PresetLighting(PresetLightRigType: MsoLightRigType); safecall;
    function Get_Z: Single; safecall;
    procedure Set_Z(Z: Single); safecall;
    function Get_BevelTopType: MsoBevelType; safecall;
    procedure Set_BevelTopType(BevelTopType: MsoBevelType); safecall;
    function Get_BevelTopInset: Single; safecall;
    procedure Set_BevelTopInset(BevelTopInset: Single); safecall;
    function Get_BevelTopDepth: Single; safecall;
    procedure Set_BevelTopDepth(BevelTopDepth: Single); safecall;
    function Get_BevelBottomType: MsoBevelType; safecall;
    procedure Set_BevelBottomType(BevelBottomType: MsoBevelType); safecall;
    function Get_BevelBottomInset: Single; safecall;
    procedure Set_BevelBottomInset(BevelBottomInset: Single); safecall;
    function Get_BevelBottomDepth: Single; safecall;
    procedure Set_BevelBottomDepth(BevelBottomDepth: Single); safecall;
    function Get_PresetCamera: MsoPresetCamera; safecall;
    function Get_RotationZ: Single; safecall;
    procedure Set_RotationZ(RotationZ: Single); safecall;
    function Get_ContourWidth: Single; safecall;
    procedure Set_ContourWidth(Width: Single); safecall;
    function Get_ContourColor: ColorFormat; safecall;
    function Get_FieldOfView: Single; safecall;
    procedure Set_FieldOfView(FOV: Single); safecall;
    function Get_ProjectText: MsoTriState; safecall;
    procedure Set_ProjectText(ProjectText: MsoTriState); safecall;
    function Get_LightAngle: Single; safecall;
    procedure Set_LightAngle(LightAngle: Single); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Depth: Single read Get_Depth write Set_Depth;
    property ExtrusionColor: ColorFormat read Get_ExtrusionColor;
    property ExtrusionColorType: MsoExtrusionColorType read Get_ExtrusionColorType write Set_ExtrusionColorType;
    property Perspective: MsoTriState read Get_Perspective write Set_Perspective;
    property PresetExtrusionDirection: MsoPresetExtrusionDirection read Get_PresetExtrusionDirection;
    property PresetLightingDirection: MsoPresetLightingDirection read Get_PresetLightingDirection write Set_PresetLightingDirection;
    property PresetLightingSoftness: MsoPresetLightingSoftness read Get_PresetLightingSoftness write Set_PresetLightingSoftness;
    property PresetMaterial: MsoPresetMaterial read Get_PresetMaterial write Set_PresetMaterial;
    property PresetThreeDFormat: MsoPresetThreeDFormat read Get_PresetThreeDFormat;
    property RotationX: Single read Get_RotationX write Set_RotationX;
    property RotationY: Single read Get_RotationY write Set_RotationY;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property PresetLighting: MsoLightRigType read Get_PresetLighting write Set_PresetLighting;
    property Z: Single read Get_Z write Set_Z;
    property BevelTopType: MsoBevelType read Get_BevelTopType write Set_BevelTopType;
    property BevelTopInset: Single read Get_BevelTopInset write Set_BevelTopInset;
    property BevelTopDepth: Single read Get_BevelTopDepth write Set_BevelTopDepth;
    property BevelBottomType: MsoBevelType read Get_BevelBottomType write Set_BevelBottomType;
    property BevelBottomInset: Single read Get_BevelBottomInset write Set_BevelBottomInset;
    property BevelBottomDepth: Single read Get_BevelBottomDepth write Set_BevelBottomDepth;
    property PresetCamera: MsoPresetCamera read Get_PresetCamera;
    property RotationZ: Single read Get_RotationZ write Set_RotationZ;
    property ContourWidth: Single read Get_ContourWidth write Set_ContourWidth;
    property ContourColor: ColorFormat read Get_ContourColor;
    property FieldOfView: Single read Get_FieldOfView write Set_FieldOfView;
    property ProjectText: MsoTriState read Get_ProjectText write Set_ProjectText;
    property LightAngle: Single read Get_LightAngle write Set_LightAngle;
  end;

// *********************************************************************//
// DispIntf:  ThreeDFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493483-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ThreeDFormatDisp = dispinterface
    ['{91493483-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure IncrementRotationX(Increment: Single); dispid 10;
    procedure IncrementRotationY(Increment: Single); dispid 11;
    procedure ResetRotation; dispid 12;
    procedure SetThreeDFormat(PresetThreeDFormat: MsoPresetThreeDFormat); dispid 13;
    procedure SetExtrusionDirection(PresetExtrusionDirection: MsoPresetExtrusionDirection); dispid 14;
    property Depth: Single dispid 100;
    property ExtrusionColor: ColorFormat readonly dispid 101;
    property ExtrusionColorType: MsoExtrusionColorType dispid 102;
    property Perspective: MsoTriState dispid 103;
    property PresetExtrusionDirection: MsoPresetExtrusionDirection readonly dispid 104;
    property PresetLightingDirection: MsoPresetLightingDirection dispid 105;
    property PresetLightingSoftness: MsoPresetLightingSoftness dispid 106;
    property PresetMaterial: MsoPresetMaterial dispid 107;
    property PresetThreeDFormat: MsoPresetThreeDFormat readonly dispid 108;
    property RotationX: Single dispid 109;
    property RotationY: Single dispid 110;
    property Visible: MsoTriState dispid 111;
    procedure SetPresetCamera(PresetCamera: MsoPresetCamera); dispid 15;
    procedure IncrementRotationZ(Increment: Single); dispid 16;
    procedure IncrementRotationHorizontal(Increment: Single); dispid 17;
    procedure IncrementRotationVertical(Increment: Single); dispid 18;
    property PresetLighting: MsoLightRigType dispid 112;
    property Z: Single dispid 113;
    property BevelTopType: MsoBevelType dispid 114;
    property BevelTopInset: Single dispid 115;
    property BevelTopDepth: Single dispid 116;
    property BevelBottomType: MsoBevelType dispid 117;
    property BevelBottomInset: Single dispid 118;
    property BevelBottomDepth: Single dispid 119;
    property PresetCamera: MsoPresetCamera readonly dispid 120;
    property RotationZ: Single dispid 121;
    property ContourWidth: Single dispid 122;
    property ContourColor: ColorFormat readonly dispid 123;
    property FieldOfView: Single dispid 124;
    property ProjectText: MsoTriState dispid 125;
    property LightAngle: Single dispid 126;
  end;

// *********************************************************************//
// Interface: TextFrame
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493484-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextFrame = interface(IDispatch)
    ['{91493484-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_MarginBottom: Single; safecall;
    procedure Set_MarginBottom(MarginBottom: Single); safecall;
    function Get_MarginLeft: Single; safecall;
    procedure Set_MarginLeft(MarginLeft: Single); safecall;
    function Get_MarginRight: Single; safecall;
    procedure Set_MarginRight(MarginRight: Single); safecall;
    function Get_MarginTop: Single; safecall;
    procedure Set_MarginTop(MarginTop: Single); safecall;
    function Get_Orientation: MsoTextOrientation; safecall;
    procedure Set_Orientation(Orientation: MsoTextOrientation); safecall;
    function Get_HasText: MsoTriState; safecall;
    function Get_TextRange: TextRange; safecall;
    function Get_Ruler: Ruler; safecall;
    function Get_HorizontalAnchor: MsoHorizontalAnchor; safecall;
    procedure Set_HorizontalAnchor(HorizontalAnchor: MsoHorizontalAnchor); safecall;
    function Get_VerticalAnchor: MsoVerticalAnchor; safecall;
    procedure Set_VerticalAnchor(VerticalAnchor: MsoVerticalAnchor); safecall;
    function Get_AutoSize: PpAutoSize; safecall;
    procedure Set_AutoSize(AutoSize: PpAutoSize); safecall;
    function Get_WordWrap: MsoTriState; safecall;
    procedure Set_WordWrap(WordWrap: MsoTriState); safecall;
    procedure DeleteText; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property MarginBottom: Single read Get_MarginBottom write Set_MarginBottom;
    property MarginLeft: Single read Get_MarginLeft write Set_MarginLeft;
    property MarginRight: Single read Get_MarginRight write Set_MarginRight;
    property MarginTop: Single read Get_MarginTop write Set_MarginTop;
    property Orientation: MsoTextOrientation read Get_Orientation write Set_Orientation;
    property HasText: MsoTriState read Get_HasText;
    property TextRange: TextRange read Get_TextRange;
    property Ruler: Ruler read Get_Ruler;
    property HorizontalAnchor: MsoHorizontalAnchor read Get_HorizontalAnchor write Set_HorizontalAnchor;
    property VerticalAnchor: MsoVerticalAnchor read Get_VerticalAnchor write Set_VerticalAnchor;
    property AutoSize: PpAutoSize read Get_AutoSize write Set_AutoSize;
    property WordWrap: MsoTriState read Get_WordWrap write Set_WordWrap;
  end;

// *********************************************************************//
// DispIntf:  TextFrameDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493484-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextFrameDisp = dispinterface
    ['{91493484-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property MarginBottom: Single dispid 100;
    property MarginLeft: Single dispid 101;
    property MarginRight: Single dispid 102;
    property MarginTop: Single dispid 103;
    property Orientation: MsoTextOrientation dispid 104;
    property HasText: MsoTriState readonly dispid 2003;
    property TextRange: TextRange readonly dispid 2004;
    property Ruler: Ruler readonly dispid 2005;
    property HorizontalAnchor: MsoHorizontalAnchor dispid 2006;
    property VerticalAnchor: MsoVerticalAnchor dispid 2007;
    property AutoSize: PpAutoSize dispid 2008;
    property WordWrap: MsoTriState dispid 2009;
    procedure DeleteText; dispid 2010;
  end;

// *********************************************************************//
// Interface: CalloutFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493485-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CalloutFormat = interface(IDispatch)
    ['{91493485-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure AutomaticLength; safecall;
    procedure CustomDrop(Drop: Single); safecall;
    procedure CustomLength(Length: Single); safecall;
    procedure PresetDrop(DropType: MsoCalloutDropType); safecall;
    function Get_Accent: MsoTriState; safecall;
    procedure Set_Accent(Accent: MsoTriState); safecall;
    function Get_Angle: MsoCalloutAngleType; safecall;
    procedure Set_Angle(Angle: MsoCalloutAngleType); safecall;
    function Get_AutoAttach: MsoTriState; safecall;
    procedure Set_AutoAttach(AutoAttach: MsoTriState); safecall;
    function Get_AutoLength: MsoTriState; safecall;
    function Get_Border: MsoTriState; safecall;
    procedure Set_Border(Border: MsoTriState); safecall;
    function Get_Drop: Single; safecall;
    function Get_DropType: MsoCalloutDropType; safecall;
    function Get_Gap: Single; safecall;
    procedure Set_Gap(Gap: Single); safecall;
    function Get_Length: Single; safecall;
    function Get_type_: MsoCalloutType; safecall;
    procedure Set_type_(Type_: MsoCalloutType); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Accent: MsoTriState read Get_Accent write Set_Accent;
    property Angle: MsoCalloutAngleType read Get_Angle write Set_Angle;
    property AutoAttach: MsoTriState read Get_AutoAttach write Set_AutoAttach;
    property AutoLength: MsoTriState read Get_AutoLength;
    property Border: MsoTriState read Get_Border write Set_Border;
    property Drop: Single read Get_Drop;
    property DropType: MsoCalloutDropType read Get_DropType;
    property Gap: Single read Get_Gap write Set_Gap;
    property Length: Single read Get_Length;
    property type_: MsoCalloutType read Get_type_ write Set_type_;
  end;

// *********************************************************************//
// DispIntf:  CalloutFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493485-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CalloutFormatDisp = dispinterface
    ['{91493485-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    procedure AutomaticLength; dispid 10;
    procedure CustomDrop(Drop: Single); dispid 11;
    procedure CustomLength(Length: Single); dispid 12;
    procedure PresetDrop(DropType: MsoCalloutDropType); dispid 13;
    property Accent: MsoTriState dispid 100;
    property Angle: MsoCalloutAngleType dispid 101;
    property AutoAttach: MsoTriState dispid 102;
    property AutoLength: MsoTriState readonly dispid 103;
    property Border: MsoTriState dispid 104;
    property Drop: Single readonly dispid 105;
    property DropType: MsoCalloutDropType readonly dispid 106;
    property Gap: Single dispid 107;
    property Length: Single readonly dispid 108;
    property type_: MsoCalloutType dispid 109;
  end;

// *********************************************************************//
// Interface: ShapeNodes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493486-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeNodes = interface(IDispatch)
    ['{91493486-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    function Item(Index: OleVariant): ShapeNode; safecall;
    function Get__NewEnum: IUnknown; safecall;
    procedure Delete(Index: SYSINT); safecall;
    procedure Insert(Index: SYSINT; SegmentType: MsoSegmentType; EditingType: MsoEditingType; 
                     X1: Single; Y1: Single; X2: Single; Y2: Single; X3: Single; Y3: Single); safecall;
    procedure SetEditingType(Index: SYSINT; EditingType: MsoEditingType); safecall;
    procedure SetPosition(Index: SYSINT; X1: Single; Y1: Single); safecall;
    procedure SetSegmentType(Index: SYSINT; SegmentType: MsoSegmentType); safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ShapeNodesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493486-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeNodesDisp = dispinterface
    ['{91493486-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property Count: SYSINT readonly dispid 2;
    function Item(Index: OleVariant): ShapeNode; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    procedure Delete(Index: SYSINT); dispid 11;
    procedure Insert(Index: SYSINT; SegmentType: MsoSegmentType; EditingType: MsoEditingType; 
                     X1: Single; Y1: Single; X2: Single; Y2: Single; X3: Single; Y3: Single); dispid 12;
    procedure SetEditingType(Index: SYSINT; EditingType: MsoEditingType); dispid 13;
    procedure SetPosition(Index: SYSINT; X1: Single; Y1: Single); dispid 14;
    procedure SetSegmentType(Index: SYSINT; SegmentType: MsoSegmentType); dispid 15;
  end;

// *********************************************************************//
// Interface: ShapeNode
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493487-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeNode = interface(IDispatch)
    ['{91493487-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_EditingType: MsoEditingType; safecall;
    function Get_Points: OleVariant; safecall;
    function Get_SegmentType: MsoSegmentType; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property EditingType: MsoEditingType read Get_EditingType;
    property Points: OleVariant read Get_Points;
    property SegmentType: MsoSegmentType read Get_SegmentType;
  end;

// *********************************************************************//
// DispIntf:  ShapeNodeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493487-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ShapeNodeDisp = dispinterface
    ['{91493487-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property EditingType: MsoEditingType readonly dispid 100;
    property Points: OleVariant readonly dispid 101;
    property SegmentType: MsoSegmentType readonly dispid 102;
  end;

// *********************************************************************//
// Interface: OLEFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493488-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  OLEFormat = interface(IDispatch)
    ['{91493488-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ObjectVerbs: ObjectVerbs; safecall;
    function Get_Object_: IDispatch; safecall;
    function Get_ProgID: WideString; safecall;
    function Get_FollowColors: PpFollowColors; safecall;
    procedure Set_FollowColors(FollowColors: PpFollowColors); safecall;
    procedure DoVerb(Index: SYSINT); safecall;
    procedure Activate; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ObjectVerbs: ObjectVerbs read Get_ObjectVerbs;
    property Object_: IDispatch read Get_Object_;
    property ProgID: WideString read Get_ProgID;
    property FollowColors: PpFollowColors read Get_FollowColors write Set_FollowColors;
  end;

// *********************************************************************//
// DispIntf:  OLEFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493488-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  OLEFormatDisp = dispinterface
    ['{91493488-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property ObjectVerbs: ObjectVerbs readonly dispid 2003;
    property Object_: IDispatch readonly dispid 2004;
    property ProgID: WideString readonly dispid 2005;
    property FollowColors: PpFollowColors dispid 2006;
    procedure DoVerb(Index: SYSINT); dispid 2007;
    procedure Activate; dispid 2008;
  end;

// *********************************************************************//
// Interface: LinkFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493489-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  LinkFormat = interface(IDispatch)
    ['{91493489-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_SourceFullName: WideString; safecall;
    procedure Set_SourceFullName(const SourceFullName: WideString); safecall;
    function Get_AutoUpdate: PpUpdateOption; safecall;
    procedure Set_AutoUpdate(AutoUpdate: PpUpdateOption); safecall;
    procedure Update; safecall;
    procedure BreakLink; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property SourceFullName: WideString read Get_SourceFullName write Set_SourceFullName;
    property AutoUpdate: PpUpdateOption read Get_AutoUpdate write Set_AutoUpdate;
  end;

// *********************************************************************//
// DispIntf:  LinkFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493489-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  LinkFormatDisp = dispinterface
    ['{91493489-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property SourceFullName: WideString dispid 2003;
    property AutoUpdate: PpUpdateOption dispid 2004;
    procedure Update; dispid 2005;
    procedure BreakLink; dispid 2006;
  end;

// *********************************************************************//
// Interface: ObjectVerbs
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ObjectVerbs = interface(Collection)
    ['{9149348A-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): WideString; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ObjectVerbsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ObjectVerbsDisp = dispinterface
    ['{9149348A-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): WideString; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: AnimationSettings
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationSettings = interface(IDispatch)
    ['{9149348B-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_DimColor: ColorFormat; safecall;
    function Get_SoundEffect: SoundEffect; safecall;
    function Get_EntryEffect: PpEntryEffect; safecall;
    procedure Set_EntryEffect(EntryEffect: PpEntryEffect); safecall;
    function Get_AfterEffect: PpAfterEffect; safecall;
    procedure Set_AfterEffect(AfterEffect: PpAfterEffect); safecall;
    function Get_AnimationOrder: SYSINT; safecall;
    procedure Set_AnimationOrder(AnimationOrder: SYSINT); safecall;
    function Get_AdvanceMode: PpAdvanceMode; safecall;
    procedure Set_AdvanceMode(AdvanceMode: PpAdvanceMode); safecall;
    function Get_AdvanceTime: Single; safecall;
    procedure Set_AdvanceTime(AdvanceTime: Single); safecall;
    function Get_PlaySettings: PlaySettings; safecall;
    function Get_TextLevelEffect: PpTextLevelEffect; safecall;
    procedure Set_TextLevelEffect(TextLevelEffect: PpTextLevelEffect); safecall;
    function Get_TextUnitEffect: PpTextUnitEffect; safecall;
    procedure Set_TextUnitEffect(TextUnitEffect: PpTextUnitEffect); safecall;
    function Get_Animate: MsoTriState; safecall;
    procedure Set_Animate(Animate: MsoTriState); safecall;
    function Get_AnimateBackground: MsoTriState; safecall;
    procedure Set_AnimateBackground(AnimateBackground: MsoTriState); safecall;
    function Get_AnimateTextInReverse: MsoTriState; safecall;
    procedure Set_AnimateTextInReverse(AnimateTextInReverse: MsoTriState); safecall;
    function Get_ChartUnitEffect: PpChartUnitEffect; safecall;
    procedure Set_ChartUnitEffect(ChartUnitEffect: PpChartUnitEffect); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property DimColor: ColorFormat read Get_DimColor;
    property SoundEffect: SoundEffect read Get_SoundEffect;
    property EntryEffect: PpEntryEffect read Get_EntryEffect write Set_EntryEffect;
    property AfterEffect: PpAfterEffect read Get_AfterEffect write Set_AfterEffect;
    property AnimationOrder: SYSINT read Get_AnimationOrder write Set_AnimationOrder;
    property AdvanceMode: PpAdvanceMode read Get_AdvanceMode write Set_AdvanceMode;
    property AdvanceTime: Single read Get_AdvanceTime write Set_AdvanceTime;
    property PlaySettings: PlaySettings read Get_PlaySettings;
    property TextLevelEffect: PpTextLevelEffect read Get_TextLevelEffect write Set_TextLevelEffect;
    property TextUnitEffect: PpTextUnitEffect read Get_TextUnitEffect write Set_TextUnitEffect;
    property Animate: MsoTriState read Get_Animate write Set_Animate;
    property AnimateBackground: MsoTriState read Get_AnimateBackground write Set_AnimateBackground;
    property AnimateTextInReverse: MsoTriState read Get_AnimateTextInReverse write Set_AnimateTextInReverse;
    property ChartUnitEffect: PpChartUnitEffect read Get_ChartUnitEffect write Set_ChartUnitEffect;
  end;

// *********************************************************************//
// DispIntf:  AnimationSettingsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationSettingsDisp = dispinterface
    ['{9149348B-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property DimColor: ColorFormat readonly dispid 2003;
    property SoundEffect: SoundEffect readonly dispid 2004;
    property EntryEffect: PpEntryEffect dispid 2005;
    property AfterEffect: PpAfterEffect dispid 2006;
    property AnimationOrder: SYSINT dispid 2007;
    property AdvanceMode: PpAdvanceMode dispid 2008;
    property AdvanceTime: Single dispid 2009;
    property PlaySettings: PlaySettings readonly dispid 2010;
    property TextLevelEffect: PpTextLevelEffect dispid 2011;
    property TextUnitEffect: PpTextUnitEffect dispid 2012;
    property Animate: MsoTriState dispid 2013;
    property AnimateBackground: MsoTriState dispid 2014;
    property AnimateTextInReverse: MsoTriState dispid 2015;
    property ChartUnitEffect: PpChartUnitEffect dispid 2016;
  end;

// *********************************************************************//
// Interface: ActionSettings
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ActionSettings = interface(Collection)
    ['{9149348C-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: PpMouseActivation): ActionSetting; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ActionSettingsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ActionSettingsDisp = dispinterface
    ['{9149348C-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: PpMouseActivation): ActionSetting; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: ActionSetting
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ActionSetting = interface(IDispatch)
    ['{9149348D-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Action: PpActionType; safecall;
    procedure Set_Action(Action: PpActionType); safecall;
    function Get_ActionVerb: WideString; safecall;
    procedure Set_ActionVerb(const ActionVerb: WideString); safecall;
    function Get_AnimateAction: MsoTriState; safecall;
    procedure Set_AnimateAction(AnimateAction: MsoTriState); safecall;
    function Get_Run: WideString; safecall;
    procedure Set_Run(const Run: WideString); safecall;
    function Get_SlideShowName: WideString; safecall;
    procedure Set_SlideShowName(const SlideShowName: WideString); safecall;
    function Get_Hyperlink: Hyperlink; safecall;
    function Get_SoundEffect: SoundEffect; safecall;
    function Get_ShowAndReturn: MsoTriState; safecall;
    procedure Set_ShowAndReturn(ShowAndReturn: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Action: PpActionType read Get_Action write Set_Action;
    property ActionVerb: WideString read Get_ActionVerb write Set_ActionVerb;
    property AnimateAction: MsoTriState read Get_AnimateAction write Set_AnimateAction;
    property Run: WideString read Get_Run write Set_Run;
    property SlideShowName: WideString read Get_SlideShowName write Set_SlideShowName;
    property Hyperlink: Hyperlink read Get_Hyperlink;
    property SoundEffect: SoundEffect read Get_SoundEffect;
    property ShowAndReturn: MsoTriState read Get_ShowAndReturn write Set_ShowAndReturn;
  end;

// *********************************************************************//
// DispIntf:  ActionSettingDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348D-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ActionSettingDisp = dispinterface
    ['{9149348D-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Action: PpActionType dispid 2003;
    property ActionVerb: WideString dispid 2004;
    property AnimateAction: MsoTriState dispid 2005;
    property Run: WideString dispid 2006;
    property SlideShowName: WideString dispid 2007;
    property Hyperlink: Hyperlink readonly dispid 2008;
    property SoundEffect: SoundEffect readonly dispid 2009;
    property ShowAndReturn: MsoTriState dispid 2010;
  end;

// *********************************************************************//
// Interface: PlaySettings
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PlaySettings = interface(IDispatch)
    ['{9149348E-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ActionVerb: WideString; safecall;
    procedure Set_ActionVerb(const ActionVerb: WideString); safecall;
    function Get_HideWhileNotPlaying: MsoTriState; safecall;
    procedure Set_HideWhileNotPlaying(HideWhileNotPlaying: MsoTriState); safecall;
    function Get_LoopUntilStopped: MsoTriState; safecall;
    procedure Set_LoopUntilStopped(LoopUntilStopped: MsoTriState); safecall;
    function Get_PlayOnEntry: MsoTriState; safecall;
    procedure Set_PlayOnEntry(PlayOnEntry: MsoTriState); safecall;
    function Get_RewindMovie: MsoTriState; safecall;
    procedure Set_RewindMovie(RewindMovie: MsoTriState); safecall;
    function Get_PauseAnimation: MsoTriState; safecall;
    procedure Set_PauseAnimation(PauseAnimation: MsoTriState); safecall;
    function Get_StopAfterSlides: SYSINT; safecall;
    procedure Set_StopAfterSlides(StopAfterSlides: SYSINT); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ActionVerb: WideString read Get_ActionVerb write Set_ActionVerb;
    property HideWhileNotPlaying: MsoTriState read Get_HideWhileNotPlaying write Set_HideWhileNotPlaying;
    property LoopUntilStopped: MsoTriState read Get_LoopUntilStopped write Set_LoopUntilStopped;
    property PlayOnEntry: MsoTriState read Get_PlayOnEntry write Set_PlayOnEntry;
    property RewindMovie: MsoTriState read Get_RewindMovie write Set_RewindMovie;
    property PauseAnimation: MsoTriState read Get_PauseAnimation write Set_PauseAnimation;
    property StopAfterSlides: SYSINT read Get_StopAfterSlides write Set_StopAfterSlides;
  end;

// *********************************************************************//
// DispIntf:  PlaySettingsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348E-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PlaySettingsDisp = dispinterface
    ['{9149348E-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property ActionVerb: WideString dispid 2003;
    property HideWhileNotPlaying: MsoTriState dispid 2004;
    property LoopUntilStopped: MsoTriState dispid 2005;
    property PlayOnEntry: MsoTriState dispid 2006;
    property RewindMovie: MsoTriState dispid 2007;
    property PauseAnimation: MsoTriState dispid 2008;
    property StopAfterSlides: SYSINT dispid 2009;
  end;

// *********************************************************************//
// Interface: TextRange
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextRange = interface(Collection)
    ['{9149348F-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ActionSettings: ActionSettings; safecall;
    function Get_Start: Integer; safecall;
    function Get_Length: Integer; safecall;
    function Get_BoundLeft: Single; safecall;
    function Get_BoundTop: Single; safecall;
    function Get_BoundWidth: Single; safecall;
    function Get_BoundHeight: Single; safecall;
    function Paragraphs(Start: SYSINT; Length: SYSINT): TextRange; safecall;
    function Sentences(Start: SYSINT; Length: SYSINT): TextRange; safecall;
    function Words(Start: SYSINT; Length: SYSINT): TextRange; safecall;
    function Characters(Start: SYSINT; Length: SYSINT): TextRange; safecall;
    function Lines(Start: SYSINT; Length: SYSINT): TextRange; safecall;
    function Runs(Start: SYSINT; Length: SYSINT): TextRange; safecall;
    function TrimText: TextRange; safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Text: WideString); safecall;
    function InsertAfter(const NewText: WideString): TextRange; safecall;
    function InsertBefore(const NewText: WideString): TextRange; safecall;
    function InsertDateTime(DateTimeFormat: PpDateTimeFormat; InsertAsField: MsoTriState): TextRange; safecall;
    function InsertSlideNumber: TextRange; safecall;
    function InsertSymbol(const FontName: WideString; CharNumber: SYSINT; Unicode: MsoTriState): TextRange; safecall;
    function Get_Font: Font; safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    function Get_IndentLevel: SYSINT; safecall;
    procedure Set_IndentLevel(IndentLevel: SYSINT); safecall;
    procedure Select; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Delete; safecall;
    function Paste: TextRange; safecall;
    procedure ChangeCase(Type_: PpChangeCase); safecall;
    procedure AddPeriods; safecall;
    procedure RemovePeriods; safecall;
    function Find(const FindWhat: WideString; After: SYSINT; MatchCase: MsoTriState; 
                  WholeWords: MsoTriState): TextRange; safecall;
    function Replace(const FindWhat: WideString; const ReplaceWhat: WideString; After: SYSINT; 
                     MatchCase: MsoTriState; WholeWords: MsoTriState): TextRange; safecall;
    procedure RotatedBounds(out X1: Single; out Y1: Single; out X2: Single; out Y2: Single; 
                            out X3: Single; out Y3: Single; out x4: Single; out y4: Single); safecall;
    function Get_LanguageID: MsoLanguageID; safecall;
    procedure Set_LanguageID(LanguageID: MsoLanguageID); safecall;
    procedure RtlRun; safecall;
    procedure LtrRun; safecall;
    function PasteSpecial(DataType: PpPasteDataType; DisplayAsIcon: MsoTriState; 
                          const IconFileName: WideString; IconIndex: SYSINT; 
                          const IconLabel: WideString; Link: MsoTriState): TextRange; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ActionSettings: ActionSettings read Get_ActionSettings;
    property Start: Integer read Get_Start;
    property Length: Integer read Get_Length;
    property BoundLeft: Single read Get_BoundLeft;
    property BoundTop: Single read Get_BoundTop;
    property BoundWidth: Single read Get_BoundWidth;
    property BoundHeight: Single read Get_BoundHeight;
    property Text: WideString read Get_Text write Set_Text;
    property Font: Font read Get_Font;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat;
    property IndentLevel: SYSINT read Get_IndentLevel write Set_IndentLevel;
    property LanguageID: MsoLanguageID read Get_LanguageID write Set_LanguageID;
  end;

// *********************************************************************//
// DispIntf:  TextRangeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149348F-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextRangeDisp = dispinterface
    ['{9149348F-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property ActionSettings: ActionSettings readonly dispid 2003;
    property Start: Integer readonly dispid 2004;
    property Length: Integer readonly dispid 2005;
    property BoundLeft: Single readonly dispid 2006;
    property BoundTop: Single readonly dispid 2007;
    property BoundWidth: Single readonly dispid 2008;
    property BoundHeight: Single readonly dispid 2009;
    function Paragraphs(Start: SYSINT; Length: SYSINT): TextRange; dispid 2010;
    function Sentences(Start: SYSINT; Length: SYSINT): TextRange; dispid 2011;
    function Words(Start: SYSINT; Length: SYSINT): TextRange; dispid 2012;
    function Characters(Start: SYSINT; Length: SYSINT): TextRange; dispid 2013;
    function Lines(Start: SYSINT; Length: SYSINT): TextRange; dispid 2014;
    function Runs(Start: SYSINT; Length: SYSINT): TextRange; dispid 2015;
    function TrimText: TextRange; dispid 2016;
    property Text: WideString dispid 0;
    function InsertAfter(const NewText: WideString): TextRange; dispid 2017;
    function InsertBefore(const NewText: WideString): TextRange; dispid 2018;
    function InsertDateTime(DateTimeFormat: PpDateTimeFormat; InsertAsField: MsoTriState): TextRange; dispid 2019;
    function InsertSlideNumber: TextRange; dispid 2020;
    function InsertSymbol(const FontName: WideString; CharNumber: SYSINT; Unicode: MsoTriState): TextRange; dispid 2021;
    property Font: Font readonly dispid 2022;
    property ParagraphFormat: ParagraphFormat readonly dispid 2023;
    property IndentLevel: SYSINT dispid 2024;
    procedure Select; dispid 2025;
    procedure Cut; dispid 2026;
    procedure Copy; dispid 2027;
    procedure Delete; dispid 2028;
    function Paste: TextRange; dispid 2029;
    procedure ChangeCase(Type_: PpChangeCase); dispid 2030;
    procedure AddPeriods; dispid 2031;
    procedure RemovePeriods; dispid 2032;
    function Find(const FindWhat: WideString; After: SYSINT; MatchCase: MsoTriState; 
                  WholeWords: MsoTriState): TextRange; dispid 2033;
    function Replace(const FindWhat: WideString; const ReplaceWhat: WideString; After: SYSINT; 
                     MatchCase: MsoTriState; WholeWords: MsoTriState): TextRange; dispid 2034;
    procedure RotatedBounds(out X1: Single; out Y1: Single; out X2: Single; out Y2: Single; 
                            out X3: Single; out Y3: Single; out x4: Single; out y4: Single); dispid 2035;
    property LanguageID: MsoLanguageID dispid 2036;
    procedure RtlRun; dispid 2037;
    procedure LtrRun; dispid 2038;
    function PasteSpecial(DataType: PpPasteDataType; DisplayAsIcon: MsoTriState; 
                          const IconFileName: WideString; IconIndex: SYSINT; 
                          const IconLabel: WideString; Link: MsoTriState): TextRange; dispid 2039;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Ruler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493490-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Ruler = interface(IDispatch)
    ['{91493490-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_TabStops: TabStops; safecall;
    function Get_Levels: RulerLevels; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property TabStops: TabStops read Get_TabStops;
    property Levels: RulerLevels read Get_Levels;
  end;

// *********************************************************************//
// DispIntf:  RulerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493490-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RulerDisp = dispinterface
    ['{91493490-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property TabStops: TabStops readonly dispid 2003;
    property Levels: RulerLevels readonly dispid 2004;
  end;

// *********************************************************************//
// Interface: RulerLevels
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493491-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RulerLevels = interface(Collection)
    ['{91493491-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): RulerLevel; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  RulerLevelsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493491-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RulerLevelsDisp = dispinterface
    ['{91493491-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): RulerLevel; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: RulerLevel
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493492-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RulerLevel = interface(IDispatch)
    ['{91493492-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_FirstMargin: Single; safecall;
    procedure Set_FirstMargin(FirstMargin: Single); safecall;
    function Get_LeftMargin: Single; safecall;
    procedure Set_LeftMargin(LeftMargin: Single); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property FirstMargin: Single read Get_FirstMargin write Set_FirstMargin;
    property LeftMargin: Single read Get_LeftMargin write Set_LeftMargin;
  end;

// *********************************************************************//
// DispIntf:  RulerLevelDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493492-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RulerLevelDisp = dispinterface
    ['{91493492-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property FirstMargin: Single dispid 2003;
    property LeftMargin: Single dispid 2004;
  end;

// *********************************************************************//
// Interface: TabStops
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493493-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TabStops = interface(Collection)
    ['{91493493-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): TabStop; safecall;
    function Get_DefaultSpacing: Single; safecall;
    procedure Set_DefaultSpacing(DefaultSpacing: Single); safecall;
    function Add(Type_: PpTabStopType; Position: Single): TabStop; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property DefaultSpacing: Single read Get_DefaultSpacing write Set_DefaultSpacing;
  end;

// *********************************************************************//
// DispIntf:  TabStopsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493493-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TabStopsDisp = dispinterface
    ['{91493493-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): TabStop; dispid 0;
    property DefaultSpacing: Single dispid 2003;
    function Add(Type_: PpTabStopType; Position: Single): TabStop; dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: TabStop
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493494-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TabStop = interface(IDispatch)
    ['{91493494-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_type_: PpTabStopType; safecall;
    procedure Set_type_(Type_: PpTabStopType); safecall;
    function Get_Position: Single; safecall;
    procedure Set_Position(Position: Single); safecall;
    procedure Clear; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: PpTabStopType read Get_type_ write Set_type_;
    property Position: Single read Get_Position write Set_Position;
  end;

// *********************************************************************//
// DispIntf:  TabStopDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493494-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TabStopDisp = dispinterface
    ['{91493494-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property type_: PpTabStopType dispid 2003;
    property Position: Single dispid 2004;
    procedure Clear; dispid 2005;
  end;

// *********************************************************************//
// Interface: Font
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493495-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Font = interface(IDispatch)
    ['{91493495-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Color: ColorFormat; safecall;
    function Get_Bold: MsoTriState; safecall;
    procedure Set_Bold(Bold: MsoTriState); safecall;
    function Get_Italic: MsoTriState; safecall;
    procedure Set_Italic(Italic: MsoTriState); safecall;
    function Get_Shadow: MsoTriState; safecall;
    procedure Set_Shadow(Shadow: MsoTriState); safecall;
    function Get_Emboss: MsoTriState; safecall;
    procedure Set_Emboss(Emboss: MsoTriState); safecall;
    function Get_Underline: MsoTriState; safecall;
    procedure Set_Underline(Underline: MsoTriState); safecall;
    function Get_Subscript: MsoTriState; safecall;
    procedure Set_Subscript(Subscript: MsoTriState); safecall;
    function Get_Superscript: MsoTriState; safecall;
    procedure Set_Superscript(Superscript: MsoTriState); safecall;
    function Get_BaselineOffset: Single; safecall;
    procedure Set_BaselineOffset(BaselineOffset: Single); safecall;
    function Get_Embedded: MsoTriState; safecall;
    function Get_Embeddable: MsoTriState; safecall;
    function Get_Size: Single; safecall;
    procedure Set_Size(Size: Single); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_NameFarEast: WideString; safecall;
    procedure Set_NameFarEast(const NameFarEast: WideString); safecall;
    function Get_NameAscii: WideString; safecall;
    procedure Set_NameAscii(const NameAscii: WideString); safecall;
    function Get_AutoRotateNumbers: MsoTriState; safecall;
    procedure Set_AutoRotateNumbers(AutoRotateNumbers: MsoTriState); safecall;
    function Get_NameOther: WideString; safecall;
    procedure Set_NameOther(const NameOther: WideString); safecall;
    function Get_NameComplexScript: WideString; safecall;
    procedure Set_NameComplexScript(const NameComplexScript: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Color: ColorFormat read Get_Color;
    property Bold: MsoTriState read Get_Bold write Set_Bold;
    property Italic: MsoTriState read Get_Italic write Set_Italic;
    property Shadow: MsoTriState read Get_Shadow write Set_Shadow;
    property Emboss: MsoTriState read Get_Emboss write Set_Emboss;
    property Underline: MsoTriState read Get_Underline write Set_Underline;
    property Subscript: MsoTriState read Get_Subscript write Set_Subscript;
    property Superscript: MsoTriState read Get_Superscript write Set_Superscript;
    property BaselineOffset: Single read Get_BaselineOffset write Set_BaselineOffset;
    property Embedded: MsoTriState read Get_Embedded;
    property Embeddable: MsoTriState read Get_Embeddable;
    property Size: Single read Get_Size write Set_Size;
    property Name: WideString read Get_Name write Set_Name;
    property NameFarEast: WideString read Get_NameFarEast write Set_NameFarEast;
    property NameAscii: WideString read Get_NameAscii write Set_NameAscii;
    property AutoRotateNumbers: MsoTriState read Get_AutoRotateNumbers write Set_AutoRotateNumbers;
    property NameOther: WideString read Get_NameOther write Set_NameOther;
    property NameComplexScript: WideString read Get_NameComplexScript write Set_NameComplexScript;
  end;

// *********************************************************************//
// DispIntf:  FontDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493495-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FontDisp = dispinterface
    ['{91493495-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Color: ColorFormat readonly dispid 2003;
    property Bold: MsoTriState dispid 2004;
    property Italic: MsoTriState dispid 2005;
    property Shadow: MsoTriState dispid 2006;
    property Emboss: MsoTriState dispid 2007;
    property Underline: MsoTriState dispid 2008;
    property Subscript: MsoTriState dispid 2009;
    property Superscript: MsoTriState dispid 2010;
    property BaselineOffset: Single dispid 2011;
    property Embedded: MsoTriState readonly dispid 2012;
    property Embeddable: MsoTriState readonly dispid 2013;
    property Size: Single dispid 2014;
    property Name: WideString dispid 2015;
    property NameFarEast: WideString dispid 2016;
    property NameAscii: WideString dispid 2017;
    property AutoRotateNumbers: MsoTriState dispid 2018;
    property NameOther: WideString dispid 2019;
    property NameComplexScript: WideString dispid 2020;
  end;

// *********************************************************************//
// Interface: ParagraphFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493496-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ParagraphFormat = interface(IDispatch)
    ['{91493496-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Alignment: PpParagraphAlignment; safecall;
    procedure Set_Alignment(Alignment: PpParagraphAlignment); safecall;
    function Get_Bullet: BulletFormat; safecall;
    function Get_LineRuleBefore: MsoTriState; safecall;
    procedure Set_LineRuleBefore(LineRuleBefore: MsoTriState); safecall;
    function Get_LineRuleAfter: MsoTriState; safecall;
    procedure Set_LineRuleAfter(LineRuleAfter: MsoTriState); safecall;
    function Get_LineRuleWithin: MsoTriState; safecall;
    procedure Set_LineRuleWithin(LineRuleWithin: MsoTriState); safecall;
    function Get_SpaceBefore: Single; safecall;
    procedure Set_SpaceBefore(SpaceBefore: Single); safecall;
    function Get_SpaceAfter: Single; safecall;
    procedure Set_SpaceAfter(SpaceAfter: Single); safecall;
    function Get_SpaceWithin: Single; safecall;
    procedure Set_SpaceWithin(SpaceWithin: Single); safecall;
    function Get_BaseLineAlignment: PpBaselineAlignment; safecall;
    procedure Set_BaseLineAlignment(BaseLineAlignment: PpBaselineAlignment); safecall;
    function Get_FarEastLineBreakControl: MsoTriState; safecall;
    procedure Set_FarEastLineBreakControl(FarEastLineBreakControl: MsoTriState); safecall;
    function Get_WordWrap: MsoTriState; safecall;
    procedure Set_WordWrap(WordWrap: MsoTriState); safecall;
    function Get_HangingPunctuation: MsoTriState; safecall;
    procedure Set_HangingPunctuation(HangingPunctuation: MsoTriState); safecall;
    function Get_TextDirection: PpDirection; safecall;
    procedure Set_TextDirection(TextDirection: PpDirection); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Alignment: PpParagraphAlignment read Get_Alignment write Set_Alignment;
    property Bullet: BulletFormat read Get_Bullet;
    property LineRuleBefore: MsoTriState read Get_LineRuleBefore write Set_LineRuleBefore;
    property LineRuleAfter: MsoTriState read Get_LineRuleAfter write Set_LineRuleAfter;
    property LineRuleWithin: MsoTriState read Get_LineRuleWithin write Set_LineRuleWithin;
    property SpaceBefore: Single read Get_SpaceBefore write Set_SpaceBefore;
    property SpaceAfter: Single read Get_SpaceAfter write Set_SpaceAfter;
    property SpaceWithin: Single read Get_SpaceWithin write Set_SpaceWithin;
    property BaseLineAlignment: PpBaselineAlignment read Get_BaseLineAlignment write Set_BaseLineAlignment;
    property FarEastLineBreakControl: MsoTriState read Get_FarEastLineBreakControl write Set_FarEastLineBreakControl;
    property WordWrap: MsoTriState read Get_WordWrap write Set_WordWrap;
    property HangingPunctuation: MsoTriState read Get_HangingPunctuation write Set_HangingPunctuation;
    property TextDirection: PpDirection read Get_TextDirection write Set_TextDirection;
  end;

// *********************************************************************//
// DispIntf:  ParagraphFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493496-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ParagraphFormatDisp = dispinterface
    ['{91493496-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Alignment: PpParagraphAlignment dispid 2003;
    property Bullet: BulletFormat readonly dispid 2004;
    property LineRuleBefore: MsoTriState dispid 2005;
    property LineRuleAfter: MsoTriState dispid 2006;
    property LineRuleWithin: MsoTriState dispid 2007;
    property SpaceBefore: Single dispid 2008;
    property SpaceAfter: Single dispid 2009;
    property SpaceWithin: Single dispid 2010;
    property BaseLineAlignment: PpBaselineAlignment dispid 2011;
    property FarEastLineBreakControl: MsoTriState dispid 2012;
    property WordWrap: MsoTriState dispid 2013;
    property HangingPunctuation: MsoTriState dispid 2014;
    property TextDirection: PpDirection dispid 2015;
  end;

// *********************************************************************//
// Interface: BulletFormat
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493497-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  BulletFormat = interface(IDispatch)
    ['{91493497-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_Character: SYSINT; safecall;
    procedure Set_Character(Character: SYSINT); safecall;
    function Get_RelativeSize: Single; safecall;
    procedure Set_RelativeSize(RelativeSize: Single); safecall;
    function Get_UseTextColor: MsoTriState; safecall;
    procedure Set_UseTextColor(UseTextColor: MsoTriState); safecall;
    function Get_UseTextFont: MsoTriState; safecall;
    procedure Set_UseTextFont(UseTextFont: MsoTriState); safecall;
    function Get_Font: Font; safecall;
    function Get_type_: PpBulletType; safecall;
    procedure Set_type_(Type_: PpBulletType); safecall;
    function Get_Style: PpNumberedBulletStyle; safecall;
    procedure Set_Style(Style: PpNumberedBulletStyle); safecall;
    function Get_StartValue: SYSINT; safecall;
    procedure Set_StartValue(StartValue: SYSINT); safecall;
    procedure Picture(const Picture: WideString); safecall;
    function Get_Number: SYSINT; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Character: SYSINT read Get_Character write Set_Character;
    property RelativeSize: Single read Get_RelativeSize write Set_RelativeSize;
    property UseTextColor: MsoTriState read Get_UseTextColor write Set_UseTextColor;
    property UseTextFont: MsoTriState read Get_UseTextFont write Set_UseTextFont;
    property Font: Font read Get_Font;
    property type_: PpBulletType read Get_type_ write Set_type_;
    property Style: PpNumberedBulletStyle read Get_Style write Set_Style;
    property StartValue: SYSINT read Get_StartValue write Set_StartValue;
    property Number: SYSINT read Get_Number;
  end;

// *********************************************************************//
// DispIntf:  BulletFormatDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493497-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  BulletFormatDisp = dispinterface
    ['{91493497-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Visible: MsoTriState dispid 0;
    property Character: SYSINT dispid 2003;
    property RelativeSize: Single dispid 2004;
    property UseTextColor: MsoTriState dispid 2005;
    property UseTextFont: MsoTriState dispid 2006;
    property Font: Font readonly dispid 2007;
    property type_: PpBulletType dispid 2008;
    property Style: PpNumberedBulletStyle dispid 2009;
    property StartValue: SYSINT dispid 2010;
    procedure Picture(const Picture: WideString); dispid 2011;
    property Number: SYSINT readonly dispid 2012;
  end;

// *********************************************************************//
// Interface: TextStyles
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493498-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyles = interface(Collection)
    ['{91493498-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Type_: PpTextStyleType): TextStyle; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  TextStylesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493498-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStylesDisp = dispinterface
    ['{91493498-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Type_: PpTextStyleType): TextStyle; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: TextStyle
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493499-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyle = interface(IDispatch)
    ['{91493499-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Ruler: Ruler; safecall;
    function Get_TextFrame: TextFrame; safecall;
    function Get_Levels: TextStyleLevels; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Ruler: Ruler read Get_Ruler;
    property TextFrame: TextFrame read Get_TextFrame;
    property Levels: TextStyleLevels read Get_Levels;
  end;

// *********************************************************************//
// DispIntf:  TextStyleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {91493499-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyleDisp = dispinterface
    ['{91493499-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Ruler: Ruler readonly dispid 2003;
    property TextFrame: TextFrame readonly dispid 2004;
    property Levels: TextStyleLevels readonly dispid 2005;
  end;

// *********************************************************************//
// Interface: TextStyleLevels
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyleLevels = interface(Collection)
    ['{9149349A-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Level: SYSINT): TextStyleLevel; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  TextStyleLevelsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349A-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyleLevelsDisp = dispinterface
    ['{9149349A-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Level: SYSINT): TextStyleLevel; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: TextStyleLevel
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyleLevel = interface(IDispatch)
    ['{9149349B-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    function Get_Font: Font; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat;
    property Font: Font read Get_Font;
  end;

// *********************************************************************//
// DispIntf:  TextStyleLevelDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349B-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextStyleLevelDisp = dispinterface
    ['{9149349B-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property ParagraphFormat: ParagraphFormat readonly dispid 2003;
    property Font: Font readonly dispid 2004;
  end;

// *********************************************************************//
// Interface: HeaderFooter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  HeaderFooter = interface(IDispatch)
    ['{9149349C-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Visible: MsoTriState); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Text: WideString); safecall;
    function Get_UseFormat: MsoTriState; safecall;
    procedure Set_UseFormat(UseFormat: MsoTriState); safecall;
    function Get_Format: PpDateTimeFormat; safecall;
    procedure Set_Format(Format: PpDateTimeFormat); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Text: WideString read Get_Text write Set_Text;
    property UseFormat: MsoTriState read Get_UseFormat write Set_UseFormat;
    property Format: PpDateTimeFormat read Get_Format write Set_Format;
  end;

// *********************************************************************//
// DispIntf:  HeaderFooterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9149349C-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  HeaderFooterDisp = dispinterface
    ['{9149349C-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Visible: MsoTriState dispid 2003;
    property Text: WideString dispid 2004;
    property UseFormat: MsoTriState dispid 2005;
    property Format: PpDateTimeFormat dispid 2006;
  end;

// *********************************************************************//
// Interface: Tags
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934B9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Tags = interface(Collection)
    ['{914934B9-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(const Name: WideString): WideString; safecall;
    procedure Add(const Name: WideString; const Value: WideString); safecall;
    procedure Delete(const Name: WideString); safecall;
    procedure AddBinary(const Name: WideString; const FilePath: WideString); safecall;
    function BinaryValue(const Name: WideString): Integer; safecall;
    function Name(Index: SYSINT): WideString; safecall;
    function Value(Index: SYSINT): WideString; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  TagsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934B9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TagsDisp = dispinterface
    ['{914934B9-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(const Name: WideString): WideString; dispid 0;
    procedure Add(const Name: WideString; const Value: WideString); dispid 2003;
    procedure Delete(const Name: WideString); dispid 2004;
    procedure AddBinary(const Name: WideString; const FilePath: WideString); dispid 2005;
    function BinaryValue(const Name: WideString): Integer; dispid 2006;
    function Name(Index: SYSINT): WideString; dispid 2007;
    function Value(Index: SYSINT): WideString; dispid 2008;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: MouseTracker
// Flags:     (16) Hidden
// GUID:      {914934BE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  MouseTracker = interface(IUnknown)
    ['{914934BE-5A91-11CF-8700-00AA0060263B}']
    function OnTrack(X: Single; Y: Single): HResult; stdcall;
    function EndTrack(X: Single; Y: Single): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: MouseDownHandler
// Flags:     (16) Hidden
// GUID:      {914934BF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  MouseDownHandler = interface(IUnknown)
    ['{914934BF-5A91-11CF-8700-00AA0060263B}']
    function OnMouseDown(const activeWin: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: OCXExtender
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  OCXExtender = interface(IDispatch)
    ['{914934C0-5A91-11CF-8700-00AA0060263B}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Visible: WordBool); safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Left: Single); safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Top: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    function Get_ZOrderPosition: SYSINT; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_AltHTML: WideString; safecall;
    procedure Set_AltHTML(const AltHTML: WideString); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Height: Single read Get_Height write Set_Height;
    property Width: Single read Get_Width write Set_Width;
    property ZOrderPosition: SYSINT read Get_ZOrderPosition;
    property Name: WideString read Get_Name write Set_Name;
    property AltHTML: WideString read Get_AltHTML write Set_AltHTML;
  end;

// *********************************************************************//
// DispIntf:  OCXExtenderDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  OCXExtenderDisp = dispinterface
    ['{914934C0-5A91-11CF-8700-00AA0060263B}']
    property Visible: WordBool dispid -2147418105;
    property Left: Single dispid -2147418109;
    property Top: Single dispid -2147418108;
    property Height: Single dispid -2147418107;
    property Width: Single dispid -2147418106;
    property ZOrderPosition: SYSINT readonly dispid -2147417882;
    property Name: WideString dispid -2147418112;
    property AltHTML: WideString dispid -2147417881;
  end;

// *********************************************************************//
// Interface: OCXExtenderEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {914934C1-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  OCXExtenderEvents = interface(IDispatch)
    ['{914934C1-5A91-11CF-8700-00AA0060263B}']
    function GotFocus: HResult; stdcall;
    function LostFocus: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: Table
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Table = interface(IDispatch)
    ['{914934C3-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Columns: Columns; safecall;
    function Get_Rows: Rows; safecall;
    function Cell(Row: SYSINT; Column: SYSINT): Cell; safecall;
    function Get_TableDirection: PpDirection; safecall;
    procedure Set_TableDirection(TableDirection: PpDirection); safecall;
    procedure MergeBorders; safecall;
    function Get_FirstRow: WordBool; safecall;
    procedure Set_FirstRow(FirstRow: WordBool); safecall;
    function Get_LastRow: WordBool; safecall;
    procedure Set_LastRow(LastRow: WordBool); safecall;
    function Get_FirstCol: WordBool; safecall;
    procedure Set_FirstCol(FirstCol: WordBool); safecall;
    function Get_LastCol: WordBool; safecall;
    procedure Set_LastCol(LastCol: WordBool); safecall;
    function Get_HorizBanding: WordBool; safecall;
    procedure Set_HorizBanding(HorizBanding: WordBool); safecall;
    function Get_VertBanding: WordBool; safecall;
    procedure Set_VertBanding(VertBanding: WordBool); safecall;
    function Get_Style: TableStyle; safecall;
    function Get_Background: TableBackground; safecall;
    procedure ScaleProportionally(scale: Single); safecall;
    procedure ApplyStyle(const StyleID: WideString; SaveFormatting: WordBool); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Columns: Columns read Get_Columns;
    property Rows: Rows read Get_Rows;
    property TableDirection: PpDirection read Get_TableDirection write Set_TableDirection;
    property FirstRow: WordBool read Get_FirstRow write Set_FirstRow;
    property LastRow: WordBool read Get_LastRow write Set_LastRow;
    property FirstCol: WordBool read Get_FirstCol write Set_FirstCol;
    property LastCol: WordBool read Get_LastCol write Set_LastCol;
    property HorizBanding: WordBool read Get_HorizBanding write Set_HorizBanding;
    property VertBanding: WordBool read Get_VertBanding write Set_VertBanding;
    property Style: TableStyle read Get_Style;
    property Background: TableBackground read Get_Background;
  end;

// *********************************************************************//
// DispIntf:  TableDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TableDisp = dispinterface
    ['{914934C3-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Columns: Columns readonly dispid 2003;
    property Rows: Rows readonly dispid 2004;
    function Cell(Row: SYSINT; Column: SYSINT): Cell; dispid 2005;
    property TableDirection: PpDirection dispid 2006;
    procedure MergeBorders; dispid 2007;
    property FirstRow: WordBool dispid 2008;
    property LastRow: WordBool dispid 2009;
    property FirstCol: WordBool dispid 2010;
    property LastCol: WordBool dispid 2011;
    property HorizBanding: WordBool dispid 2012;
    property VertBanding: WordBool dispid 2013;
    property Style: TableStyle readonly dispid 2014;
    property Background: TableBackground readonly dispid 2015;
    procedure ScaleProportionally(scale: Single); dispid 2016;
    procedure ApplyStyle(const StyleID: WideString; SaveFormatting: WordBool); dispid 2017;
  end;

// *********************************************************************//
// Interface: Columns
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C4-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Columns = interface(Collection)
    ['{914934C4-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Column; safecall;
    function Add(BeforeColumn: SYSINT): Column; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ColumnsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C4-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColumnsDisp = dispinterface
    ['{914934C4-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Column; dispid 0;
    function Add(BeforeColumn: SYSINT): Column; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Column
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Column = interface(IDispatch)
    ['{914934C5-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Cells: CellRange; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Width: Single); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Cells: CellRange read Get_Cells;
    property Width: Single read Get_Width write Set_Width;
  end;

// *********************************************************************//
// DispIntf:  ColumnDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColumnDisp = dispinterface
    ['{914934C5-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Cells: CellRange readonly dispid 2003;
    procedure Select; dispid 2004;
    procedure Delete; dispid 2005;
    property Width: Single dispid 2006;
  end;

// *********************************************************************//
// Interface: Rows
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Rows = interface(Collection)
    ['{914934C6-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Row; safecall;
    function Add(BeforeRow: SYSINT): Row; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  RowsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RowsDisp = dispinterface
    ['{914934C6-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Row; dispid 0;
    function Add(BeforeRow: SYSINT): Row; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Row
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Row = interface(IDispatch)
    ['{914934C7-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Cells: CellRange; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Height: Single); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Cells: CellRange read Get_Cells;
    property Height: Single read Get_Height write Set_Height;
  end;

// *********************************************************************//
// DispIntf:  RowDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RowDisp = dispinterface
    ['{914934C7-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Cells: CellRange readonly dispid 2003;
    procedure Select; dispid 2004;
    procedure Delete; dispid 2005;
    property Height: Single dispid 2006;
  end;

// *********************************************************************//
// Interface: CellRange
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CellRange = interface(Collection)
    ['{914934C8-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Cell; safecall;
    function Get_Borders: Borders; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Borders: Borders read Get_Borders;
  end;

// *********************************************************************//
// DispIntf:  CellRangeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CellRangeDisp = dispinterface
    ['{914934C8-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Cell; dispid 0;
    property Borders: Borders readonly dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Cell
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Cell = interface(IDispatch)
    ['{914934C9-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Shape: Shape; safecall;
    function Get_Borders: Borders; safecall;
    procedure Merge(const MergeTo: Cell); safecall;
    procedure Split(NumRows: SYSINT; NumColumns: SYSINT); safecall;
    procedure Select; safecall;
    function Get_Selected: WordBool; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Shape: Shape read Get_Shape;
    property Borders: Borders read Get_Borders;
    property Selected: WordBool read Get_Selected;
  end;

// *********************************************************************//
// DispIntf:  CellDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934C9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CellDisp = dispinterface
    ['{914934C9-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Shape: Shape readonly dispid 2003;
    property Borders: Borders readonly dispid 2004;
    procedure Merge(const MergeTo: Cell); dispid 2005;
    procedure Split(NumRows: SYSINT; NumColumns: SYSINT); dispid 2006;
    procedure Select; dispid 2007;
    property Selected: WordBool readonly dispid 2008;
  end;

// *********************************************************************//
// Interface: Borders
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CA-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Borders = interface(Collection)
    ['{914934CA-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(BorderType: PpBorderType): LineFormat; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  BordersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CA-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  BordersDisp = dispinterface
    ['{914934CA-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(BorderType: PpBorderType): LineFormat; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Panes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CB-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Panes = interface(Collection)
    ['{914934CB-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Item(Index: SYSINT): Pane; safecall;
    function Get_Parent: IDispatch; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  PanesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CB-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PanesDisp = dispinterface
    ['{914934CB-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    function Item(Index: SYSINT): Pane; dispid 0;
    property Parent: IDispatch readonly dispid 2002;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Pane
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CC-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Pane = interface(IDispatch)
    ['{914934CC-5A91-11CF-8700-00AA0060263B}']
    function Get_Parent: IDispatch; safecall;
    procedure Activate; safecall;
    function Get_Active: MsoTriState; safecall;
    function Get_Application: PowerPointApplication; safecall;
    function Get_ViewType: PpViewType; safecall;
    property Parent: IDispatch read Get_Parent;
    property Active: MsoTriState read Get_Active;
    property Application: PowerPointApplication read Get_Application;
    property ViewType: PpViewType read Get_ViewType;
  end;

// *********************************************************************//
// DispIntf:  PaneDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CC-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PaneDisp = dispinterface
    ['{914934CC-5A91-11CF-8700-00AA0060263B}']
    property Parent: IDispatch readonly dispid 2000;
    procedure Activate; dispid 2001;
    property Active: MsoTriState readonly dispid 2002;
    property Application: PowerPointApplication readonly dispid 2003;
    property ViewType: PpViewType readonly dispid 2004;
  end;

// *********************************************************************//
// Interface: DefaultWebOptions
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CD-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DefaultWebOptions = interface(IDispatch)
    ['{914934CD-5A91-11CF-8700-00AA0060263B}']
    function Get_IncludeNavigation: MsoTriState; safecall;
    procedure Set_IncludeNavigation(IncludeNavigation: MsoTriState); safecall;
    function Get_FrameColors: PpFrameColors; safecall;
    procedure Set_FrameColors(FrameColors: PpFrameColors); safecall;
    function Get_ResizeGraphics: MsoTriState; safecall;
    procedure Set_ResizeGraphics(ResizeGraphics: MsoTriState); safecall;
    function Get_ShowSlideAnimation: MsoTriState; safecall;
    procedure Set_ShowSlideAnimation(ShowSlideAnimation: MsoTriState); safecall;
    function Get_OrganizeInFolder: MsoTriState; safecall;
    procedure Set_OrganizeInFolder(OrganizeInFolder: MsoTriState); safecall;
    function Get_UseLongFileNames: MsoTriState; safecall;
    procedure Set_UseLongFileNames(UseLongFileNames: MsoTriState); safecall;
    function Get_RelyOnVML: MsoTriState; safecall;
    procedure Set_RelyOnVML(RelyOnVML: MsoTriState); safecall;
    function Get_AllowPNG: MsoTriState; safecall;
    procedure Set_AllowPNG(AllowPNG: MsoTriState); safecall;
    function Get_ScreenSize: MsoScreenSize; safecall;
    procedure Set_ScreenSize(ScreenSize: MsoScreenSize); safecall;
    function Get_Encoding: MsoEncoding; safecall;
    procedure Set_Encoding(Encoding: MsoEncoding); safecall;
    function Get_UpdateLinksOnSave: MsoTriState; safecall;
    procedure Set_UpdateLinksOnSave(UpdateLinksOnSave: MsoTriState); safecall;
    function Get_CheckIfOfficeIsHTMLEditor: MsoTriState; safecall;
    procedure Set_CheckIfOfficeIsHTMLEditor(CheckIfOfficeIsHTMLEditor: MsoTriState); safecall;
    function Get_AlwaysSaveInDefaultEncoding: MsoTriState; safecall;
    procedure Set_AlwaysSaveInDefaultEncoding(AlwaysSaveInDefaultEncoding: MsoTriState); safecall;
    function Get_Fonts: WebPageFonts; safecall;
    function Get_FolderSuffix: WideString; safecall;
    function Get_TargetBrowser: MsoTargetBrowser; safecall;
    procedure Set_TargetBrowser(TargetBrowser: MsoTargetBrowser); safecall;
    function Get_SaveNewWebPagesAsWebArchives: MsoTriState; safecall;
    procedure Set_SaveNewWebPagesAsWebArchives(SaveNewWebPagesAsWebArchives: MsoTriState); safecall;
    function Get_HTMLVersion: PpHTMLVersion; safecall;
    procedure Set_HTMLVersion(HTMLVersion: PpHTMLVersion); safecall;
    property IncludeNavigation: MsoTriState read Get_IncludeNavigation write Set_IncludeNavigation;
    property FrameColors: PpFrameColors read Get_FrameColors write Set_FrameColors;
    property ResizeGraphics: MsoTriState read Get_ResizeGraphics write Set_ResizeGraphics;
    property ShowSlideAnimation: MsoTriState read Get_ShowSlideAnimation write Set_ShowSlideAnimation;
    property OrganizeInFolder: MsoTriState read Get_OrganizeInFolder write Set_OrganizeInFolder;
    property UseLongFileNames: MsoTriState read Get_UseLongFileNames write Set_UseLongFileNames;
    property RelyOnVML: MsoTriState read Get_RelyOnVML write Set_RelyOnVML;
    property AllowPNG: MsoTriState read Get_AllowPNG write Set_AllowPNG;
    property ScreenSize: MsoScreenSize read Get_ScreenSize write Set_ScreenSize;
    property Encoding: MsoEncoding read Get_Encoding write Set_Encoding;
    property UpdateLinksOnSave: MsoTriState read Get_UpdateLinksOnSave write Set_UpdateLinksOnSave;
    property CheckIfOfficeIsHTMLEditor: MsoTriState read Get_CheckIfOfficeIsHTMLEditor write Set_CheckIfOfficeIsHTMLEditor;
    property AlwaysSaveInDefaultEncoding: MsoTriState read Get_AlwaysSaveInDefaultEncoding write Set_AlwaysSaveInDefaultEncoding;
    property Fonts: WebPageFonts read Get_Fonts;
    property FolderSuffix: WideString read Get_FolderSuffix;
    property TargetBrowser: MsoTargetBrowser read Get_TargetBrowser write Set_TargetBrowser;
    property SaveNewWebPagesAsWebArchives: MsoTriState read Get_SaveNewWebPagesAsWebArchives write Set_SaveNewWebPagesAsWebArchives;
    property HTMLVersion: PpHTMLVersion read Get_HTMLVersion write Set_HTMLVersion;
  end;

// *********************************************************************//
// DispIntf:  DefaultWebOptionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CD-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DefaultWebOptionsDisp = dispinterface
    ['{914934CD-5A91-11CF-8700-00AA0060263B}']
    property IncludeNavigation: MsoTriState dispid 2001;
    property FrameColors: PpFrameColors dispid 2002;
    property ResizeGraphics: MsoTriState dispid 2003;
    property ShowSlideAnimation: MsoTriState dispid 2004;
    property OrganizeInFolder: MsoTriState dispid 2005;
    property UseLongFileNames: MsoTriState dispid 2006;
    property RelyOnVML: MsoTriState dispid 2007;
    property AllowPNG: MsoTriState dispid 2008;
    property ScreenSize: MsoScreenSize dispid 2009;
    property Encoding: MsoEncoding dispid 2010;
    property UpdateLinksOnSave: MsoTriState dispid 2011;
    property CheckIfOfficeIsHTMLEditor: MsoTriState dispid 2012;
    property AlwaysSaveInDefaultEncoding: MsoTriState dispid 2013;
    property Fonts: WebPageFonts readonly dispid 2014;
    property FolderSuffix: WideString readonly dispid 2015;
    property TargetBrowser: MsoTargetBrowser dispid 2016;
    property SaveNewWebPagesAsWebArchives: MsoTriState dispid 2017;
    property HTMLVersion: PpHTMLVersion dispid 2018;
  end;

// *********************************************************************//
// Interface: WebOptions
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  WebOptions = interface(IDispatch)
    ['{914934CE-5A91-11CF-8700-00AA0060263B}']
    function Get_IncludeNavigation: MsoTriState; safecall;
    procedure Set_IncludeNavigation(IncludeNavigation: MsoTriState); safecall;
    function Get_FrameColors: PpFrameColors; safecall;
    procedure Set_FrameColors(FrameColors: PpFrameColors); safecall;
    function Get_ResizeGraphics: MsoTriState; safecall;
    procedure Set_ResizeGraphics(ResizeGraphics: MsoTriState); safecall;
    function Get_ShowSlideAnimation: MsoTriState; safecall;
    procedure Set_ShowSlideAnimation(ShowSlideAnimation: MsoTriState); safecall;
    function Get_OrganizeInFolder: MsoTriState; safecall;
    procedure Set_OrganizeInFolder(OrganizeInFolder: MsoTriState); safecall;
    function Get_UseLongFileNames: MsoTriState; safecall;
    procedure Set_UseLongFileNames(UseLongFileNames: MsoTriState); safecall;
    function Get_RelyOnVML: MsoTriState; safecall;
    procedure Set_RelyOnVML(RelyOnVML: MsoTriState); safecall;
    function Get_AllowPNG: MsoTriState; safecall;
    procedure Set_AllowPNG(AllowPNG: MsoTriState); safecall;
    function Get_ScreenSize: MsoScreenSize; safecall;
    procedure Set_ScreenSize(ScreenSize: MsoScreenSize); safecall;
    function Get_Encoding: MsoEncoding; safecall;
    procedure Set_Encoding(Encoding: MsoEncoding); safecall;
    function Get_FolderSuffix: WideString; safecall;
    procedure UseDefaultFolderSuffix; safecall;
    function Get_TargetBrowser: MsoTargetBrowser; safecall;
    procedure Set_TargetBrowser(TargetBrowser: MsoTargetBrowser); safecall;
    function Get_HTMLVersion: PpHTMLVersion; safecall;
    procedure Set_HTMLVersion(HTMLVersion: PpHTMLVersion); safecall;
    property IncludeNavigation: MsoTriState read Get_IncludeNavigation write Set_IncludeNavigation;
    property FrameColors: PpFrameColors read Get_FrameColors write Set_FrameColors;
    property ResizeGraphics: MsoTriState read Get_ResizeGraphics write Set_ResizeGraphics;
    property ShowSlideAnimation: MsoTriState read Get_ShowSlideAnimation write Set_ShowSlideAnimation;
    property OrganizeInFolder: MsoTriState read Get_OrganizeInFolder write Set_OrganizeInFolder;
    property UseLongFileNames: MsoTriState read Get_UseLongFileNames write Set_UseLongFileNames;
    property RelyOnVML: MsoTriState read Get_RelyOnVML write Set_RelyOnVML;
    property AllowPNG: MsoTriState read Get_AllowPNG write Set_AllowPNG;
    property ScreenSize: MsoScreenSize read Get_ScreenSize write Set_ScreenSize;
    property Encoding: MsoEncoding read Get_Encoding write Set_Encoding;
    property FolderSuffix: WideString read Get_FolderSuffix;
    property TargetBrowser: MsoTargetBrowser read Get_TargetBrowser write Set_TargetBrowser;
    property HTMLVersion: PpHTMLVersion read Get_HTMLVersion write Set_HTMLVersion;
  end;

// *********************************************************************//
// DispIntf:  WebOptionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  WebOptionsDisp = dispinterface
    ['{914934CE-5A91-11CF-8700-00AA0060263B}']
    property IncludeNavigation: MsoTriState dispid 2001;
    property FrameColors: PpFrameColors dispid 2002;
    property ResizeGraphics: MsoTriState dispid 2003;
    property ShowSlideAnimation: MsoTriState dispid 2004;
    property OrganizeInFolder: MsoTriState dispid 2005;
    property UseLongFileNames: MsoTriState dispid 2006;
    property RelyOnVML: MsoTriState dispid 2007;
    property AllowPNG: MsoTriState dispid 2008;
    property ScreenSize: MsoScreenSize dispid 2009;
    property Encoding: MsoEncoding dispid 2010;
    property FolderSuffix: WideString readonly dispid 2011;
    procedure UseDefaultFolderSuffix; dispid 2012;
    property TargetBrowser: MsoTargetBrowser dispid 2013;
    property HTMLVersion: PpHTMLVersion dispid 2014;
  end;

// *********************************************************************//
// Interface: PublishObjects
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PublishObjects = interface(Collection)
    ['{914934CF-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): PublishObject; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  PublishObjectsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934CF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PublishObjectsDisp = dispinterface
    ['{914934CF-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): PublishObject; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: PublishObject
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PublishObject = interface(IDispatch)
    ['{914934D0-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_HTMLVersion: PpHTMLVersion; safecall;
    procedure Set_HTMLVersion(HTMLVersion: PpHTMLVersion); safecall;
    function Get_SourceType: PpPublishSourceType; safecall;
    procedure Set_SourceType(SourceType: PpPublishSourceType); safecall;
    function Get_RangeStart: SYSINT; safecall;
    procedure Set_RangeStart(RangeStart: SYSINT); safecall;
    function Get_RangeEnd: SYSINT; safecall;
    procedure Set_RangeEnd(RangeEnd: SYSINT); safecall;
    function Get_SlideShowName: WideString; safecall;
    procedure Set_SlideShowName(const SlideShowName: WideString); safecall;
    function Get_SpeakerNotes: MsoTriState; safecall;
    procedure Set_SpeakerNotes(SpeakerNotes: MsoTriState); safecall;
    function Get_FileName: WideString; safecall;
    procedure Set_FileName(const FileName: WideString); safecall;
    procedure Publish; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property HTMLVersion: PpHTMLVersion read Get_HTMLVersion write Set_HTMLVersion;
    property SourceType: PpPublishSourceType read Get_SourceType write Set_SourceType;
    property RangeStart: SYSINT read Get_RangeStart write Set_RangeStart;
    property RangeEnd: SYSINT read Get_RangeEnd write Set_RangeEnd;
    property SlideShowName: WideString read Get_SlideShowName write Set_SlideShowName;
    property SpeakerNotes: MsoTriState read Get_SpeakerNotes write Set_SpeakerNotes;
    property FileName: WideString read Get_FileName write Set_FileName;
  end;

// *********************************************************************//
// DispIntf:  PublishObjectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PublishObjectDisp = dispinterface
    ['{914934D0-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property HTMLVersion: PpHTMLVersion dispid 2003;
    property SourceType: PpPublishSourceType dispid 2004;
    property RangeStart: SYSINT dispid 2005;
    property RangeEnd: SYSINT dispid 2006;
    property SlideShowName: WideString dispid 2007;
    property SpeakerNotes: MsoTriState dispid 2008;
    property FileName: WideString dispid 2009;
    procedure Publish; dispid 2010;
  end;

// *********************************************************************//
// Interface: MasterEvents
// Flags:     (16) Hidden
// GUID:      {914934D2-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  MasterEvents = interface(IUnknown)
    ['{914934D2-5A91-11CF-8700-00AA0060263B}']
  end;

// *********************************************************************//
// Interface: _PowerRex
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _PowerRex = interface(IDispatch)
    ['{914934D3-5A91-11CF-8700-00AA0060263B}']
    procedure OnAsfEncoderEvent(erorCode: OleVariant; bstrErrorDesc: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  _PowerRexDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  _PowerRexDisp = dispinterface
    ['{914934D3-5A91-11CF-8700-00AA0060263B}']
    procedure OnAsfEncoderEvent(erorCode: OleVariant; bstrErrorDesc: OleVariant); dispid 2001;
  end;

// *********************************************************************//
// Interface: Comments
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D4-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Comments = interface(Collection)
    ['{914934D4-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Comment; safecall;
    function Add(Left: Single; Top: Single; const Author: WideString; 
                 const AuthorInitials: WideString; const Text: WideString): Comment; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  CommentsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D4-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CommentsDisp = dispinterface
    ['{914934D4-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Comment; dispid 0;
    function Add(Left: Single; Top: Single; const Author: WideString; 
                 const AuthorInitials: WideString; const Text: WideString): Comment; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Comment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Comment = interface(IDispatch)
    ['{914934D5-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Author: WideString; safecall;
    function Get_AuthorInitials: WideString; safecall;
    function Get_Text: WideString; safecall;
    function Get_DateTime: TDateTime; safecall;
    function Get_AuthorIndex: SYSINT; safecall;
    function Get_Left: Single; safecall;
    function Get_Top: Single; safecall;
    procedure Delete; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Author: WideString read Get_Author;
    property AuthorInitials: WideString read Get_AuthorInitials;
    property Text: WideString read Get_Text;
    property DateTime: TDateTime read Get_DateTime;
    property AuthorIndex: SYSINT read Get_AuthorIndex;
    property Left: Single read Get_Left;
    property Top: Single read Get_Top;
  end;

// *********************************************************************//
// DispIntf:  CommentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CommentDisp = dispinterface
    ['{914934D5-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Author: WideString readonly dispid 2003;
    property AuthorInitials: WideString readonly dispid 2004;
    property Text: WideString readonly dispid 2005;
    property DateTime: TDateTime readonly dispid 2006;
    property AuthorIndex: SYSINT readonly dispid 2007;
    property Left: Single readonly dispid 2008;
    property Top: Single readonly dispid 2009;
    procedure Delete; dispid 2010;
  end;

// *********************************************************************//
// Interface: Designs
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Designs = interface(Collection)
    ['{914934D6-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: OleVariant): Design; safecall;
    function Add(const designName: WideString; Index: SYSINT): Design; safecall;
    function Load(const TemplateName: WideString; Index: SYSINT): Design; safecall;
    function Clone(const pOriginal: Design; Index: SYSINT): Design; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  DesignsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DesignsDisp = dispinterface
    ['{914934D6-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: OleVariant): Design; dispid 0;
    function Add(const designName: WideString; Index: SYSINT): Design; dispid 2003;
    function Load(const TemplateName: WideString; Index: SYSINT): Design; dispid 2004;
    function Clone(const pOriginal: Design; Index: SYSINT): Design; dispid 2005;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Design
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Design = interface(IDispatch)
    ['{914934D7-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_SlideMaster: _Master; safecall;
    function Get_TitleMaster: _Master; safecall;
    function Get_HasTitleMaster: MsoTriState; safecall;
    function AddTitleMaster: _Master; safecall;
    function Get_Index: SYSINT; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_Preserved: MsoTriState; safecall;
    procedure Set_Preserved(Preserved: MsoTriState); safecall;
    procedure MoveTo(toPos: SYSINT); safecall;
    procedure Delete; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property SlideMaster: _Master read Get_SlideMaster;
    property TitleMaster: _Master read Get_TitleMaster;
    property HasTitleMaster: MsoTriState read Get_HasTitleMaster;
    property Index: SYSINT read Get_Index;
    property Name: WideString read Get_Name write Set_Name;
    property Preserved: MsoTriState read Get_Preserved write Set_Preserved;
  end;

// *********************************************************************//
// DispIntf:  DesignDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DesignDisp = dispinterface
    ['{914934D7-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property SlideMaster: _Master readonly dispid 2003;
    property TitleMaster: _Master readonly dispid 2004;
    property HasTitleMaster: MsoTriState readonly dispid 2005;
    function AddTitleMaster: _Master; dispid 2006;
    property Index: SYSINT readonly dispid 2007;
    property Name: WideString dispid 2008;
    property Preserved: MsoTriState dispid 2009;
    procedure MoveTo(toPos: SYSINT); dispid 2010;
    procedure Delete; dispid 2011;
  end;

// *********************************************************************//
// Interface: DiagramNode
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramNode = interface(IDispatch)
    ['{914934D8-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function AddNode(Pos: MsoRelativeNodePosition; NodeType: MsoDiagramNodeType): DiagramNode; safecall;
    procedure Delete; safecall;
    procedure MoveNode(const TargetNode: DiagramNode; Pos: MsoRelativeNodePosition); safecall;
    procedure ReplaceNode(const TargetNode: DiagramNode); safecall;
    procedure SwapNode(const TargetNode: DiagramNode; SwapChildren: WordBool); safecall;
    function CloneNode(CopyChildren: WordBool; const TargetNode: DiagramNode; 
                       Pos: MsoRelativeNodePosition): DiagramNode; safecall;
    procedure TransferChildren(const ReceivingNode: DiagramNode); safecall;
    function NextNode: DiagramNode; safecall;
    function PrevNode: DiagramNode; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Children: DiagramNodeChildren; safecall;
    function Get_Shape: Shape; safecall;
    function Get_Root: DiagramNode; safecall;
    function Get_Diagram: Diagram; safecall;
    function Get_Layout: MsoOrgChartLayoutType; safecall;
    procedure Set_Layout(Type_: MsoOrgChartLayoutType); safecall;
    function Get_TextShape: Shape; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Children: DiagramNodeChildren read Get_Children;
    property Shape: Shape read Get_Shape;
    property Root: DiagramNode read Get_Root;
    property Diagram: Diagram read Get_Diagram;
    property Layout: MsoOrgChartLayoutType read Get_Layout write Set_Layout;
    property TextShape: Shape read Get_TextShape;
  end;

// *********************************************************************//
// DispIntf:  DiagramNodeDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramNodeDisp = dispinterface
    ['{914934D8-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    function AddNode(Pos: MsoRelativeNodePosition; NodeType: MsoDiagramNodeType): DiagramNode; dispid 10;
    procedure Delete; dispid 11;
    procedure MoveNode(const TargetNode: DiagramNode; Pos: MsoRelativeNodePosition); dispid 12;
    procedure ReplaceNode(const TargetNode: DiagramNode); dispid 13;
    procedure SwapNode(const TargetNode: DiagramNode; SwapChildren: WordBool); dispid 14;
    function CloneNode(CopyChildren: WordBool; const TargetNode: DiagramNode; 
                       Pos: MsoRelativeNodePosition): DiagramNode; dispid 15;
    procedure TransferChildren(const ReceivingNode: DiagramNode); dispid 16;
    function NextNode: DiagramNode; dispid 17;
    function PrevNode: DiagramNode; dispid 18;
    property Parent: IDispatch readonly dispid 100;
    property Children: DiagramNodeChildren readonly dispid 101;
    property Shape: Shape readonly dispid 102;
    property Root: DiagramNode readonly dispid 103;
    property Diagram: Diagram readonly dispid 104;
    property Layout: MsoOrgChartLayoutType dispid 105;
    property TextShape: Shape readonly dispid 106;
  end;

// *********************************************************************//
// Interface: DiagramNodeChildren
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramNodeChildren = interface(IDispatch)
    ['{914934D9-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(Index: OleVariant): DiagramNode; safecall;
    function AddNode(Index: OleVariant; NodeType: MsoDiagramNodeType): DiagramNode; safecall;
    procedure SelectAll; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    function Get_FirstChild: DiagramNode; safecall;
    function Get_LastChild: DiagramNode; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
    property FirstChild: DiagramNode read Get_FirstChild;
    property LastChild: DiagramNode read Get_LastChild;
  end;

// *********************************************************************//
// DispIntf:  DiagramNodeChildrenDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934D9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramNodeChildrenDisp = dispinterface
    ['{914934D9-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(Index: OleVariant): DiagramNode; dispid 0;
    function AddNode(Index: OleVariant; NodeType: MsoDiagramNodeType): DiagramNode; dispid 10;
    procedure SelectAll; dispid 11;
    property Parent: IDispatch readonly dispid 100;
    property Count: SYSINT readonly dispid 101;
    property FirstChild: DiagramNode readonly dispid 103;
    property LastChild: DiagramNode readonly dispid 104;
  end;

// *********************************************************************//
// Interface: DiagramNodes
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DA-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramNodes = interface(IDispatch)
    ['{914934DA-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(Index: OleVariant): DiagramNode; safecall;
    procedure SelectAll; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  DiagramNodesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DA-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramNodesDisp = dispinterface
    ['{914934DA-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(Index: OleVariant): DiagramNode; dispid 0;
    procedure SelectAll; dispid 10;
    property Parent: IDispatch readonly dispid 100;
    property Count: SYSINT readonly dispid 101;
  end;

// *********************************************************************//
// Interface: Diagram
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DB-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Diagram = interface(IDispatch)
    ['{914934DB-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Nodes: DiagramNodes; safecall;
    function Get_type_: MsoDiagramType; safecall;
    function Get_AutoLayout: MsoTriState; safecall;
    procedure Set_AutoLayout(AutoLayout: MsoTriState); safecall;
    function Get_Reverse: MsoTriState; safecall;
    procedure Set_Reverse(Reverse: MsoTriState); safecall;
    function Get_AutoFormat: MsoTriState; safecall;
    procedure Set_AutoFormat(AutoFormat: MsoTriState); safecall;
    procedure Convert(Type_: MsoDiagramType); safecall;
    procedure FitText; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Nodes: DiagramNodes read Get_Nodes;
    property type_: MsoDiagramType read Get_type_;
    property AutoLayout: MsoTriState read Get_AutoLayout write Set_AutoLayout;
    property Reverse: MsoTriState read Get_Reverse write Set_Reverse;
    property AutoFormat: MsoTriState read Get_AutoFormat write Set_AutoFormat;
  end;

// *********************************************************************//
// DispIntf:  DiagramDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DB-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  DiagramDisp = dispinterface
    ['{914934DB-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 100;
    property Nodes: DiagramNodes readonly dispid 101;
    property type_: MsoDiagramType readonly dispid 102;
    property AutoLayout: MsoTriState dispid 103;
    property Reverse: MsoTriState dispid 104;
    property AutoFormat: MsoTriState dispid 105;
    procedure Convert(Type_: MsoDiagramType); dispid 10;
    procedure FitText; dispid 11;
  end;

// *********************************************************************//
// Interface: TimeLine
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DC-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TimeLine = interface(IDispatch)
    ['{914934DC-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_MainSequence: Sequence; safecall;
    function Get_InteractiveSequences: Sequences; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property MainSequence: Sequence read Get_MainSequence;
    property InteractiveSequences: Sequences read Get_InteractiveSequences;
  end;

// *********************************************************************//
// DispIntf:  TimeLineDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DC-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TimeLineDisp = dispinterface
    ['{914934DC-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property MainSequence: Sequence readonly dispid 2003;
    property InteractiveSequences: Sequences readonly dispid 2004;
  end;

// *********************************************************************//
// Interface: Sequences
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DD-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Sequences = interface(Collection)
    ['{914934DD-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Sequence; safecall;
    function Add(Index: SYSINT): Sequence; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  SequencesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DD-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SequencesDisp = dispinterface
    ['{914934DD-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Sequence; dispid 0;
    function Add(Index: SYSINT): Sequence; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Sequence
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Sequence = interface(Collection)
    ['{914934DE-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): Effect; safecall;
    function AddEffect(const Shape: Shape; effectId: MsoAnimEffect; Level: MsoAnimateByLevel; 
                       trigger: MsoAnimTriggerType; Index: SYSINT): Effect; safecall;
    function Clone(const Effect: Effect; Index: SYSINT): Effect; safecall;
    function FindFirstAnimationFor(const Shape: Shape): Effect; safecall;
    function FindFirstAnimationForClick(click: SYSINT): Effect; safecall;
    function ConvertToBuildLevel(const Effect: Effect; Level: MsoAnimateByLevel): Effect; safecall;
    function ConvertToAfterEffect(const Effect: Effect; After: MsoAnimAfterEffect; 
                                  DimColor: MsoRGBType; DimSchemeColor: PpColorSchemeIndex): Effect; safecall;
    function ConvertToAnimateBackground(const Effect: Effect; AnimateBackground: MsoTriState): Effect; safecall;
    function ConvertToAnimateInReverse(const Effect: Effect; animateInReverse: MsoTriState): Effect; safecall;
    function ConvertToTextUnitEffect(const Effect: Effect; unitEffect: MsoAnimTextUnitEffect): Effect; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  SequenceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SequenceDisp = dispinterface
    ['{914934DE-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): Effect; dispid 0;
    function AddEffect(const Shape: Shape; effectId: MsoAnimEffect; Level: MsoAnimateByLevel; 
                       trigger: MsoAnimTriggerType; Index: SYSINT): Effect; dispid 2003;
    function Clone(const Effect: Effect; Index: SYSINT): Effect; dispid 2004;
    function FindFirstAnimationFor(const Shape: Shape): Effect; dispid 2005;
    function FindFirstAnimationForClick(click: SYSINT): Effect; dispid 2006;
    function ConvertToBuildLevel(const Effect: Effect; Level: MsoAnimateByLevel): Effect; dispid 2007;
    function ConvertToAfterEffect(const Effect: Effect; After: MsoAnimAfterEffect; 
                                  DimColor: MsoRGBType; DimSchemeColor: PpColorSchemeIndex): Effect; dispid 2008;
    function ConvertToAnimateBackground(const Effect: Effect; AnimateBackground: MsoTriState): Effect; dispid 2009;
    function ConvertToAnimateInReverse(const Effect: Effect; animateInReverse: MsoTriState): Effect; dispid 2010;
    function ConvertToTextUnitEffect(const Effect: Effect; unitEffect: MsoAnimTextUnitEffect): Effect; dispid 2011;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Effect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Effect = interface(IDispatch)
    ['{914934DF-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Shape: Shape; safecall;
    procedure Set_Shape(const Shape: Shape); safecall;
    procedure MoveTo(toPos: SYSINT); safecall;
    procedure MoveBefore(const Effect: Effect); safecall;
    procedure MoveAfter(const Effect: Effect); safecall;
    procedure Delete; safecall;
    function Get_Index: SYSINT; safecall;
    function Get_Timing: Timing; safecall;
    function Get_EffectType: MsoAnimEffect; safecall;
    procedure Set_EffectType(EffectType: MsoAnimEffect); safecall;
    function Get_EffectParameters: EffectParameters; safecall;
    function Get_TextRangeStart: SYSINT; safecall;
    function Get_TextRangeLength: SYSINT; safecall;
    function Get_Paragraph: SYSINT; safecall;
    procedure Set_Paragraph(Paragraph: SYSINT); safecall;
    function Get_DisplayName: WideString; safecall;
    function Get_Exit: MsoTriState; safecall;
    procedure Set_Exit(Exit: MsoTriState); safecall;
    function Get_Behaviors: AnimationBehaviors; safecall;
    function Get_EffectInformation: EffectInformation; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Shape: Shape read Get_Shape write Set_Shape;
    property Index: SYSINT read Get_Index;
    property Timing: Timing read Get_Timing;
    property EffectType: MsoAnimEffect read Get_EffectType write Set_EffectType;
    property EffectParameters: EffectParameters read Get_EffectParameters;
    property TextRangeStart: SYSINT read Get_TextRangeStart;
    property TextRangeLength: SYSINT read Get_TextRangeLength;
    property Paragraph: SYSINT read Get_Paragraph write Set_Paragraph;
    property DisplayName: WideString read Get_DisplayName;
    property Exit: MsoTriState read Get_Exit write Set_Exit;
    property Behaviors: AnimationBehaviors read Get_Behaviors;
    property EffectInformation: EffectInformation read Get_EffectInformation;
  end;

// *********************************************************************//
// DispIntf:  EffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934DF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  EffectDisp = dispinterface
    ['{914934DF-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Shape: Shape dispid 2003;
    procedure MoveTo(toPos: SYSINT); dispid 2004;
    procedure MoveBefore(const Effect: Effect); dispid 2005;
    procedure MoveAfter(const Effect: Effect); dispid 2006;
    procedure Delete; dispid 2007;
    property Index: SYSINT readonly dispid 2008;
    property Timing: Timing readonly dispid 2009;
    property EffectType: MsoAnimEffect dispid 2010;
    property EffectParameters: EffectParameters readonly dispid 2011;
    property TextRangeStart: SYSINT readonly dispid 2012;
    property TextRangeLength: SYSINT readonly dispid 2013;
    property Paragraph: SYSINT dispid 2014;
    property DisplayName: WideString readonly dispid 2015;
    property Exit: MsoTriState dispid 2016;
    property Behaviors: AnimationBehaviors readonly dispid 2017;
    property EffectInformation: EffectInformation readonly dispid 2018;
  end;

// *********************************************************************//
// Interface: Timing
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Timing = interface(IDispatch)
    ['{914934E0-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Duration: Single; safecall;
    procedure Set_Duration(Duration: Single); safecall;
    function Get_TriggerType: MsoAnimTriggerType; safecall;
    procedure Set_TriggerType(TriggerType: MsoAnimTriggerType); safecall;
    function Get_TriggerDelayTime: Single; safecall;
    procedure Set_TriggerDelayTime(TriggerDelayTime: Single); safecall;
    function Get_TriggerShape: Shape; safecall;
    procedure Set_TriggerShape(const TriggerShape: Shape); safecall;
    function Get_RepeatCount: SYSINT; safecall;
    procedure Set_RepeatCount(RepeatCount: SYSINT); safecall;
    function Get_RepeatDuration: Single; safecall;
    procedure Set_RepeatDuration(RepeatDuration: Single); safecall;
    function Get_Speed: Single; safecall;
    procedure Set_Speed(Speed: Single); safecall;
    function Get_Accelerate: Single; safecall;
    procedure Set_Accelerate(Accelerate: Single); safecall;
    function Get_Decelerate: Single; safecall;
    procedure Set_Decelerate(Decelerate: Single); safecall;
    function Get_AutoReverse: MsoTriState; safecall;
    procedure Set_AutoReverse(AutoReverse: MsoTriState); safecall;
    function Get_SmoothStart: MsoTriState; safecall;
    procedure Set_SmoothStart(SmoothStart: MsoTriState); safecall;
    function Get_SmoothEnd: MsoTriState; safecall;
    procedure Set_SmoothEnd(SmoothEnd: MsoTriState); safecall;
    function Get_RewindAtEnd: MsoTriState; safecall;
    procedure Set_RewindAtEnd(RewindAtEnd: MsoTriState); safecall;
    function Get_Restart: MsoAnimEffectRestart; safecall;
    procedure Set_Restart(Restart: MsoAnimEffectRestart); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Duration: Single read Get_Duration write Set_Duration;
    property TriggerType: MsoAnimTriggerType read Get_TriggerType write Set_TriggerType;
    property TriggerDelayTime: Single read Get_TriggerDelayTime write Set_TriggerDelayTime;
    property TriggerShape: Shape read Get_TriggerShape write Set_TriggerShape;
    property RepeatCount: SYSINT read Get_RepeatCount write Set_RepeatCount;
    property RepeatDuration: Single read Get_RepeatDuration write Set_RepeatDuration;
    property Speed: Single read Get_Speed write Set_Speed;
    property Accelerate: Single read Get_Accelerate write Set_Accelerate;
    property Decelerate: Single read Get_Decelerate write Set_Decelerate;
    property AutoReverse: MsoTriState read Get_AutoReverse write Set_AutoReverse;
    property SmoothStart: MsoTriState read Get_SmoothStart write Set_SmoothStart;
    property SmoothEnd: MsoTriState read Get_SmoothEnd write Set_SmoothEnd;
    property RewindAtEnd: MsoTriState read Get_RewindAtEnd write Set_RewindAtEnd;
    property Restart: MsoAnimEffectRestart read Get_Restart write Set_Restart;
  end;

// *********************************************************************//
// DispIntf:  TimingDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TimingDisp = dispinterface
    ['{914934E0-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Duration: Single dispid 2003;
    property TriggerType: MsoAnimTriggerType dispid 2004;
    property TriggerDelayTime: Single dispid 2005;
    property TriggerShape: Shape dispid 2006;
    property RepeatCount: SYSINT dispid 2007;
    property RepeatDuration: Single dispid 2008;
    property Speed: Single dispid 2009;
    property Accelerate: Single dispid 2010;
    property Decelerate: Single dispid 2011;
    property AutoReverse: MsoTriState dispid 2012;
    property SmoothStart: MsoTriState dispid 2013;
    property SmoothEnd: MsoTriState dispid 2014;
    property RewindAtEnd: MsoTriState dispid 2015;
    property Restart: MsoAnimEffectRestart dispid 2016;
  end;

// *********************************************************************//
// Interface: EffectParameters
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E1-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  EffectParameters = interface(IDispatch)
    ['{914934E1-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Direction: MsoAnimDirection; safecall;
    procedure Set_Direction(Direction: MsoAnimDirection); safecall;
    function Get_Amount: Single; safecall;
    procedure Set_Amount(Amount: Single); safecall;
    function Get_Size: Single; safecall;
    procedure Set_Size(Size: Single); safecall;
    function Get_Color2: ColorFormat; safecall;
    function Get_Relative: MsoTriState; safecall;
    procedure Set_Relative(Relative: MsoTriState); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const FontName: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Direction: MsoAnimDirection read Get_Direction write Set_Direction;
    property Amount: Single read Get_Amount write Set_Amount;
    property Size: Single read Get_Size write Set_Size;
    property Color2: ColorFormat read Get_Color2;
    property Relative: MsoTriState read Get_Relative write Set_Relative;
    property FontName: WideString read Get_FontName write Set_FontName;
  end;

// *********************************************************************//
// DispIntf:  EffectParametersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E1-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  EffectParametersDisp = dispinterface
    ['{914934E1-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Direction: MsoAnimDirection dispid 2003;
    property Amount: Single dispid 2004;
    property Size: Single dispid 2005;
    property Color2: ColorFormat readonly dispid 2006;
    property Relative: MsoTriState dispid 2007;
    property FontName: WideString dispid 2008;
  end;

// *********************************************************************//
// Interface: EffectInformation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E2-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  EffectInformation = interface(IDispatch)
    ['{914934E2-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_AfterEffect: MsoAnimAfterEffect; safecall;
    function Get_AnimateBackground: MsoTriState; safecall;
    function Get_AnimateTextInReverse: MsoTriState; safecall;
    function Get_BuildByLevelEffect: MsoAnimateByLevel; safecall;
    function Get_Dim: ColorFormat; safecall;
    function Get_PlaySettings: PlaySettings; safecall;
    function Get_SoundEffect: SoundEffect; safecall;
    function Get_TextUnitEffect: MsoAnimTextUnitEffect; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property AfterEffect: MsoAnimAfterEffect read Get_AfterEffect;
    property AnimateBackground: MsoTriState read Get_AnimateBackground;
    property AnimateTextInReverse: MsoTriState read Get_AnimateTextInReverse;
    property BuildByLevelEffect: MsoAnimateByLevel read Get_BuildByLevelEffect;
    property Dim: ColorFormat read Get_Dim;
    property PlaySettings: PlaySettings read Get_PlaySettings;
    property SoundEffect: SoundEffect read Get_SoundEffect;
    property TextUnitEffect: MsoAnimTextUnitEffect read Get_TextUnitEffect;
  end;

// *********************************************************************//
// DispIntf:  EffectInformationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E2-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  EffectInformationDisp = dispinterface
    ['{914934E2-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property AfterEffect: MsoAnimAfterEffect readonly dispid 2003;
    property AnimateBackground: MsoTriState readonly dispid 2004;
    property AnimateTextInReverse: MsoTriState readonly dispid 2005;
    property BuildByLevelEffect: MsoAnimateByLevel readonly dispid 2006;
    property Dim: ColorFormat readonly dispid 2007;
    property PlaySettings: PlaySettings readonly dispid 2008;
    property SoundEffect: SoundEffect readonly dispid 2009;
    property TextUnitEffect: MsoAnimTextUnitEffect readonly dispid 2010;
  end;

// *********************************************************************//
// Interface: AnimationBehaviors
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationBehaviors = interface(Collection)
    ['{914934E3-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): AnimationBehavior; safecall;
    function Add(Type_: MsoAnimType; Index: SYSINT): AnimationBehavior; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  AnimationBehaviorsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationBehaviorsDisp = dispinterface
    ['{914934E3-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): AnimationBehavior; dispid 0;
    function Add(Type_: MsoAnimType; Index: SYSINT): AnimationBehavior; dispid 2003;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: AnimationBehavior
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E4-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationBehavior = interface(IDispatch)
    ['{914934E4-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Additive: MsoAnimAdditive; safecall;
    procedure Set_Additive(Additive: MsoAnimAdditive); safecall;
    function Get_Accumulate: MsoAnimAccumulate; safecall;
    procedure Set_Accumulate(Accumulate: MsoAnimAccumulate); safecall;
    function Get_type_: MsoAnimType; safecall;
    procedure Set_type_(Type_: MsoAnimType); safecall;
    function Get_MotionEffect: MotionEffect; safecall;
    function Get_ColorEffect: ColorEffect; safecall;
    function Get_ScaleEffect: ScaleEffect; safecall;
    function Get_RotationEffect: RotationEffect; safecall;
    function Get_PropertyEffect: PropertyEffect; safecall;
    function Get_Timing: Timing; safecall;
    procedure Delete; safecall;
    function Get_CommandEffect: CommandEffect; safecall;
    function Get_FilterEffect: FilterEffect; safecall;
    function Get_SetEffect: SetEffect; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Additive: MsoAnimAdditive read Get_Additive write Set_Additive;
    property Accumulate: MsoAnimAccumulate read Get_Accumulate write Set_Accumulate;
    property type_: MsoAnimType read Get_type_ write Set_type_;
    property MotionEffect: MotionEffect read Get_MotionEffect;
    property ColorEffect: ColorEffect read Get_ColorEffect;
    property ScaleEffect: ScaleEffect read Get_ScaleEffect;
    property RotationEffect: RotationEffect read Get_RotationEffect;
    property PropertyEffect: PropertyEffect read Get_PropertyEffect;
    property Timing: Timing read Get_Timing;
    property CommandEffect: CommandEffect read Get_CommandEffect;
    property FilterEffect: FilterEffect read Get_FilterEffect;
    property SetEffect: SetEffect read Get_SetEffect;
  end;

// *********************************************************************//
// DispIntf:  AnimationBehaviorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E4-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationBehaviorDisp = dispinterface
    ['{914934E4-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Additive: MsoAnimAdditive dispid 2003;
    property Accumulate: MsoAnimAccumulate dispid 2004;
    property type_: MsoAnimType dispid 2005;
    property MotionEffect: MotionEffect readonly dispid 2006;
    property ColorEffect: ColorEffect readonly dispid 2007;
    property ScaleEffect: ScaleEffect readonly dispid 2008;
    property RotationEffect: RotationEffect readonly dispid 2009;
    property PropertyEffect: PropertyEffect readonly dispid 2010;
    property Timing: Timing readonly dispid 2011;
    procedure Delete; dispid 2012;
    property CommandEffect: CommandEffect readonly dispid 2013;
    property FilterEffect: FilterEffect readonly dispid 2014;
    property SetEffect: SetEffect readonly dispid 2015;
  end;

// *********************************************************************//
// Interface: MotionEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  MotionEffect = interface(IDispatch)
    ['{914934E5-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ByX: Single; safecall;
    procedure Set_ByX(ByX: Single); safecall;
    function Get_ByY: Single; safecall;
    procedure Set_ByY(ByY: Single); safecall;
    function Get_FromX: Single; safecall;
    procedure Set_FromX(FromX: Single); safecall;
    function Get_FromY: Single; safecall;
    procedure Set_FromY(FromY: Single); safecall;
    function Get_ToX: Single; safecall;
    procedure Set_ToX(ToX: Single); safecall;
    function Get_ToY: Single; safecall;
    procedure Set_ToY(ToY: Single); safecall;
    function Get_Path: WideString; safecall;
    procedure Set_Path(const Path: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ByX: Single read Get_ByX write Set_ByX;
    property ByY: Single read Get_ByY write Set_ByY;
    property FromX: Single read Get_FromX write Set_FromX;
    property FromY: Single read Get_FromY write Set_FromY;
    property ToX: Single read Get_ToX write Set_ToX;
    property ToY: Single read Get_ToY write Set_ToY;
    property Path: WideString read Get_Path write Set_Path;
  end;

// *********************************************************************//
// DispIntf:  MotionEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  MotionEffectDisp = dispinterface
    ['{914934E5-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property ByX: Single dispid 2003;
    property ByY: Single dispid 2004;
    property FromX: Single dispid 2005;
    property FromY: Single dispid 2006;
    property ToX: Single dispid 2007;
    property ToY: Single dispid 2008;
    property Path: WideString dispid 2009;
  end;

// *********************************************************************//
// Interface: ColorEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorEffect = interface(IDispatch)
    ['{914934E6-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_By: ColorFormat; safecall;
    function Get_From: ColorFormat; safecall;
    function Get_To_: ColorFormat; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property By: ColorFormat read Get_By;
    property From: ColorFormat read Get_From;
    property To_: ColorFormat read Get_To_;
  end;

// *********************************************************************//
// DispIntf:  ColorEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ColorEffectDisp = dispinterface
    ['{914934E6-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property By: ColorFormat readonly dispid 2003;
    property From: ColorFormat readonly dispid 2004;
    property To_: ColorFormat readonly dispid 2005;
  end;

// *********************************************************************//
// Interface: ScaleEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ScaleEffect = interface(IDispatch)
    ['{914934E7-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ByX: Single; safecall;
    procedure Set_ByX(ByX: Single); safecall;
    function Get_ByY: Single; safecall;
    procedure Set_ByY(ByY: Single); safecall;
    function Get_FromX: Single; safecall;
    procedure Set_FromX(FromX: Single); safecall;
    function Get_FromY: Single; safecall;
    procedure Set_FromY(FromY: Single); safecall;
    function Get_ToX: Single; safecall;
    procedure Set_ToX(ToX: Single); safecall;
    function Get_ToY: Single; safecall;
    procedure Set_ToY(ToY: Single); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property ByX: Single read Get_ByX write Set_ByX;
    property ByY: Single read Get_ByY write Set_ByY;
    property FromX: Single read Get_FromX write Set_FromX;
    property FromY: Single read Get_FromY write Set_FromY;
    property ToX: Single read Get_ToX write Set_ToX;
    property ToY: Single read Get_ToY write Set_ToY;
  end;

// *********************************************************************//
// DispIntf:  ScaleEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ScaleEffectDisp = dispinterface
    ['{914934E7-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property ByX: Single dispid 2003;
    property ByY: Single dispid 2004;
    property FromX: Single dispid 2005;
    property FromY: Single dispid 2006;
    property ToX: Single dispid 2007;
    property ToY: Single dispid 2008;
  end;

// *********************************************************************//
// Interface: RotationEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RotationEffect = interface(IDispatch)
    ['{914934E8-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_By: Single; safecall;
    procedure Set_By(By: Single); safecall;
    function Get_From: Single; safecall;
    procedure Set_From(From: Single); safecall;
    function Get_To_: Single; safecall;
    procedure Set_To_(To_: Single); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property By: Single read Get_By write Set_By;
    property From: Single read Get_From write Set_From;
    property To_: Single read Get_To_ write Set_To_;
  end;

// *********************************************************************//
// DispIntf:  RotationEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  RotationEffectDisp = dispinterface
    ['{914934E8-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property By: Single dispid 2003;
    property From: Single dispid 2004;
    property To_: Single dispid 2005;
  end;

// *********************************************************************//
// Interface: PropertyEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PropertyEffect = interface(IDispatch)
    ['{914934E9-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Property_: MsoAnimProperty; safecall;
    procedure Set_Property_(Property_: MsoAnimProperty); safecall;
    function Get_Points: AnimationPoints; safecall;
    function Get_From: OleVariant; safecall;
    procedure Set_From(From: OleVariant); safecall;
    function Get_To_: OleVariant; safecall;
    procedure Set_To_(To_: OleVariant); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Property_: MsoAnimProperty read Get_Property_ write Set_Property_;
    property Points: AnimationPoints read Get_Points;
    property From: OleVariant read Get_From write Set_From;
    property To_: OleVariant read Get_To_ write Set_To_;
  end;

// *********************************************************************//
// DispIntf:  PropertyEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934E9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  PropertyEffectDisp = dispinterface
    ['{914934E9-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Property_: MsoAnimProperty dispid 2003;
    property Points: AnimationPoints readonly dispid 2004;
    property From: OleVariant dispid 2005;
    property To_: OleVariant dispid 2006;
  end;

// *********************************************************************//
// Interface: AnimationPoints
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EA-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationPoints = interface(Collection)
    ['{914934EA-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: SYSINT): AnimationPoint; safecall;
    function Add(Index: SYSINT): AnimationPoint; safecall;
    function Get_Smooth: MsoTriState; safecall;
    procedure Set_Smooth(Smooth: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Smooth: MsoTriState read Get_Smooth write Set_Smooth;
  end;

// *********************************************************************//
// DispIntf:  AnimationPointsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EA-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationPointsDisp = dispinterface
    ['{914934EA-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: SYSINT): AnimationPoint; dispid 0;
    function Add(Index: SYSINT): AnimationPoint; dispid 2003;
    property Smooth: MsoTriState dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: AnimationPoint
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EB-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationPoint = interface(IDispatch)
    ['{914934EB-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Delete; safecall;
    function Get_Time: Single; safecall;
    procedure Set_Time(Time: Single); safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(Value: OleVariant); safecall;
    function Get_Formula: WideString; safecall;
    procedure Set_Formula(const Formula: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Time: Single read Get_Time write Set_Time;
    property Value: OleVariant read Get_Value write Set_Value;
    property Formula: WideString read Get_Formula write Set_Formula;
  end;

// *********************************************************************//
// DispIntf:  AnimationPointDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EB-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AnimationPointDisp = dispinterface
    ['{914934EB-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    procedure Delete; dispid 2003;
    property Time: Single dispid 2004;
    property Value: OleVariant dispid 2005;
    property Formula: WideString dispid 2006;
  end;

// *********************************************************************//
// Interface: CanvasShapes
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EC-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CanvasShapes = interface(IDispatch)
    ['{914934EC-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: SYSINT; safecall;
    function Item(Index: OleVariant): Shape; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function AddCallout(Type_: MsoCalloutType; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function AddConnector(Type_: MsoConnectorType; BeginX: Single; BeginY: Single; EndX: Single; 
                          EndY: Single): Shape; safecall;
    function AddCurve(SafeArrayOfPoints: OleVariant): Shape; safecall;
    function AddLabel(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; safecall;
    function AddLine(BeginX: Single; BeginY: Single; EndX: Single; EndY: Single): Shape; safecall;
    function AddPicture(const FileName: WideString; LinkToFile: MsoTriState; 
                        SaveWithDocument: MsoTriState; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function AddPolyline(SafeArrayOfPoints: OleVariant): Shape; safecall;
    function AddShape(Type_: MsoAutoShapeType; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; safecall;
    function AddTextEffect(PresetTextEffect: MsoPresetTextEffect; const Text: WideString; 
                           const FontName: WideString; FontSize: Single; FontBold: MsoTriState; 
                           FontItalic: MsoTriState; Left: Single; Top: Single): Shape; safecall;
    function AddTextbox(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; safecall;
    function BuildFreeform(EditingType: MsoEditingType; X1: Single; Y1: Single): FreeformBuilder; safecall;
    function Range(Index: OleVariant): ShapeRange; safecall;
    procedure SelectAll; safecall;
    function Get_Background: Shape; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: SYSINT read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Background: Shape read Get_Background;
  end;

// *********************************************************************//
// DispIntf:  CanvasShapesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EC-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CanvasShapesDisp = dispinterface
    ['{914934EC-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property Count: SYSINT readonly dispid 2;
    function Item(Index: OleVariant): Shape; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    function AddCallout(Type_: MsoCalloutType; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 10;
    function AddConnector(Type_: MsoConnectorType; BeginX: Single; BeginY: Single; EndX: Single; 
                          EndY: Single): Shape; dispid 11;
    function AddCurve(SafeArrayOfPoints: OleVariant): Shape; dispid 12;
    function AddLabel(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; dispid 13;
    function AddLine(BeginX: Single; BeginY: Single; EndX: Single; EndY: Single): Shape; dispid 14;
    function AddPicture(const FileName: WideString; LinkToFile: MsoTriState; 
                        SaveWithDocument: MsoTriState; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 15;
    function AddPolyline(SafeArrayOfPoints: OleVariant): Shape; dispid 16;
    function AddShape(Type_: MsoAutoShapeType; Left: Single; Top: Single; Width: Single; 
                      Height: Single): Shape; dispid 17;
    function AddTextEffect(PresetTextEffect: MsoPresetTextEffect; const Text: WideString; 
                           const FontName: WideString; FontSize: Single; FontBold: MsoTriState; 
                           FontItalic: MsoTriState; Left: Single; Top: Single): Shape; dispid 18;
    function AddTextbox(Orientation: MsoTextOrientation; Left: Single; Top: Single; Width: Single; 
                        Height: Single): Shape; dispid 19;
    function BuildFreeform(EditingType: MsoEditingType; X1: Single; Y1: Single): FreeformBuilder; dispid 20;
    function Range(Index: OleVariant): ShapeRange; dispid 21;
    procedure SelectAll; dispid 22;
    property Background: Shape readonly dispid 100;
  end;

// *********************************************************************//
// Interface: AutoCorrect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934ED-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AutoCorrect = interface(IDispatch)
    ['{914934ED-5A91-11CF-8700-00AA0060263B}']
    function Get_DisplayAutoCorrectOptions: WordBool; safecall;
    procedure Set_DisplayAutoCorrectOptions(DisplayAutoCorrectOptions: WordBool); safecall;
    function Get_DisplayAutoLayoutOptions: WordBool; safecall;
    procedure Set_DisplayAutoLayoutOptions(DisplayAutoLayoutOptions: WordBool); safecall;
    property DisplayAutoCorrectOptions: WordBool read Get_DisplayAutoCorrectOptions write Set_DisplayAutoCorrectOptions;
    property DisplayAutoLayoutOptions: WordBool read Get_DisplayAutoLayoutOptions write Set_DisplayAutoLayoutOptions;
  end;

// *********************************************************************//
// DispIntf:  AutoCorrectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934ED-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  AutoCorrectDisp = dispinterface
    ['{914934ED-5A91-11CF-8700-00AA0060263B}']
    property DisplayAutoCorrectOptions: WordBool dispid 2001;
    property DisplayAutoLayoutOptions: WordBool dispid 2002;
  end;

// *********************************************************************//
// Interface: Options
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Options = interface(IDispatch)
    ['{914934EE-5A91-11CF-8700-00AA0060263B}']
    function Get_DisplayPasteOptions: MsoTriState; safecall;
    procedure Set_DisplayPasteOptions(DisplayPasteOptions: MsoTriState); safecall;
    function Get_DoNotPromptForConvert: MsoTriState; safecall;
    procedure Set_DoNotPromptForConvert(DoNotPromptForConvert: MsoTriState); safecall;
    property DisplayPasteOptions: MsoTriState read Get_DisplayPasteOptions write Set_DisplayPasteOptions;
    property DoNotPromptForConvert: MsoTriState read Get_DoNotPromptForConvert write Set_DoNotPromptForConvert;
  end;

// *********************************************************************//
// DispIntf:  OptionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EE-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  OptionsDisp = dispinterface
    ['{914934EE-5A91-11CF-8700-00AA0060263B}']
    property DisplayPasteOptions: MsoTriState dispid 2001;
    property DoNotPromptForConvert: MsoTriState dispid 2002;
  end;

// *********************************************************************//
// Interface: CommandEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CommandEffect = interface(IDispatch)
    ['{914934EF-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_type_: MsoAnimCommandType; safecall;
    procedure Set_type_(Type_: MsoAnimCommandType); safecall;
    function Get_Command: WideString; safecall;
    procedure Set_Command(const Command: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: MsoAnimCommandType read Get_type_ write Set_type_;
    property Command: WideString read Get_Command write Set_Command;
  end;

// *********************************************************************//
// DispIntf:  CommandEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934EF-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CommandEffectDisp = dispinterface
    ['{914934EF-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property type_: MsoAnimCommandType dispid 2003;
    property Command: WideString dispid 2004;
  end;

// *********************************************************************//
// Interface: FilterEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FilterEffect = interface(IDispatch)
    ['{914934F0-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_type_: MsoAnimFilterEffectType; safecall;
    procedure Set_type_(Type_: MsoAnimFilterEffectType); safecall;
    function Get_Subtype: MsoAnimFilterEffectSubtype; safecall;
    procedure Set_Subtype(Subtype: MsoAnimFilterEffectSubtype); safecall;
    function Get_Reveal: MsoTriState; safecall;
    procedure Set_Reveal(Reveal: MsoTriState); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property type_: MsoAnimFilterEffectType read Get_type_ write Set_type_;
    property Subtype: MsoAnimFilterEffectSubtype read Get_Subtype write Set_Subtype;
    property Reveal: MsoTriState read Get_Reveal write Set_Reveal;
  end;

// *********************************************************************//
// DispIntf:  FilterEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F0-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  FilterEffectDisp = dispinterface
    ['{914934F0-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property type_: MsoAnimFilterEffectType dispid 2003;
    property Subtype: MsoAnimFilterEffectSubtype dispid 2004;
    property Reveal: MsoTriState dispid 2005;
  end;

// *********************************************************************//
// Interface: SetEffect
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F1-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SetEffect = interface(IDispatch)
    ['{914934F1-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Property_: MsoAnimProperty; safecall;
    procedure Set_Property_(Property_: MsoAnimProperty); safecall;
    function Get_To_: OleVariant; safecall;
    procedure Set_To_(To_: OleVariant); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Property_: MsoAnimProperty read Get_Property_ write Set_Property_;
    property To_: OleVariant read Get_To_ write Set_To_;
  end;

// *********************************************************************//
// DispIntf:  SetEffectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F1-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  SetEffectDisp = dispinterface
    ['{914934F1-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Property_: MsoAnimProperty dispid 2003;
    property To_: OleVariant dispid 2004;
  end;

// *********************************************************************//
// Interface: CustomLayouts
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F2-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CustomLayouts = interface(Collection)
    ['{914934F2-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: OleVariant): CustomLayout; safecall;
    function Add(Index: SYSINT): CustomLayout; safecall;
    function Paste(Index: SYSINT): CustomLayout; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  CustomLayoutsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F2-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CustomLayoutsDisp = dispinterface
    ['{914934F2-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(Index: OleVariant): CustomLayout; dispid 0;
    function Add(Index: SYSINT): CustomLayout; dispid 2003;
    function Paste(Index: SYSINT): CustomLayout; dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: CustomLayout
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CustomLayout = interface(IDispatch)
    ['{914934F3-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Shapes: Shapes; safecall;
    function Get_HeadersFooters: HeadersFooters; safecall;
    function Get_Background: ShapeRange; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    procedure Delete; safecall;
    function Get_Height: Single; safecall;
    function Get_Width: Single; safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    function Get_Design: Design; safecall;
    function Get_TimeLine: TimeLine; safecall;
    function Get_SlideShowTransition: SlideShowTransition; safecall;
    function Get_MatchingName: WideString; safecall;
    procedure Set_MatchingName(const MatchingName: WideString); safecall;
    function Get_Preserved: MsoTriState; safecall;
    procedure Set_Preserved(Preserved: MsoTriState); safecall;
    function Get_Index: SYSINT; safecall;
    procedure Select; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    function Duplicate: CustomLayout; safecall;
    procedure MoveTo(toPos: SYSINT); safecall;
    function Get_DisplayMasterShapes: MsoTriState; safecall;
    procedure Set_DisplayMasterShapes(DisplayMasterShapes: MsoTriState); safecall;
    function Get_FollowMasterBackground: MsoTriState; safecall;
    procedure Set_FollowMasterBackground(FollowMasterBackground: MsoTriState); safecall;
    function Get_ThemeColorScheme: ThemeColorScheme; safecall;
    function Get_CustomerData: CustomerData; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Shapes: Shapes read Get_Shapes;
    property HeadersFooters: HeadersFooters read Get_HeadersFooters;
    property Background: ShapeRange read Get_Background;
    property Name: WideString read Get_Name write Set_Name;
    property Height: Single read Get_Height;
    property Width: Single read Get_Width;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property Design: Design read Get_Design;
    property TimeLine: TimeLine read Get_TimeLine;
    property SlideShowTransition: SlideShowTransition read Get_SlideShowTransition;
    property MatchingName: WideString read Get_MatchingName write Set_MatchingName;
    property Preserved: MsoTriState read Get_Preserved write Set_Preserved;
    property Index: SYSINT read Get_Index;
    property DisplayMasterShapes: MsoTriState read Get_DisplayMasterShapes write Set_DisplayMasterShapes;
    property FollowMasterBackground: MsoTriState read Get_FollowMasterBackground write Set_FollowMasterBackground;
    property ThemeColorScheme: ThemeColorScheme read Get_ThemeColorScheme;
    property CustomerData: CustomerData read Get_CustomerData;
  end;

// *********************************************************************//
// DispIntf:  CustomLayoutDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F3-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CustomLayoutDisp = dispinterface
    ['{914934F3-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    property Shapes: Shapes readonly dispid 2003;
    property HeadersFooters: HeadersFooters readonly dispid 2004;
    property Background: ShapeRange readonly dispid 2005;
    property Name: WideString dispid 2006;
    procedure Delete; dispid 2007;
    property Height: Single readonly dispid 2008;
    property Width: Single readonly dispid 2009;
    property Hyperlinks: Hyperlinks readonly dispid 2010;
    property Design: Design readonly dispid 2011;
    property TimeLine: TimeLine readonly dispid 2012;
    property SlideShowTransition: SlideShowTransition readonly dispid 2013;
    property MatchingName: WideString dispid 2014;
    property Preserved: MsoTriState dispid 2015;
    property Index: SYSINT readonly dispid 2016;
    procedure Select; dispid 2017;
    procedure Cut; dispid 2018;
    procedure Copy; dispid 2019;
    function Duplicate: CustomLayout; dispid 2020;
    procedure MoveTo(toPos: SYSINT); dispid 2021;
    property DisplayMasterShapes: MsoTriState dispid 2022;
    property FollowMasterBackground: MsoTriState dispid 2023;
    property ThemeColorScheme: ThemeColorScheme readonly dispid 2024;
    property CustomerData: CustomerData readonly dispid 2025;
  end;

// *********************************************************************//
// Interface: TableStyle
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TableStyle = interface(IDispatch)
    ['{914934F5-5A91-11CF-8700-00AA0060263B}']
    function Get_Name: WideString; safecall;
    function Get_Id: WideString; safecall;
    property Name: WideString read Get_Name;
    property Id: WideString read Get_Id;
  end;

// *********************************************************************//
// DispIntf:  TableStyleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F5-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TableStyleDisp = dispinterface
    ['{914934F5-5A91-11CF-8700-00AA0060263B}']
    property Name: WideString readonly dispid 2001;
    property Id: WideString readonly dispid 2002;
  end;

// *********************************************************************//
// Interface: CustomerData
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CustomerData = interface(Collection)
    ['{914934F6-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(const Id: WideString): CustomXMLPart; safecall;
    function Add: CustomXMLPart; safecall;
    procedure Delete(const Id: WideString); safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  CustomerDataDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F6-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  CustomerDataDisp = dispinterface
    ['{914934F6-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    function Item(const Id: WideString): CustomXMLPart; dispid 0;
    function Add: CustomXMLPart; dispid 2003;
    procedure Delete(const Id: WideString); dispid 2004;
    property _NewEnum: IUnknown readonly dispid -4;
    function _Index(Index: SYSINT): OleVariant; dispid 10;
    property Count: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: Research
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  Research = interface(IDispatch)
    ['{914934F7-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: PowerPointApplication; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Query(const ServiceID: WideString; var QueryString: OleVariant; 
                    var QueryLanguage: OleVariant; UseSelection: WordBool; LaunchQuery: WordBool); safecall;
    procedure SetLanguagePair(var Language1: OleVariant; var Language2: OleVariant); safecall;
    function IsResearchService(const ServiceID: WideString): WordBool; safecall;
    property Application: PowerPointApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ResearchDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F7-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  ResearchDisp = dispinterface
    ['{914934F7-5A91-11CF-8700-00AA0060263B}']
    property Application: PowerPointApplication readonly dispid 2001;
    property Parent: IDispatch readonly dispid 2002;
    procedure Query(const ServiceID: WideString; var QueryString: OleVariant; 
                    var QueryLanguage: OleVariant; UseSelection: WordBool; LaunchQuery: WordBool); dispid 2003;
    procedure SetLanguagePair(var Language1: OleVariant; var Language2: OleVariant); dispid 2004;
    function IsResearchService(const ServiceID: WideString): WordBool; dispid 2005;
  end;

// *********************************************************************//
// Interface: TableBackground
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TableBackground = interface(IDispatch)
    ['{914934F8-5A91-11CF-8700-00AA0060263B}']
    function Get_Fill: FillFormat; safecall;
    function Get_Picture: PictureFormat; safecall;
    function Get_Reflection: ReflectionFormat; safecall;
    function Get_Shadow: ShadowFormat; safecall;
    property Fill: FillFormat read Get_Fill;
    property Picture: PictureFormat read Get_Picture;
    property Reflection: ReflectionFormat read Get_Reflection;
    property Shadow: ShadowFormat read Get_Shadow;
  end;

// *********************************************************************//
// DispIntf:  TableBackgroundDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F8-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TableBackgroundDisp = dispinterface
    ['{914934F8-5A91-11CF-8700-00AA0060263B}']
    property Fill: FillFormat readonly dispid 2001;
    property Picture: PictureFormat readonly dispid 2002;
    property Reflection: ReflectionFormat readonly dispid 2003;
    property Shadow: ShadowFormat readonly dispid 2004;
  end;

// *********************************************************************//
// Interface: TextFrame2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextFrame2 = interface(IDispatch)
    ['{914934F9-5A91-11CF-8700-00AA0060263B}']
    function Get_Application: IDispatch; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_MarginBottom: Single; safecall;
    procedure Set_MarginBottom(MarginBottom: Single); safecall;
    function Get_MarginLeft: Single; safecall;
    procedure Set_MarginLeft(MarginLeft: Single); safecall;
    function Get_MarginRight: Single; safecall;
    procedure Set_MarginRight(MarginRight: Single); safecall;
    function Get_MarginTop: Single; safecall;
    procedure Set_MarginTop(MarginTop: Single); safecall;
    function Get_Orientation: MsoTextOrientation; safecall;
    procedure Set_Orientation(Orientation: MsoTextOrientation); safecall;
    function Get_HorizontalAnchor: MsoHorizontalAnchor; safecall;
    procedure Set_HorizontalAnchor(HorizontalAnchor: MsoHorizontalAnchor); safecall;
    function Get_VerticalAnchor: MsoVerticalAnchor; safecall;
    procedure Set_VerticalAnchor(VerticalAnchor: MsoVerticalAnchor); safecall;
    function Get_PathFormat: MsoPathFormat; safecall;
    procedure Set_PathFormat(PathFormat: MsoPathFormat); safecall;
    function Get_WarpFormat: MsoWarpFormat; safecall;
    procedure Set_WarpFormat(WarpFormat: MsoWarpFormat); safecall;
    function Get_WordArtFormat: MsoPresetTextEffect; safecall;
    procedure Set_WordArtFormat(WordArtFormat: MsoPresetTextEffect); safecall;
    function Get_WordWrap: MsoTriState; safecall;
    procedure Set_WordWrap(WordWrap: MsoTriState); safecall;
    function Get_AutoSize: MsoAutoSize; safecall;
    procedure Set_AutoSize(AutoSize: MsoAutoSize); safecall;
    function Get_ThreeD: ThreeDFormat; safecall;
    function Get_HasText: MsoTriState; safecall;
    function Get_TextRange: TextRange2; safecall;
    function Get_Column: TextColumn2; safecall;
    function Get_Ruler: Ruler2; safecall;
    procedure DeleteText; safecall;
    property Application: IDispatch read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property MarginBottom: Single read Get_MarginBottom write Set_MarginBottom;
    property MarginLeft: Single read Get_MarginLeft write Set_MarginLeft;
    property MarginRight: Single read Get_MarginRight write Set_MarginRight;
    property MarginTop: Single read Get_MarginTop write Set_MarginTop;
    property Orientation: MsoTextOrientation read Get_Orientation write Set_Orientation;
    property HorizontalAnchor: MsoHorizontalAnchor read Get_HorizontalAnchor write Set_HorizontalAnchor;
    property VerticalAnchor: MsoVerticalAnchor read Get_VerticalAnchor write Set_VerticalAnchor;
    property PathFormat: MsoPathFormat read Get_PathFormat write Set_PathFormat;
    property WarpFormat: MsoWarpFormat read Get_WarpFormat write Set_WarpFormat;
    property WordArtFormat: MsoPresetTextEffect read Get_WordArtFormat write Set_WordArtFormat;
    property WordWrap: MsoTriState read Get_WordWrap write Set_WordWrap;
    property AutoSize: MsoAutoSize read Get_AutoSize write Set_AutoSize;
    property ThreeD: ThreeDFormat read Get_ThreeD;
    property HasText: MsoTriState read Get_HasText;
    property TextRange: TextRange2 read Get_TextRange;
    property Column: TextColumn2 read Get_Column;
    property Ruler: Ruler2 read Get_Ruler;
  end;

// *********************************************************************//
// DispIntf:  TextFrame2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {914934F9-5A91-11CF-8700-00AA0060263B}
// *********************************************************************//
  TextFrame2Disp = dispinterface
    ['{914934F9-5A91-11CF-8700-00AA0060263B}']
    property Application: IDispatch readonly dispid 2001;
    property Creator: Integer readonly dispid 2002;
    property Parent: IDispatch readonly dispid 1;
    property MarginBottom: Single dispid 100;
    property MarginLeft: Single dispid 101;
    property MarginRight: Single dispid 102;
    property MarginTop: Single dispid 103;
    property Orientation: MsoTextOrientation dispid 104;
    property HorizontalAnchor: MsoHorizontalAnchor dispid 105;
    property VerticalAnchor: MsoVerticalAnchor dispid 106;
    property PathFormat: MsoPathFormat dispid 107;
    property WarpFormat: MsoWarpFormat dispid 108;
    property WordArtFormat: MsoPresetTextEffect dispid 109;
    property WordWrap: MsoTriState dispid 110;
    property AutoSize: MsoAutoSize dispid 111;
    property ThreeD: ThreeDFormat readonly dispid 112;
    property HasText: MsoTriState readonly dispid 113;
    property TextRange: TextRange2 readonly dispid 114;
    property Column: TextColumn2 readonly dispid 115;
    property Ruler: Ruler2 readonly dispid 116;
    procedure DeleteText; dispid 117;
  end;

// *********************************************************************//
// The Class CoPowerPointGlobal provides a Create and CreateRemote method to          
// create instances of the default interface _Global exposed by              
// the CoClass PowerPointGlobal. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPowerPointGlobal = class
    class function Create: _Global;
    class function CreateRemote(const MachineName: string): _Global;
  end;

// *********************************************************************//
// The Class CoPowerPointSlide provides a Create and CreateRemote method to          
// create instances of the default interface _Slide exposed by              
// the CoClass PowerPointSlide. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPowerPointSlide = class
    class function Create: _Slide;
    class function CreateRemote(const MachineName: string): _Slide;
  end;

// *********************************************************************//
// The Class CoPowerPointPresentation provides a Create and CreateRemote method to          
// create instances of the default interface _Presentation exposed by              
// the CoClass PowerPointPresentation. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPowerPointPresentation = class
    class function Create: _Presentation;
    class function CreateRemote(const MachineName: string): _Presentation;
  end;

// *********************************************************************//
// The Class CoOLECtrl provides a Create and CreateRemote method to          
// create instances of the default interface OCXExtender exposed by              
// the CoClass OLECtrl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOLECtrl = class
    class function Create: OCXExtender;
    class function CreateRemote(const MachineName: string): OCXExtender;
  end;

// *********************************************************************//
// The Class CoPowerPointApplication provides a Create and CreateRemote method to          
// create instances of the default interface _Application exposed by              
// the CoClass PowerPointApplication. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPowerPointApplication = class
    class function Create: _Application;
    class function CreateRemote(const MachineName: string): _Application;
  end;

  TPowerPointApplicationWindowSelectionChange = procedure(ASender: TObject; const Sel: Selection) of object;
  TPowerPointApplicationWindowBeforeRightClick = procedure(ASender: TObject; const Sel: Selection; 
                                                                             var Cancel: WordBool) of object;
  TPowerPointApplicationWindowBeforeDoubleClick = procedure(ASender: TObject; const Sel: Selection; 
                                                                              var Cancel: WordBool) of object;
  TPowerPointApplicationPresentationClose = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationPresentationSave = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationPresentationOpen = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationNewPresentation = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationPresentationNewSlide = procedure(ASender: TObject; const Sld: PowerPointSlide) of object;
  TPowerPointApplicationWindowActivate = procedure(ASender: TObject; const Pres: PowerPointPresentation; 
                                                                     const Wn: DocumentWindow) of object;
  TPowerPointApplicationWindowDeactivate = procedure(ASender: TObject; const Pres: PowerPointPresentation; 
                                                                       const Wn: DocumentWindow) of object;
  TPowerPointApplicationSlideShowBegin = procedure(ASender: TObject; const Wn: SlideShowWindow) of object;
  TPowerPointApplicationSlideShowNextBuild = procedure(ASender: TObject; const Wn: SlideShowWindow) of object;
  TPowerPointApplicationSlideShowNextSlide = procedure(ASender: TObject; const Wn: SlideShowWindow) of object;
  TPowerPointApplicationSlideShowEnd = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationPresentationPrint = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationSlideSelectionChanged = procedure(ASender: TObject; const SldRange: SlideRange) of object;
  TPowerPointApplicationColorSchemeChanged = procedure(ASender: TObject; const SldRange: SlideRange) of object;
  TPowerPointApplicationPresentationBeforeSave = procedure(ASender: TObject; const Pres: PowerPointPresentation; 
                                                                             var Cancel: WordBool) of object;
  TPowerPointApplicationSlideShowNextClick = procedure(ASender: TObject; const Wn: SlideShowWindow; 
                                                                         const nEffect: Effect) of object;
  TPowerPointApplicationAfterNewPresentation = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationAfterPresentationOpen = procedure(ASender: TObject; const Pres: PowerPointPresentation) of object;
  TPowerPointApplicationPresentationSync = procedure(ASender: TObject; const Pres: PowerPointPresentation; 
                                                                       SyncEventType: MsoSyncEventType) of object;
  TPowerPointApplicationSlideShowOnNext = procedure(ASender: TObject; const Wn: SlideShowWindow) of object;
  TPowerPointApplicationSlideShowOnPrevious = procedure(ASender: TObject; const Wn: SlideShowWindow) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPowerPointApplication
// Help String      : 
// Default Interface: _Application
// Def. Intf. DISP? : No
// Event   Interface: EApplication
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPowerPointApplicationProperties= class;
{$ENDIF}
  TPowerPointApplication = class(TOleServer)
  private
    FOnWindowSelectionChange: TPowerPointApplicationWindowSelectionChange;
    FOnWindowBeforeRightClick: TPowerPointApplicationWindowBeforeRightClick;
    FOnWindowBeforeDoubleClick: TPowerPointApplicationWindowBeforeDoubleClick;
    FOnPresentationClose: TPowerPointApplicationPresentationClose;
    FOnPresentationSave: TPowerPointApplicationPresentationSave;
    FOnPresentationOpen: TPowerPointApplicationPresentationOpen;
    FOnNewPresentation: TPowerPointApplicationNewPresentation;
    FOnPresentationNewSlide: TPowerPointApplicationPresentationNewSlide;
    FOnWindowActivate: TPowerPointApplicationWindowActivate;
    FOnWindowDeactivate: TPowerPointApplicationWindowDeactivate;
    FOnSlideShowBegin: TPowerPointApplicationSlideShowBegin;
    FOnSlideShowNextBuild: TPowerPointApplicationSlideShowNextBuild;
    FOnSlideShowNextSlide: TPowerPointApplicationSlideShowNextSlide;
    FOnSlideShowEnd: TPowerPointApplicationSlideShowEnd;
    FOnPresentationPrint: TPowerPointApplicationPresentationPrint;
    FOnSlideSelectionChanged: TPowerPointApplicationSlideSelectionChanged;
    FOnColorSchemeChanged: TPowerPointApplicationColorSchemeChanged;
    FOnPresentationBeforeSave: TPowerPointApplicationPresentationBeforeSave;
    FOnSlideShowNextClick: TPowerPointApplicationSlideShowNextClick;
    FOnAfterNewPresentation: TPowerPointApplicationAfterNewPresentation;
    FOnAfterPresentationOpen: TPowerPointApplicationAfterPresentationOpen;
    FOnPresentationSync: TPowerPointApplicationPresentationSync;
    FOnSlideShowOnNext: TPowerPointApplicationSlideShowOnNext;
    FOnSlideShowOnPrevious: TPowerPointApplicationSlideShowOnPrevious;
    FAutoQuit:    Boolean;
    FIntf:        _Application;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TPowerPointApplicationProperties;
    function      GetServerProperties: TPowerPointApplicationProperties;
{$ENDIF}
    function      GetDefaultInterface: _Application;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Presentations: Presentations;
    function Get_Windows: DocumentWindows;
    function Get_Dialogs: IUnknown;
    function Get_ActiveWindow: DocumentWindow;
    function Get_ActivePresentation: PowerPointPresentation;
    function Get_SlideShowWindows: SlideShowWindows;
    function Get_CommandBars: CommandBars;
    function Get_Path: WideString;
    function Get_Name: WideString;
    function Get_Caption: WideString;
    procedure Set_Caption(const Caption: WideString);
    function Get_Assistant: Assistant;
    function Get_FileSearch: FileSearch;
    function Get_FileFind: IFind;
    function Get_Build: WideString;
    function Get_Version: WideString;
    function Get_OperatingSystem: WideString;
    function Get_ActivePrinter: WideString;
    function Get_Creator: Integer;
    function Get_AddIns: AddIns;
    function Get_VBE: VBE;
    function Get_Left: Single;
    procedure Set_Left(Left: Single);
    function Get_Top: Single;
    procedure Set_Top(Top: Single);
    function Get_Width: Single;
    procedure Set_Width(Width: Single);
    function Get_Height: Single;
    procedure Set_Height(Height: Single);
    function Get_WindowState: PpWindowState;
    procedure Set_WindowState(WindowState: PpWindowState);
    function Get_Visible: MsoTriState;
    procedure Set_Visible(Visible: MsoTriState);
    function Get_Active: MsoTriState;
    function Get_AnswerWizard: AnswerWizard;
    function Get_COMAddIns: COMAddIns;
    function Get_ProductCode: WideString;
    function Get_DefaultWebOptions: DefaultWebOptions;
    function Get_LanguageSettings: LanguageSettings;
    function Get_MsoDebugOptions: MsoDebugOptions;
    function Get_ShowWindowsInTaskbar: MsoTriState;
    procedure Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar: MsoTriState);
    function Get_Marker: IUnknown;
    function Get_FeatureInstall: MsoFeatureInstall;
    procedure Set_FeatureInstall(FeatureInstall: MsoFeatureInstall);
    function Get_FileDialog(Type_: MsoFileDialogType): FileDialog;
    function Get_DisplayGridLines: MsoTriState;
    procedure Set_DisplayGridLines(DisplayGridLines: MsoTriState);
    function Get_AutomationSecurity: MsoAutomationSecurity;
    procedure Set_AutomationSecurity(AutomationSecurity: MsoAutomationSecurity);
    function Get_NewPresentation: NewFile;
    function Get_DisplayAlerts: PpAlertLevel;
    procedure Set_DisplayAlerts(DisplayAlerts: PpAlertLevel);
    function Get_ShowStartupDialog: MsoTriState;
    procedure Set_ShowStartupDialog(ShowStartupDialog: MsoTriState);
    function Get_AutoCorrect: AutoCorrect;
    function Get_Options: Options;
    function Get_DisplayDocumentInformationPanel: WordBool;
    procedure Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel: WordBool);
    function Get_Assistance: IAssistance;
    function Get_ActiveEncryptionSession: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Application);
    procedure Disconnect; override;
    procedure Help(const HelpFile: WideString; ContextID: SYSINT);
    procedure Quit;
    function Run(const MacroName: WideString; var safeArrayOfParams: PSafeArray): OleVariant;
    function PPFileDialog(Type_: PpFileDialogType): IUnknown;
    procedure Activate;
    function GetOptionFlag(Option: Integer; Persist: WordBool): WordBool;
    procedure SetOptionFlag(Option: Integer; State: WordBool; Persist: WordBool);
    procedure SetPerfMarker(Marker: SYSINT);
    procedure LaunchPublishSlidesDialog(const SlideLibraryUrl: WideString);
    procedure LaunchSendToPPTDialog(var SlideUrls: OleVariant);
    property DefaultInterface: _Application read GetDefaultInterface;
    property Presentations: Presentations read Get_Presentations;
    property Windows: DocumentWindows read Get_Windows;
    property Dialogs: IUnknown read Get_Dialogs;
    property ActiveWindow: DocumentWindow read Get_ActiveWindow;
    property ActivePresentation: PowerPointPresentation read Get_ActivePresentation;
    property SlideShowWindows: SlideShowWindows read Get_SlideShowWindows;
    property CommandBars: CommandBars read Get_CommandBars;
    property Path: WideString read Get_Path;
    property Name: WideString read Get_Name;
    property Assistant: Assistant read Get_Assistant;
    property FileSearch: FileSearch read Get_FileSearch;
    property FileFind: IFind read Get_FileFind;
    property Build: WideString read Get_Build;
    property Version: WideString read Get_Version;
    property OperatingSystem: WideString read Get_OperatingSystem;
    property ActivePrinter: WideString read Get_ActivePrinter;
    property Creator: Integer read Get_Creator;
    property AddIns: AddIns read Get_AddIns;
    property VBE: VBE read Get_VBE;
    property Active: MsoTriState read Get_Active;
    property AnswerWizard: AnswerWizard read Get_AnswerWizard;
    property COMAddIns: COMAddIns read Get_COMAddIns;
    property ProductCode: WideString read Get_ProductCode;
    property DefaultWebOptions: DefaultWebOptions read Get_DefaultWebOptions;
    property LanguageSettings: LanguageSettings read Get_LanguageSettings;
    property MsoDebugOptions: MsoDebugOptions read Get_MsoDebugOptions;
    property Marker: IUnknown read Get_Marker;
    property FileDialog[Type_: MsoFileDialogType]: FileDialog read Get_FileDialog;
    property NewPresentation: NewFile read Get_NewPresentation;
    property AutoCorrect: AutoCorrect read Get_AutoCorrect;
    property Options: Options read Get_Options;
    property Assistance: IAssistance read Get_Assistance;
    property ActiveEncryptionSession: Integer read Get_ActiveEncryptionSession;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property WindowState: PpWindowState read Get_WindowState write Set_WindowState;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property ShowWindowsInTaskbar: MsoTriState read Get_ShowWindowsInTaskbar write Set_ShowWindowsInTaskbar;
    property FeatureInstall: MsoFeatureInstall read Get_FeatureInstall write Set_FeatureInstall;
    property DisplayGridLines: MsoTriState read Get_DisplayGridLines write Set_DisplayGridLines;
    property AutomationSecurity: MsoAutomationSecurity read Get_AutomationSecurity write Set_AutomationSecurity;
    property DisplayAlerts: PpAlertLevel read Get_DisplayAlerts write Set_DisplayAlerts;
    property ShowStartupDialog: MsoTriState read Get_ShowStartupDialog write Set_ShowStartupDialog;
    property DisplayDocumentInformationPanel: WordBool read Get_DisplayDocumentInformationPanel write Set_DisplayDocumentInformationPanel;
  published
    property AutoQuit: Boolean read FAutoQuit write FAutoQuit; 
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPowerPointApplicationProperties read GetServerProperties;
{$ENDIF}
    property OnWindowSelectionChange: TPowerPointApplicationWindowSelectionChange read FOnWindowSelectionChange write FOnWindowSelectionChange;
    property OnWindowBeforeRightClick: TPowerPointApplicationWindowBeforeRightClick read FOnWindowBeforeRightClick write FOnWindowBeforeRightClick;
    property OnWindowBeforeDoubleClick: TPowerPointApplicationWindowBeforeDoubleClick read FOnWindowBeforeDoubleClick write FOnWindowBeforeDoubleClick;
    property OnPresentationClose: TPowerPointApplicationPresentationClose read FOnPresentationClose write FOnPresentationClose;
    property OnPresentationSave: TPowerPointApplicationPresentationSave read FOnPresentationSave write FOnPresentationSave;
    property OnPresentationOpen: TPowerPointApplicationPresentationOpen read FOnPresentationOpen write FOnPresentationOpen;
    property OnNewPresentation: TPowerPointApplicationNewPresentation read FOnNewPresentation write FOnNewPresentation;
    property OnPresentationNewSlide: TPowerPointApplicationPresentationNewSlide read FOnPresentationNewSlide write FOnPresentationNewSlide;
    property OnWindowActivate: TPowerPointApplicationWindowActivate read FOnWindowActivate write FOnWindowActivate;
    property OnWindowDeactivate: TPowerPointApplicationWindowDeactivate read FOnWindowDeactivate write FOnWindowDeactivate;
    property OnSlideShowBegin: TPowerPointApplicationSlideShowBegin read FOnSlideShowBegin write FOnSlideShowBegin;
    property OnSlideShowNextBuild: TPowerPointApplicationSlideShowNextBuild read FOnSlideShowNextBuild write FOnSlideShowNextBuild;
    property OnSlideShowNextSlide: TPowerPointApplicationSlideShowNextSlide read FOnSlideShowNextSlide write FOnSlideShowNextSlide;
    property OnSlideShowEnd: TPowerPointApplicationSlideShowEnd read FOnSlideShowEnd write FOnSlideShowEnd;
    property OnPresentationPrint: TPowerPointApplicationPresentationPrint read FOnPresentationPrint write FOnPresentationPrint;
    property OnSlideSelectionChanged: TPowerPointApplicationSlideSelectionChanged read FOnSlideSelectionChanged write FOnSlideSelectionChanged;
    property OnColorSchemeChanged: TPowerPointApplicationColorSchemeChanged read FOnColorSchemeChanged write FOnColorSchemeChanged;
    property OnPresentationBeforeSave: TPowerPointApplicationPresentationBeforeSave read FOnPresentationBeforeSave write FOnPresentationBeforeSave;
    property OnSlideShowNextClick: TPowerPointApplicationSlideShowNextClick read FOnSlideShowNextClick write FOnSlideShowNextClick;
    property OnAfterNewPresentation: TPowerPointApplicationAfterNewPresentation read FOnAfterNewPresentation write FOnAfterNewPresentation;
    property OnAfterPresentationOpen: TPowerPointApplicationAfterPresentationOpen read FOnAfterPresentationOpen write FOnAfterPresentationOpen;
    property OnPresentationSync: TPowerPointApplicationPresentationSync read FOnPresentationSync write FOnPresentationSync;
    property OnSlideShowOnNext: TPowerPointApplicationSlideShowOnNext read FOnSlideShowOnNext write FOnSlideShowOnNext;
    property OnSlideShowOnPrevious: TPowerPointApplicationSlideShowOnPrevious read FOnSlideShowOnPrevious write FOnSlideShowOnPrevious;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPowerPointApplication
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPowerPointApplicationProperties = class(TPersistent)
  private
    FServer:    TPowerPointApplication;
    function    GetDefaultInterface: _Application;
    constructor Create(AServer: TPowerPointApplication);
  protected
    function Get_Presentations: Presentations;
    function Get_Windows: DocumentWindows;
    function Get_Dialogs: IUnknown;
    function Get_ActiveWindow: DocumentWindow;
    function Get_ActivePresentation: PowerPointPresentation;
    function Get_SlideShowWindows: SlideShowWindows;
    function Get_CommandBars: CommandBars;
    function Get_Path: WideString;
    function Get_Name: WideString;
    function Get_Caption: WideString;
    procedure Set_Caption(const Caption: WideString);
    function Get_Assistant: Assistant;
    function Get_FileSearch: FileSearch;
    function Get_FileFind: IFind;
    function Get_Build: WideString;
    function Get_Version: WideString;
    function Get_OperatingSystem: WideString;
    function Get_ActivePrinter: WideString;
    function Get_Creator: Integer;
    function Get_AddIns: AddIns;
    function Get_VBE: VBE;
    function Get_Left: Single;
    procedure Set_Left(Left: Single);
    function Get_Top: Single;
    procedure Set_Top(Top: Single);
    function Get_Width: Single;
    procedure Set_Width(Width: Single);
    function Get_Height: Single;
    procedure Set_Height(Height: Single);
    function Get_WindowState: PpWindowState;
    procedure Set_WindowState(WindowState: PpWindowState);
    function Get_Visible: MsoTriState;
    procedure Set_Visible(Visible: MsoTriState);
    function Get_Active: MsoTriState;
    function Get_AnswerWizard: AnswerWizard;
    function Get_COMAddIns: COMAddIns;
    function Get_ProductCode: WideString;
    function Get_DefaultWebOptions: DefaultWebOptions;
    function Get_LanguageSettings: LanguageSettings;
    function Get_MsoDebugOptions: MsoDebugOptions;
    function Get_ShowWindowsInTaskbar: MsoTriState;
    procedure Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar: MsoTriState);
    function Get_Marker: IUnknown;
    function Get_FeatureInstall: MsoFeatureInstall;
    procedure Set_FeatureInstall(FeatureInstall: MsoFeatureInstall);
    function Get_FileDialog(Type_: MsoFileDialogType): FileDialog;
    function Get_DisplayGridLines: MsoTriState;
    procedure Set_DisplayGridLines(DisplayGridLines: MsoTriState);
    function Get_AutomationSecurity: MsoAutomationSecurity;
    procedure Set_AutomationSecurity(AutomationSecurity: MsoAutomationSecurity);
    function Get_NewPresentation: NewFile;
    function Get_DisplayAlerts: PpAlertLevel;
    procedure Set_DisplayAlerts(DisplayAlerts: PpAlertLevel);
    function Get_ShowStartupDialog: MsoTriState;
    procedure Set_ShowStartupDialog(ShowStartupDialog: MsoTriState);
    function Get_AutoCorrect: AutoCorrect;
    function Get_Options: Options;
    function Get_DisplayDocumentInformationPanel: WordBool;
    procedure Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel: WordBool);
    function Get_Assistance: IAssistance;
    function Get_ActiveEncryptionSession: Integer;
  public
    property DefaultInterface: _Application read GetDefaultInterface;
  published
    property Caption: WideString read Get_Caption write Set_Caption;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property WindowState: PpWindowState read Get_WindowState write Set_WindowState;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property ShowWindowsInTaskbar: MsoTriState read Get_ShowWindowsInTaskbar write Set_ShowWindowsInTaskbar;
    property FeatureInstall: MsoFeatureInstall read Get_FeatureInstall write Set_FeatureInstall;
    property DisplayGridLines: MsoTriState read Get_DisplayGridLines write Set_DisplayGridLines;
    property AutomationSecurity: MsoAutomationSecurity read Get_AutomationSecurity write Set_AutomationSecurity;
    property DisplayAlerts: PpAlertLevel read Get_DisplayAlerts write Set_DisplayAlerts;
    property ShowStartupDialog: MsoTriState read Get_ShowStartupDialog write Set_ShowStartupDialog;
    property DisplayDocumentInformationPanel: WordBool read Get_DisplayDocumentInformationPanel write Set_DisplayDocumentInformationPanel;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMaster provides a Create and CreateRemote method to          
// create instances of the default interface _Master exposed by              
// the CoClass Master. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMaster = class
    class function Create: _Master;
    class function CreateRemote(const MachineName: string): _Master;
  end;

// *********************************************************************//
// The Class CoPowerRex provides a Create and CreateRemote method to          
// create instances of the default interface _PowerRex exposed by              
// the CoClass PowerRex. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPowerRex = class
    class function Create: _PowerRex;
    class function CreateRemote(const MachineName: string): _PowerRex;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoPowerPointGlobal.Create: _Global;
begin
  Result := CreateComObject(CLASS_PowerPointGlobal) as _Global;
end;

class function CoPowerPointGlobal.CreateRemote(const MachineName: string): _Global;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerPointGlobal) as _Global;
end;

class function CoPowerPointSlide.Create: _Slide;
begin
  Result := CreateComObject(CLASS_PowerPointSlide) as _Slide;
end;

class function CoPowerPointSlide.CreateRemote(const MachineName: string): _Slide;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerPointSlide) as _Slide;
end;

class function CoPowerPointPresentation.Create: _Presentation;
begin
  Result := CreateComObject(CLASS_PowerPointPresentation) as _Presentation;
end;

class function CoPowerPointPresentation.CreateRemote(const MachineName: string): _Presentation;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerPointPresentation) as _Presentation;
end;

class function CoOLECtrl.Create: OCXExtender;
begin
  Result := CreateComObject(CLASS_OLECtrl) as OCXExtender;
end;

class function CoOLECtrl.CreateRemote(const MachineName: string): OCXExtender;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OLECtrl) as OCXExtender;
end;

class function CoPowerPointApplication.Create: _Application;
begin
  Result := CreateComObject(CLASS_PowerPointApplication) as _Application;
end;

class function CoPowerPointApplication.CreateRemote(const MachineName: string): _Application;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerPointApplication) as _Application;
end;

procedure TPowerPointApplication.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{91493441-5A91-11CF-8700-00AA0060263B}';
    IntfIID:   '{91493442-5A91-11CF-8700-00AA0060263B}';
    EventIID:  '{914934C2-5A91-11CF-8700-00AA0060263B}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPowerPointApplication.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as _Application;
  end;
end;

procedure TPowerPointApplication.ConnectTo(svrIntf: _Application);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TPowerPointApplication.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    if FAutoQuit then
      Quit();
    FIntf := nil;
  end;
end;

function TPowerPointApplication.GetDefaultInterface: _Application;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TPowerPointApplication.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPowerPointApplicationProperties.Create(Self);
{$ENDIF}
end;

destructor TPowerPointApplication.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPowerPointApplication.GetServerProperties: TPowerPointApplicationProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TPowerPointApplication.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    2001: if Assigned(FOnWindowSelectionChange) then
         FOnWindowSelectionChange(Self, IUnknown(TVarData(Params[0]).VPointer) as Selection {const Selection});
    2002: if Assigned(FOnWindowBeforeRightClick) then
         FOnWindowBeforeRightClick(Self,
                                   IUnknown(TVarData(Params[0]).VPointer) as Selection {const Selection},
                                   WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    2003: if Assigned(FOnWindowBeforeDoubleClick) then
         FOnWindowBeforeDoubleClick(Self,
                                    IUnknown(TVarData(Params[0]).VPointer) as Selection {const Selection},
                                    WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    2004: if Assigned(FOnPresentationClose) then
         FOnPresentationClose(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2005: if Assigned(FOnPresentationSave) then
         FOnPresentationSave(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2006: if Assigned(FOnPresentationOpen) then
         FOnPresentationOpen(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2007: if Assigned(FOnNewPresentation) then
         FOnNewPresentation(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2008: if Assigned(FOnPresentationNewSlide) then
         FOnPresentationNewSlide(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointSlide {const PowerPointSlide});
    2009: if Assigned(FOnWindowActivate) then
         FOnWindowActivate(Self,
                           IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation},
                           IUnknown(TVarData(Params[1]).VPointer) as DocumentWindow {const DocumentWindow});
    2010: if Assigned(FOnWindowDeactivate) then
         FOnWindowDeactivate(Self,
                             IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation},
                             IUnknown(TVarData(Params[1]).VPointer) as DocumentWindow {const DocumentWindow});
    2011: if Assigned(FOnSlideShowBegin) then
         FOnSlideShowBegin(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideShowWindow {const SlideShowWindow});
    2012: if Assigned(FOnSlideShowNextBuild) then
         FOnSlideShowNextBuild(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideShowWindow {const SlideShowWindow});
    2013: if Assigned(FOnSlideShowNextSlide) then
         FOnSlideShowNextSlide(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideShowWindow {const SlideShowWindow});
    2014: if Assigned(FOnSlideShowEnd) then
         FOnSlideShowEnd(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2015: if Assigned(FOnPresentationPrint) then
         FOnPresentationPrint(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2016: if Assigned(FOnSlideSelectionChanged) then
         FOnSlideSelectionChanged(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideRange {const SlideRange});
    2017: if Assigned(FOnColorSchemeChanged) then
         FOnColorSchemeChanged(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideRange {const SlideRange});
    2018: if Assigned(FOnPresentationBeforeSave) then
         FOnPresentationBeforeSave(Self,
                                   IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation},
                                   WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    2019: if Assigned(FOnSlideShowNextClick) then
         FOnSlideShowNextClick(Self,
                               IUnknown(TVarData(Params[0]).VPointer) as SlideShowWindow {const SlideShowWindow},
                               IUnknown(TVarData(Params[1]).VPointer) as Effect {const Effect});
    2020: if Assigned(FOnAfterNewPresentation) then
         FOnAfterNewPresentation(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2021: if Assigned(FOnAfterPresentationOpen) then
         FOnAfterPresentationOpen(Self, IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation});
    2022: if Assigned(FOnPresentationSync) then
         FOnPresentationSync(Self,
                             IUnknown(TVarData(Params[0]).VPointer) as PowerPointPresentation {const PowerPointPresentation},
                             Params[1] {MsoSyncEventType});
    2023: if Assigned(FOnSlideShowOnNext) then
         FOnSlideShowOnNext(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideShowWindow {const SlideShowWindow});
    2024: if Assigned(FOnSlideShowOnPrevious) then
         FOnSlideShowOnPrevious(Self, IUnknown(TVarData(Params[0]).VPointer) as SlideShowWindow {const SlideShowWindow});
  end; {case DispID}
end;

function TPowerPointApplication.Get_Presentations: Presentations;
begin
    Result := DefaultInterface.Presentations;
end;

function TPowerPointApplication.Get_Windows: DocumentWindows;
begin
    Result := DefaultInterface.Windows;
end;

function TPowerPointApplication.Get_Dialogs: IUnknown;
begin
    Result := DefaultInterface.Dialogs;
end;

function TPowerPointApplication.Get_ActiveWindow: DocumentWindow;
begin
    Result := DefaultInterface.ActiveWindow;
end;

function TPowerPointApplication.Get_ActivePresentation: PowerPointPresentation;
begin
    Result := DefaultInterface.ActivePresentation;
end;

function TPowerPointApplication.Get_SlideShowWindows: SlideShowWindows;
begin
    Result := DefaultInterface.SlideShowWindows;
end;

function TPowerPointApplication.Get_CommandBars: CommandBars;
begin
    Result := DefaultInterface.CommandBars;
end;

function TPowerPointApplication.Get_Path: WideString;
begin
    Result := DefaultInterface.Path;
end;

function TPowerPointApplication.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

function TPowerPointApplication.Get_Caption: WideString;
begin
    Result := DefaultInterface.Caption;
end;

procedure TPowerPointApplication.Set_Caption(const Caption: WideString);
  { Warning: The property Caption has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Caption := Caption;
end;

function TPowerPointApplication.Get_Assistant: Assistant;
begin
    Result := DefaultInterface.Assistant;
end;

function TPowerPointApplication.Get_FileSearch: FileSearch;
begin
    Result := DefaultInterface.FileSearch;
end;

function TPowerPointApplication.Get_FileFind: IFind;
begin
    Result := DefaultInterface.FileFind;
end;

function TPowerPointApplication.Get_Build: WideString;
begin
    Result := DefaultInterface.Build;
end;

function TPowerPointApplication.Get_Version: WideString;
begin
    Result := DefaultInterface.Version;
end;

function TPowerPointApplication.Get_OperatingSystem: WideString;
begin
    Result := DefaultInterface.OperatingSystem;
end;

function TPowerPointApplication.Get_ActivePrinter: WideString;
begin
    Result := DefaultInterface.ActivePrinter;
end;

function TPowerPointApplication.Get_Creator: Integer;
begin
    Result := DefaultInterface.Creator;
end;

function TPowerPointApplication.Get_AddIns: AddIns;
begin
    Result := DefaultInterface.AddIns;
end;

function TPowerPointApplication.Get_VBE: VBE;
begin
    Result := DefaultInterface.VBE;
end;

function TPowerPointApplication.Get_Left: Single;
begin
    Result := DefaultInterface.Left;
end;

procedure TPowerPointApplication.Set_Left(Left: Single);
begin
  DefaultInterface.Set_Left(Left);
end;

function TPowerPointApplication.Get_Top: Single;
begin
    Result := DefaultInterface.Top;
end;

procedure TPowerPointApplication.Set_Top(Top: Single);
begin
  DefaultInterface.Set_Top(Top);
end;

function TPowerPointApplication.Get_Width: Single;
begin
    Result := DefaultInterface.Width;
end;

procedure TPowerPointApplication.Set_Width(Width: Single);
begin
  DefaultInterface.Set_Width(Width);
end;

function TPowerPointApplication.Get_Height: Single;
begin
    Result := DefaultInterface.Height;
end;

procedure TPowerPointApplication.Set_Height(Height: Single);
begin
  DefaultInterface.Set_Height(Height);
end;

function TPowerPointApplication.Get_WindowState: PpWindowState;
begin
    Result := DefaultInterface.WindowState;
end;

procedure TPowerPointApplication.Set_WindowState(WindowState: PpWindowState);
begin
  DefaultInterface.Set_WindowState(WindowState);
end;

function TPowerPointApplication.Get_Visible: MsoTriState;
begin
    Result := DefaultInterface.Visible;
end;

procedure TPowerPointApplication.Set_Visible(Visible: MsoTriState);
begin
  DefaultInterface.Set_Visible(Visible);
end;

function TPowerPointApplication.Get_Active: MsoTriState;
begin
    Result := DefaultInterface.Active;
end;

function TPowerPointApplication.Get_AnswerWizard: AnswerWizard;
begin
    Result := DefaultInterface.AnswerWizard;
end;

function TPowerPointApplication.Get_COMAddIns: COMAddIns;
begin
    Result := DefaultInterface.COMAddIns;
end;

function TPowerPointApplication.Get_ProductCode: WideString;
begin
    Result := DefaultInterface.ProductCode;
end;

function TPowerPointApplication.Get_DefaultWebOptions: DefaultWebOptions;
begin
    Result := DefaultInterface.DefaultWebOptions;
end;

function TPowerPointApplication.Get_LanguageSettings: LanguageSettings;
begin
    Result := DefaultInterface.LanguageSettings;
end;

function TPowerPointApplication.Get_MsoDebugOptions: MsoDebugOptions;
begin
    Result := DefaultInterface.MsoDebugOptions;
end;

function TPowerPointApplication.Get_ShowWindowsInTaskbar: MsoTriState;
begin
    Result := DefaultInterface.ShowWindowsInTaskbar;
end;

procedure TPowerPointApplication.Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar: MsoTriState);
begin
  DefaultInterface.Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar);
end;

function TPowerPointApplication.Get_Marker: IUnknown;
begin
    Result := DefaultInterface.Marker;
end;

function TPowerPointApplication.Get_FeatureInstall: MsoFeatureInstall;
begin
    Result := DefaultInterface.FeatureInstall;
end;

procedure TPowerPointApplication.Set_FeatureInstall(FeatureInstall: MsoFeatureInstall);
begin
  DefaultInterface.Set_FeatureInstall(FeatureInstall);
end;

function TPowerPointApplication.Get_FileDialog(Type_: MsoFileDialogType): FileDialog;
begin
    Result := DefaultInterface.FileDialog[Type_];
end;

function TPowerPointApplication.Get_DisplayGridLines: MsoTriState;
begin
    Result := DefaultInterface.DisplayGridLines;
end;

procedure TPowerPointApplication.Set_DisplayGridLines(DisplayGridLines: MsoTriState);
begin
  DefaultInterface.Set_DisplayGridLines(DisplayGridLines);
end;

function TPowerPointApplication.Get_AutomationSecurity: MsoAutomationSecurity;
begin
    Result := DefaultInterface.AutomationSecurity;
end;

procedure TPowerPointApplication.Set_AutomationSecurity(AutomationSecurity: MsoAutomationSecurity);
begin
  DefaultInterface.Set_AutomationSecurity(AutomationSecurity);
end;

function TPowerPointApplication.Get_NewPresentation: NewFile;
begin
    Result := DefaultInterface.NewPresentation;
end;

function TPowerPointApplication.Get_DisplayAlerts: PpAlertLevel;
begin
    Result := DefaultInterface.DisplayAlerts;
end;

procedure TPowerPointApplication.Set_DisplayAlerts(DisplayAlerts: PpAlertLevel);
begin
  DefaultInterface.Set_DisplayAlerts(DisplayAlerts);
end;

function TPowerPointApplication.Get_ShowStartupDialog: MsoTriState;
begin
    Result := DefaultInterface.ShowStartupDialog;
end;

procedure TPowerPointApplication.Set_ShowStartupDialog(ShowStartupDialog: MsoTriState);
begin
  DefaultInterface.Set_ShowStartupDialog(ShowStartupDialog);
end;

function TPowerPointApplication.Get_AutoCorrect: AutoCorrect;
begin
    Result := DefaultInterface.AutoCorrect;
end;

function TPowerPointApplication.Get_Options: Options;
begin
    Result := DefaultInterface.Options;
end;

function TPowerPointApplication.Get_DisplayDocumentInformationPanel: WordBool;
begin
    Result := DefaultInterface.DisplayDocumentInformationPanel;
end;

procedure TPowerPointApplication.Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel: WordBool);
begin
  DefaultInterface.Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel);
end;

function TPowerPointApplication.Get_Assistance: IAssistance;
begin
    Result := DefaultInterface.Assistance;
end;

function TPowerPointApplication.Get_ActiveEncryptionSession: Integer;
begin
    Result := DefaultInterface.ActiveEncryptionSession;
end;

procedure TPowerPointApplication.Help(const HelpFile: WideString; ContextID: SYSINT);
begin
  DefaultInterface.Help(HelpFile, ContextID);
end;

procedure TPowerPointApplication.Quit;
begin
  DefaultInterface.Quit;
end;

function TPowerPointApplication.Run(const MacroName: WideString; var safeArrayOfParams: PSafeArray): OleVariant;
begin
  Result := DefaultInterface.Run(MacroName, safeArrayOfParams);
end;

function TPowerPointApplication.PPFileDialog(Type_: PpFileDialogType): IUnknown;
begin
  Result := DefaultInterface.PPFileDialog(Type_);
end;

procedure TPowerPointApplication.Activate;
begin
  DefaultInterface.Activate;
end;

function TPowerPointApplication.GetOptionFlag(Option: Integer; Persist: WordBool): WordBool;
begin
  Result := DefaultInterface.GetOptionFlag(Option, Persist);
end;

procedure TPowerPointApplication.SetOptionFlag(Option: Integer; State: WordBool; Persist: WordBool);
begin
  DefaultInterface.SetOptionFlag(Option, State, Persist);
end;

procedure TPowerPointApplication.SetPerfMarker(Marker: SYSINT);
begin
  DefaultInterface.SetPerfMarker(Marker);
end;

procedure TPowerPointApplication.LaunchPublishSlidesDialog(const SlideLibraryUrl: WideString);
begin
  DefaultInterface.LaunchPublishSlidesDialog(SlideLibraryUrl);
end;

procedure TPowerPointApplication.LaunchSendToPPTDialog(var SlideUrls: OleVariant);
begin
  DefaultInterface.LaunchSendToPPTDialog(SlideUrls);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPowerPointApplicationProperties.Create(AServer: TPowerPointApplication);
begin
  inherited Create;
  FServer := AServer;
end;

function TPowerPointApplicationProperties.GetDefaultInterface: _Application;
begin
  Result := FServer.DefaultInterface;
end;

function TPowerPointApplicationProperties.Get_Presentations: Presentations;
begin
    Result := DefaultInterface.Presentations;
end;

function TPowerPointApplicationProperties.Get_Windows: DocumentWindows;
begin
    Result := DefaultInterface.Windows;
end;

function TPowerPointApplicationProperties.Get_Dialogs: IUnknown;
begin
    Result := DefaultInterface.Dialogs;
end;

function TPowerPointApplicationProperties.Get_ActiveWindow: DocumentWindow;
begin
    Result := DefaultInterface.ActiveWindow;
end;

function TPowerPointApplicationProperties.Get_ActivePresentation: PowerPointPresentation;
begin
    Result := DefaultInterface.ActivePresentation;
end;

function TPowerPointApplicationProperties.Get_SlideShowWindows: SlideShowWindows;
begin
    Result := DefaultInterface.SlideShowWindows;
end;

function TPowerPointApplicationProperties.Get_CommandBars: CommandBars;
begin
    Result := DefaultInterface.CommandBars;
end;

function TPowerPointApplicationProperties.Get_Path: WideString;
begin
    Result := DefaultInterface.Path;
end;

function TPowerPointApplicationProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

function TPowerPointApplicationProperties.Get_Caption: WideString;
begin
    Result := DefaultInterface.Caption;
end;

procedure TPowerPointApplicationProperties.Set_Caption(const Caption: WideString);
  { Warning: The property Caption has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Caption := Caption;
end;

function TPowerPointApplicationProperties.Get_Assistant: Assistant;
begin
    Result := DefaultInterface.Assistant;
end;

function TPowerPointApplicationProperties.Get_FileSearch: FileSearch;
begin
    Result := DefaultInterface.FileSearch;
end;

function TPowerPointApplicationProperties.Get_FileFind: IFind;
begin
    Result := DefaultInterface.FileFind;
end;

function TPowerPointApplicationProperties.Get_Build: WideString;
begin
    Result := DefaultInterface.Build;
end;

function TPowerPointApplicationProperties.Get_Version: WideString;
begin
    Result := DefaultInterface.Version;
end;

function TPowerPointApplicationProperties.Get_OperatingSystem: WideString;
begin
    Result := DefaultInterface.OperatingSystem;
end;

function TPowerPointApplicationProperties.Get_ActivePrinter: WideString;
begin
    Result := DefaultInterface.ActivePrinter;
end;

function TPowerPointApplicationProperties.Get_Creator: Integer;
begin
    Result := DefaultInterface.Creator;
end;

function TPowerPointApplicationProperties.Get_AddIns: AddIns;
begin
    Result := DefaultInterface.AddIns;
end;

function TPowerPointApplicationProperties.Get_VBE: VBE;
begin
    Result := DefaultInterface.VBE;
end;

function TPowerPointApplicationProperties.Get_Left: Single;
begin
    Result := DefaultInterface.Left;
end;

procedure TPowerPointApplicationProperties.Set_Left(Left: Single);
begin
  DefaultInterface.Set_Left(Left);
end;

function TPowerPointApplicationProperties.Get_Top: Single;
begin
    Result := DefaultInterface.Top;
end;

procedure TPowerPointApplicationProperties.Set_Top(Top: Single);
begin
  DefaultInterface.Set_Top(Top);
end;

function TPowerPointApplicationProperties.Get_Width: Single;
begin
    Result := DefaultInterface.Width;
end;

procedure TPowerPointApplicationProperties.Set_Width(Width: Single);
begin
  DefaultInterface.Set_Width(Width);
end;

function TPowerPointApplicationProperties.Get_Height: Single;
begin
    Result := DefaultInterface.Height;
end;

procedure TPowerPointApplicationProperties.Set_Height(Height: Single);
begin
  DefaultInterface.Set_Height(Height);
end;

function TPowerPointApplicationProperties.Get_WindowState: PpWindowState;
begin
    Result := DefaultInterface.WindowState;
end;

procedure TPowerPointApplicationProperties.Set_WindowState(WindowState: PpWindowState);
begin
  DefaultInterface.Set_WindowState(WindowState);
end;

function TPowerPointApplicationProperties.Get_Visible: MsoTriState;
begin
    Result := DefaultInterface.Visible;
end;

procedure TPowerPointApplicationProperties.Set_Visible(Visible: MsoTriState);
begin
  DefaultInterface.Set_Visible(Visible);
end;

function TPowerPointApplicationProperties.Get_Active: MsoTriState;
begin
    Result := DefaultInterface.Active;
end;

function TPowerPointApplicationProperties.Get_AnswerWizard: AnswerWizard;
begin
    Result := DefaultInterface.AnswerWizard;
end;

function TPowerPointApplicationProperties.Get_COMAddIns: COMAddIns;
begin
    Result := DefaultInterface.COMAddIns;
end;

function TPowerPointApplicationProperties.Get_ProductCode: WideString;
begin
    Result := DefaultInterface.ProductCode;
end;

function TPowerPointApplicationProperties.Get_DefaultWebOptions: DefaultWebOptions;
begin
    Result := DefaultInterface.DefaultWebOptions;
end;

function TPowerPointApplicationProperties.Get_LanguageSettings: LanguageSettings;
begin
    Result := DefaultInterface.LanguageSettings;
end;

function TPowerPointApplicationProperties.Get_MsoDebugOptions: MsoDebugOptions;
begin
    Result := DefaultInterface.MsoDebugOptions;
end;

function TPowerPointApplicationProperties.Get_ShowWindowsInTaskbar: MsoTriState;
begin
    Result := DefaultInterface.ShowWindowsInTaskbar;
end;

procedure TPowerPointApplicationProperties.Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar: MsoTriState);
begin
  DefaultInterface.Set_ShowWindowsInTaskbar(ShowWindowsInTaskbar);
end;

function TPowerPointApplicationProperties.Get_Marker: IUnknown;
begin
    Result := DefaultInterface.Marker;
end;

function TPowerPointApplicationProperties.Get_FeatureInstall: MsoFeatureInstall;
begin
    Result := DefaultInterface.FeatureInstall;
end;

procedure TPowerPointApplicationProperties.Set_FeatureInstall(FeatureInstall: MsoFeatureInstall);
begin
  DefaultInterface.Set_FeatureInstall(FeatureInstall);
end;

function TPowerPointApplicationProperties.Get_FileDialog(Type_: MsoFileDialogType): FileDialog;
begin
    Result := DefaultInterface.FileDialog[Type_];
end;

function TPowerPointApplicationProperties.Get_DisplayGridLines: MsoTriState;
begin
    Result := DefaultInterface.DisplayGridLines;
end;

procedure TPowerPointApplicationProperties.Set_DisplayGridLines(DisplayGridLines: MsoTriState);
begin
  DefaultInterface.Set_DisplayGridLines(DisplayGridLines);
end;

function TPowerPointApplicationProperties.Get_AutomationSecurity: MsoAutomationSecurity;
begin
    Result := DefaultInterface.AutomationSecurity;
end;

procedure TPowerPointApplicationProperties.Set_AutomationSecurity(AutomationSecurity: MsoAutomationSecurity);
begin
  DefaultInterface.Set_AutomationSecurity(AutomationSecurity);
end;

function TPowerPointApplicationProperties.Get_NewPresentation: NewFile;
begin
    Result := DefaultInterface.NewPresentation;
end;

function TPowerPointApplicationProperties.Get_DisplayAlerts: PpAlertLevel;
begin
    Result := DefaultInterface.DisplayAlerts;
end;

procedure TPowerPointApplicationProperties.Set_DisplayAlerts(DisplayAlerts: PpAlertLevel);
begin
  DefaultInterface.Set_DisplayAlerts(DisplayAlerts);
end;

function TPowerPointApplicationProperties.Get_ShowStartupDialog: MsoTriState;
begin
    Result := DefaultInterface.ShowStartupDialog;
end;

procedure TPowerPointApplicationProperties.Set_ShowStartupDialog(ShowStartupDialog: MsoTriState);
begin
  DefaultInterface.Set_ShowStartupDialog(ShowStartupDialog);
end;

function TPowerPointApplicationProperties.Get_AutoCorrect: AutoCorrect;
begin
    Result := DefaultInterface.AutoCorrect;
end;

function TPowerPointApplicationProperties.Get_Options: Options;
begin
    Result := DefaultInterface.Options;
end;

function TPowerPointApplicationProperties.Get_DisplayDocumentInformationPanel: WordBool;
begin
    Result := DefaultInterface.DisplayDocumentInformationPanel;
end;

procedure TPowerPointApplicationProperties.Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel: WordBool);
begin
  DefaultInterface.Set_DisplayDocumentInformationPanel(DisplayDocumentInformationPanel);
end;

function TPowerPointApplicationProperties.Get_Assistance: IAssistance;
begin
    Result := DefaultInterface.Assistance;
end;

function TPowerPointApplicationProperties.Get_ActiveEncryptionSession: Integer;
begin
    Result := DefaultInterface.ActiveEncryptionSession;
end;

{$ENDIF}

class function CoMaster.Create: _Master;
begin
  Result := CreateComObject(CLASS_Master) as _Master;
end;

class function CoMaster.CreateRemote(const MachineName: string): _Master;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Master) as _Master;
end;

class function CoPowerRex.Create: _PowerRex;
begin
  Result := CreateComObject(CLASS_PowerRex) as _PowerRex;
end;

class function CoPowerRex.CreateRemote(const MachineName: string): _PowerRex;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PowerRex) as _PowerRex;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TPowerPointApplication]);
end;

end.
