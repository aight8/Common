import SwiftUI
import PDFKit

#if os(iOS)
public struct PDFThumbnail: UIViewRepresentable {
	let data: Data

	public func makeUIView(context: UIViewRepresentableContext<Self>) -> PDFThumbnailView {
		let pdfView = PDFView()
		pdfView.document = PDFDocument(data: self.data)

		let uiView = PDFThumbnailView()
		uiView.pdfView = pdfView
		uiView.thumbnailSize = .init(width: 300, height: 300)
		return uiView
	}

	public func updateUIView(_ uiView: PDFThumbnailView, context: UIViewRepresentableContext<Self>) {
//		uiView. = PDFDocument(data: data)
	}
}
#endif
