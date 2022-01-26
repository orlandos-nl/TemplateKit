public struct AnyHTML<Scope: HTMLScope>: ContentRepresentable, _HTML {
    public typealias BaseHTML = AnyHTML
    public typealias HTMLScope = Scope
    let node: TemplateNode
    
    init(node: TemplateNode) {
        self.node = node
    }
    
    init() {
        self.node = .noContent
    }
    
    public init<Content: _HTML>(content: Content) {
        if let node = content as? TemplateNode {
            self.node = node
        } else if let content = content as? ContentRepresentable {
            self.node = content.node
        } else {
            self.node = AnyHTML(content: content.html).node
        }
    }
    
    public var html: Never { fatalError() }
}

extension AnyHTML: HTML where Scope == Scopes.Body {}
