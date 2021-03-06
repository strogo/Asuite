{
Copyright (C) 2006-2020 Matteo Salvi

Website: http://www.salvadorsoftware.com/

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
}

unit DataModules.Icons;

{$MODE DelphiUnicode}

{$I ASuite.inc}

interface

uses
  SysUtils, Classes, Controls, LCLIntf, LCLType, Graphics, Dialogs, CommCtrl,
  kgraphics, kicon, BGRAImageList, Windows, DefaultTranslator;

type

  { TdmImages }

  TdmImages = class(TDataModule)
    ilSmallIcons: TBGRAImageList;
    ilLargeIcons: TBGRAImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    FSysImageListLarge: Windows.THANDLE;
    FSysImageListSmall: Windows.THANDLE;
    { Private declarations }
    procedure DrawTransparentBitmap(DC: HDC; hBmp: HBITMAP; xStart: integer;
                                    yStart : integer; cTransparentColor : COLORREF);
    function SysImageListHandle(const Path: string; const WantLargeIcons: Boolean): Windows.THandle;
  public
    property SysImageListSmall: Windows.THANDLE read FSysImageListSmall;
    property SysImageListLarge: Windows.THANDLE read FSysImageListLarge;

    procedure GetAlphaBitmapFromImageList(ABMP: TKAlphaBitmap;const AImageIndex: Integer; ASmallIcon: Boolean = True);
    procedure DrawIconInBitmap(const AGlyph: Graphics.TBitmap;const AImageIndex: Integer; ASmallIcon: Boolean = True);

    function AddIcon(ABMP: Graphics.TBitmap; const WantLargeIcons: Boolean): Integer;
  end;

var
  dmImages: TdmImages;

implementation

uses
  ShellApi, AppConfig.Main;

{$R *.lfm}

{ TdmImages }

procedure TdmImages.DrawIconInBitmap(const AGlyph: Graphics.TBitmap;
  const AImageIndex: Integer; ASmallIcon: Boolean);
var
  BMP: Graphics.TBitmap;
begin
  AGlyph.Assign(nil);

  if AImageIndex <> -1 then
  begin
    //Buttons' image
    BMP := Graphics.TBitmap.Create;
    try
      if ASmallIcon then
        ilSmallIcons.GetBitmap(AImageIndex, BMP)
      else
        ilLargeIcons.GetBitmap(AImageIndex, BMP);
      AGlyph.Assign(BMP);
      DrawTransparentBitmap(AGlyph.Canvas.Handle, BMP.Handle, 0, 0, clWhite);
    finally
      BMP.Free;
    end;
  end;
end;

function TdmImages.AddIcon(ABMP: Graphics.TBitmap; const WantLargeIcons: Boolean): Integer;
begin
  Result := -1;
  if Assigned(ABMP) then
  begin
    if WantLargeIcons then
      Result := ilLargeIcons.Add(ABMP, nil)
    else                         
      Result := ilSmallIcons.Add(ABMP, nil);
  end;
end;

procedure TdmImages.GetAlphaBitmapFromImageList(ABMP: TKAlphaBitmap;
  const AImageIndex: Integer; ASmallIcon: Boolean);
var
  KIcon: TKIcon;
  hIcon: Windows.HICON;
begin
  if AImageIndex <> -1 then
  begin
    //Buttons' image
    KIcon := TKIcon.Create;
    try
      //Get handle from imagelist
      if ASmallIcon then
        hIcon := ImageList_GetIcon(ilSmallIcons.ResolutionByIndex[0].Reference.Handle, AImageIndex, ILD_NORMAL)
      else
        hIcon := ImageList_GetIcon(ilLargeIcons.ResolutionByIndex[0].Reference.Handle, AImageIndex, ILD_NORMAL);

      if hIcon <> 0 then
      begin
        //Load handle in TKIcon and copy it as TKAlphaBitmap (so we can't losing alpha)
        KIcon.LoadFromHandle(hIcon);
        KIcon.OptimalIcon := True;
        KIcon.CopyToAlphaBitmap(KIcon.CurrentIndex, ABMP);

        //Destroy handle, now useless
        DestroyIcon(hIcon);
      end;
    finally
      KIcon.Free;
    end;
  end;
end;

procedure TdmImages.DataModuleCreate(Sender: TObject);
begin
  FSysImageListLarge := SysImageListHandle(Config.Paths.SuitePathData, True);
  FSysImageListSmall := SysImageListHandle(Config.Paths.SuitePathData, False);
end;

procedure TdmImages.DrawTransparentBitmap(DC: HDC; hBmp: HBITMAP;
  xStart: integer; yStart: integer; cTransparentColor: COLORREF);
var
      bm:                                                  BITMAP;
      cColor:                                              COLORREF;
      bmAndBack, bmAndObject, bmAndMem, bmSave:            HBITMAP;
      bmBackOld, bmObjectOld, bmMemOld, bmSaveOld:         HBITMAP;
      hdcMem, hdcBack, hdcObject, hdcTemp, hdcSave:        HDC;
      ptSize:                                              TPOINT;

begin
   hdcTemp := CreateCompatibleDC(dc);
   SelectObject(hdcTemp, hBmp);   // Select the bitmap

   GetObject(hBmp, sizeof(BITMAP), @bm);
   ptSize.x := bm.bmWidth;            // Get width of bitmap
   ptSize.y := bm.bmHeight;           // Get height of bitmap
   DPtoLP(hdcTemp, ptSize, 1);        // Convert from device
                                      // to logical points

   // Create some DCs to hold temporary data.
   hdcBack   := CreateCompatibleDC(dc);
   hdcObject := CreateCompatibleDC(dc);
   hdcMem    := CreateCompatibleDC(dc);
   hdcSave   := CreateCompatibleDC(dc);

   // Create a bitmap for each DC. DCs are required for a number of
   // GDI functions.

   // Monochrome DC
   bmAndBack   := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);

   // Monochrome DC
   bmAndObject := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);

   bmAndMem    := CreateCompatibleBitmap(dc, ptSize.x, ptSize.y);
   bmSave      := CreateCompatibleBitmap(dc, ptSize.x, ptSize.y);

   // Each DC must select a bitmap object to store pixel data.
   bmBackOld   := SelectObject(hdcBack, bmAndBack);
   bmObjectOld := SelectObject(hdcObject, bmAndObject);
   bmMemOld    := SelectObject(hdcMem, bmAndMem);
   bmSaveOld   := SelectObject(hdcSave, bmSave);

   // Set proper mapping mode.
   SetMapMode(hdcTemp, GetMapMode(dc));

   // Save the bitmap sent here, because it will be overwritten.
   BitBlt(hdcSave, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0, SRCCOPY);

   // Set the background color of the source DC to the color.
   // contained in the parts of the bitmap that should be transparent
   cColor := SetBkColor(hdcTemp, cTransparentColor);

   // Create the object mask for the bitmap by performing a BitBlt
   // from the source bitmap to a monochrome bitmap.
   BitBlt(hdcObject, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0,
          SRCCOPY);

   // Set the background color of the source DC back to the original
   // color.
   SetBkColor(hdcTemp, cColor);

   // Create the inverse of the object mask.
   BitBlt(hdcBack, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0,
          NOTSRCCOPY);

   // Copy the background of the main DC to the destination.
   BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, dc, xStart, yStart,
          SRCCOPY);

   // Mask out the places where the bitmap will be placed.
   BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, SRCAND);

   // Mask out the transparent colored pixels on the bitmap.
   BitBlt(hdcTemp, 0, 0, ptSize.x, ptSize.y, hdcBack, 0, 0, SRCAND);

   // XOR the bitmap with the background on the destination DC.
   BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0, SRCPAINT);

   // Copy the destination to the screen.
   BitBlt(dc, xStart, yStart, ptSize.x, ptSize.y, hdcMem, 0, 0,
          SRCCOPY);

   // Place the original bitmap back into the bitmap sent here.
   BitBlt(hdcTemp, 0, 0, ptSize.x, ptSize.y, hdcSave, 0, 0, SRCCOPY);

   // Delete the memory bitmaps.
   DeleteObject(SelectObject(hdcBack, bmBackOld));
   DeleteObject(SelectObject(hdcObject, bmObjectOld));
   DeleteObject(SelectObject(hdcMem, bmMemOld));
   DeleteObject(SelectObject(hdcSave, bmSaveOld));

   // Delete the memory DCs.
   DeleteDC(hdcMem);
   DeleteDC(hdcBack);
   DeleteDC(hdcObject);
   DeleteDC(hdcSave);
   DeleteDC(hdcTemp);
end;

function TdmImages.SysImageListHandle(const Path: string;
  const WantLargeIcons: Boolean): Windows.THandle;
  {Returns a handle to the system image list for path Path.
  WantLargeIcons determines if the image list is to contain large or small
  icons.}
var
  FI: ShellAPI.TSHFileInfoW; // required file info structure
  Flags: Windows.UINT;      // flags used to request image list
begin
  Flags := ShellAPI.SHGFI_SYSICONINDEX or ShellAPI.SHGFI_ICON;

  if WantLargeIcons then
    Flags := Flags or ShellAPI.SHGFI_LARGEICON
  else
    Flags := Flags or ShellAPI.SHGFI_SMALLICON;

  Result := ShellAPI.SHGetFileInfo(PChar(Path), 0, FI, SizeOf(FI), Flags);
end;

end.

