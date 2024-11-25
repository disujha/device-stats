import { registerPlugin } from '@capacitor/core';

import type { devicePlugin } from './definitions';

const device = registerPlugin<devicePlugin>('device', {
  web: () => import('./web').then((m) => new m.DeviceWeb()),
});

export * from './definitions';
export { device };
