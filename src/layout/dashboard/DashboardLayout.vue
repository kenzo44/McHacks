<template>
  <div class="wrapper">
    <side-bar>
      <template slot="links">
        <sidebar-link to="/dashboard" name="Dashboard" icon="ti-home"/>
        <sidebar-link to="/typography" name="Daily Activity" icon="ti-check-box"/>
        <sidebar-link to="/stats" name="User Profile" icon="ti-user"/>
        <sidebar-link to="/maps" name="Goals & Values" icon="ti-agenda"/>
      </template>
      <mobile-menu>
        <drop-down class="nav-item"
                   title="5 Notifications"
                   title-classes="nav-link"
                   icon="ti-bell">
          <a class="dropdown-item">Notification 1</a>
          <a class="dropdown-item">Notification 2</a>
          <a class="dropdown-item">Notification 3</a>
          <a class="dropdown-item">Notification 4</a>
          <a class="dropdown-item">Another notification</a>
        </drop-down>
        <li class="divider"></li>
      </mobile-menu>
    </side-bar>
    <div class="main-panel">
      <top-navbar></top-navbar>

      <dashboard-content @click.native="toggleSidebar">

      </dashboard-content>

      <content-footer></content-footer>
    </div>
  </div>
</template>
<style lang="scss">
.sidebar-wrapper {
  background-image: linear-gradient(#340088, #1CB5E0);
  color: #fff;
  // background-color: #3a0d9b;
}
</style>
<script>
import TopNavbar from "./TopNavbar.vue";
import ContentFooter from "./ContentFooter.vue";
import DashboardContent from "./Content.vue";
import MobileMenu from "./MobileMenu";
export default {
  components: {
    TopNavbar,
    ContentFooter,
    DashboardContent,
    MobileMenu
  },
  methods: {
    toggleSidebar() {
      if (this.$sidebar.showSidebar) {
        this.$sidebar.displaySidebar(false);
      }
    }
  }
};
</script>
