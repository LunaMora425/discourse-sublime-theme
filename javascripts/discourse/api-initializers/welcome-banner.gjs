import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  const logoDark = settings.welcome_logo_dark;

  api.onPageChange(() => {
    const mainOutlet = document.getElementById("main-outlet");
    if (mainOutlet && !document.getElementById("custom-welcome-banner")) {
      const banner = document.createElement("div");
      banner.id = "custom-welcome-banner";
      banner.className = "wrap";
      banner.innerHTML = `
        <div class="inner-logo-area">
          ${logoDark ? `<a href="/"><img src="${logoDark}" alt="Welcome Logo Dark" class="welcome-logo dark-mode-logo" /></a>` : ""}
        </div>
      `;
      mainOutlet.parentNode.insertBefore(banner, mainOutlet);
    }
  });
});
