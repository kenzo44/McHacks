<template>
	<div id="app">
		<div>
			<button @click="type = 'range'" id='btn'>Range</button>
			<button @click="type = 'single'" id='btn'>Single</button>
		</div>
		<br />
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
			type: 'range',
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
#app {
  /*display: flex;
  flex-direction: column;
  justify-content: space-around;
  background-color: #FFFFFF;*/
  color: #212120;
  font-size: 25px;
	text-align: center;
	font-family: Arial, Roboto;
}
#btn {
  font-size: 10px;
}

.vcs-clickable {
  background-color: #d4f4b7;
  border: 2px solid white;
  border-radius: 10px;

}

@media only screen and (max-width: 574px) {
.vcs-table__day {
  height: 50px;
  width: 50px;
  padding: -20px;
}
}

</style>
