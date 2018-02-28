ThinkingSphinx::Index.define :actor, with: :active_record do
  indexes name, sortable: true
  indexes bio, sortable: true

  has created_at, updated_at
end
