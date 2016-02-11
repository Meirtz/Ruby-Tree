class Tree
  attr_accessor :children, :node_value
  def initialize(value, children = [])
    @children = children
    @node_value = value
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("wo",
                     [Tree.new("bc"),Tree.new("jiu",
                                              [Tree.new("shi"), Tree.new("diao")])])

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_value}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_value}