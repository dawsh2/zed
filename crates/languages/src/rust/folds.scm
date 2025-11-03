; Fold items entirely
[
 (mod_item)
 (foreign_mod_item)
 (trait_item)
 (enum_item)
 (impl_item)
 (type_item)
 (union_item)
 (const_item)
 (let_declaration)
 (array_expression)
 (macro_definition)
 (macro_invocation)
 (attribute_item)
 (use_declaration)+
] @fold

; Fold function bodies, keeping signature visible
; Marked with fold.auto to enable automatic folding (matklad-style)
((function_item
  body: (block) @fold)
  (#set! fold.auto "true"))

; Fold struct bodies, keeping signature visible
(struct_item
  body: (field_declaration_list) @fold)

; Fold control flow bodies, keeping statement visible
(loop_expression
  body: (block) @fold)

(for_expression
  body: (block) @fold)

(while_expression
  body: (block) @fold)

(if_expression
  consequence: (block) @fold)

(match_expression
  body: (match_block) @fold)
