try {
	module.exports = require("@discourse/lint-configs/prettier");
} catch {
	// Fallback so editor Prettier can run before project deps are installed.
	module.exports = {};
}
