<template>
  <div class="container-fluid masonry">
    <!--Stats cards-->
    <div class="row">
      <div class="col-md-6 col-xl-3" v-for="stats in statsCards" :key="stats.title">
        <stats-card>
          <div class="icon-big text-center" :class="`icon-${stats.type}`" slot="header">
            <i :class="stats.icon"></i>
          </div>
          <div class="numbers" slot="content">
            <p>{{stats.title}}</p>
            {{stats.value}}
          </div>
          <div class="stats" slot="footer">
            <i :class="stats.footerIcon"></i> {{stats.footerText}}
          </div>
        </stats-card>
      </div>
    </div>

    <!--Charts-->
    <div class="row">

      <div class="col-md-6 col-12">
        <chart-card title="Total Behavior Activities"
                    sub-title=""
                    :chart-data="preferencesChart.data"
                    chart-type="Pie">
          <span slot="footer">
            <i class="ti-timer"></i> Last updated today</span>
          <div slot="legend">
            <i class="fa fa-circle text-info"></i> Toward Moves

            <i class="fa fa-circle text-warning"></i> Away Moves
          </div>
        </chart-card>
      </div>

<!-- Calendar -->
      <div class="caly col-md-6 col-12">
        <div class="calendar">
          Day at a glance...<br><br>

		<v-simple-calendar :type="type" :weekdayFormat="'cccccc'" :value="selectedRange" @change="changeValue"></v-simple-calendar>
	</div>
      </div>

    </div>

    <!-- chat -->
      <div class="caly col-md-6 col-12">
        <div class="chat-box">
          Share your progress with Kippy :)<br><br>
		<iframe
    allow="microphone;"
    width="450"
    height="500"
    src="https://console.dialogflow.com/api-client/demo/embedded/495a8448-bba9-4575-8ba4-48a687248161">
</iframe>

	</div>
  <br>
<br>
Kippy is built with Dialogflow and Google Cloud Functions<br><br>
- Keywords from the chat are saved to a firebase db<br>
- This helps build a psychological profile of the individual
      </div>

    </div>

  </div>
</template>
<script>
import  VSimpleCalendar  from  '@romanran/vue-simple-calendar'
import '@romanran/vue-simple-calendar/dist/vue-simple-calendar.css'
import { StatsCard, ChartCard } from "@/components/index";
import Chartist from 'chartist';
export default {
  mounted () {
    document.body.classList.add('no-scroll')
  },

  destroyed () {
    document.body.classList.remove('no-scroll')
  },
  components: {
    StatsCard,
    ChartCard,
    VSimpleCalendar,
  },
  /**
   * Chart data used to render stats, charts. Should be replaced with server data
   */
  data() {
    return {
      selectedRange: [new Date()],
			type: 'single',
      statsCards: [
        {
          type: "warning",
          icon: "ti-arrow-top-right",
          title: "Toward Moves",
          value: "63",
          footerText: "This Week",
          footerIcon: "ti-reload"
        },
        {
          type: "success",
          icon: "ti-clipboard",
          title: "Behavior Activities",
          value: "4",
          footerText: "Entered Today",
          footerIcon: "ti-calendar"
        },

        {
          type: "info",
          icon: "ti-time",
          title: "Upcoming Session",
          value: "6pm Wed",
          footerText: "See Schedule",
          footerIcon: "ti-calendar"
        }
      ],
      usersChart: {
        data: {
          labels: [
            "9:00AM",
            "12:00AM",
            "3:00PM",
            "6:00PM",
            "9:00PM",
            "12:00PM",
            "3:00AM",
            "6:00AM"
          ],
          series: [
            [287, 385, 490, 562, 594, 626, 698, 895, 952],
            [67, 152, 193, 240, 387, 435, 535, 642, 744],
            [23, 113, 67, 108, 190, 239, 307, 410, 410]
          ]
        },
        options: {
          low: 0,
          high: 1000,
          showArea: true,
          height: "245px",
          axisX: {
            showGrid: false
          },
          lineSmooth: Chartist.Interpolation.simple({
            divisor: 3
          }),
          showLine: true,
          showPoint: false
        }
      },
      activityChart: {
        data: {
          labels: [
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "Mai",
            "Jun",
            "Jul",
            "Aug",
            "Sep",
            "Oct",
            "Nov",
            "Dec"
          ],
          series: [
            [542, 543, 520, 680, 653, 753, 326, 434, 568, 610, 756, 895],
            [230, 293, 380, 480, 503, 553, 600, 664, 698, 710, 736, 795]
          ]
        },
        options: {
          seriesBarDistance: 10,
          axisX: {
            showGrid: false
          },
          height: "245px"
        }
      },

      preferencesChart: {
        data: {
          labels: ["27%", "63%"],
          series: [27,63],
          },
        options: {}
      },

    };
  },
  methods: {
		changeValue(value) {
			this.selectedRange = value
		},
	},
};
</script>

<style>

.calendar {
  padding: 25px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  background-color: #FFFFFF;
  color: #333;
  font-size: 18px;
  text-align: center;
	font-family: 'Muli', "Helvetica", Arial, sans-serif;
}
.chat-box{
  display: block;
  padding: 25px;
  /* display: flex; */

  background-color: #FFFFFF;
  color: #333;
  font-size: 18px;
  text-align: center;
	font-family: 'Muli', "Helvetica", Arial, sans-serif;
}
.vcs-clickable {
  background-color: #fff;
  border-radius: 10px;
}

.ti-arrow-top-right {
  color: green;
}

.ti-clipboard {
  color: #ba8a10;
}

.numbers p {
  width: 150px;
  padding-right: 10px;
}

.vcs-table__day {
  height: 5*0px;
  width: 50px;
}


@media only screen and (max-width: 574px) {
.vcs-table__day {
  height: 50px;
  width: 50px;
  padding: -20px;
}
}

</style>
