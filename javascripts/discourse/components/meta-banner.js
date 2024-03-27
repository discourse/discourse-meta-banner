import Component from "@ember/component";
import { service } from "@ember/service";
import discourseComputed from "discourse-common/utils/decorators";

export default Component.extend({
  router: service(),

  @discourseComputed("currentUser")
  shouldShow(currentUser) {
    const isStaff = currentUser && currentUser.staff;
    const lowTrustLevel = currentUser && currentUser.trust_level < 2;
    // show banner only for anons and < TL 2
    return !isStaff && (!currentUser || lowTrustLevel);
  },

  @discourseComputed("router.currentRouteName", "router.currentURL")
  discoveryRoute(currentRouteName) {
    return currentRouteName.includes("discovery");
  },
});
