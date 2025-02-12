class UnionFind<Element> {
  Map<Element, Element> parent = {};

  void initialize(List<Element> elements) {
    for (final element in elements) {
      if (!parent.containsKey(element)) {
        parent[element] = element;
      }
    }
  }

  Element find(Element element) {
    if (parent[element] != element) {
      final root = find(parent[element] as Element);
      parent[element] = root;
      return root;
    }
    return element;
  }

  void union(Element e1, Element e2) {
    final Element root1 = find(e1);
    final Element root2 = find(e2);
    if (root1 != root2) {
      parent[root2] = root1;
    }
  }
}
