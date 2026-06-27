


Commands:



npm init -y
npm install --save-dev @playwright/test
npx playwright install

npx playwright codegen https://corda-rr.vercel.app/vault?invite=demo --output playwright_tests/demo_inverstor_registration.spec.ts


run test...

# Record the HAR by running the Playwright test (writes har/demo_investor_registration.har)
npx playwright test


## HAR -> sequence diagram workflow (run from this DAST directory)
# All artifacts are maintained here under har/ (NOT in any build/ directory).
# The threat-model-* binaries resolve via PATH from the threat-modeling root node_modules.

# 1. Bootstrap config + index from the HAR (one-time; config is then edited/maintained by hand)
npm run har:config

# 2. (Re)generate the three PlantUML diagrams from the maintained config
npm run har:diagrams

# Individual diagram targets:
npm run har:seq         # full sequence (one call per request)
npm run har:seq:hosts   # collapsed: one call per source host
npm run har:dfd         # high-level DFD (one call per participant)

