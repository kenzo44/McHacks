<template>
	<div class="calendar">
	
		<v-simple-calendar :type="type" :weekdayFormat="'cccccc'" :value="selectedRange" @change="changeValue"></v-simple-calendar>
	</div>
</template>

<script>
import  VSimpleCalendar  from  '@romanran/vue-simple-calendar'
import '@romanran/vue-simple-calendar/dist/vue-simple-calendar.css'
export default {
	components: {
		VSimpleCalendar,
	},
	data() {
		return {
			selectedRange: [new Date()],
			type: 'single',
		}
	},
	methods: {
		changeValue(value) {
			this.selectedRange = value
		},
	},
}
</script>

<style>
.calendar {
  /*display: flex;
  flex-direction: column;
  justify-content: space-around;
  background-color: #FFFFFF;*/
  color: #333;
  font-size: 25px;
	text-align: center;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif, Roboto;
}
.vcs-clickable {
  background-color: #fff;
  border-radius: 5px;
}

@media only screen and (max-width: 574px) {
.vcs-table__day {
  height: 50px;
  width: 50px;
  padding: -20px;
}
}

</style>
