ThinkingSphinx::Index.define :user, with: :active_record, delta: true do
  indexes email, sortable: true
  indexes name, sortable: true
  indexes phone_no, sortable: true
  indexes gender, sortable: true
  indexes status, sortable: true
  indexes date_of_birth, sortable: true

  has created_at, updated_at
end
