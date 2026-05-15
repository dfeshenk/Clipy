//
//  SearchMenuItemView.swift
//
//  Clipy
//  GitHub: https://github.com/clipy
//  HP: https://clipy-app.com
//
//  Copyright © 2015-2018 Clipy Project.
//

import Cocoa

final class SearchMenuItemView: NSView {

    // MARK: - Properties
    var onSearch: ((String) -> Void)?

    // MARK: - UI
    private let searchField: NSSearchField = {
        let field = NSSearchField()
        field.placeholderString = "Search"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    // MARK: - Initialize
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // MARK: - Setup
    private func setupViews() {
        addSubview(searchField)
        searchField.delegate = self
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            searchField.centerYAnchor.constraint(equalTo: centerYAnchor),
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    // MARK: - Public
    func focusSearchField() {
        searchField.window?.makeFirstResponder(searchField)
    }

    func clearSearchField() {
        searchField.stringValue = ""
    }
}

// MARK: - NSSearchFieldDelegate
extension SearchMenuItemView: NSSearchFieldDelegate {
    func controlTextDidChange(_ obj: Notification) {
        onSearch?(searchField.stringValue)
    }
}
