import globals from 'globals'
import pluginJs from '@eslint/js'
import tseslint from 'typescript-eslint'
import prettier from 'eslint-config-prettier'
import pluginPrettier from 'eslint-plugin-prettier'

/** @type {import('eslint').Linter.Config[]} */
export default [
  { files: ['**/*.{js,mjs,cjs,ts}'] },
  { languageOptions: { globals: globals.node } },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
  prettier,
  {
    plugins: { prettier: pluginPrettier },
    rules: {
      'prettier/prettier': 'error',
      'quotes': ['error', 'single', { 'avoidEscape': true }],
      'semi': ['error', 'never'],
      'arrow-body-style': ['error', 'as-needed'],
      'prefer-const': 'error',
      'no-unused-vars': 'warn',
      'endOfLine': 'lf',
    },
  },
]
