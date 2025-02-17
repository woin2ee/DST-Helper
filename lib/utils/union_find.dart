class UnionFind<Element> {
  Map<Element, Element> map = {};

  void initialize(List<Element> elements) {
    for (final element in elements) {
      if (!map.containsKey(element)) {
        map[element] = element;
      }
    }
  }

  Element find(Element element) {
    if (map[element] != element) {
      final root = find(map[element] as Element);
      map[element] = root;
      return root;
    }
    return element;
  }

  void union(Element e1, Element e2) {
    final Element root1 = find(e1);
    final Element root2 = find(e2);
    if (root1 != root2) {
      map[root2] = root1;
    }
  }
}
