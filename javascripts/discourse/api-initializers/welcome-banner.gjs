import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  // Admin upload settings win; bundled theme assets (about.json:
  // welcome_banner_light/_dark) are the fallback. If only one variant
  // exists it is used in BOTH modes so the banner never vanishes.
  // Light/dark visibility is CSS-driven via
  // --bm-welcome-{light,dark}-display (color_definitions.scss).
  const uploads = settings.theme_uploads || {};
  let logoLight = settings.welcome_logo_light || uploads.welcome_banner_light;
  let logoDark = settings.welcome_logo_dark || uploads.welcome_banner_dark;
  logoLight ||= logoDark;
  logoDark ||= logoLight;

  api.onPageChange(() => {
    const mainOutlet = document.getElementById("main-outlet");
    if (mainOutlet && !document.getElementById("custom-welcome-banner")) {
      const banner = document.createElement("div");
      banner.id = "custom-welcome-banner";
      banner.className = "wrap";
      banner.innerHTML = `
        <div class="inner-logo-area">
          ${logoLight ? `<a href="/"><img src="${logoLight}" alt="Welcome Logo" class="welcome-logo light-mode-logo" /></a>` : ""}
          ${logoDark ? `<a href="/"><img src="${logoDark}" alt="Welcome Logo Dark" class="welcome-logo dark-mode-logo" /></a>` : ""}
        </div>
      `;
      mainOutlet.parentNode.insertBefore(banner, mainOutlet);
    }
  });
});
