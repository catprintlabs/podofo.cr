module Podofo
  
  # Native bindings.  Mostly generated.
  lib Binding
    # Container for string data.
    struct CrystalString
      ptr : LibC::Char*
      size : LibC::Int
    end
  
    # Container for a `Proc`
    struct CrystalProc
      ptr : Void*
      context : Void*
    end
  
    # Container for raw memory-data.  The `ptr` could be anything.
    struct CrystalSlice
      ptr : Void*
      size : LibC::Int
    end
  end
  
  # Helpers for bindings.  Required.
  module BindgenHelper
    # Wraps `Proc` to a `Binding::CrystalProc`, which can then passed on to C++.
    def self.wrap_proc(proc : Proc)
      Binding::CrystalProc.new(
        ptr: proc.pointer,
        context: proc.closure_data,
      )
    end
  
    # Wraps `Proc` to a `Binding::CrystalProc`, which can then passed on to C++.
    # `Nil` version, returns a null-proc.
    def self.wrap_proc(nothing : Nil)
      Binding::CrystalProc.new(
        ptr: Pointer(Void).null,
        context: Pointer(Void).null,
      )
    end
  
    # Wraps a *list* into a container *wrapper*, if it's not already one.
    macro wrap_container(wrapper, list)
      %instance = {{ list }}
      if %instance.is_a?({{ wrapper }})
        %instance
      else
        {{wrapper}}.new.concat(%instance)
      end
    end
  
    # Wrapper for an instantiated, sequential container type.
    #
    # This offers (almost) all read-only methods known from `Array`.
    # Additionally, there's `#<<`.  Other than that, the container type is not
    # meant to be used for storage, but for data transmission between the C++
    # and the Crystal world.  Don't let that discourage you though.
    abstract class SequentialContainer(T)
      include Indexable(T)
  
      # `#unsafe_fetch` and `#size` will be implemented by the wrapper class.
  
      # Adds an element at the end.  Implemented by the wrapper.
      abstract def push(value)
  
      # Adds *element* at the end of the container.
      def <<(value : T) : self
        push(value)
        self
      end
  
      # Adds all *elements* at the end of the container, retaining their order.
      def concat(values : Enumerable(T)) : self
        values.each { |v| push(v) }
        self
      end
  
      def to_s(io)
        to_a.to_s(io)
      end
  
      def inspect(io)
        io << "<Wrapped "
        to_a.inspect(io)
        io << ">"
      end
    end
  end
  
  @[Link(ldflags: "#{__DIR__}/../../ext/podofo_binding.a -lstdc++ -lpodofo")]
  lib Binding
    alias PoDoFo::PdfDocument = Void
    alias PoDoFo::PdfInfo = Void
    alias PoDoFo::PdfOutlines = Void
    alias PoDoFo::PdfNamesTree = Void
    alias PoDoFo::PdfAcroForm = Void
    alias PoDoFo::EPdfAcroFormDefaulAppearance = Void
    alias PoDoFo::PdfPagesTree = Void
    alias PoDoFo::PdfPage = Void
    alias PoDoFo::PdfFont = Void
    alias PoDoFo::PdfEncoding = Void
    alias PoDoFo::PdfFontCache::EFontCreationFlags = Void
    alias FT_FaceRec_ = Void
    alias FT_LibraryRec_ = Void
    alias PoDoFo::PdfRect = Void
    alias std::vector<PoDoFo::PdfRect> = Void
    alias PoDoFo::PdfMemDocument = Void
    alias PoDoFo::PdfXObject = Void
    alias PoDoFo::PdfFileSpec = Void
    alias PoDoFoPdfString = Void
    alias PoDoFo::PdfDestination = Void
    alias PoDoFo::PdfName = Void
    alias PoDoFo::PdfVecObjects = Void
    alias PoDoFo::PdfFontConfigWrapper = Void
    alias PoDoFo::PdfObject = Void
    alias PoDoFo::PdfRefCountedInputDevice = Void
    alias PoDoFo::PdfOutputDevice = Void
    alias std::vector<PoDoFo::PdfExtension> = Void
    alias PoDoFo::PdfEncrypt::EPdfEncryptAlgorithm = Void
    alias PoDoFo::PdfEncrypt::EPdfKeyLength = Void
    alias PoDoFo::PdfEncrypt = Void
    alias PoDoFo::PdfReference = Void
    alias PoDoFo::PdfRefCountedBuffer = Void
    alias PoDoFo::EPdfStringConversion = Void
    struct BgJumptable_PdfDocument
      bg_PoDoFo__PdfDocument_GetWriteMode_ : CrystalProc
      bg_PoDoFo__PdfDocument_GetPdfVersion_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsLinearized_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsPrintAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsEditAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsCopyAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsEditNotesAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_ : CrystalProc
      bg_PoDoFo__PdfDocument_IsHighPrintAllowed_ : CrystalProc
    end
    struct BgJumptable_PdfMemDocument
      bg_PoDoFo__PdfMemDocument_GetWriteMode_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_GetPdfVersion_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsLinearized_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsPrintAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsEditAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsCopyAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_ : CrystalProc
      bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_ : CrystalProc
    end
    struct BgJumptable_PdfString
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X : CrystalProc
    end
    fun bg_PoDoFo__PdfDocument_GetWriteMode_(_self_ : PoDoFo::PdfDocument*) : EPdfWriteMode
    fun bg_PoDoFo__PdfDocument_GetPdfVersion_(_self_ : PoDoFo::PdfDocument*) : EPdfVersion
    fun bg_PoDoFo__PdfDocument_IsLinearized_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_GetInfo_(_self_ : PoDoFo::PdfDocument*) : PoDoFo::PdfInfo*
    fun bg_PoDoFo__PdfDocument_GetOutlines_bool(_self_ : PoDoFo::PdfDocument*, b_create : Bool) : PoDoFo::PdfOutlines*
    fun bg_PoDoFo__PdfDocument_GetNamesTree_bool(_self_ : PoDoFo::PdfDocument*, b_create : Bool) : PoDoFo::PdfNamesTree*
    fun bg_PoDoFo__PdfDocument_GetAcroForm_bool_PoDoFo__EPdfAcroFormDefaulAppearance(_self_ : PoDoFo::PdfDocument*, b_create : Bool, e_default_appearance : PoDoFo::EPdfAcroFormDefaulAppearance*) : PoDoFo::PdfAcroForm*
    fun bg_PoDoFo__PdfDocument_GetPagesTree_(_self_ : PoDoFo::PdfDocument*) : PoDoFo::PdfPagesTree*
    fun bg_PoDoFo__PdfDocument_GetPageCount_(_self_ : PoDoFo::PdfDocument*) : Int32
    fun bg_PoDoFo__PdfDocument_GetPage_int(_self_ : PoDoFo::PdfDocument*, n_index : Int32) : PoDoFo::PdfPage*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_symbol_charset : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, e_font_creation_flags : PoDoFo::PdfFontCache::EFontCreationFlags*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, e_font_creation_flags : PoDoFo::PdfFontCache::EFontCreationFlags*, b_embedd : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, e_font_creation_flags : PoDoFo::PdfFontCache::EFontCreationFlags*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, e_font_creation_flags : PoDoFo::PdfFontCache::EFontCreationFlags*, b_embedd : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool_const_char_X(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, e_font_creation_flags : PoDoFo::PdfFontCache::EFontCreationFlags*, b_embedd : Bool, psz_file_name : UInt8*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool(_self_ : PoDoFo::PdfDocument*, face : FT_FaceRec_*, b_symbol_charset : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool_const_PoDoFo__PdfEncoding_Xconst(_self_ : PoDoFo::PdfDocument*, face : FT_FaceRec_*, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool_const_PoDoFo__PdfEncoding_Xconst_bool(_self_ : PoDoFo::PdfDocument*, face : FT_FaceRec_*, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, b_embedd : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateDuplicateFontType1_PoDoFo__PdfFont_X_const_char_X(_self_ : PoDoFo::PdfDocument*, p_font : PoDoFo::PdfFont*, psz_suffix : UInt8*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_const_char_X(_self_ : PoDoFo::PdfDocument*, psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : PoDoFo::PdfEncoding*, psz_file_name : UInt8*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfDocument_GetFontLibrary_(_self_ : PoDoFo::PdfDocument*) : FT_LibraryRec_*
    fun bg_PoDoFo__PdfDocument_EmbedSubsetFonts_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_CreatePage_const_PoDoFo__PdfRect_R(_self_ : PoDoFo::PdfDocument*, r_size : PoDoFo::PdfRect*) : PoDoFo::PdfPage*
    fun bg_PoDoFo__PdfDocument_CreatePages_const_std__vector_PoDoFo__PdfRect__R(_self_ : PoDoFo::PdfDocument*, vec_sizes : std::vector<PoDoFo::PdfRect>*) : Void
    fun bg_PoDoFo__PdfDocument_InsertPage_const_PoDoFo__PdfRect_R_int(_self_ : PoDoFo::PdfDocument*, r_size : PoDoFo::PdfRect*, at_index : Int32) : PoDoFo::PdfPage*
    fun bg_PoDoFo__PdfDocument_Append_const_PoDoFo__PdfMemDocument_R_bool(_self_ : PoDoFo::PdfDocument*, r_doc : PoDoFo::PdfMemDocument*, b_append_all : Bool) : PoDoFo::PdfDocument*
    fun bg_PoDoFo__PdfDocument_InsertExistingPageAt_const_PoDoFo__PdfMemDocument_R_int_int(_self_ : PoDoFo::PdfDocument*, r_doc : PoDoFo::PdfMemDocument*, n_page_index : Int32, n_at_index : Int32) : PoDoFo::PdfDocument*
    fun bg_PoDoFo__PdfDocument_FillXObjectFromDocumentPage_PoDoFo__PdfXObject_X_const_PoDoFo__PdfMemDocument_R_int_bool(_self_ : PoDoFo::PdfDocument*, p_x_obj : PoDoFo::PdfXObject*, r_doc : PoDoFo::PdfMemDocument*, n_page : Int32, b_use_trim_box : Bool) : PoDoFo::PdfRect*
    fun bg_PoDoFo__PdfDocument_FillXObjectFromExistingPage_PoDoFo__PdfXObject_X_int_bool(_self_ : PoDoFo::PdfDocument*, p_x_obj : PoDoFo::PdfXObject*, n_page : Int32, b_use_trim_box : Bool) : PoDoFo::PdfRect*
    fun bg_PoDoFo__PdfDocument_FillXObjectFromPage_PoDoFo__PdfXObject_X_const_PoDoFo__PdfPage_X_bool_unsigned_int(_self_ : PoDoFo::PdfDocument*, p_x_obj : PoDoFo::PdfXObject*, p_page : PoDoFo::PdfPage*, b_use_trim_box : Bool, difference : UInt32) : PoDoFo::PdfRect*
    fun bg_PoDoFo__PdfDocument_AttachFile_const_PoDoFo__PdfFileSpec_R(_self_ : PoDoFo::PdfDocument*, r_file_spec : PoDoFo::PdfFileSpec*) : Void
    fun bg_PoDoFo__PdfDocument_GetAttachment_const_PoDoFo__PdfString_R(_self_ : PoDoFo::PdfDocument*, r_name : PoDoFoPdfString*) : PoDoFo::PdfFileSpec*
    fun bg_PoDoFo__PdfDocument_AddNamedDestination_const_PoDoFo__PdfDestination_R_const_PoDoFo__PdfString_R(_self_ : PoDoFo::PdfDocument*, r_dest : PoDoFo::PdfDestination*, rs_name : PoDoFoPdfString*) : Void
    fun bg_PoDoFo__PdfDocument_SetPageMode_PoDoFo__EPdfPageMode(_self_ : PoDoFo::PdfDocument*, in_mode : EPdfPageMode) : Void
    fun bg_PoDoFo__PdfDocument_GetPageMode_(_self_ : PoDoFo::PdfDocument*) : EPdfPageMode
    fun bg_PoDoFo__PdfDocument_SetUseFullScreen_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetPageLayout_PoDoFo__EPdfPageLayout(_self_ : PoDoFo::PdfDocument*, in_layout : EPdfPageLayout) : Void
    fun bg_PoDoFo__PdfDocument_SetHideToolbar_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetHideMenubar_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetHideWindowUI_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetFitWindow_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetCenterWindow_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetDisplayDocTitle_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_SetPrintScaling_PoDoFo__PdfName_R(_self_ : PoDoFo::PdfDocument*, in_scaling_type : PoDoFo::PdfName*) : Void
    fun bg_PoDoFo__PdfDocument_SetBaseURI_const_std__string_R(_self_ : PoDoFo::PdfDocument*, in_base_uri : CrystalString) : Void
    fun bg_PoDoFo__PdfDocument_SetLanguage_const_std__string_R(_self_ : PoDoFo::PdfDocument*, in_language : CrystalString) : Void
    fun bg_PoDoFo__PdfDocument_SetBindingDirection_PoDoFo__PdfName_R(_self_ : PoDoFo::PdfDocument*, in_direction : PoDoFo::PdfName*) : Void
    fun bg_PoDoFo__PdfDocument_IsPrintAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsEditAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsCopyAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsEditNotesAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_IsHighPrintAllowed_(_self_ : PoDoFo::PdfDocument*) : Bool
    fun bg_PoDoFo__PdfDocument_GetObjects_(_self_ : PoDoFo::PdfDocument*) : PoDoFo::PdfVecObjects*
    fun bg_PoDoFo__PdfDocument_SetFontConfigWrapper_const_PoDoFo__PdfFontConfigWrapper_R(_self_ : PoDoFo::PdfDocument*, r_font_config : PoDoFo::PdfFontConfigWrapper*) : Void
    fun bg_PoDoFo__PdfDocument__CONSTRUCT_bool(b_empty : Bool) : PoDoFo::PdfDocument*
    fun bg_PoDoFo__PdfDocument_SetInfo_PoDoFo__PdfInfo_X(_self_ : PoDoFo::PdfDocument*, p_info : PoDoFo::PdfInfo*) : Void
    fun bg_PoDoFo__PdfDocument_GetCatalog_(_self_ : PoDoFo::PdfDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfDocument_SetCatalog_PoDoFo__PdfObject_X(_self_ : PoDoFo::PdfDocument*, p_object : PoDoFo::PdfObject*) : Void
    fun bg_PoDoFo__PdfDocument_GetTrailer_(_self_ : PoDoFo::PdfDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfDocument_SetTrailer_PoDoFo__PdfObject_X(_self_ : PoDoFo::PdfDocument*, p_object : PoDoFo::PdfObject*) : Void
    fun bg_PoDoFo__PdfDocument_GetNamedObjectFromCatalog_const_char_X(_self_ : PoDoFo::PdfDocument*, psz_name : UInt8*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfDocument_InitPagesTree_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_PoDoFo__PdfDocument_FixObjectReferences_PoDoFo__PdfObject_X_int(_self_ : PoDoFo::PdfDocument*, p_object : PoDoFo::PdfObject*, difference : Int32) : Void
    fun bg_PoDoFo__PdfDocument_SetViewerPreference_const_PoDoFo__PdfName_R_const_PoDoFo__PdfObject_R(_self_ : PoDoFo::PdfDocument*, which_pref : PoDoFo::PdfName*, value_obj : PoDoFo::PdfObject*) : Void
    fun bg_PoDoFo__PdfDocument_SetViewerPreference_const_PoDoFo__PdfName_R_bool(_self_ : PoDoFo::PdfDocument*, which_pref : PoDoFo::PdfName*, in_value : Bool) : Void
    fun bg_PoDoFo__PdfDocument_Clear_(_self_ : PoDoFo::PdfDocument*) : Void
    fun bg_BgInherit_PdfDocument_JUMPTABLE_BgJumptable_PdfDocument_R(_self_ : PoDoFo::PdfDocument*, table : Binding::BgJumptable_PdfDocument*) : Void
    fun bg_PoDoFo__PdfMemDocument__CONSTRUCT_() : PoDoFo::PdfMemDocument*
    fun bg_PoDoFo__PdfMemDocument__CONSTRUCT_bool(b_only_trailer : Bool) : PoDoFo::PdfMemDocument*
    fun bg_PoDoFo__PdfMemDocument__CONSTRUCT_const_char_X_bool(psz_filename : UInt8*, b_for_update : Bool) : PoDoFo::PdfMemDocument*
    fun bg_PoDoFo__PdfMemDocument_Load_const_char_X_bool(_self_ : PoDoFo::PdfMemDocument*, psz_filename : UInt8*, b_for_update : Bool) : Void
    fun bg_PoDoFo__PdfMemDocument_LoadFromBuffer_const_char_X_long_bool(_self_ : PoDoFo::PdfMemDocument*, p_buffer : UInt8*, l_len : LibC::Long, b_for_update : Bool) : Void
    fun bg_PoDoFo__PdfMemDocument_LoadFromDevice_const_PoDoFo__PdfRefCountedInputDevice_R_bool(_self_ : PoDoFo::PdfMemDocument*, r_device : PoDoFo::PdfRefCountedInputDevice*, b_for_update : Bool) : Void
    fun bg_PoDoFo__PdfMemDocument_IsLoaded_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_Write_const_char_X(_self_ : PoDoFo::PdfMemDocument*, psz_filename : UInt8*) : Void
    fun bg_PoDoFo__PdfMemDocument_Write_PoDoFo__PdfOutputDevice_X(_self_ : PoDoFo::PdfMemDocument*, p_device : PoDoFo::PdfOutputDevice*) : Void
    fun bg_PoDoFo__PdfMemDocument_WriteUpdate_const_char_X(_self_ : PoDoFo::PdfMemDocument*, psz_filename : UInt8*) : Void
    fun bg_PoDoFo__PdfMemDocument_WriteUpdate_PoDoFo__PdfOutputDevice_X_bool(_self_ : PoDoFo::PdfMemDocument*, p_device : PoDoFo::PdfOutputDevice*, b_truncate : Bool) : Void
    fun bg_PoDoFo__PdfMemDocument_SetWriteMode_PoDoFo__EPdfWriteMode(_self_ : PoDoFo::PdfMemDocument*, e_write_mode : EPdfWriteMode) : Void
    fun bg_PoDoFo__PdfMemDocument_GetWriteMode_(_self_ : PoDoFo::PdfMemDocument*) : EPdfWriteMode
    fun bg_PoDoFo__PdfMemDocument_SetPdfVersion_PoDoFo__EPdfVersion(_self_ : PoDoFo::PdfMemDocument*, e_version : EPdfVersion) : Void
    fun bg_PoDoFo__PdfMemDocument_GetPdfVersion_(_self_ : PoDoFo::PdfMemDocument*) : EPdfVersion
    fun bg_PoDoFo__PdfMemDocument_AddPdfExtension_const_char_X_PoDoFo__pdf_int64(_self_ : PoDoFo::PdfMemDocument*, ns : UInt8*, level : PoDoFo::pdf_int64*) : Void
    fun bg_PoDoFo__PdfMemDocument_HasPdfExtension_const_char_X_PoDoFo__pdf_int64(_self_ : PoDoFo::PdfMemDocument*, ns : UInt8*, level : PoDoFo::pdf_int64*) : Bool
    fun bg_PoDoFo__PdfMemDocument_RemovePdfExtension_const_char_X_PoDoFo__pdf_int64(_self_ : PoDoFo::PdfMemDocument*, ns : UInt8*, level : PoDoFo::pdf_int64*) : Void
    fun bg_PoDoFo__PdfMemDocument_GetPdfExtensions_(_self_ : PoDoFo::PdfMemDocument*) : std::vector<PoDoFo::PdfExtension>*
    fun bg_PoDoFo__PdfMemDocument_SetPassword_const_std__string_R(_self_ : PoDoFo::PdfMemDocument*, s_password : CrystalString) : Void
    fun bg_PoDoFo__PdfMemDocument_SetEncrypted_const_std__string_R_const_std__string_R_int_PoDoFo__PdfEncrypt__EPdfEncryptAlgorithm_PoDoFo__PdfEncrypt__EPdfKeyLength(_self_ : PoDoFo::PdfMemDocument*, user_password : CrystalString, owner_password : CrystalString, protection : Int32, e_algorithm : PoDoFo::PdfEncrypt::EPdfEncryptAlgorithm*, e_key_length : PoDoFo::PdfEncrypt::EPdfKeyLength*) : Void
    fun bg_PoDoFo__PdfMemDocument_SetEncrypted_const_PoDoFo__PdfEncrypt_R(_self_ : PoDoFo::PdfMemDocument*, p_encrypt : PoDoFo::PdfEncrypt*) : Void
    fun bg_PoDoFo__PdfMemDocument_GetEncrypted_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsLinearized_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_GetObjects_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfVecObjects*
    fun bg_PoDoFo__PdfMemDocument_GetCatalog_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfMemDocument_GetTrailer_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfMemDocument_GetStructTreeRoot_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfMemDocument_GetMetadata_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfMemDocument_GetMarkInfo_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfMemDocument_GetLanguage_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfObject*
    fun bg_PoDoFo__PdfMemDocument_GetFont_PoDoFo__PdfObject_X(_self_ : PoDoFo::PdfMemDocument*, p_object : PoDoFo::PdfObject*) : PoDoFo::PdfFont*
    fun bg_PoDoFo__PdfMemDocument_InsertPages_const_PoDoFo__PdfMemDocument_R_int_int(_self_ : PoDoFo::PdfMemDocument*, r_doc : PoDoFo::PdfMemDocument*, in_first_page : Int32, in_num_pages : Int32) : PoDoFo::PdfMemDocument*
    fun bg_PoDoFo__PdfMemDocument_DeletePages_int_int(_self_ : PoDoFo::PdfMemDocument*, in_first_page : Int32, in_num_pages : Int32) : Void
    fun bg_PoDoFo__PdfMemDocument_IsPrintAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsEditAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsCopyAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_(_self_ : PoDoFo::PdfMemDocument*) : Bool
    fun bg_PoDoFo__PdfMemDocument_FreeObjectMemory_const_PoDoFo__PdfReference_R_bool(_self_ : PoDoFo::PdfMemDocument*, r_ref : PoDoFo::PdfReference*, b_force : Bool) : Void
    fun bg_PoDoFo__PdfMemDocument_FreeObjectMemory_PoDoFo__PdfObject_X_bool(_self_ : PoDoFo::PdfMemDocument*, p_obj : PoDoFo::PdfObject*, b_force : Bool) : Void
    fun bg_PoDoFo__PdfMemDocument_GetEncrypt_(_self_ : PoDoFo::PdfMemDocument*) : PoDoFo::PdfEncrypt*
    fun bg_BgInherit_PdfMemDocument_JUMPTABLE_BgJumptable_PdfMemDocument_R(_self_ : PoDoFo::PdfMemDocument*, table : Binding::BgJumptable_PdfMemDocument*) : Void
    fun bg_PoDoFo__PdfString__CONSTRUCT_() : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_std__string_R_const_PoDoFo__PdfEncoding_Xconst(s_string : CrystalString, p_encoding : PoDoFo::PdfEncoding*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_char_X_const_PoDoFo__PdfEncoding_Xconst(psz_string : UInt8*, p_encoding : PoDoFo::PdfEncoding*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_wchar_t_X_PoDoFo__pdf_long(psz_string : Char*, l_len : Int64*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString_setFromWchar_t_const_wchar_t_X_PoDoFo__pdf_long(_self_ : PoDoFoPdfString*, psz_string : Char*, l_len : Int64*) : Void
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_char_X_PoDoFo__pdf_long_bool_const_PoDoFo__PdfEncoding_Xconst(psz_string : UInt8*, l_len : Int64*, b_hex : Bool, p_encoding : PoDoFo::PdfEncoding*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf8_X(psz_string_utf8 : Char*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf16be_X(psz_string_utf16 : Char*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long(psz_string_utf8 : Char*, l_len : Int64*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long(psz_string_utf16 : Char*, l_len : Int64*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString_SetHexData_const_char_X_PoDoFo__pdf_long_PoDoFo__PdfEncrypt_X(_self_ : PoDoFoPdfString*, psz_hex : UInt8*, l_len : Int64*, p_encrypt : PoDoFo::PdfEncrypt*) : Void
    fun bg_PoDoFo__PdfString_IsValid_(_self_ : PoDoFoPdfString*) : Bool
    fun bg_PoDoFo__PdfString_IsHex_(_self_ : PoDoFoPdfString*) : Bool
    fun bg_PoDoFo__PdfString_IsUnicode_(_self_ : PoDoFoPdfString*) : Bool
    fun bg_PoDoFo__PdfString_GetString_(_self_ : PoDoFoPdfString*) : UInt8*
    fun bg_PoDoFo__PdfString_GetUnicode_(_self_ : PoDoFoPdfString*) : Char*
    fun bg_PoDoFo__PdfString_GetStringUtf8_(_self_ : PoDoFoPdfString*) : CrystalString
    fun bg_PoDoFo__PdfString_GetLength_(_self_ : PoDoFoPdfString*) : Int64*
    fun bg_PoDoFo__PdfString_GetUnicodeLength_(_self_ : PoDoFoPdfString*) : Int64*
    fun bg_PoDoFo__PdfString_GetCharacterLength_(_self_ : PoDoFoPdfString*) : Int64*
    fun bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X(_self_ : PoDoFoPdfString*, p_device : PoDoFo::PdfOutputDevice*, e_write_mode : EPdfWriteMode, p_encrypt : PoDoFo::PdfEncrypt*) : Void
    fun bg_PoDoFo__PdfString_ToUnicode_(_self_ : PoDoFoPdfString*) : PoDoFoPdfString*
    fun bg_PoDoFo__PdfString_GetBuffer_(_self_ : PoDoFoPdfString*) : PoDoFo::PdfRefCountedBuffer*
    fun bg_PoDoFo__PdfString_ConvertUTF8toUTF16_STATIC_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long(psz_utf8 : Char*, psz_utf16 : Char*, l_len_utf16 : Int64*) : Int64*
    fun bg_PoDoFo__PdfString_ConvertUTF8toUTF16_STATIC_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long_PoDoFo__EPdfStringConversion(psz_utf8 : Char*, l_len_utf8 : Int64*, psz_utf16 : Char*, l_len_utf16 : Int64*, e_conversion : PoDoFo::EPdfStringConversion*) : Int64*
    fun bg_PoDoFo__PdfString_ConvertUTF16toUTF8_STATIC_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long(psz_utf16 : Char*, psz_utf8 : Char*, l_len_utf8 : Int64*) : Int64*
    fun bg_PoDoFo__PdfString_ConvertUTF16toUTF8_STATIC_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long_PoDoFo__EPdfStringConversion(psz_utf16 : Char*, l_len_utf16 : Int64*, psz_utf8 : Char*, l_len_utf8 : Int64*, e_conversion : PoDoFo::EPdfStringConversion*) : Int64*
    fun bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(_self_ : PoDoFoPdfString*, table : Binding::BgJumptable_PdfString*) : Void
  end
  abstract class PdfDocument
    @unwrap : Binding::PoDoFo::PdfDocument*
    
    abstract def write_mode() : EPdfWriteMode
    abstract def pdf_version() : EPdfVersion
    abstract def linearized?() : Bool
    def info() : Binding::PoDoFo::PdfInfo*
      Binding.bg_PoDoFo__PdfDocument_GetInfo_(self)
    end
    
    def get_outlines(b_create : Bool = true) : Binding::PoDoFo::PdfOutlines*
      Binding.bg_PoDoFo__PdfDocument_GetOutlines_bool(self, b_create)
    end
    
    def get_names_tree(b_create : Bool = true) : Binding::PoDoFo::PdfNamesTree*
      Binding.bg_PoDoFo__PdfDocument_GetNamesTree_bool(self, b_create)
    end
    
    def get_acro_form(b_create : Bool = true, e_default_appearance : Binding::PoDoFo::EPdfAcroFormDefaulAppearance*) : Binding::PoDoFo::PdfAcroForm*
      Binding.bg_PoDoFo__PdfDocument_GetAcroForm_bool_PoDoFo__EPdfAcroFormDefaulAppearance(self, b_create, e_default_appearance)
    end
    
    def pages_tree() : Binding::PoDoFo::PdfPagesTree*
      Binding.bg_PoDoFo__PdfDocument_GetPagesTree_(self)
    end
    
    def page_count() : Int32
      Binding.bg_PoDoFo__PdfDocument_GetPageCount_(self)
    end
    
    def get_page(n_index : Int32) : Binding::PoDoFo::PdfPage*
      Binding.bg_PoDoFo__PdfDocument_GetPage_int(self, n_index)
    end
    
    def create_font(psz_font_name : UInt8*, b_symbol_charset : Bool = false) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool(self, psz_font_name, b_symbol_charset)
    end
    
    def create_font(psz_font_name : UInt8*, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst(self, psz_font_name, b_symbol_charset, p_encoding)
    end
    
    def create_font(psz_font_name : UInt8*, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, e_font_creation_flags : Binding::PoDoFo::PdfFontCache::EFontCreationFlags*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags(self, psz_font_name, b_symbol_charset, p_encoding, e_font_creation_flags)
    end
    
    def create_font(psz_font_name : UInt8*, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, e_font_creation_flags : Binding::PoDoFo::PdfFontCache::EFontCreationFlags*, b_embedd : Bool = true) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool(self, psz_font_name, b_symbol_charset, p_encoding, e_font_creation_flags, b_embedd)
    end
    
    def create_font(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool = false) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool(self, psz_font_name, b_bold, b_italic, b_symbol_charset)
    end
    
    def create_font(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst(self, psz_font_name, b_bold, b_italic, b_symbol_charset, p_encoding)
    end
    
    def create_font(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, e_font_creation_flags : Binding::PoDoFo::PdfFontCache::EFontCreationFlags*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags(self, psz_font_name, b_bold, b_italic, b_symbol_charset, p_encoding, e_font_creation_flags)
    end
    
    def create_font(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, e_font_creation_flags : Binding::PoDoFo::PdfFontCache::EFontCreationFlags*, b_embedd : Bool = true) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool(self, psz_font_name, b_bold, b_italic, b_symbol_charset, p_encoding, e_font_creation_flags, b_embedd)
    end
    
    def create_font(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, e_font_creation_flags : Binding::PoDoFo::PdfFontCache::EFontCreationFlags*, b_embedd : Bool, psz_file_name : UInt8*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_PoDoFo__PdfFontCache__EFontCreationFlags_bool_const_char_X(self, psz_font_name, b_bold, b_italic, b_symbol_charset, p_encoding, e_font_creation_flags, b_embedd, psz_file_name)
    end
    
    def create_font(face : Binding::FT_FaceRec_*, b_symbol_charset : Bool = false) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool(self, face, b_symbol_charset)
    end
    
    def create_font(face : Binding::FT_FaceRec_*, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool_const_PoDoFo__PdfEncoding_Xconst(self, face, b_symbol_charset, p_encoding)
    end
    
    def create_font(face : Binding::FT_FaceRec_*, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, b_embedd : Bool = true) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFont_FT_Face_bool_const_PoDoFo__PdfEncoding_Xconst_bool(self, face, b_symbol_charset, p_encoding, b_embedd)
    end
    
    def create_duplicate_font_type1(p_font : Binding::PoDoFo::PdfFont*, psz_suffix : UInt8*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateDuplicateFontType1_PoDoFo__PdfFont_X_const_char_X(self, p_font, psz_suffix)
    end
    
    def create_font_subset(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool = false) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool(self, psz_font_name, b_bold, b_italic, b_symbol_charset)
    end
    
    def create_font_subset(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst(self, psz_font_name, b_bold, b_italic, b_symbol_charset, p_encoding)
    end
    
    def create_font_subset(psz_font_name : UInt8*, b_bold : Bool, b_italic : Bool, b_symbol_charset : Bool, p_encoding : Binding::PoDoFo::PdfEncoding*, psz_file_name : UInt8*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfDocument_CreateFontSubset_const_char_X_bool_bool_bool_const_PoDoFo__PdfEncoding_Xconst_const_char_X(self, psz_font_name, b_bold, b_italic, b_symbol_charset, p_encoding, psz_file_name)
    end
    
    def font_library() : Binding::FT_LibraryRec_*
      Binding.bg_PoDoFo__PdfDocument_GetFontLibrary_(self)
    end
    
    def embed_subset_fonts() : Void
      Binding.bg_PoDoFo__PdfDocument_EmbedSubsetFonts_(self)
    end
    
    def create_page(r_size : Binding::PoDoFo::PdfRect*) : Binding::PoDoFo::PdfPage*
      Binding.bg_PoDoFo__PdfDocument_CreatePage_const_PoDoFo__PdfRect_R(self, r_size)
    end
    
    def create_pages(vec_sizes : Binding::std::vector<PoDoFo::PdfRect>*) : Void
      Binding.bg_PoDoFo__PdfDocument_CreatePages_const_std__vector_PoDoFo__PdfRect__R(self, vec_sizes)
    end
    
    def insert_page(r_size : Binding::PoDoFo::PdfRect*, at_index : Int32) : Binding::PoDoFo::PdfPage*
      Binding.bg_PoDoFo__PdfDocument_InsertPage_const_PoDoFo__PdfRect_R_int(self, r_size, at_index)
    end
    
    def append(r_doc : PdfMemDocument, b_append_all : Bool = true) : PdfDocument
      PdfDocumentImpl.new(unwrap: Binding.bg_PoDoFo__PdfDocument_Append_const_PoDoFo__PdfMemDocument_R_bool(self, r_doc, b_append_all))
    end
    
    def insert_existing_page_at(r_doc : PdfMemDocument, n_page_index : Int32, n_at_index : Int32) : PdfDocument
      PdfDocumentImpl.new(unwrap: Binding.bg_PoDoFo__PdfDocument_InsertExistingPageAt_const_PoDoFo__PdfMemDocument_R_int_int(self, r_doc, n_page_index, n_at_index))
    end
    
    def fill_x_object_from_document_page(p_x_obj : Binding::PoDoFo::PdfXObject*, r_doc : PdfMemDocument, n_page : Int32, b_use_trim_box : Bool) : Binding::PoDoFo::PdfRect*
      Binding.bg_PoDoFo__PdfDocument_FillXObjectFromDocumentPage_PoDoFo__PdfXObject_X_const_PoDoFo__PdfMemDocument_R_int_bool(self, p_x_obj, r_doc, n_page, b_use_trim_box)
    end
    
    def fill_x_object_from_existing_page(p_x_obj : Binding::PoDoFo::PdfXObject*, n_page : Int32, b_use_trim_box : Bool) : Binding::PoDoFo::PdfRect*
      Binding.bg_PoDoFo__PdfDocument_FillXObjectFromExistingPage_PoDoFo__PdfXObject_X_int_bool(self, p_x_obj, n_page, b_use_trim_box)
    end
    
    def fill_x_object_from_page(p_x_obj : Binding::PoDoFo::PdfXObject*, p_page : Binding::PoDoFo::PdfPage*, b_use_trim_box : Bool, difference : UInt32) : Binding::PoDoFo::PdfRect*
      Binding.bg_PoDoFo__PdfDocument_FillXObjectFromPage_PoDoFo__PdfXObject_X_const_PoDoFo__PdfPage_X_bool_unsigned_int(self, p_x_obj, p_page, b_use_trim_box, difference)
    end
    
    def attach_file(r_file_spec : Binding::PoDoFo::PdfFileSpec*) : Void
      Binding.bg_PoDoFo__PdfDocument_AttachFile_const_PoDoFo__PdfFileSpec_R(self, r_file_spec)
    end
    
    def get_attachment(r_name : PdfString) : Binding::PoDoFo::PdfFileSpec*
      Binding.bg_PoDoFo__PdfDocument_GetAttachment_const_PoDoFo__PdfString_R(self, r_name)
    end
    
    def add_named_destination(r_dest : Binding::PoDoFo::PdfDestination*, rs_name : PdfString) : Void
      Binding.bg_PoDoFo__PdfDocument_AddNamedDestination_const_PoDoFo__PdfDestination_R_const_PoDoFo__PdfString_R(self, r_dest, rs_name)
    end
    
    def page_mode=(in_mode : EPdfPageMode) : Void
      Binding.bg_PoDoFo__PdfDocument_SetPageMode_PoDoFo__EPdfPageMode(self, in_mode)
    end
    
    def page_mode() : EPdfPageMode
      Binding.bg_PoDoFo__PdfDocument_GetPageMode_(self)
    end
    
    def set_use_full_screen() : Void
      Binding.bg_PoDoFo__PdfDocument_SetUseFullScreen_(self)
    end
    
    def page_layout=(in_layout : EPdfPageLayout) : Void
      Binding.bg_PoDoFo__PdfDocument_SetPageLayout_PoDoFo__EPdfPageLayout(self, in_layout)
    end
    
    def set_hide_toolbar() : Void
      Binding.bg_PoDoFo__PdfDocument_SetHideToolbar_(self)
    end
    
    def set_hide_menubar() : Void
      Binding.bg_PoDoFo__PdfDocument_SetHideMenubar_(self)
    end
    
    def set_hide_window_ui() : Void
      Binding.bg_PoDoFo__PdfDocument_SetHideWindowUI_(self)
    end
    
    def set_fit_window() : Void
      Binding.bg_PoDoFo__PdfDocument_SetFitWindow_(self)
    end
    
    def set_center_window() : Void
      Binding.bg_PoDoFo__PdfDocument_SetCenterWindow_(self)
    end
    
    def set_display_doc_title() : Void
      Binding.bg_PoDoFo__PdfDocument_SetDisplayDocTitle_(self)
    end
    
    def print_scaling=(in_scaling_type : Binding::PoDoFo::PdfName*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetPrintScaling_PoDoFo__PdfName_R(self, in_scaling_type)
    end
    
    def base_uri=(in_base_uri : String) : Void
      Binding.bg_PoDoFo__PdfDocument_SetBaseURI_const_std__string_R(self, Binding::CrystalString.new(ptr: in_base_uri.to_unsafe, size: in_base_uri.bytesize))
    end
    
    def language=(in_language : String) : Void
      Binding.bg_PoDoFo__PdfDocument_SetLanguage_const_std__string_R(self, Binding::CrystalString.new(ptr: in_language.to_unsafe, size: in_language.bytesize))
    end
    
    def binding_direction=(in_direction : Binding::PoDoFo::PdfName*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetBindingDirection_PoDoFo__PdfName_R(self, in_direction)
    end
    
    abstract def print_allowed?() : Bool
    abstract def edit_allowed?() : Bool
    abstract def copy_allowed?() : Bool
    abstract def edit_notes_allowed?() : Bool
    abstract def fill_and_sign_allowed?() : Bool
    abstract def accessibility_allowed?() : Bool
    abstract def doc_assembly_allowed?() : Bool
    abstract def high_print_allowed?() : Bool
    def objects() : Binding::PoDoFo::PdfVecObjects*
      Binding.bg_PoDoFo__PdfDocument_GetObjects_(self)
    end
    
    def font_config_wrapper=(r_font_config : Binding::PoDoFo::PdfFontConfigWrapper*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetFontConfigWrapper_const_PoDoFo__PdfFontConfigWrapper_R(self, r_font_config)
    end
    
    protected def initialize(b_empty : Bool = false)
      result = Binding.bg_PoDoFo__PdfDocument__CONSTRUCT_bool(b_empty)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfDocument)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write_mode pdf_version linearized? print_allowed? edit_allowed? copy_allowed? edit_notes_allowed? fill_and_sign_allowed? accessibility_allowed? doc_assembly_allowed? high_print_allowed? ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfDocument.new(
      bg_PoDoFo__PdfDocument_GetWriteMode_: BindgenHelper.wrap_proc({% if forwarded.includes?("write_mode") %} Proc(EPdfWriteMode).new{ self.write_mode().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_GetPdfVersion_: BindgenHelper.wrap_proc({% if forwarded.includes?("pdf_version") %} Proc(EPdfVersion).new{ self.pdf_version().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsLinearized_: BindgenHelper.wrap_proc({% if forwarded.includes?("linearized?") %} Proc(Bool).new{ self.linearized?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("print_allowed?") %} Proc(Bool).new{ self.print_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsEditAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_allowed?") %} Proc(Bool).new{ self.edit_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsCopyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("copy_allowed?") %} Proc(Bool).new{ self.copy_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsEditNotesAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_notes_allowed?") %} Proc(Bool).new{ self.edit_notes_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("fill_and_sign_allowed?") %} Proc(Bool).new{ self.fill_and_sign_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("accessibility_allowed?") %} Proc(Bool).new{ self.accessibility_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("doc_assembly_allowed?") %} Proc(Bool).new{ self.doc_assembly_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfDocument_IsHighPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("high_print_allowed?") %} Proc(Bool).new{ self.high_print_allowed?() } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfDocument_JUMPTABLE_BgJumptable_PdfDocument_R(result, pointerof(jump_table))
    {% end %}
    end
    
    protected def info=(p_info : Binding::PoDoFo::PdfInfo*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetInfo_PoDoFo__PdfInfo_X(self, p_info)
    end
    
    protected def catalog() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfDocument_GetCatalog_(self)
    end
    
    protected def catalog=(p_object : Binding::PoDoFo::PdfObject*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetCatalog_PoDoFo__PdfObject_X(self, p_object)
    end
    
    protected def trailer() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfDocument_GetTrailer_(self)
    end
    
    protected def trailer=(p_object : Binding::PoDoFo::PdfObject*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetTrailer_PoDoFo__PdfObject_X(self, p_object)
    end
    
    protected def get_named_object_from_catalog(psz_name : UInt8*) : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfDocument_GetNamedObjectFromCatalog_const_char_X(self, psz_name)
    end
    
    protected def init_pages_tree() : Void
      Binding.bg_PoDoFo__PdfDocument_InitPagesTree_(self)
    end
    
    protected def fix_object_references(p_object : Binding::PoDoFo::PdfObject*, difference : Int32) : Void
      Binding.bg_PoDoFo__PdfDocument_FixObjectReferences_PoDoFo__PdfObject_X_int(self, p_object, difference)
    end
    
    protected def set_viewer_preference(which_pref : Binding::PoDoFo::PdfName*, value_obj : Binding::PoDoFo::PdfObject*) : Void
      Binding.bg_PoDoFo__PdfDocument_SetViewerPreference_const_PoDoFo__PdfName_R_const_PoDoFo__PdfObject_R(self, which_pref, value_obj)
    end
    
    protected def set_viewer_preference(which_pref : Binding::PoDoFo::PdfName*, in_value : Bool) : Void
      Binding.bg_PoDoFo__PdfDocument_SetViewerPreference_const_PoDoFo__PdfName_R_bool(self, which_pref, in_value)
    end
    
    protected def clear() : Void
      Binding.bg_PoDoFo__PdfDocument_Clear_(self)
    end
    
    def to_unsafe
      @unwrap
    end
    def initialize(unwrap : Binding::PoDoFo::PdfDocument*)
      result = unwrap
    @unwrap = result
    end
    
  end
  class PdfMemDocument
    @unwrap : Binding::PoDoFo::PdfMemDocument*
    
    def initialize()
      result = Binding.bg_PoDoFo__PdfMemDocument__CONSTRUCT_()
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfMemDocument)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write_mode pdf_version linearized? print_allowed? edit_allowed? copy_allowed? edit_notes_allowed? fill_and_sign_allowed? accessibility_allowed? doc_assembly_allowed? high_print_allowed? ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfMemDocument.new(
      bg_PoDoFo__PdfMemDocument_GetWriteMode_: BindgenHelper.wrap_proc({% if forwarded.includes?("write_mode") %} Proc(EPdfWriteMode).new{ self.write_mode().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_GetPdfVersion_: BindgenHelper.wrap_proc({% if forwarded.includes?("pdf_version") %} Proc(EPdfVersion).new{ self.pdf_version().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsLinearized_: BindgenHelper.wrap_proc({% if forwarded.includes?("linearized?") %} Proc(Bool).new{ self.linearized?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("print_allowed?") %} Proc(Bool).new{ self.print_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsEditAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_allowed?") %} Proc(Bool).new{ self.edit_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsCopyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("copy_allowed?") %} Proc(Bool).new{ self.copy_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_notes_allowed?") %} Proc(Bool).new{ self.edit_notes_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("fill_and_sign_allowed?") %} Proc(Bool).new{ self.fill_and_sign_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("accessibility_allowed?") %} Proc(Bool).new{ self.accessibility_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("doc_assembly_allowed?") %} Proc(Bool).new{ self.doc_assembly_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("high_print_allowed?") %} Proc(Bool).new{ self.high_print_allowed?() } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfMemDocument_JUMPTABLE_BgJumptable_PdfMemDocument_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(b_only_trailer : Bool)
      result = Binding.bg_PoDoFo__PdfMemDocument__CONSTRUCT_bool(b_only_trailer)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfMemDocument)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write_mode pdf_version linearized? print_allowed? edit_allowed? copy_allowed? edit_notes_allowed? fill_and_sign_allowed? accessibility_allowed? doc_assembly_allowed? high_print_allowed? ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfMemDocument.new(
      bg_PoDoFo__PdfMemDocument_GetWriteMode_: BindgenHelper.wrap_proc({% if forwarded.includes?("write_mode") %} Proc(EPdfWriteMode).new{ self.write_mode().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_GetPdfVersion_: BindgenHelper.wrap_proc({% if forwarded.includes?("pdf_version") %} Proc(EPdfVersion).new{ self.pdf_version().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsLinearized_: BindgenHelper.wrap_proc({% if forwarded.includes?("linearized?") %} Proc(Bool).new{ self.linearized?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("print_allowed?") %} Proc(Bool).new{ self.print_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsEditAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_allowed?") %} Proc(Bool).new{ self.edit_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsCopyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("copy_allowed?") %} Proc(Bool).new{ self.copy_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_notes_allowed?") %} Proc(Bool).new{ self.edit_notes_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("fill_and_sign_allowed?") %} Proc(Bool).new{ self.fill_and_sign_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("accessibility_allowed?") %} Proc(Bool).new{ self.accessibility_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("doc_assembly_allowed?") %} Proc(Bool).new{ self.doc_assembly_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("high_print_allowed?") %} Proc(Bool).new{ self.high_print_allowed?() } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfMemDocument_JUMPTABLE_BgJumptable_PdfMemDocument_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_filename : UInt8*, b_for_update : Bool = false)
      result = Binding.bg_PoDoFo__PdfMemDocument__CONSTRUCT_const_char_X_bool(psz_filename, b_for_update)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfMemDocument)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write_mode pdf_version linearized? print_allowed? edit_allowed? copy_allowed? edit_notes_allowed? fill_and_sign_allowed? accessibility_allowed? doc_assembly_allowed? high_print_allowed? ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfMemDocument.new(
      bg_PoDoFo__PdfMemDocument_GetWriteMode_: BindgenHelper.wrap_proc({% if forwarded.includes?("write_mode") %} Proc(EPdfWriteMode).new{ self.write_mode().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_GetPdfVersion_: BindgenHelper.wrap_proc({% if forwarded.includes?("pdf_version") %} Proc(EPdfVersion).new{ self.pdf_version().to_unsafe } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsLinearized_: BindgenHelper.wrap_proc({% if forwarded.includes?("linearized?") %} Proc(Bool).new{ self.linearized?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("print_allowed?") %} Proc(Bool).new{ self.print_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsEditAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_allowed?") %} Proc(Bool).new{ self.edit_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsCopyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("copy_allowed?") %} Proc(Bool).new{ self.copy_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("edit_notes_allowed?") %} Proc(Bool).new{ self.edit_notes_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("fill_and_sign_allowed?") %} Proc(Bool).new{ self.fill_and_sign_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("accessibility_allowed?") %} Proc(Bool).new{ self.accessibility_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("doc_assembly_allowed?") %} Proc(Bool).new{ self.doc_assembly_allowed?() } {% else %} nil {% end %}),
      bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_: BindgenHelper.wrap_proc({% if forwarded.includes?("high_print_allowed?") %} Proc(Bool).new{ self.high_print_allowed?() } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfMemDocument_JUMPTABLE_BgJumptable_PdfMemDocument_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def load(psz_filename : UInt8*, b_for_update : Bool = false) : Void
      Binding.bg_PoDoFo__PdfMemDocument_Load_const_char_X_bool(self, psz_filename, b_for_update)
    end
    
    def load_from_buffer(p_buffer : UInt8*, l_len : LibC::Long, b_for_update : Bool = false) : Void
      Binding.bg_PoDoFo__PdfMemDocument_LoadFromBuffer_const_char_X_long_bool(self, p_buffer, l_len, b_for_update)
    end
    
    def load_from_device(r_device : Binding::PoDoFo::PdfRefCountedInputDevice*, b_for_update : Bool = false) : Void
      Binding.bg_PoDoFo__PdfMemDocument_LoadFromDevice_const_PoDoFo__PdfRefCountedInputDevice_R_bool(self, r_device, b_for_update)
    end
    
    def loaded?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsLoaded_(self)
    end
    
    def write(psz_filename : UInt8*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_Write_const_char_X(self, psz_filename)
    end
    
    def write(p_device : Binding::PoDoFo::PdfOutputDevice*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_Write_PoDoFo__PdfOutputDevice_X(self, p_device)
    end
    
    def write_update(psz_filename : UInt8*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_WriteUpdate_const_char_X(self, psz_filename)
    end
    
    def write_update(p_device : Binding::PoDoFo::PdfOutputDevice*, b_truncate : Bool = true) : Void
      Binding.bg_PoDoFo__PdfMemDocument_WriteUpdate_PoDoFo__PdfOutputDevice_X_bool(self, p_device, b_truncate)
    end
    
    def write_mode=(e_write_mode : EPdfWriteMode) : Void
      Binding.bg_PoDoFo__PdfMemDocument_SetWriteMode_PoDoFo__EPdfWriteMode(self, e_write_mode)
    end
    
    def write_mode() : EPdfWriteMode
      Binding.bg_PoDoFo__PdfMemDocument_GetWriteMode_(self)
    end
    
    def pdf_version=(e_version : EPdfVersion) : Void
      Binding.bg_PoDoFo__PdfMemDocument_SetPdfVersion_PoDoFo__EPdfVersion(self, e_version)
    end
    
    def pdf_version() : EPdfVersion
      Binding.bg_PoDoFo__PdfMemDocument_GetPdfVersion_(self)
    end
    
    def add_pdf_extension(ns : UInt8*, level : Binding::PoDoFo::pdf_int64*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_AddPdfExtension_const_char_X_PoDoFo__pdf_int64(self, ns, level)
    end
    
    def has_pdf_extension(ns : UInt8*, level : Binding::PoDoFo::pdf_int64*) : Bool
      Binding.bg_PoDoFo__PdfMemDocument_HasPdfExtension_const_char_X_PoDoFo__pdf_int64(self, ns, level)
    end
    
    def remove_pdf_extension(ns : UInt8*, level : Binding::PoDoFo::pdf_int64*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_RemovePdfExtension_const_char_X_PoDoFo__pdf_int64(self, ns, level)
    end
    
    def pdf_extensions() : Binding::std::vector<PoDoFo::PdfExtension>*
      Binding.bg_PoDoFo__PdfMemDocument_GetPdfExtensions_(self)
    end
    
    def password=(s_password : String) : Void
      Binding.bg_PoDoFo__PdfMemDocument_SetPassword_const_std__string_R(self, Binding::CrystalString.new(ptr: s_password.to_unsafe, size: s_password.bytesize))
    end
    
    def set_encrypted(user_password : String, owner_password : String, protection : Int32 = 3900, e_algorithm : Binding::PoDoFo::PdfEncrypt::EPdfEncryptAlgorithm*, e_key_length : Binding::PoDoFo::PdfEncrypt::EPdfKeyLength*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_SetEncrypted_const_std__string_R_const_std__string_R_int_PoDoFo__PdfEncrypt__EPdfEncryptAlgorithm_PoDoFo__PdfEncrypt__EPdfKeyLength(self, Binding::CrystalString.new(ptr: user_password.to_unsafe, size: user_password.bytesize), Binding::CrystalString.new(ptr: owner_password.to_unsafe, size: owner_password.bytesize), protection, e_algorithm, e_key_length)
    end
    
    def encrypted=(p_encrypt : Binding::PoDoFo::PdfEncrypt*) : Void
      Binding.bg_PoDoFo__PdfMemDocument_SetEncrypted_const_PoDoFo__PdfEncrypt_R(self, p_encrypt)
    end
    
    def encrypted?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_GetEncrypted_(self)
    end
    
    def linearized?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsLinearized_(self)
    end
    
    def objects() : Binding::PoDoFo::PdfVecObjects*
      Binding.bg_PoDoFo__PdfMemDocument_GetObjects_(self)
    end
    
    def catalog() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfMemDocument_GetCatalog_(self)
    end
    
    def trailer() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfMemDocument_GetTrailer_(self)
    end
    
    def struct_tree_root() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfMemDocument_GetStructTreeRoot_(self)
    end
    
    def metadata() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfMemDocument_GetMetadata_(self)
    end
    
    def mark_info() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfMemDocument_GetMarkInfo_(self)
    end
    
    def language() : Binding::PoDoFo::PdfObject*
      Binding.bg_PoDoFo__PdfMemDocument_GetLanguage_(self)
    end
    
    def get_font(p_object : Binding::PoDoFo::PdfObject*) : Binding::PoDoFo::PdfFont*
      Binding.bg_PoDoFo__PdfMemDocument_GetFont_PoDoFo__PdfObject_X(self, p_object)
    end
    
    def insert_pages(r_doc : PdfMemDocument, in_first_page : Int32, in_num_pages : Int32) : PdfMemDocument
      PdfMemDocument.new(unwrap: Binding.bg_PoDoFo__PdfMemDocument_InsertPages_const_PoDoFo__PdfMemDocument_R_int_int(self, r_doc, in_first_page, in_num_pages))
    end
    
    def delete_pages(in_first_page : Int32, in_num_pages : Int32) : Void
      Binding.bg_PoDoFo__PdfMemDocument_DeletePages_int_int(self, in_first_page, in_num_pages)
    end
    
    def print_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsPrintAllowed_(self)
    end
    
    def edit_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsEditAllowed_(self)
    end
    
    def copy_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsCopyAllowed_(self)
    end
    
    def edit_notes_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsEditNotesAllowed_(self)
    end
    
    def fill_and_sign_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsFillAndSignAllowed_(self)
    end
    
    def accessibility_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsAccessibilityAllowed_(self)
    end
    
    def doc_assembly_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsDocAssemblyAllowed_(self)
    end
    
    def high_print_allowed?() : Bool
      Binding.bg_PoDoFo__PdfMemDocument_IsHighPrintAllowed_(self)
    end
    
    def free_object_memory(r_ref : Binding::PoDoFo::PdfReference*, b_force : Bool = false) : Void
      Binding.bg_PoDoFo__PdfMemDocument_FreeObjectMemory_const_PoDoFo__PdfReference_R_bool(self, r_ref, b_force)
    end
    
    def free_object_memory(p_obj : Binding::PoDoFo::PdfObject*, b_force : Bool = false) : Void
      Binding.bg_PoDoFo__PdfMemDocument_FreeObjectMemory_PoDoFo__PdfObject_X_bool(self, p_obj, b_force)
    end
    
    def encrypt() : Binding::PoDoFo::PdfEncrypt*
      Binding.bg_PoDoFo__PdfMemDocument_GetEncrypt_(self)
    end
    
    def to_unsafe
      @unwrap
    end
    def initialize(unwrap : Binding::PoDoFo::PdfMemDocument*)
      result = unwrap
    @unwrap = result
    end
    
  end
  class PdfString
    @unwrap : Binding::PoDoFoPdfString*
    
    def initialize()
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_()
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(s_string : String, p_encoding : Binding::PoDoFo::PdfEncoding*? = nil)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_std__string_R_const_PoDoFo__PdfEncoding_Xconst(Binding::CrystalString.new(ptr: s_string.to_unsafe, size: s_string.bytesize), p_encoding)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_string : UInt8*, p_encoding : Binding::PoDoFo::PdfEncoding*? = nil)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_char_X_const_PoDoFo__PdfEncoding_Xconst(psz_string, p_encoding)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_string : Char, l_len : Int64 = -1i64)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_wchar_t_X_PoDoFo__pdf_long(psz_string, l_len)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def set_from_wchar_t(psz_string : Char, l_len : Int64 = -1i64) : Void
      Binding.bg_PoDoFo__PdfString_setFromWchar_t_const_wchar_t_X_PoDoFo__pdf_long(self, psz_string, l_len)
    end
    
    def initialize(psz_string : UInt8*, l_len : Int64, b_hex : Bool = false, p_encoding : Binding::PoDoFo::PdfEncoding*? = nil)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_char_X_PoDoFo__pdf_long_bool_const_PoDoFo__PdfEncoding_Xconst(psz_string, l_len, b_hex, p_encoding)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_string_utf8 : Char)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf8_X(psz_string_utf8)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_string_utf16 : Char)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf16be_X(psz_string_utf16)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_string_utf8 : Char, l_len : Int64)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long(psz_string_utf8, l_len)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def initialize(psz_string_utf16 : Char, l_len : Int64)
      result = Binding.bg_PoDoFo__PdfString__CONSTRUCT_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long(psz_string_utf16, l_len)
    @unwrap = result
    {% begin %}
    {%
      methods = [] of Def
      ([@type] + @type.ancestors).select(&.<(PdfString)).map{|x| methods = methods + x.methods}
      forwarded = methods.map(&.name.stringify).select{|m| %w[ write ].includes?(m) }.uniq
    %}
    jump_table = Binding::BgJumptable_PdfString.new(
      bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X: BindgenHelper.wrap_proc({% if forwarded.includes?("write") %} Proc(Binding::PoDoFo::PdfOutputDevice*, EPdfWriteMode, Binding::PoDoFo::PdfEncrypt*, Void).new{|p_device, e_write_mode, p_encrypt| self.write(p_device, e_write_mode, p_encrypt) } {% else %} nil {% end %}),
    )
    Binding.bg_BgInherit_PdfString_JUMPTABLE_BgJumptable_PdfString_R(result, pointerof(jump_table))
    {% end %}
    end
    
    def set_hex_data(psz_hex : UInt8*, l_len : Int64 = -1i64, p_encrypt : Binding::PoDoFo::PdfEncrypt*? = nil) : Void
      Binding.bg_PoDoFo__PdfString_SetHexData_const_char_X_PoDoFo__pdf_long_PoDoFo__PdfEncrypt_X(self, psz_hex, l_len, p_encrypt)
    end
    
    def valid?() : Bool
      Binding.bg_PoDoFo__PdfString_IsValid_(self)
    end
    
    def hex?() : Bool
      Binding.bg_PoDoFo__PdfString_IsHex_(self)
    end
    
    def unicode?() : Bool
      Binding.bg_PoDoFo__PdfString_IsUnicode_(self)
    end
    
    def string() : UInt8*
      Binding.bg_PoDoFo__PdfString_GetString_(self)
    end
    
    def unicode() : Char
      Char.new(unwrap: Binding.bg_PoDoFo__PdfString_GetUnicode_(self))
    end
    
    def string_utf8() : String
      String.new(Binding.bg_PoDoFo__PdfString_GetStringUtf8_(self).ptr, Binding.bg_PoDoFo__PdfString_GetStringUtf8_(self).size)
    end
    
    def length() : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_GetLength_(self))
    end
    
    def unicode_length() : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_GetUnicodeLength_(self))
    end
    
    def character_length() : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_GetCharacterLength_(self))
    end
    
    def write(p_device : Binding::PoDoFo::PdfOutputDevice*, e_write_mode : EPdfWriteMode, p_encrypt : Binding::PoDoFo::PdfEncrypt*? = nil) : Void
      Binding.bg_PoDoFo__PdfString_Write_PoDoFo__PdfOutputDevice_X_PoDoFo__EPdfWriteMode_const_PoDoFo__PdfEncrypt_X(self, p_device, e_write_mode, p_encrypt)
    end
    
    def to_unicode() : PdfString
      PdfString.new(unwrap: Binding.bg_PoDoFo__PdfString_ToUnicode_(self))
    end
    
    def buffer() : Binding::PoDoFo::PdfRefCountedBuffer*
      Binding.bg_PoDoFo__PdfString_GetBuffer_(self)
    end
    
    def self.convert_utf8to_utf16(psz_utf8 : Char, psz_utf16 : Char, l_len_utf16 : Int64) : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_ConvertUTF8toUTF16_STATIC_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long(psz_utf8, psz_utf16, l_len_utf16))
    end
    
    def self.convert_utf8to_utf16(psz_utf8 : Char, l_len_utf8 : Int64, psz_utf16 : Char, l_len_utf16 : Int64, e_conversion : Binding::PoDoFo::EPdfStringConversion*) : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_ConvertUTF8toUTF16_STATIC_const_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long_PoDoFo__EPdfStringConversion(psz_utf8, l_len_utf8, psz_utf16, l_len_utf16, e_conversion))
    end
    
    def self.convert_utf16to_utf8(psz_utf16 : Char, psz_utf8 : Char, l_len_utf8 : Int64) : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_ConvertUTF16toUTF8_STATIC_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long(psz_utf16, psz_utf8, l_len_utf8))
    end
    
    def self.convert_utf16to_utf8(psz_utf16 : Char, l_len_utf16 : Int64, psz_utf8 : Char, l_len_utf8 : Int64, e_conversion : Binding::PoDoFo::EPdfStringConversion*) : Int64
      Int64.new(unwrap: Binding.bg_PoDoFo__PdfString_ConvertUTF16toUTF8_STATIC_const_PoDoFo__pdf_utf16be_X_PoDoFo__pdf_long_PoDoFo__pdf_utf8_X_PoDoFo__pdf_long_PoDoFo__EPdfStringConversion(psz_utf16, l_len_utf16, psz_utf8, l_len_utf8, e_conversion))
    end
    
    def to_unsafe
      @unwrap
    end
    def initialize(unwrap : Binding::PoDoFoPdfString*)
      result = unwrap
    @unwrap = result
    end
    
  end
  class PdfDocumentImpl < PdfDocument
    def write_mode() : EPdfWriteMode
      Binding.bg_PoDoFo__PdfDocument_GetWriteMode_(self)
    end
    
    def pdf_version() : EPdfVersion
      Binding.bg_PoDoFo__PdfDocument_GetPdfVersion_(self)
    end
    
    def linearized?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsLinearized_(self)
    end
    
    def print_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsPrintAllowed_(self)
    end
    
    def edit_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsEditAllowed_(self)
    end
    
    def copy_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsCopyAllowed_(self)
    end
    
    def edit_notes_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsEditNotesAllowed_(self)
    end
    
    def fill_and_sign_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsFillAndSignAllowed_(self)
    end
    
    def accessibility_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsAccessibilityAllowed_(self)
    end
    
    def doc_assembly_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsDocAssemblyAllowed_(self)
    end
    
    def high_print_allowed?() : Bool
      Binding.bg_PoDoFo__PdfDocument_IsHighPrintAllowed_(self)
    end
    
    def initialize(unwrap : Binding::PoDoFo::PdfDocument*)
      result = unwrap
    @unwrap = result
    end
    
  end
  enum EPdfContentsType : UInt32
    EpdfcontentstypeKeyword = 0
    EpdfcontentstypeVariant = 1
    EpdfcontentstypeImagedata = 2
  end
  enum EPdfVersion : UInt32
    Epdfversion10 = 0
    Epdfversion11 = 1
    Epdfversion12 = 2
    Epdfversion13 = 3
    Epdfversion14 = 4
    Epdfversion15 = 5
    Epdfversion16 = 6
    Epdfversion17 = 7
  end
  enum EPdfWriteMode : UInt32
    EpdfwritemodeCompact = 1
    EpdfwritemodeClean = 2
  end
  enum EPdfDataType : UInt32
    EpdfdatatypeBool = 0
    EpdfdatatypeNumber = 1
    EpdfdatatypeReal = 2
    EpdfdatatypeString = 3
    EpdfdatatypeHexstring = 4
    EpdfdatatypeName = 5
    EpdfdatatypeArray = 6
    EpdfdatatypeDictionary = 7
    EpdfdatatypeNull = 8
    EpdfdatatypeReference = 9
    EpdfdatatypeRawdata = 10
    EpdfdatatypeUnknown = 11
  end
  enum EPdfFilter : Int32
    EpdffilterNone = -1
    EpdffilterAsciihexdecode = 0
    EpdffilterAscii85decode = 1
    EpdffilterLzwdecode = 2
    EpdffilterFlatedecode = 3
    EpdffilterRunlengthdecode = 4
    EpdffilterCcittfaxdecode = 5
    EpdffilterJbig2decode = 6
    EpdffilterDctdecode = 7
    EpdffilterJpxdecode = 8
    EpdffilterCrypt = 9
  end
  enum EPdfFontType : UInt32
    EpdffonttypeTruetype = 0
    EpdffonttypeType1pfa = 1
    EpdffonttypeType1pfb = 2
    EpdffonttypeType1base14 = 3
    EpdffonttypeType3 = 4
    EpdffonttypeUnknown = 255
  end
  enum EPdfColorSpace : UInt32
    EpdfcolorspaceDevicegray = 0
    EpdfcolorspaceDevicergb = 1
    EpdfcolorspaceDevicecmyk = 2
    EpdfcolorspaceSeparation = 3
    EpdfcolorspaceCielab = 4
    EpdfcolorspaceIndexed = 5
    EpdfcolorspaceUnknown = 255
  end
  enum EPdfTextRenderingMode : UInt32
    EpdftextrenderingmodeFill = 0
    EpdftextrenderingmodeStroke = 1
    EpdftextrenderingmodeFillandstroke = 2
    EpdftextrenderingmodeInvisible = 3
    EpdftextrenderingmodeFilltoclippath = 4
    EpdftextrenderingmodeStroketoclippath = 5
    EpdftextrenderingmodeFillandstroketoclippath = 6
    EpdftextrenderingmodeToclippath = 7
    EpdftextrenderingmodeUnknown = 255
  end
  enum EPdfStrokeStyle : UInt32
    EpdfstrokestyleSolid = 0
    EpdfstrokestyleDash = 1
    EpdfstrokestyleDot = 2
    EpdfstrokestyleDashdot = 3
    EpdfstrokestyleDashdotdot = 4
    EpdfstrokestyleCustom = 5
  end
  enum EPdfTilingPatternType : UInt32
    EpdftilingpatterntypeBdiagonal = 1
    EpdftilingpatterntypeCross = 2
    EpdftilingpatterntypeDiagcross = 3
    EpdftilingpatterntypeFdiagonal = 4
    EpdftilingpatterntypeHorizontal = 5
    EpdftilingpatterntypeVertical = 6
    EpdftilingpatterntypeImage = 7
  end
  enum EPdfLineCapStyle : UInt32
    EpdflinecapstyleButt = 0
    EpdflinecapstyleRound = 1
    EpdflinecapstyleSquare = 2
  end
  enum EPdfLineJoinStyle : UInt32
    EpdflinejoinstyleMiter = 0
    EpdflinejoinstyleRound = 1
    EpdflinejoinstyleBevel = 2
  end
  enum EPdfVerticalAlignment : UInt32
    EpdfverticalalignmentTop = 0
    EpdfverticalalignmentCenter = 1
    EpdfverticalalignmentBottom = 2
  end
  enum EPdfAlignment : UInt32
    EpdfalignmentLeft = 0
    EpdfalignmentCenter = 1
    EpdfalignmentRight = 2
  end
  enum EPdfPageSize : UInt32
    EpdfpagesizeA0 = 0
    EpdfpagesizeA1 = 1
    EpdfpagesizeA2 = 2
    EpdfpagesizeA3 = 3
    EpdfpagesizeA4 = 4
    EpdfpagesizeA5 = 5
    EpdfpagesizeA6 = 6
    EpdfpagesizeLetter = 7
    EpdfpagesizeLegal = 8
    EpdfpagesizeTabloid = 9
  end
  enum EPdfPageMode : UInt32
    Epdfpagemodedontcare = 0
    Epdfpagemodeusenone = 1
    Epdfpagemodeusethumbs = 2
    Epdfpagemodeusebookmarks = 3
    Epdfpagemodefullscreen = 4
    Epdfpagemodeuseoc = 5
    Epdfpagemodeuseattachments = 6
  end
  enum EPdfPageLayout : UInt32
    Epdfpagelayoutignore = 0
    Epdfpagelayoutdefault = 1
    Epdfpagelayoutsinglepage = 2
    Epdfpagelayoutonecolumn = 3
    Epdfpagelayouttwocolumnleft = 4
    Epdfpagelayouttwocolumnright = 5
    Epdfpagelayouttwopageleft = 6
    Epdfpagelayouttwopageright = 7
  end
  enum EPdfError : UInt32
    EpdferrorErrok = 0
    EpdferrorTestfailed = 1
    EpdferrorInvalidhandle = 2
    EpdferrorFilenotfound = 3
    EpdferrorInvaliddeviceoperation = 4
    EpdferrorUnexpectedeof = 5
    EpdferrorOutofmemory = 6
    EpdferrorValueoutofrange = 7
    EpdferrorInternallogic = 8
    EpdferrorInvalidenumvalue = 9
    EpdferrorBrokenfile = 10
    EpdferrorPagenotfound = 11
    EpdferrorNopdffile = 12
    EpdferrorNoxref = 13
    EpdferrorNotrailer = 14
    EpdferrorNonumber = 15
    EpdferrorNoobject = 16
    EpdferrorNoeoftoken = 17
    EpdferrorInvalidtrailersize = 18
    EpdferrorInvalidlinearization = 19
    EpdferrorInvaliddatatype = 20
    EpdferrorInvalidxref = 21
    EpdferrorInvalidxrefstream = 22
    EpdferrorInvalidxreftype = 23
    EpdferrorInvalidpredictor = 24
    EpdferrorInvalidstrokestyle = 25
    EpdferrorInvalidhexstring = 26
    EpdferrorInvalidstream = 27
    EpdferrorInvalidstreamlength = 28
    EpdferrorInvalidkey = 29
    EpdferrorInvalidname = 30
    EpdferrorInvalidencryptiondict = 31
    EpdferrorInvalidpassword = 32
    EpdferrorInvalidfontfile = 33
    EpdferrorInvalidcontentstream = 34
    EpdferrorUnsupportedfilter = 35
    EpdferrorUnsupportedfontformat = 36
    EpdferrorActionalreadypresent = 37
    EpdferrorWrongdestinationtype = 38
    EpdferrorMissingendstream = 39
    EpdferrorDate = 40
    EpdferrorFlate = 41
    EpdferrorFreetype = 42
    EpdferrorSignatureerror = 43
    EpdferrorMutexerror = 44
    EpdferrorUnsupportedimageformat = 45
    EpdferrorCannotconvertcolor = 46
    EpdferrorNotimplemented = 47
    EpdferrorDestinationalreadypresent = 48
    EpdferrorChangeonimmutable = 49
    EpdferrorNotcompiled = 50
    EpdferrorOutlineitemalreadypresent = 51
    EpdferrorNotloadedforupdate = 52
    EpdferrorCannotencryptedforupdate = 53
    EpdferrorUnknown = 65535
  end
  enum ELogSeverity : UInt32
    ElogseverityCritical = 0
    ElogseverityError = 1
    ElogseverityWarning = 2
    ElogseverityInformation = 3
    ElogseverityDebug = 4
    ElogseverityNone = 5
    ElogseverityUnknown = 65535
  end
end
