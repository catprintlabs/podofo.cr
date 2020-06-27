require "./podofo/pdf"
require "./podofo/binding"

# TODO: Write documentation for `Podofo`
module PoDoFo
  VERSION = "0.1.0"

  # TODO: Put your code here
end

# foo = PoDoFo::PdfEncrypt.new

# doc = PoDoFo::FileInputStream.new("test.pdf".to_unsafe)

str = Podofo::PdfString.new("Yo")

puts str.length
puts str.string_utf8

puts Podofo::EPdfVersion::Epdfversion15.value

# stream = PoDoFo::FileInputStream.new("test_pdf".to_unsafe)


# puts str.string
# puts doc.file_length
