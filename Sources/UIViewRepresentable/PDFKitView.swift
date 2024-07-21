import SwiftUI
import PDFKit

public struct PDFKitView: UIViewRepresentable {
	public let data: Data

	public func makeUIView(context: UIViewRepresentableContext<Self>) -> PDFView {
		let uiView = PDFView()
		uiView.document = PDFDocument(data: self.data)
		uiView.autoScales = true
		uiView.pageShadowsEnabled = true
		uiView.translatesAutoresizingMaskIntoConstraints = false
		uiView.displayBox = .artBox
		uiView.displayMode = .singlePage
		// pdfView.visiblePages
		return uiView
	}

	public func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<Self>) {
		uiView.document = PDFDocument(data: data)
	}
}
