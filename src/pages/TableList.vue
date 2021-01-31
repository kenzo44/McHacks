<template>
	<div>
    <h1>Goals and Values</h1>
    <p>"Goals are things that you are aiming for in the future: things you want to get, have, or achieve. In contrast,
      values are how you want to behave right now and on an ongoing basis for the rest of your life, and how you want to
       behave every step of the way toward achieving your goals; whether you achieve them or not."</p>

    <div class="Values">
      <h3>Values</h3>
      <div class="listWrap">
      <ul class="myLists">
        <li>Compassion/self-compassion: to act kindly toward myself and others in pain.</li>
        <li>Supportiveness: to be supportive, helpful, and available to myself and others.</li>
        <li>Fun and Humour: to be fun-loving; to seek, create, and engage in fun-filled activities.</li>
      </ul>
    </div>
    </div>

    <div class="goals">
      <h3>Goals</h3>
      <div class="listWrap">
      <ul class="myLists">
        <li>To practice mindfullness daily on choicepoint.space and log my behaviour activities.</li>
        <li>Get 30 minutes of physical activity in 4 times a week.</li>
        <li>To earn an A in Math class.</li>
        <li>To be more present and engaging with family members by calling them once a week.</li>
      </ul>
    </div>
    </div>
	</div>

</template>

<script>

export default {

}
</script>

<style lang="scss">

  .listWrap {
    background: linear-gradient(#340088, #1CB5E0);
    color: #fff;
    padding: 2px;
    border-radius: 5px;
    position: relative;
  }

  .myLists {
    list-style-type: none;

    justify-content: space-around;
    border-radius: 5px;
    border: 3px;
    border-color: none;
    line-height: 30px;
    padding: 5px;
    background-color: white;

    li {
      color: #66615b;
      font-size: 20px;
    }
  }

</style>
