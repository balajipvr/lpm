<template>
  <div class="form-group row">
    <div class="col-md-2">
      <label class="control-label">{{ label_title }}</label>
    </div>
    <div class="col-sm-4">
      <datetime :type="need_time ? 'datetime' : 'date' " :use12-hour=need_time :placeholder="placeholder_value"  v-model="dateSelected"></datetime>
    </div>
  </div>
</template>
<script>
import {Datetime} from 'vue-datetime';

export default {
  name: 'DateWithLabel',
  components: {
    datetime: Datetime
  },
  props: [ 'label_title','placeholder_value','field_value', 'need_time'],
  computed: {
    dateSelected: {
      get: function () {
        return this.field_value;
      },
      set: function (newValue) {
        this.$emit('update:field_value', newValue)
      }
    }
  },
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
