import { apiInitializer } from "discourse/lib/api";

// Per-theme logo overrides (see THEME-ARCHITECTURE.md rule 5).
//
// Core resolves the three logos (logo, logo_small, mobile_logo) from site
// settings — including the *_dark variants — and then runs the result through
// the `home-logo-image-url` value transformer (see core
// frontend/discourse/app/components/header/home-logo.gjs, logoResolver()).
// We hook that transformer: if this theme has its own upload for the slot,
// use it; otherwise return core's value untouched, so empty settings mean
// "inherit the Admin > Branding logos".
//
// Dark resolution mirrors core: `context.dark` is set when core is building
// the <picture> source for browser dark mode; `defaultColorSchemeIsDark`
// covers a dark palette being the active scheme. Dark falls back to the
// light override before falling through to core, same as core's own
// dark -> light fallback.
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
