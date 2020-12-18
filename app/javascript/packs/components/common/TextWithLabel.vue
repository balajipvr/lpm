<template>
  <div class="form-group row">
    <div :class="label_size">
      <label class="control-label">{{ label_title }}</label>
    </div>
    <div :class="value_size">
      <input  class="form-control" type="text"  :placeholder="placeholder_value"  :value="field_value" @input="$emit('update:field_value', $event.target.value)">
    </div>
  </div>
</template>
<script>
export default {
  name: 'TextWithLabel',
  props: [ 'label_title','placeholder_value','field_value','label_size','value_size'],

  $_veeValidate: {
    name () {
      return this.label_title;
    },
    value () {
      return this.field_value;
    }
  }

}
</script>
