import { mkdirSync } from 'fs';
import { join } from 'path';
import { test } from '@playwright/test';

test('test', async ({ browser }) => {
  const harDir = join(process.cwd(), 'har');
  mkdirSync(harDir, { recursive: true });

  const context = await browser.newContext({
    recordHar: {
      path: join(harDir, 'demo_investor_registration.har'),
      mode: 'minimal'
    }
  });
  const page = await context.newPage();

  await page.goto('https://corda-rr.vercel.app/vault?invite=demo');
  await page.getByRole('checkbox', { name: 'I have read and agree to the Terms of Use.' }).check();
  await page.getByRole('checkbox', { name: 'I have read and agree to the Privacy Policy.' }).check();
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByRole('button', { name: 'Accept Terms of Use' }).click();
  await page.getByRole('button', { name: 'Start KYC' }).click();
  await page.locator('iframe').contentFrame().getByRole('button', { name: 'Change language' }).click();
  await page.locator('iframe').contentFrame().getByRole('option', { name: 'Español (Spanish)' }).click();

  await context.close();
});