<template>
    <div class="form-group row">
        <div :class="label_size">
            <label class="control-label">{{ label_title }}</label>
        </div>
        <div :class="value_size">
            <input  class="form-control" type="number"
                    :value="field_value" @input="$emit('update:field_value', parseInt($event.target.value))">
        </div>
    </div>
</template>
<script>
    export default {
        name: 'NumberWithLabel',
        props: [ 'label_title','field_value','label_size','value_size']
    }
</script>
