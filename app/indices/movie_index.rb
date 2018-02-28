ThinkingSphinx::Index.define :movie, with: :active_record do
  indexes name, sortable: true
  indexes genre, sortable: true
  indexes director, sortable: true
  indexes producer, sortable: true
  indexes writer, sortable: true
  indexes actors.name, as: :actor

  has created_at, updated_at
end
