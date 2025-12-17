import SwiftUI

public extension URL {

    // Backed Up. Sync data between devices.
    static var icloud: URL {
        return FileManager.default.url(forUbiquityContainerIdentifier: nil)!
    }

    // Backed Up. Sync data between devices.
    static func icloud(_ subDirectory: String) -> URL {
        return icloud.appending(component: subDirectory)
    }

    // Backed Up. Sync data between devices.
    static var icloudDocuments: URL {
        return icloud("Documents")
    }
}

extension URL {

    /// Returns a URL by appending a file name to the current URL.
    public func file(name: String) -> URL {
        return appendingPathComponent(name, isDirectory: false)
    }

    /// Returns a URL by appending a directory name to the current URL.
    public func dir(name: String) -> URL {
        return appendingPathComponent(name, isDirectory: true)
    }

    /// Returns an array of file URLs in the directory, optionally filtering by name pattern.
    public func files(matching pattern: String? = nil) -> [URL] {
        return contentsOfDirectory(matching: pattern, includeDirectories: false)
    }

    /// Returns an array of directory URLs in the directory, optionally filtering by name pattern.
    public func directories(matching pattern: String? = nil) -> [URL] {
        return contentsOfDirectory(matching: pattern, includeDirectories: true)
    }

    /// Checks if the URL is a directory.
    public var isDirectory: Bool {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }

    /// Checks if the URL is a file.
    public var isFile: Bool {
        return !isDirectory
    }

    /// Private helper function to list contents of a directory.
    private func contentsOfDirectory(matching pattern: String?, includeDirectories: Bool) -> [URL] {
        guard isDirectory else { return [] }

        do {
            let fileManager = FileManager.default
            let contents = try fileManager.contentsOfDirectory(at: self, includingPropertiesForKeys: [.isDirectoryKey], options: [])

            return contents.filter { url in
                let isDir = (try? url.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
                let matchesType = includeDirectories ? isDir : !isDir

                if let pattern = pattern {
                    return matchesType && url.lastPathComponent.contains(pattern)
                }
                return matchesType
            }
        } catch {
            return []
        }
    }

}

extension URL {

    /// Checks if the file or directory is readable.
    var isReadable: Bool {
        return FileManager.default.isReadableFile(atPath: path)
    }

    /// Checks if the file or directory is writable.
    var isWritable: Bool {
        return FileManager.default.isWritableFile(atPath: path)
    }

    /// Reads and returns the file contents as a string.
    public func contents() -> String? {
        guard isFile else { return nil }

        do {
            return try String(contentsOf: self, encoding: .utf8)
        } catch {
            return nil
        }
    }

}

// public extension URL {
// 
//     static func places() {
//         debugPrint(try! URL.homeDirectory.directories())
// 
//         print(["URL.currentDirectory", URL.currentDirectory().formatted()])
//         print(["URL.applicationDirectory", URL.applicationDirectory.formatted()])
//         print(["URL.userDirectory", URL.userDirectory.formatted()])
// 
//         print(["URL.homeDirectory", URL.homeDirectory.formatted()])
//         print(["URL.musicDirectory", URL.musicDirectory.formatted()])
//         print(["URL.moviesDirectory", URL.moviesDirectory.formatted()])
//         print(["URL.desktopDirectory", URL.desktopDirectory.formatted()])
//         print(["URL.libraryDirectory", URL.libraryDirectory.formatted()])
//         print(["URL.picturesDirectory", URL.picturesDirectory.formatted()])
//         print(["URL.documentsDirectory", URL.documentsDirectory.formatted()])
//         print(["URL.downloadsDirectory", URL.downloadsDirectory.formatted()])
//         print(["URL.sharedPublicDirectory", URL.sharedPublicDirectory.formatted()])
//         print(["URL.applicationSupportDirectory", URL.applicationSupportDirectory.formatted()])
//         print(["URL.cachesDirectory", URL.cachesDirectory.formatted()])
// 
//         print(["URL.temporaryDirectory", URL.temporaryDirectory.formatted()])
// 
//         // print(["xxx", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)])
// 
//         // print(["URL.trashDirectory", URL.trashDirectory.formatted()])
//     }
// }
