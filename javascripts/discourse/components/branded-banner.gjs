import Component from "@glimmer/component";
import { service } from "@ember/service";
import { defaultHomepage } from "discourse/lib/utilities";
import icon from "discourse-common/helpers/d-icon";
import i18n from "discourse-common/helpers/i18n";

export default class BrandedBanner extends Component {
  @service router;
  @service currentUser;

  get shouldShow() {
    const anonOrLowTrust = (this.currentUser?.trust_level ?? 0) <= 1;
    return (
      this.router.currentRouteName === `discovery.${defaultHomepage()}` &&
      anonOrLowTrust
    );
  }

  <template>
    {{#if this.shouldShow}}
      <div class="custom-banner-wrapper">
        <div class="wrap custom-banner">
          <div class="custom-banner__content-wrapper">
            <div class="custom-banner__intro">
              <h1>{{i18n (themePrefix "meta_banner.welcome")}}</h1>
              <p>{{i18n (themePrefix "meta_banner.subtitle")}}</p>
            </div>
            <div class="custom-banner__list">
              {{#each settings.links as |link|}}
                <div class="custom-banner__list-item">
                  <a href={{link.url}}>
                    <h2>
                      {{icon link.icon}}
                      {{link.name}}
                    </h2>
                  </a>
                </div>
              {{/each}}
            </div>
          </div>
        </div>
      </div>
    {{/if}}
  </template>
}
