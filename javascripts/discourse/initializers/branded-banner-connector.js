import { apiInitializer } from "discourse/lib/api";
import BrandedBanner from "../components/branded-banner";

export default apiInitializer("1.15.0", (api) => {
  api.renderInOutlet("below-site-header", BrandedBanner);
});
