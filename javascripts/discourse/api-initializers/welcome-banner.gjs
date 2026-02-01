import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  const currentUser = api.getCurrentUser();

  api.renderInOutlet(
    "below-site-header",
    <template>
      <div id="custom-welcome-banner" class="wrap">
        <div class="inner-logo-area">
          {{#if currentUser}}
            Welcome back @{{currentUser.username}}
          {{else}}
            Welcome to our community
          {{/if}}
        </div>
      </div>
    </template>
  );
});
