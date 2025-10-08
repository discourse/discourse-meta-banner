import { apiInitializer } from "discourse/lib/api";
import BrandedBanner from "../components/branded-banner";

export default apiInitializer((api) => {
  api.renderInOutlet("below-site-header", BrandedBanner);
});
