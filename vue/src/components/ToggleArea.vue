<template>
  <el-select v-if="areaRows" size="mini" v-model="areaName" @change="changeArea">
    <el-option
        v-for="item in areaRows"
        :key="item.aid"
        :label="$t(areaNameMapping[item.areaName])"
        :value="item.aid">
    </el-option>
  </el-select>
</template>

<script>
export default {
  name: "ToggleArea",
  props: {
    areaRows: {
      type: Array
    }
  },
  data() {
    return {
      areaName: null,
      curIndex: 0,
      areaNameMapping: {
        "一层西阅览区": "first_floor_west_reading_area",
        "一层东阅览区": "first_floor_east_reading_area",
        "二层西自习区": "second_floor_west_study_area",
        "二层东自习区": "second_floor_east_study_area",
        "三层西自习区": "third_floor_west_study_area",
        "三层东自习区": "third_floor_east_study_area"
      }
    }
  },
  methods: {
    getArea() {
      return this.areaRows[this.curIndex];
    },
    changeArea(index) {
      this.curIndex = index - 1;
      this.$emit('changeArea', this.areaRows[index - 1]);
    },
  },
  created() {
    this.areaName = this.areaRows[0].aid;
  }
}
</script>

<style scoped>

</style>
