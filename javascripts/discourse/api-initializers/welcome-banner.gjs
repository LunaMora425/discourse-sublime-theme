import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  const logoDark = settings.welcome_logo_dark;

  api.renderInOutlet(
    "below-site-header",
    <template>
      <div id="custom-welcome-banner" class="wrap">
        <div class="inner-logo-area">
          {{#if logoDark}}
            <img
              src="{{logoDark}}"
              alt="Welcome Logo Dark"
              class="welcome-logo dark-mode-logo"
            />
          {{/if}}
        </div>
      </div>
    </template>
  );
});
