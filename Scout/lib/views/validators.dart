dynamic numberValidator = (String? value, {String field = ''}) {
  if (value == null || value.isEmpty) {
    return 'Please enter a $field';
  }
  if (int.tryParse(value) == null) {
    return 'Please enter a valid $field';
  }
  return null;
};
