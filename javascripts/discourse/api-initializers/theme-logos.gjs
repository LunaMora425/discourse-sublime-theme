// Per-theme logo overrides: theme uploads win; empty settings inherit core Branding.
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  const session = api.container.lookup("service:session");

  api.registerValueTransformer("home-logo-image-url", ({ value, context }) => {
    const dark = context.dark || session.defaultColorSchemeIsDark;
    const override = dark
      ? settings[`${context.name}_dark`] || settings[`${context.name}_light`]
      : settings[`${context.name}_light`];
    return override || value;
  });
});
