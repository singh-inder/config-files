/**
 * @type {import('prettier').Options}
 */
export default {
  printWidth: 87,
  trailingComma: "none",
  arrowParens: "avoid",
  semi: true,
  plugins: ["@ianvs/prettier-plugin-sort-imports"],
  importOrder: [
    "<TYPES>",
    ".*\\.css\\?.*$",
    "", // Empty line
    "<BUILTIN_MODULES>", // Node.js built-in modules
    "^react",
    "<THIRD_PARTY_MODULES>", // Imports not matched by other special words or groups.
    "",
    "^@/(.*)$",
    "",
    "^[./]"
  ]
};
