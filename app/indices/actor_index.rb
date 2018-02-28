ThinkingSphinx::Index.define :actor, with: :active_record, delta: true do
  indexes name, sortable: true
  indexes bio, sortable: true

  has created_at, updated_at, deleted_at
end
