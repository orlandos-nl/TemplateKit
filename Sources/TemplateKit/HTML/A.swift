public struct A: BodyTag {
    
    static var tag: StaticString = "a"
    let node: TemplateNode
}

extension AttributedHTML where BaseTag == A {
    public func href<URI: TemplateValueRepresentable>(_ href: URI) -> Modified<BaseTag> {
        self.attribute(key: "href", value: href)
    }
}
