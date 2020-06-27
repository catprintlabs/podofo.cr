#include "bindgen_helper.hpp"
#include <podofo/podofo.h>

struct BgJumptable_PdfDocument {
  CrystalProc<PoDoFo::EPdfWriteMode> bg_PoDoFo__PdfDocument_GetWriteMode_;
  CrystalProc<PoDoFo::EPdfVersion> bg_PoDoFo__PdfDocument_GetPdfVersion_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsLinearized_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsPrintAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsEditAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsCopyAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsEditNotesAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfDocument_IsHighPrintAllowed_;
};
struct BgInherit_PdfDocument : public PoDoFo::PdfDocument {
  using PoDoFo::PdfDocument::PdfDocument;
  BgJumptable_PdfDocument bgJump;
  PoDoFo::EPdfWriteMode GetWriteMode() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_GetWriteMode_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_GetWriteMode_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::GetWriteMode");
    }
  }

  PoDoFo::EPdfVersion GetPdfVersion() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_GetPdfVersion_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_GetPdfVersion_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::GetPdfVersion");
    }
  }

  bool IsLinearized() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsLinearized_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsLinearized_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsLinearized");
    }
  }

  bool IsPrintAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsPrintAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsPrintAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsPrintAllowed");
    }
  }

  bool IsEditAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsEditAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsEditAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsEditAllowed");
    }
  }

  bool IsCopyAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsCopyAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsCopyAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsCopyAllowed");
    }
  }

  bool IsEditNotesAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsEditNotesAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsEditNotesAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsEditNotesAllowed");
    }
  }

  bool IsFillAndSignAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsFillAndSignAllowed");
    }
  }

  bool IsAccessibilityAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsAccessibilityAllowed");
    }
  }

  bool IsDocAssemblyAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsDocAssemblyAllowed");
    }
  }

  bool IsHighPrintAllowed() const override {
    const BgInherit_PdfDocument *_self_ = this;
    if (bindgen_likely(_self_->bgJump.bg_PoDoFo__PdfDocument_IsHighPrintAllowed_.isValid())) {
      return _self_->bgJump.bg_PoDoFo__PdfDocument_IsHighPrintAllowed_();
    } else {
      bindgen_fatal_panic("No implementation for pure method PoDoFo::PdfDocument::IsHighPrintAllowed");
    }
  }

};
extern "C" PoDoFo::EPdfWriteMode bg_PoDoFo__PdfDocument_GetWriteMode_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetWriteMode();
}

extern "C" PoDoFo::EPdfVersion bg_PoDoFo__PdfDocument_GetPdfVersion_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetPdfVersion();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsLinearized_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsLinearized();
}

extern "C" PoDoFo::PdfInfo * bg_PoDoFo__PdfDocument_GetInfo_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetInfo();
}

extern "C" PoDoFo::PdfOutlines * bg_PoDoFo__PdfDocument_GetOutlines_bool(PoDoFo::PdfDocument * _self_, bool bCreate) {
  return _self_->GetOutlines(bCreate);
}

extern "C" PoDoFo::PdfNamesTree * bg_PoDoFo__PdfDocument_GetNamesTree_bool(PoDoFo::PdfDocument * _self_, bool bCreate) {
  return _self_->GetNamesTree(bCreate);
}

extern "C" PoDoFo::PdfAcroForm * bg_PoDoFo__PdfDocument_GetAcroForm_bool_PoDoFo__EPdfAcroFormDefaulAppearance(PoDoFo::PdfDocument * _self_, bool bCreate, PoDoFo::EPdfAcroFormDefaulAppearance & eDefaultAppearance) {
  return _self_->GetAcroForm(bCreate, eDefaultAppearance);
}

extern "C" PoDoFo::PdfPagesTree * bg_PoDoFo__PdfDocument_GetPagesTree_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetPagesTree();
}

extern "C" int bg_PoDoFo__PdfDocument_GetPageCount_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetPageCount();
}

extern "C" PoDoFo::PdfPage * bg_PoDoFo__PdfDocument_GetPage_int(PoDoFo::PdfDocument * _self_, int nIndex) {
  return _self_->GetPage(nIndex);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bSymbolCharset) {
  return _self_->CreateFont(pszFontName, bSymbolCharset);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding) {
  return _self_->CreateFont(pszFontName, bSymbolCharset, pEncoding);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, PoDoFo::PdfFontCache::EFontCreationFlags & eFontCreationFlags) {
  return _self_->CreateFont(pszFontName, bSymbolCharset, pEncoding, eFontCreationFlags);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, PoDoFo::PdfFontCache::EFontCreationFlags & eFontCreationFlags, bool bEmbedd) {
  return _self_->CreateFont(pszFontName, bSymbolCharset, pEncoding, eFontCreationFlags, bEmbedd);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset) {
  return _self_->CreateFont(pszFontName, bBold, bItalic, bSymbolCharset);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding) {
  return _self_->CreateFont(pszFontName, bBold, bItalic, bSymbolCharset, pEncoding);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, PoDoFo::PdfFontCache::EFontCreationFlags & eFontCreationFlags) {
  return _self_->CreateFont(pszFontName, bBold, bItalic, bSymbolCharset, pEncoding, eFontCreationFlags);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, PoDoFo::PdfFontCache::EFontCreationFlags & eFontCreationFlags, bool bEmbedd) {
  return _self_->CreateFont(pszFontName, bBold, bItalic, bSymbolCharset, pEncoding, eFontCreationFlags, bEmbedd);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool_const_char_X(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, PoDoFo::PdfFontCache::EFontCreationFlags & eFontCreationFlags, bool bEmbedd, const char * pszFileName) {
  return _self_->CreateFont(pszFontName, bBold, bItalic, bSymbolCharset, pEncoding, eFontCreationFlags, bEmbedd, pszFileName);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool(PoDoFo::PdfDocument * _self_, FT_FaceRec_ * face, bool bSymbolCharset) {
  return _self_->CreateFont(face, bSymbolCharset);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool_const_PoDoFo__PdfEncoding_Xconst(PoDoFo::PdfDocument * _self_, FT_FaceRec_ * face, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding) {
  return _self_->CreateFont(face, bSymbolCharset, pEncoding);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool_const_PoDoFo__PdfEncoding_Xconst_bool(PoDoFo::PdfDocument * _self_, FT_FaceRec_ * face, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, bool bEmbedd) {
  return _self_->CreateFont(face, bSymbolCharset, pEncoding, bEmbedd);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateDuplicateFontType1_PoDoFo__PdfFont_X_const_char_X(PoDoFo::PdfDocument * _self_, PoDoFo::PdfFont * pFont, const char * pszSuffix) {
  return _self_->CreateDuplicateFontType1(pFont, pszSuffix);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset) {
  return _self_->CreateFontSubset(pszFontName, bBold, bItalic, bSymbolCharset);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding) {
  return _self_->CreateFontSubset(pszFontName, bBold, bItalic, bSymbolCharset, pEncoding);
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_const_char_X(PoDoFo::PdfDocument * _self_, const char * pszFontName, bool bBold, bool bItalic, bool bSymbolCharset, const PoDoFo::PdfEncoding * pEncoding, const char * pszFileName) {
  return _self_->CreateFontSubset(pszFontName, bBold, bItalic, bSymbolCharset, pEncoding, pszFileName);
}

extern "C" FT_LibraryRec_ * bg_PoDoFo__PdfDocument_GetFontLibrary_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetFontLibrary();
}

extern "C" void bg_PoDoFo__PdfDocument_EmbedSubsetFonts_(PoDoFo::PdfDocument * _self_) {
  _self_->EmbedSubsetFonts();
}

extern "C" PoDoFo::PdfPage * bg_PoDoFo__PdfDocument_CreatePage_const_PoDoFo__PdfRect_R(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfRect & rSize) {
  return _self_->CreatePage(rSize);
}

extern "C" void bg_PoDoFo__PdfDocument_CreatePages_const_std__vector_PoDoFo__PdfRect__R(PoDoFo::PdfDocument * _self_, const std::vector<PoDoFo::PdfRect> & vecSizes) {
  _self_->CreatePages(vecSizes);
}

extern "C" PoDoFo::PdfPage * bg_PoDoFo__PdfDocument_InsertPage_const_PoDoFo__PdfRect_R_int(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfRect & rSize, int atIndex) {
  return _self_->InsertPage(rSize, atIndex);
}

extern "C" const PoDoFo::PdfDocument * bg_PoDoFo__PdfDocument_Append_const_PoDoFo__PdfMemDocument_R_bool(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfMemDocument & rDoc, bool bAppendAll) {
  return &(_self_->Append(rDoc, bAppendAll));
}

extern "C" const PoDoFo::PdfDocument * bg_PoDoFo__PdfDocument_InsertExistingPageAt_const_PoDoFo__PdfMemDocument_R_int_int(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfMemDocument & rDoc, int nPageIndex, int nAtIndex) {
  return &(_self_->InsertExistingPageAt(rDoc, nPageIndex, nAtIndex));
}

extern "C" PoDoFo::PdfRect * bg_PoDoFo__PdfDocument_FillXObjectFromDocumentPage_PoDoFo__PdfXObject_X_const_PoDoFo__PdfMemDocument_R_int_bool(PoDoFo::PdfDocument * _self_, PoDoFo::PdfXObject * pXObj, const PoDoFo::PdfMemDocument & rDoc, int nPage, bool bUseTrimBox) {
  return new (UseGC) PoDoFo::PdfRect (_self_->FillXObjectFromDocumentPage(pXObj, rDoc, nPage, bUseTrimBox));
}

extern "C" PoDoFo::PdfRect * bg_PoDoFo__PdfDocument_FillXObjectFromExistingPage_PoDoFo__PdfXObject_X_int_bool(PoDoFo::PdfDocument * _self_, PoDoFo::PdfXObject * pXObj, int nPage, bool bUseTrimBox) {
  return new (UseGC) PoDoFo::PdfRect (_self_->FillXObjectFromExistingPage(pXObj, nPage, bUseTrimBox));
}

extern "C" PoDoFo::PdfRect * bg_PoDoFo__PdfDocument_FillXObjectFromPage_PoDoFo__PdfXObject_X_const_PoDoFo__PdfPage_X_bool_unsigned_int(PoDoFo::PdfDocument * _self_, PoDoFo::PdfXObject * pXObj, const PoDoFo::PdfPage * pPage, bool bUseTrimBox, unsigned int difference) {
  return new (UseGC) PoDoFo::PdfRect (_self_->FillXObjectFromPage(pXObj, pPage, bUseTrimBox, difference));
}

extern "C" void bg_PoDoFo__PdfDocument_AttachFile_const_PoDoFo__PdfFileSpec_R(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfFileSpec & rFileSpec) {
  _self_->AttachFile(rFileSpec);
}

extern "C" PoDoFo::PdfFileSpec * bg_PoDoFo__PdfDocument_GetAttachment_const_PoDoFo__PdfString_R(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfString & rName) {
  return _self_->GetAttachment(rName);
}

extern "C" void bg_PoDoFo__PdfDocument_AddNamedDestination_const_PoDoFo__PdfDestination_R_const_PoDoFo__PdfString_R(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfDestination & rDest, const PoDoFo::PdfString & rsName) {
  _self_->AddNamedDestination(rDest, rsName);
}

extern "C" void bg_PoDoFo__PdfDocument_SetPageMode_PoDoFo__EPdfPageMode(PoDoFo::PdfDocument * _self_, PoDoFo::EPdfPageMode inMode) {
  _self_->SetPageMode(inMode);
}

extern "C" PoDoFo::EPdfPageMode bg_PoDoFo__PdfDocument_GetPageMode_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetPageMode();
}

extern "C" void bg_PoDoFo__PdfDocument_SetUseFullScreen_(PoDoFo::PdfDocument * _self_) {
  _self_->SetUseFullScreen();
}

extern "C" void bg_PoDoFo__PdfDocument_SetPageLayout_PoDoFo__EPdfPageLayout(PoDoFo::PdfDocument * _self_, PoDoFo::EPdfPageLayout inLayout) {
  _self_->SetPageLayout(inLayout);
}

extern "C" void bg_PoDoFo__PdfDocument_SetHideToolbar_(PoDoFo::PdfDocument * _self_) {
  _self_->SetHideToolbar();
}

extern "C" void bg_PoDoFo__PdfDocument_SetHideMenubar_(PoDoFo::PdfDocument * _self_) {
  _self_->SetHideMenubar();
}

extern "C" void bg_PoDoFo__PdfDocument_SetHideWindowUI_(PoDoFo::PdfDocument * _self_) {
  _self_->SetHideWindowUI();
}

extern "C" void bg_PoDoFo__PdfDocument_SetFitWindow_(PoDoFo::PdfDocument * _self_) {
  _self_->SetFitWindow();
}

extern "C" void bg_PoDoFo__PdfDocument_SetCenterWindow_(PoDoFo::PdfDocument * _self_) {
  _self_->SetCenterWindow();
}

extern "C" void bg_PoDoFo__PdfDocument_SetDisplayDocTitle_(PoDoFo::PdfDocument * _self_) {
  _self_->SetDisplayDocTitle();
}

extern "C" void bg_PoDoFo__PdfDocument_SetPrintScaling_PoDoFo__PdfName_R(PoDoFo::PdfDocument * _self_, PoDoFo::PdfName & inScalingType) {
  _self_->SetPrintScaling(inScalingType);
}

extern "C" void bg_PoDoFo__PdfDocument_SetBaseURI_const_std__string_R(PoDoFo::PdfDocument * _self_, const CrystalString inBaseURI) {
  _self_->SetBaseURI(bindgen_crystal_to_stdstring(inBaseURI));
}

extern "C" void bg_PoDoFo__PdfDocument_SetLanguage_const_std__string_R(PoDoFo::PdfDocument * _self_, const CrystalString inLanguage) {
  _self_->SetLanguage(bindgen_crystal_to_stdstring(inLanguage));
}

extern "C" void bg_PoDoFo__PdfDocument_SetBindingDirection_PoDoFo__PdfName_R(PoDoFo::PdfDocument * _self_, PoDoFo::PdfName & inDirection) {
  _self_->SetBindingDirection(inDirection);
}

extern "C" bool bg_PoDoFo__PdfDocument_IsPrintAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsPrintAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsEditAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsEditAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsCopyAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsCopyAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsEditNotesAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsEditNotesAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsFillAndSignAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsAccessibilityAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsDocAssemblyAllowed();
}

extern "C" bool bg_PoDoFo__PdfDocument_IsHighPrintAllowed_(PoDoFo::PdfDocument * _self_) {
  return _self_->IsHighPrintAllowed();
}

extern "C" PoDoFo::PdfVecObjects * bg_PoDoFo__PdfDocument_GetObjects_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetObjects();
}

extern "C" void bg_PoDoFo__PdfDocument_SetFontConfigWrapper_const_PoDoFo__PdfFontConfigWrapper_R(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfFontConfigWrapper & rFontConfig) {
  _self_->SetFontConfigWrapper(rFontConfig);
}

extern "C" PoDoFo::PdfDocument * bg_PoDoFo__PdfDocument__CONSTRUCT_bool(bool bEmpty) {
  return new (UseGC) BgInherit_PdfDocument(bEmpty);
}

extern "C" void bg_PoDoFo__PdfDocument_SetInfo_PoDoFo__PdfInfo_X(PoDoFo::PdfDocument * _self_, PoDoFo::PdfInfo * pInfo) {
  _self_->SetInfo(pInfo);
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfDocument_GetCatalog_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetCatalog();
}

extern "C" void bg_PoDoFo__PdfDocument_SetCatalog_PoDoFo__PdfObject_X(PoDoFo::PdfDocument * _self_, PoDoFo::PdfObject * pObject) {
  _self_->SetCatalog(pObject);
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfDocument_GetTrailer_(PoDoFo::PdfDocument * _self_) {
  return _self_->GetTrailer();
}

extern "C" void bg_PoDoFo__PdfDocument_SetTrailer_PoDoFo__PdfObject_X(PoDoFo::PdfDocument * _self_, PoDoFo::PdfObject * pObject) {
  _self_->SetTrailer(pObject);
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfDocument_GetNamedObjectFromCatalog_const_char_X(PoDoFo::PdfDocument * _self_, const char * pszName) {
  return _self_->GetNamedObjectFromCatalog(pszName);
}

extern "C" void bg_PoDoFo__PdfDocument_InitPagesTree_(PoDoFo::PdfDocument * _self_) {
  _self_->InitPagesTree();
}

extern "C" void bg_PoDoFo__PdfDocument_FixObjectReferences_PoDoFo__PdfObject_X_int(PoDoFo::PdfDocument * _self_, PoDoFo::PdfObject * pObject, int difference) {
  _self_->FixObjectReferences(pObject, difference);
}

extern "C" void bg_PoDoFo__PdfDocument_SetViewerPreference_const_PoDoFo__PdfName_R_const_PoDoFo__PdfObject_R(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfName & whichPref, const PoDoFo::PdfObject & valueObj) {
  _self_->SetViewerPreference(whichPref, valueObj);
}

extern "C" void bg_PoDoFo__PdfDocument_SetViewerPreference_const_PoDoFo__PdfName_R_bool(PoDoFo::PdfDocument * _self_, const PoDoFo::PdfName & whichPref, bool inValue) {
  _self_->SetViewerPreference(whichPref, inValue);
}

extern "C" void bg_PoDoFo__PdfDocument_Clear_(PoDoFo::PdfDocument * _self_) {
  _self_->Clear();
}

extern "C" void bg_BgInherit_PdfDocument_JUMPTABLE_BgJumptable_PdfDocument_R(BgInherit_PdfDocument * _self_, const BgJumptable_PdfDocument & table) {
  _self_->bgJump = (table);
}

struct BgJumptable_PdfMemDocument {
  CrystalProc<PoDoFo::EPdfWriteMode> bg_PoDoFo__PdfMemDocument_GetWriteMode_;
  CrystalProc<PoDoFo::EPdfVersion> bg_PoDoFo__PdfMemDocument_GetPdfVersion_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsLinearized_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsPrintAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsEditAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsCopyAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_;
  CrystalProc<bool> bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_;
};
struct BgInherit_PdfMemDocument : public PoDoFo::PdfMemDocument {
  using PoDoFo::PdfMemDocument::PdfMemDocument;
  BgJumptable_PdfMemDocument bgJump;
  PoDoFo::EPdfWriteMode GetWriteMode() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_GetWriteMode_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_GetWriteMode_();
    } else {
      return PoDoFo::PdfMemDocument::GetWriteMode();
    }
  }

  PoDoFo::EPdfVersion GetPdfVersion() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_GetPdfVersion_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_GetPdfVersion_();
    } else {
      return PoDoFo::PdfMemDocument::GetPdfVersion();
    }
  }

  bool IsLinearized() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsLinearized_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsLinearized_();
    } else {
      return PoDoFo::PdfMemDocument::IsLinearized();
    }
  }

  bool IsPrintAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsPrintAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsPrintAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsPrintAllowed();
    }
  }

  bool IsEditAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsEditAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsEditAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsEditAllowed();
    }
  }

  bool IsCopyAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsCopyAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsCopyAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsCopyAllowed();
    }
  }

  bool IsEditNotesAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsEditNotesAllowed();
    }
  }

  bool IsFillAndSignAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsFillAndSignAllowed();
    }
  }

  bool IsAccessibilityAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsAccessibilityAllowed();
    }
  }

  bool IsDocAssemblyAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsDocAssemblyAllowed();
    }
  }

  bool IsHighPrintAllowed() const override {
    const BgInherit_PdfMemDocument *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_.isValid()) {
      return _self_->bgJump.bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_();
    } else {
      return PoDoFo::PdfMemDocument::IsHighPrintAllowed();
    }
  }

};
extern "C" PoDoFo::PdfMemDocument * bg_PoDoFo__PdfMemDocument__CONSTRUCT_() {
  return new (UseGC) BgInherit_PdfMemDocument();
}

extern "C" PoDoFo::PdfMemDocument * bg_PoDoFo__PdfMemDocument__CONSTRUCT_bool(bool bOnlyTrailer) {
  return new (UseGC) BgInherit_PdfMemDocument(bOnlyTrailer);
}

extern "C" PoDoFo::PdfMemDocument * bg_PoDoFo__PdfMemDocument__CONSTRUCT_const_char_X_bool(const char * pszFilename, bool bForUpdate) {
  return new (UseGC) BgInherit_PdfMemDocument(pszFilename, bForUpdate);
}

extern "C" void bg_PoDoFo__PdfMemDocument_Load_const_char_X_bool(PoDoFo::PdfMemDocument * _self_, const char * pszFilename, bool bForUpdate) {
  _self_->Load(pszFilename, bForUpdate);
}

extern "C" void bg_PoDoFo__PdfMemDocument_LoadFromBuffer_const_char_X_long_bool(PoDoFo::PdfMemDocument * _self_, const char * pBuffer, long lLen, bool bForUpdate) {
  _self_->LoadFromBuffer(pBuffer, lLen, bForUpdate);
}

extern "C" void bg_PoDoFo__PdfMemDocument_LoadFromDevice_const_PoDoFo__PdfRefCountedInputDevice_R_bool(PoDoFo::PdfMemDocument * _self_, const PoDoFo::PdfRefCountedInputDevice & rDevice, bool bForUpdate) {
  _self_->LoadFromDevice(rDevice, bForUpdate);
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsLoaded_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsLoaded();
}

extern "C" void bg_PoDoFo__PdfMemDocument_Write_const_char_X(PoDoFo::PdfMemDocument * _self_, const char * pszFilename) {
  _self_->Write(pszFilename);
}

extern "C" void bg_PoDoFo__PdfMemDocument_Write_PoDoFo__PdfOutputDevice_X(PoDoFo::PdfMemDocument * _self_, PoDoFo::PdfOutputDevice * pDevice) {
  _self_->Write(pDevice);
}

extern "C" void bg_PoDoFo__PdfMemDocument_WriteUpdate_const_char_X(PoDoFo::PdfMemDocument * _self_, const char * pszFilename) {
  _self_->WriteUpdate(pszFilename);
}

extern "C" void bg_PoDoFo__PdfMemDocument_WriteUpdate_PoDoFo__PdfOutputDevice_X_bool(PoDoFo::PdfMemDocument * _self_, PoDoFo::PdfOutputDevice * pDevice, bool bTruncate) {
  _self_->WriteUpdate(pDevice, bTruncate);
}

extern "C" void bg_PoDoFo__PdfMemDocument_SetWriteMode_PoDoFo__EPdfWriteMode(PoDoFo::PdfMemDocument * _self_, PoDoFo::EPdfWriteMode eWriteMode) {
  _self_->SetWriteMode(eWriteMode);
}

extern "C" PoDoFo::EPdfWriteMode bg_PoDoFo__PdfMemDocument_GetWriteMode_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetWriteMode();
}

extern "C" void bg_PoDoFo__PdfMemDocument_SetPdfVersion_PoDoFo__EPdfVersion(PoDoFo::PdfMemDocument * _self_, PoDoFo::EPdfVersion eVersion) {
  _self_->SetPdfVersion(eVersion);
}

extern "C" PoDoFo::EPdfVersion bg_PoDoFo__PdfMemDocument_GetPdfVersion_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetPdfVersion();
}

extern "C" void bg_PoDoFo__PdfMemDocument_AddPdfExtension_const_char_X_PoDoFo__pdf_int64(PoDoFo::PdfMemDocument * _self_, const char * ns, PoDoFo::pdf_int64 & level) {
  _self_->AddPdfExtension(ns, level);
}

extern "C" bool bg_PoDoFo__PdfMemDocument_HasPdfExtension_const_char_X_PoDoFo__pdf_int64(PoDoFo::PdfMemDocument * _self_, const char * ns, PoDoFo::pdf_int64 & level) {
  return _self_->HasPdfExtension(ns, level);
}

extern "C" void bg_PoDoFo__PdfMemDocument_RemovePdfExtension_const_char_X_PoDoFo__pdf_int64(PoDoFo::PdfMemDocument * _self_, const char * ns, PoDoFo::pdf_int64 & level) {
  _self_->RemovePdfExtension(ns, level);
}

extern "C" std::vector<PoDoFo::PdfExtension> * bg_PoDoFo__PdfMemDocument_GetPdfExtensions_(PoDoFo::PdfMemDocument * _self_) {
  return new (UseGC) std::vector<PoDoFo::PdfExtension> (_self_->GetPdfExtensions());
}

extern "C" void bg_PoDoFo__PdfMemDocument_SetPassword_const_std__string_R(PoDoFo::PdfMemDocument * _self_, const CrystalString sPassword) {
  _self_->SetPassword(bindgen_crystal_to_stdstring(sPassword));
}

extern "C" void bg_PoDoFo__PdfMemDocument_SetEncrypted_const_std__string_R_const_std__string_R_int_PoDoFo__PdfEncrypt__EPdfEncryptAlgorithm_PoDoFo__PdfEncrypt__EPdfKeyLength(PoDoFo::PdfMemDocument * _self_, const CrystalString userPassword, const CrystalString ownerPassword, int protection, PoDoFo::PdfEncrypt::EPdfEncryptAlgorithm & eAlgorithm, PoDoFo::PdfEncrypt::EPdfKeyLength & eKeyLength) {
  _self_->SetEncrypted(bindgen_crystal_to_stdstring(userPassword), bindgen_crystal_to_stdstring(ownerPassword), protection, eAlgorithm, eKeyLength);
}

extern "C" void bg_PoDoFo__PdfMemDocument_SetEncrypted_const_PoDoFo__PdfEncrypt_R(PoDoFo::PdfMemDocument * _self_, const PoDoFo::PdfEncrypt & pEncrypt) {
  _self_->SetEncrypted(pEncrypt);
}

extern "C" bool bg_PoDoFo__PdfMemDocument_GetEncrypted_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetEncrypted();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsLinearized_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsLinearized();
}

extern "C" const PoDoFo::PdfVecObjects * bg_PoDoFo__PdfMemDocument_GetObjects_(PoDoFo::PdfMemDocument * _self_) {
  return &(_self_->GetObjects());
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfMemDocument_GetCatalog_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetCatalog();
}

extern "C" const PoDoFo::PdfObject * bg_PoDoFo__PdfMemDocument_GetTrailer_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetTrailer();
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfMemDocument_GetStructTreeRoot_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetStructTreeRoot();
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfMemDocument_GetMetadata_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetMetadata();
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfMemDocument_GetMarkInfo_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetMarkInfo();
}

extern "C" PoDoFo::PdfObject * bg_PoDoFo__PdfMemDocument_GetLanguage_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetLanguage();
}

extern "C" PoDoFo::PdfFont * bg_PoDoFo__PdfMemDocument_GetFont_PoDoFo__PdfObject_X(PoDoFo::PdfMemDocument * _self_, PoDoFo::PdfObject * pObject) {
  return _self_->GetFont(pObject);
}

extern "C" const PoDoFo::PdfMemDocument * bg_PoDoFo__PdfMemDocument_InsertPages_const_PoDoFo__PdfMemDocument_R_int_int(PoDoFo::PdfMemDocument * _self_, const PoDoFo::PdfMemDocument & rDoc, int inFirstPage, int inNumPages) {
  return &(_self_->InsertPages(rDoc, inFirstPage, inNumPages));
}

extern "C" void bg_PoDoFo__PdfMemDocument_DeletePages_int_int(PoDoFo::PdfMemDocument * _self_, int inFirstPage, int inNumPages) {
  _self_->DeletePages(inFirstPage, inNumPages);
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsPrintAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsPrintAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsEditAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsEditAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsCopyAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsCopyAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsEditNotesAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsFillAndSignAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsAccessibilityAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsDocAssemblyAllowed();
}

extern "C" bool bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->IsHighPrintAllowed();
}

extern "C" void bg_PoDoFo__PdfMemDocument_FreeObjectMemory_const_PoDoFo__PdfReference_R_bool(PoDoFo::PdfMemDocument * _self_, const PoDoFo::PdfReference & rRef, bool bForce) {
  _self_->FreeObjectMemory(rRef, bForce);
}

extern "C" void bg_PoDoFo__PdfMemDocument_FreeObjectMemory_PoDoFo__PdfObject_X_bool(PoDoFo::PdfMemDocument * _self_, PoDoFo::PdfObject * pObj, bool bForce) {
  _self_->FreeObjectMemory(pObj, bForce);
}

extern "C" const PoDoFo::PdfEncrypt * bg_PoDoFo__PdfMemDocument_GetEncrypt_(PoDoFo::PdfMemDocument * _self_) {
  return _self_->GetEncrypt();
}

extern "C" void bg_BgInherit_PdfMemDocument_JUMPTABLE_BgJumptable_PdfMemDocument_R(BgInherit_PdfMemDocument * _self_, const BgJumptable_PdfMemDocument & table) {
  _self_->bgJump = (table);
}

struct BgJumptable_PdfString {
  CrystalProc<void, PoDoFo::PdfOutputDevice *, PoDoFo::EPdfWriteMode, const PoDoFo::PdfEncrypt *> bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X;
};
struct BgInherit_PdfString : public PoDoFo::PdfString {
  using PoDoFo::PdfString::PdfString;
  BgJumptable_PdfString bgJump;
  void Write(PoDoFo::PdfOutputDevice * pDevice, PoDoFo::EPdfWriteMode eWriteMode, const PoDoFo::PdfEncrypt * pEncrypt) const override {
    const BgInherit_PdfString *_self_ = this;
    if (_self_->bgJump.bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X.isValid()) {
      _self_->bgJump.bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X(pDevice, eWriteMode, pEncrypt);
    } else {
      PoDoFo::PdfString::Write(pDevice, eWriteMode, pEncrypt);
    }
  }

};
extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_() {
  return new (UseGC) BgInherit_PdfString();
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_std__string_R_const_PoDoFo__PdfEncoding_Xconst(const CrystalString sString, const PoDoFo::PdfEncoding * pEncoding) {
  return new (UseGC) BgInherit_PdfString(bindgen_crystal_to_stdstring(sString), pEncoding);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_char_X_const_PoDoFo__PdfEncoding_Xconst(const char * pszString, const PoDoFo::PdfEncoding * pEncoding) {
  return new (UseGC) BgInherit_PdfString(pszString, pEncoding);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_wchar_t_X_PoDoFo__pdf_long(const wchar_t * pszString, PoDoFo::pdf_long & lLen) {
  return new (UseGC) BgInherit_PdfString(pszString, lLen);
}

extern "C" void bg_PoDoFo__PdfString_setFromWchar_t_const_wchar_t_X_PoDoFo__pdf_long(PoDoFo::PdfString * _self_, const wchar_t * pszString, PoDoFo::pdf_long & lLen) {
  _self_->setFromWchar_t(pszString, lLen);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_char_X_PoDoFo__pdf_long_bool_const_PoDoFo__PdfEncoding_Xconst(const char * pszString, PoDoFo::pdf_long & lLen, bool bHex, const PoDoFo::PdfEncoding * pEncoding) {
  return new (UseGC) BgInherit_PdfString(pszString, lLen, bHex, pEncoding);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf8_X(const PoDoFo::pdf_utf8 * pszStringUtf8) {
  return new (UseGC) BgInherit_PdfString(pszStringUtf8);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf16be_X(const PoDoFo::pdf_utf16be * pszStringUtf16) {
  return new (UseGC) BgInherit_PdfString(pszStringUtf16);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long(const PoDoFo::pdf_utf8 * pszStringUtf8, PoDoFo::pdf_long & lLen) {
  return new (UseGC) BgInherit_PdfString(pszStringUtf8, lLen);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long(const PoDoFo::pdf_utf16be * pszStringUtf16, PoDoFo::pdf_long & lLen) {
  return new (UseGC) BgInherit_PdfString(pszStringUtf16, lLen);
}

extern "C" void bg_PoDoFo__PdfString_SetHexData_const_char_X_PoDoFo__pdf_long_PoDoFo__PdfEncrypt_X(PoDoFo::PdfString * _self_, const char * pszHex, PoDoFo::pdf_long & lLen, PoDoFo::PdfEncrypt * pEncrypt) {
  _self_->SetHexData(pszHex, lLen, pEncrypt);
}

extern "C" bool bg_PoDoFo__PdfString_IsValid_(PoDoFo::PdfString * _self_) {
  return _self_->IsValid();
}

extern "C" bool bg_PoDoFo__PdfString_IsHex_(PoDoFo::PdfString * _self_) {
  return _self_->IsHex();
}

extern "C" bool bg_PoDoFo__PdfString_IsUnicode_(PoDoFo::PdfString * _self_) {
  return _self_->IsUnicode();
}

extern "C" const char * bg_PoDoFo__PdfString_GetString_(PoDoFo::PdfString * _self_) {
  return _self_->GetString();
}

extern "C" const PoDoFo::pdf_utf16be * bg_PoDoFo__PdfString_GetUnicode_(PoDoFo::PdfString * _self_) {
  return _self_->GetUnicode();
}

extern "C" const CrystalString bg_PoDoFo__PdfString_GetStringUtf8_(PoDoFo::PdfString * _self_) {
  return bindgen_stdstring_to_crystal(_self_->GetStringUtf8());
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_GetLength_(PoDoFo::PdfString * _self_) {
  return new (UseGC) PoDoFo::pdf_long (_self_->GetLength());
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_GetUnicodeLength_(PoDoFo::PdfString * _self_) {
  return new (UseGC) PoDoFo::pdf_long (_self_->GetUnicodeLength());
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_GetCharacterLength_(PoDoFo::PdfString * _self_) {
  return new (UseGC) PoDoFo::pdf_long (_self_->GetCharacterLength());
}

extern "C" void bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X(PoDoFo::PdfString * _self_, PoDoFo::PdfOutputDevice * pDevice, PoDoFo::EPdfWriteMode eWriteMode, const PoDoFo::PdfEncrypt * pEncrypt) {
  _self_->Write(pDevice, eWriteMode, pEncrypt);
}

extern "C" PoDoFo::PdfString * bg_PoDoFo__PdfString_ToUnicode_(PoDoFo::PdfString * _self_) {
  return new (UseGC) PoDoFo::PdfString (_self_->ToUnicode());
}

extern "C" PoDoFo::PdfRefCountedBuffer * bg_PoDoFo__PdfString_GetBuffer_(PoDoFo::PdfString * _self_) {
  return &(_self_->GetBuffer());
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_ConvertUTF8toUTF16_STATIC_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long(const PoDoFo::pdf_utf8 * pszUtf8, PoDoFo::pdf_utf16be * pszUtf16, PoDoFo::pdf_long & lLenUtf16) {
  return new (UseGC) PoDoFo::pdf_long (PoDoFo::PdfString::ConvertUTF8toUTF16(pszUtf8, pszUtf16, lLenUtf16));
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_ConvertUTF8toUTF16_STATIC_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long_PoDoFo__EPdfStringConversion(const PoDoFo::pdf_utf8 * pszUtf8, PoDoFo::pdf_long & lLenUtf8, PoDoFo::pdf_utf16be * pszUtf16, PoDoFo::pdf_long & lLenUtf16, PoDoFo::EPdfStringConversion & eConversion) {
  return new (UseGC) PoDoFo::pdf_long (PoDoFo::PdfString::ConvertUTF8toUTF16(pszUtf8, lLenUtf8, pszUtf16, lLenUtf16, eConversion));
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_ConvertUTF16toUTF8_STATIC_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long(const PoDoFo::pdf_utf16be * pszUtf16, PoDoFo::pdf_utf8 * pszUtf8, PoDoFo::pdf_long & lLenUtf8) {
  return new (UseGC) PoDoFo::pdf_long (PoDoFo::PdfString::ConvertUTF16toUTF8(pszUtf16, pszUtf8, lLenUtf8));
}

extern "C" PoDoFo::pdf_long * bg_PoDoFo__PdfString_ConvertUTF16toUTF8_STATIC_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long_PoDoFo__EPdfStringConversion(const PoDoFo::pdf_utf16be * pszUtf16, PoDoFo::pdf_long & lLenUtf16, PoDoFo::pdf_utf8 * pszUtf8, PoDoFo::pdf_long & lLenUtf8, PoDoFo::EPdfStringConversion & eConversion) {
  return new (UseGC) PoDoFo::pdf_long (PoDoFo::PdfString::ConvertUTF16toUTF8(pszUtf16, lLenUtf16, pszUtf8, lLenUtf8, eConversion));
}

extern "C" void bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(BgInherit_PdfString * _self_, const BgJumptable_PdfString & table) {
  _self_->bgJump = (table);
}
